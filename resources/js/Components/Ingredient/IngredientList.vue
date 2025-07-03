<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-leaf food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">Ingredient Management</h5>
                            <p class="admin-subtitle mb-0">Manage ingredients for your delicious recipes</p>
                        </div>
                    </div>
                </div>
                <div class="col text-end">
                    <Link href="/IngredientSavePage" class="btn btn-dark create-btn">CREATE INGREDIENT</Link>
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
                        <Link href="/ingredient" class="btn btn-sm btn-outline-secondary">
                            <i class="fa fa-times me-1"></i>Clear Filter
                        </Link>
                    </div>
                    
                    <div>
                        <div class="mb-4 search-container">
                            <div class="position-relative">
                                <i class="fa fa-search search-icon"></i>
                                <input
                                    placeholder="Find an ingredient..."
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
                                <template #item-recipes="{ recipes }">
                                    <div v-if="recipes && recipes.length > 0" class="recipes-container">
                                        <span v-for="(recipe, index) in recipes" :key="recipe.id" class="badge bg-primary me-1 mb-1">
                                            {{ recipe.title }}
                                        </span>
                                        <small class="text-muted d-block">({{ recipes.length }} recipe{{ recipes.length > 1 ? 's' : '' }})</small>
                                    </div>
                                    <span v-else class="text-muted">Not used in any recipe</span>
                                </template>

                                <template #item-actions="{ id }">
                                    <div v-if="id" class="edit-delete-container">
                                        <Link class="btn btn-edit" :href="`/IngredientSavePage?id=${id}`">EDIT</Link>
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
                   message="Are you sure you want to delete this ingredient?"
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
    { text: "Name", value: "name" },
    { text: "Used in Recipes", value: "recipes", sortable: false },
    { text: "Created At", value: "created_at" },
    { text: "Action", value: "actions", sortable: false },
];

const searchValue = ref("");
const Item = ref(page.props.list || []);
const recipeFilter = ref(page.props.recipeFilter || null);

// Helper function to get recipe name
const getRecipeName = (recipeId) => {
    const ingredient = Item.value.find(item => item.recipes && item.recipes.some(recipe => recipe.id == recipeId));
    if (ingredient && ingredient.recipes) {
        const recipe = ingredient.recipes.find(recipe => recipe.id == recipeId);
        return recipe ? recipe.title : 'Unknown Recipe';
    }
    return 'Unknown Recipe';
};

// Computed property for filtering items
const filteredItems = computed(() => {
    if (!searchValue.value) {
        return Item.value;
    }
    return Item.value.filter(item =>
        item.name.toLowerCase().includes(searchValue.value.toLowerCase())
    );
});

// confirm delete modal
const showDeleteModal = ref(false)
const resourceToDelete = ref(null)
const resourceTitle = ref(null);

const deleteResource = (id) => {
    resourceToDelete.value = id
    showDeleteModal.value = true;
    const ingredient = page.props.list.find(item => item.id === id);
    resourceTitle.value = `Delete ingredient "${ingredient ? ingredient.name : 'Unknown'}"`

    // Small delay to trigger animation
    setTimeout(() => {
        const modalContent = document.querySelector(".modal-content");
        if (modalContent) {
            modalContent.classList.add("show");
        }
    }, 10);
};

const confirmDelete = () => {
    form.get(`/delete-ingredient/${resourceToDelete.value}`, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/ingredient")
            } else {
                toaster.error(page.props.flash.message);
            }
        }
    })
    showDeleteModal.value = false
}
</script>

<style scoped>
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

.recipes-container {
    max-width: 300px;
}

.badge {
    font-size: 0.75em;
}
</style>
