<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-users food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">User Management</h5>
                            <p class="admin-subtitle mb-0">Manage system users and their roles</p>
                        </div>
                    </div>
                </div>
                <div class="col text-end">
                    <Link href="/admin/UserSavePage" class="btn btn-dark create-btn">CREATE USER</Link>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <div>
                        <div class="mb-4 search-container">
                            <div class="position-relative">
                                <i class="fa fa-search search-icon"></i>
                                <input
                                    placeholder="Find a user..."
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
                                <template #item-avatar="{ avatar }">
                                    <img v-if="avatar" :src="avatar ? `/storage/${avatar}` : '/empty.png'" alt="User Avatar" class="user-avatar" />
                                    <span v-else class="no-avatar">No Avatar</span>
                                </template>

                                <template #item-role="{ role }">
                                    <span class="badge" :class="role === 'admin' ? 'badge-admin' : 'badge-user'">
                                        {{ role.toUpperCase() }}
                                    </span>
                                </template>

                                <template #item-bio="{ bio }">
                                    <span v-if="bio" class="bio-text">{{ bio.length > 50 ? bio.substring(0, 50) + '...' : bio }}</span>
                                    <span v-else class="text-muted">No bio</span>
                                </template>

                                <template #item-number="{ id }">
                                    <div v-if="id" class="edit-delete-container">
                                        <Link class="btn btn-edit" :href="`/admin/UserSavePage?id=${id}`">EDIT</Link>
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
                   message="Are you sure you want to delete this user?"
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
    { text: "Avatar", value: "avatar", sortable: false },
    { text: "Name", value: "name" },
    { text: "Email", value: "email" },
    { text: "Role", value: "role" },
    { text: "Bio", value: "bio", sortable: false },
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
        item.name.toLowerCase().includes(searchValue.value.toLowerCase()) ||
        item.email.toLowerCase().includes(searchValue.value.toLowerCase()) ||
        item.role.toLowerCase().includes(searchValue.value.toLowerCase())
    );
});

// confirm delete modal
const showDeleteModal = ref(false)
const resourceToDelete = ref(null)
const resourceTitle = ref(null);

const deleteResource = (id) => {
    resourceToDelete.value = id
    showDeleteModal.value = true;
    resourceTitle.value = `Delete user "${page.props.list.find(item => item.id === id).name}"`

    // Small delay to trigger animation
    setTimeout(() => {
        document.querySelector(".modal-content").classList.add("show");
    }, 10);
};

const confirmDelete = () => {
    form.get(`/admin/delete-user/${resourceToDelete.value}`,{
        onSuccess:()=>{
            if(page.props.flash.status===true){
                toaster.success(page.props.flash.message);
                router.get("/admin/user")
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
.user-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
}

.no-avatar {
    font-style: italic;
    color: #999;
}

.badge {
    padding: 4px 8px;
    border-radius: 12px;
    font-size: 0.75rem;
    font-weight: 600;
}

.badge-admin {
    background-color: #dc3545;
    color: white;
}

.badge-user {
    background-color: #6c757d;
    color: white;
}

.bio-text {
    font-size: 0.9rem;
    color: #666;
}
</style>
