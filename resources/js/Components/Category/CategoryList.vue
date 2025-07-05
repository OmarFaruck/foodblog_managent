<template>
        <div class="card admin-card">
            <div class="card-body">
                <div class="admin-header row">
                    <div class="col">
                        <div class="d-flex align-items-center">
                            <i class="fa fa-utensils food-icon fa-2x me-3"></i>
                            <div>
                                <h5 class="mb-0">Recipe Categories</h5>
                                <p class="admin-subtitle mb-0">Organize your delicious recipes into appetizing categories</p>
                            </div>
                        </div>
                    </div>
                    <div class="col text-end">
                        <Link href="/admin/CategorySavePage" class="btn btn-dark create-btn">CREATE CATEGORY</Link>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-12">
                        <div>
                            <div class="mb-4 search-container">
                                <div class="position-relative">
                                    <i class="fa fa-search search-icon"></i>
                                    <input
                                        placeholder="Find a category..."
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
                                    <template #item-icon="{ icon }">
                                    <img v-if="icon" :src="icon ? `/storage/${icon}` : '/empty.png'" alt="Category Icon" class="category-icon" />
                                    <span v-else class="no-icon">No Icon</span>
                                    </template>

                                    <template #item-number="{ id }">
                                    <div v-if="id" class="edit-delete-container">
                                        <Link class="btn btn-edit" :href="`/admin/CategorySavePage?id=${id}`">EDIT</Link>
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
                   message="Are you sure you want to delete this category?"
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
// Getting sidebar state from page props or defaulting to expanded
const isNavOpen = ref(true);  // Default to true if not provided in page props

const Header = [
    { text: "No", value: "id" },
    { text: "Name", value: "name" },
    { text: "Icon", value: "icon", sortable: false },
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
        item.name.toLowerCase().includes(searchValue.value.toLowerCase()) // Case-insensitive search
    );
});

// confirm delete modal
const showDeleteModal = ref(false)
const resourceToDelete = ref(null)
const resourceTitle = ref(null);

const deleteResource = (id) => {
    resourceToDelete.value = id
    showDeleteModal.value = true;
    resourceTitle.value = `Delete this category "${page.props.list.find(item => item.id === id).name}"`

    // Small delay to trigger animation
    setTimeout(() => {
        document.querySelector(".modal-content").classList.add("show");

    }, 10);
};

const confirmDelete = () => {
    form.get(`/admin/delete-category/${resourceToDelete.value}`,{
        onSuccess:()=>{
            if(page.props.flash.status===true){
                toaster.success(page.props.flash.message);
                router.get("/admin/category")
            }
            else {
                toaster.error(page.props.flash.message);
            }
        }
    })
    showDeleteModal.value = false
}


</script>
