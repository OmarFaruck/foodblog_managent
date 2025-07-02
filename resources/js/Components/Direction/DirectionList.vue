<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-list-ol food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">Direction Management</h5>
                            <p class="admin-subtitle mb-0">Manage cooking directions and steps for recipes</p>
                        </div>
                    </div>
                </div>
                <div class="col text-end">
                    <Link href="/DirectionSavePage" class="btn btn-dark create-btn">CREATE DIRECTION</Link>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <!-- Recipe Filter Alert -->
                    <div v-if="recipeFilter" class="alert alert-info d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <i class="fa fa-filter me-2"></i>
                            <strong>Filtered by Recipe:</strong> {{ getRecipeName(recipeFilter) }}
                        </div>
                        <Link href="/direction" class="btn btn-sm btn-outline-secondary">
                            <i class="fa fa-times me-1"></i>Clear Filter
                        </Link>
                    </div>
                    
                    <div>
                        <div class="mb-4 search-container">
                            <div class="position-relative">
                                <i class="fa fa-search search-icon"></i>
                                <input
                                    placeholder="Find a direction or recipe..."
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
                                    <img v-if="image" :src="image ? `/storage/${image}` : '/empty.png'" alt="Step Image" class="step-image" />
                                    <span v-else class="no-image">No Image</span>
                                </template>

                                <template #item-recipe="{ recipe }">
                                    <span class="badge bg-primary">{{ recipe ? recipe.title : 'No Recipe' }}</span>
                                </template>

                                <template #item-instruction="{ instruction }">
                                    <span class="instruction-text">{{ instruction.length > 100 ? instruction.substring(0, 100) + '...' : instruction }}</span>
                                </template>

                                <template #item-actions="{ id }">
                                    <div v-if="id" class="edit-delete-container">
                                        <Link class="btn btn-edit" :href="`/DirectionSavePage?id=${id}`">EDIT</Link>
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
                   message="Are you sure you want to delete this direction?"
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
    { text: "Recipe", value: "recipe", sortable: false },
    { text: "Step", value: "step_number" },
    { text: "Instruction", value: "instruction", sortable: false },
    { text: "Image", value: "image", sortable: false },
    { text: "Action", value: "actions", sortable: false },
];

const searchValue = ref("");
const Item = ref(page.props.list || []);
const recipeFilter = ref(page.props.recipeFilter || null);

// Helper function to get recipe name
const getRecipeName = (recipeId) => {
    const recipe = Item.value.find(item => item.recipe && item.recipe.id == recipeId);
    return recipe && recipe.recipe ? recipe.recipe.title : 'Unknown Recipe';
};

// Computed property for filtering items
const filteredItems = computed(() => {
    if (!searchValue.value) {
        return Item.value;
    }
    return Item.value.filter(item =>
        item.instruction.toLowerCase().includes(searchValue.value.toLowerCase()) ||
        (item.recipe && item.recipe.title.toLowerCase().includes(searchValue.value.toLowerCase()))
    );
});

// confirm delete modal
const showDeleteModal = ref(false)
const resourceToDelete = ref(null)
const resourceTitle = ref(null);

const deleteResource = (id) => {
    resourceToDelete.value = id
    showDeleteModal.value = true;
    const direction = page.props.list.find(item => item.id === id);
    resourceTitle.value = `Delete direction step ${direction ? direction.step_number : 'Unknown'}`

    // Small delay to trigger animation
    setTimeout(() => {
        const modalContent = document.querySelector(".modal-content");
        if (modalContent) {
            modalContent.classList.add("show");
        }
    }, 10);
};

const confirmDelete = () => {
    form.get(`/delete-direction/${resourceToDelete.value}`, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/direction")
            } else {
                toaster.error(page.props.flash.message);
            }
        }
    })
    showDeleteModal.value = false
}
</script>

<style scoped>
.step-image {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 8px;
}

.no-image {
    color: #6c757d;
    font-style: italic;
}

.instruction-text {
    max-width: 300px;
    display: inline-block;
}

.edit-delete-container {
    display: flex;
    gap: 8px;
}

.btn-edit {
    background-color: #17a2b8;
    border-color: #17a2b8;
    color: white;
    padding: 4px 12px;
    font-size: 12px;
}

.btn-delete {
    background-color: #dc3545;
    border-color: #dc3545;
    color: white;
    padding: 4px 12px;
    font-size: 12px;
}
</style>
