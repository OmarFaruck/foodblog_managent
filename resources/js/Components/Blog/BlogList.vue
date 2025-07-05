<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-blog food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">Blog Posts</h5>
                            <p class="admin-subtitle mb-0">Manage blog articles and posts</p>
                        </div>
                    </div>
                </div>
                <div class="col text-end">
                    <Link href="/admin/BlogSavePage" class="btn btn-dark create-btn">CREATE POST</Link>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <div>
                        <div class="mb-4 search-container">
                            <div class="position-relative">
                                <i class="fa fa-search search-icon"></i>
                                <input
                                    placeholder="Find a blog post..."
                                    class="form-control search-input"
                                    type="text"
                                    v-model="searchValue"
                                >
                            </div>
                        </div>
                        
                        <div class="admin-table">
                            <Vue3EasyDataTable
                                buttons-pagination
                                alternating
                                :headers="Header"
                                :items="filteredItems"
                                :rows-per-page="10"
                                class="easy-data-table"
                                :loading="!Item.length"
                            >
                                <template #item-image="{ image }">
                                    <img v-if="image" :src="image ? `/storage/${image}` : '/empty.png'" alt="Blog Image" class="blog-image" />
                                    <span v-else class="no-image">No Image</span>
                                </template>

                                <template #item-title="{ title }">
                                    <span class="blog-title">{{ title.length > 50 ? title.substring(0, 50) + '...' : title }}</span>
                                </template>

                                <template #item-excerpt="{ excerpt }">
                                    <span v-if="excerpt" class="excerpt-text">{{ excerpt.length > 60 ? excerpt.substring(0, 60) + '...' : excerpt }}</span>
                                    <span v-else class="text-muted">No excerpt</span>
                                </template>

                                <template #item-user="{ user }">
                                    <div class="d-flex align-items-center">
                                        <img v-if="user.avatar" :src="`/storage/${user.avatar}`" alt="Author" class="author-avatar me-2" />
                                        <span>{{ user.name }}</span>
                                    </div>
                                </template>

                                <template #item-created_at="{ created_at }">
                                    <span>{{ formatDate(created_at) }}</span>
                                </template>

                                <template #item-number="{ id }">
                                    <div v-if="id" class="edit-delete-container">
                                        <Link class="btn btn-edit" :href="`/admin/BlogSavePage?id=${id}`">EDIT</Link>
                                        <button class="btn btn-delete" @click="deleteResource(id)">DELETE</button>
                                    </div>
                                    <div v-else>Loading...</div>
                                </template>
                            </Vue3EasyDataTable>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Confirm Dialog Component -->
    <ConfirmDelete :isOpen="showDeleteModal"
                   :title="resourceTitle"
                   message="Are you sure you want to delete this blog post?"
                   @close="showDeleteModal = false"
                   @confirm="confirmDelete"/>
</template>

<script setup>
import { useForm, router, Link } from '@inertiajs/vue3';
import { ref, computed } from "vue";
import { usePage } from "@inertiajs/vue3";
import Vue3EasyDataTable from 'vue3-easy-data-table';
import 'vue3-easy-data-table/dist/style.css';
import { createToaster } from "@meforma/vue-toaster";
import ConfirmDelete from "@/Components/Helper/ConfirmDelete.vue";

const toaster = createToaster();
let page = usePage();
const form = useForm({});

const Header = [
    { text: "ID", value: "id" },
    { text: "Image", value: "image", sortable: false },
    { text: "Title", value: "title" },
    { text: "Excerpt", value: "excerpt", sortable: false },
    { text: "Author", value: "user", sortable: false },
    { text: "Created", value: "created_at" },
    { text: "Action", value: "number" },
];

const searchValue = ref("");
const Item = ref(page.props.list || []); // Loading full list once

// Computed property for filtering items
const filteredItems = computed(() => {
    if (!searchValue.value) {
        return Item.value; // No search input, returning all items
    }
    return Item.value.filter(item =>
        item.title.toLowerCase().includes(searchValue.value.toLowerCase()) ||
        (item.excerpt && item.excerpt.toLowerCase().includes(searchValue.value.toLowerCase())) ||
        item.user.name.toLowerCase().includes(searchValue.value.toLowerCase())
    );
});

// Date formatting function
const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric'
    });
};

// confirm delete modal
const showDeleteModal = ref(false)
const resourceToDelete = ref(null)
const resourceTitle = ref(null);

const deleteResource = (id) => {
    resourceToDelete.value = id
    showDeleteModal.value = true;
    resourceTitle.value = `Delete blog post "${page.props.list.find(item => item.id === id).title}"`

    // Small delay to trigger animation
    setTimeout(() => {
        document.querySelector(".modal-content").classList.add("show");
    }, 10);
};

const confirmDelete = () => {
    form.get(`/admin/delete-blog/${resourceToDelete.value}`,{
        onSuccess:()=>{
            if(page.props.flash.status===true){
                toaster.success(page.props.flash.message);
                router.get("/admin/blog")
            }
            else {
                toaster.error(page.props.flash.message);
            }
        }
    })
    showDeleteModal.value = false
}
</script>

<style scoped>
.blog-image {
    width: 60px;
    height: 40px;
    object-fit: cover;
    border-radius: 4px;
}

.author-avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    object-fit: cover;
}

.no-image {
    font-style: italic;
    color: #999;
}

.blog-title {
    font-weight: 600;
    color: #333;
}

.excerpt-text {
    font-size: 0.9rem;
    color: #666;
}

.search-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #666;
    z-index: 1;
}

.search-input {
    padding-left: 45px;
}
</style>
