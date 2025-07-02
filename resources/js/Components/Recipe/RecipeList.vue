<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-utensils food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">Recipe Management</h5>
                            <p class="admin-subtitle mb-0">Manage your delicious recipes and cooking instructions</p>
                        </div>
                    </div>
                </div>
                <div class="col text-end">
                    <Link href="/RecipeSavePage" class="btn btn-dark create-btn">CREATE RECIPE</Link>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <div>
                        <div class="mb-4 search-container">
                            <div class="position-relative">
                                <i class="fa fa-search search-icon"></i>
                                <input
                                    placeholder="Find a recipe..."
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
                                <template #item-recipe_image="{ recipe_image }">
                                    <img v-if="recipe_image" :src="recipe_image ? `/storage/${recipe_image}` : '/empty.png'" alt="Recipe Image" class="recipe-image" />
                                    <span v-else class="no-image">No Image</span>
                                </template>

                                <template #item-category="{ category }">
                                    <span class="badge bg-primary">{{ category ? category.name : 'No Category' }}</span>
                                </template>

                                <template #item-prep_time="{ prep_time }">
                                    <span>{{ prep_time }} min</span>
                                </template>

                                <template #item-cook_time="{ cook_time }">
                                    <span>{{ cook_time }} min</span>
                                </template>

                                <template #item-total_time="{ prep_time, cook_time }">
                                    <span>{{ prep_time + cook_time }} min</span>
                                </template>

                                <template #item-is_featured="{ is_featured }">
                                    <span :class="is_featured ? 'badge bg-success' : 'badge bg-secondary'">
                                        {{ is_featured ? 'Featured' : 'Regular' }}
                                    </span>
                                </template>

                                <template #item-user="{ user }">
                                    <span>{{ user ? user.name : 'Unknown' }}</span>
                                </template>

                                <template #item-quick_actions="{ id, directions_count, nutrition_facts_count }">
                                    <div v-if="id" class="quick-actions-container">
                                        <!-- Create/Add Group -->
                                        <div class="btn-group me-2" role="group">
                                            <Link :href="`/DirectionSavePage?recipe_id=${id}`" 
                                                  class="btn btn-sm btn-info" 
                                                  title="Add Directions">
                                                <i class="fa fa-list-ol me-1"></i>Add Steps
                                            </Link>
                                            <Link :href="`/NutritionFactSavePage?recipe_id=${id}`" 
                                                  class="btn btn-sm btn-warning" 
                                                  title="Add Nutrition Facts">
                                                <i class="fa fa-chart-pie me-1"></i>Add Nutrition
                                            </Link>
                                        </div>
                                        
                                        <!-- View/List Group - Only show if data exists -->
                                        <div v-if="directions_count > 0 || nutrition_facts_count > 0" class="btn-group" role="group">
                                            <Link v-if="directions_count > 0" 
                                                  :href="`/direction?recipe=${id}`" 
                                                  class="btn btn-sm btn-outline-info" 
                                                  title="View Directions">
                                                <i class="fa fa-eye me-1"></i>View Steps ({{ directions_count }})
                                            </Link>
                                            <Link v-if="nutrition_facts_count > 0" 
                                                  :href="`/nutrition-fact?recipe=${id}`" 
                                                  class="btn btn-sm btn-outline-warning" 
                                                  title="View Nutrition Facts">
                                                <i class="fa fa-chart-bar me-1"></i>View Nutrition
                                            </Link>
                                        </div>
                                    </div>
                                    <div v-else>Loading...</div>
                                </template>

                                <template #item-actions="{ id }">
                                    <div v-if="id" class="edit-delete-container">
                                        <Link class="btn btn-edit" :href="`/RecipeSavePage?id=${id}`">EDIT</Link>
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
                   message="Are you sure you want to delete this recipe?"
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
    { text: "Image", value: "recipe_image", sortable: false },
    { text: "Title", value: "title" },
    { text: "Category", value: "category", sortable: false },
    { text: "Prep Time", value: "prep_time" },
    { text: "Cook Time", value: "cook_time" },
    { text: "Total Time", value: "total_time", sortable: false },
    { text: "Servings", value: "serving_size" },
    { text: "Featured", value: "is_featured", sortable: false },
    { text: "Author", value: "user", sortable: false },
    { text: "Quick Actions", value: "quick_actions", sortable: false },
    { text: "Action", value: "actions", sortable: false },
];

const searchValue = ref("");
const Item = ref(page.props.list || []);

// Computed property for filtering items
const filteredItems = computed(() => {
    if (!searchValue.value) {
        return Item.value;
    }
    return Item.value.filter(item =>
        item.title.toLowerCase().includes(searchValue.value.toLowerCase()) ||
        (item.category && item.category.name.toLowerCase().includes(searchValue.value.toLowerCase()))
    );
});

// confirm delete modal
const showDeleteModal = ref(false)
const resourceToDelete = ref(null)
const resourceTitle = ref(null);

const deleteResource = (id) => {
    resourceToDelete.value = id
    showDeleteModal.value = true;
    const recipe = page.props.list.find(item => item.id === id);
    resourceTitle.value = `Delete recipe "${recipe ? recipe.title : 'Unknown'}"`

    // Small delay to trigger animation
    setTimeout(() => {
        const modalContent = document.querySelector(".modal-content");
        if (modalContent) {
            modalContent.classList.add("show");
        }
    }, 10);
};

const confirmDelete = () => {
    form.get(`/delete-recipe/${resourceToDelete.value}`, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/recipe")
            } else {
                toaster.error(page.props.flash.message);
            }
        }
    })
    showDeleteModal.value = false
}
</script>

<style scoped>
.recipe-image {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 8px;
}

.no-image {
    color: #6c757d;
    font-style: italic;
}

.edit-delete-container {
    display: flex;
    gap: 8px;
}

.quick-actions-container {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
    align-items: center;
}

.btn-group {
    display: flex;
}

.btn-group .btn {
    border-radius: 0;
    border-right: 1px solid rgba(255,255,255,0.2);
}

.btn-group .btn:first-child {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}

.btn-group .btn:last-child {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    border-right: none;
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

.btn-sm {
    padding: 6px 12px;
    font-size: 11px;
    font-weight: 500;
    white-space: nowrap;
}

.btn-info {
    background-color: #17a2b8;
    border-color: #17a2b8;
    color: white;
}

.btn-warning {
    background-color: #ffc107;
    border-color: #ffc107;
    color: #212529;
}

.btn-outline-info {
    color: #17a2b8;
    border-color: #17a2b8;
    background-color: transparent;
}

.btn-outline-info:hover {
    background-color: #17a2b8;
    color: white;
}

.btn-outline-warning {
    color: #ffc107;
    border-color: #ffc107;
    background-color: transparent;
}

.btn-outline-warning:hover {
    background-color: #ffc107;
    color: #212529;
}
</style>
