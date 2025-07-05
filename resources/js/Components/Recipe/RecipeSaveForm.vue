<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-utensils food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Create' }} Recipe</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Add a new' }} delicious recipe to your collection</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/recipe`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-8">
                    <form @submit.prevent="submit" enctype="multipart/form-data">
                        <div class="row">
                            <!-- Recipe Title -->
                            <div class="col-md-12 mb-4">
                                <label for="title" class="form-label fw-bold">Recipe Title</label>
                                <div class="position-relative">
                                    <i class="fa fa-utensils input-icon"></i>
                                    <input
                                        id="title"
                                        name="title"
                                        v-model="form.title"
                                        placeholder="Enter Recipe Title"
                                        class="form-control search-input"
                                        type="text"
                                    />
                                </div>
                                <span v-if="form.errors.title" class="text-danger mt-2 d-block">
                                    {{ form.errors.title }}
                                </span>
                            </div>

                            <!-- Category Selection -->
                            <div class="col-md-6 mb-4">
                                <label for="category_id" class="form-label fw-bold">Category</label>
                                <div class="position-relative">
                                    <i class="fa fa-tags input-icon"></i>
                                    <select
                                        id="category_id"
                                        name="category_id"
                                        v-model="form.category_id"
                                        class="form-control search-input"
                                    >
                                        <option value="">Select Category</option>
                                        <option v-for="category in categories" :key="category.id" :value="category.id">
                                            {{ category.name }}
                                        </option>
                                    </select>
                                </div>
                                <span v-if="form.errors.category_id" class="text-danger mt-2 d-block">
                                    {{ form.errors.category_id }}
                                </span>
                            </div>

                            <!-- User Selection -->
                            <div class="col-md-6 mb-4">
                                <label for="user_id" class="form-label fw-bold">Recipe Author</label>
                                <div class="position-relative">
                                    <i class="fa fa-user input-icon"></i>
                                    <select
                                        id="user_id"
                                        name="user_id"
                                        v-model="form.user_id"
                                        class="form-control search-input"
                                    >
                                        <option value="">Select Author</option>
                                        <option v-for="user in users" :key="user.id" :value="user.id">
                                            {{ user.name }}
                                        </option>
                                    </select>
                                </div>
                                <span v-if="form.errors.user_id" class="text-danger mt-2 d-block">
                                    {{ form.errors.user_id }}
                                </span>
                            </div>

                            <!-- Serving Size -->
                            <div class="col-md-6 mb-4">
                                <label for="serving_size" class="form-label fw-bold">Serving Size</label>
                                <div class="position-relative">
                                    <i class="fa fa-users input-icon"></i>
                                    <input
                                        id="serving_size"
                                        name="serving_size"
                                        v-model="form.serving_size"
                                        placeholder="Number of servings"
                                        class="form-control search-input"
                                        type="number"
                                        min="1"
                                    />
                                </div>
                                <span v-if="form.errors.serving_size" class="text-danger mt-2 d-block">
                                    {{ form.errors.serving_size }}
                                </span>
                            </div>

                            <!-- Prep Time -->
                            <div class="col-md-6 mb-4">
                                <label for="prep_time" class="form-label fw-bold">Prep Time (minutes)</label>
                                <div class="position-relative">
                                    <i class="fa fa-clock input-icon"></i>
                                    <input
                                        id="prep_time"
                                        name="prep_time"
                                        v-model="form.prep_time"
                                        placeholder="Preparation time"
                                        class="form-control search-input"
                                        type="number"
                                        min="1"
                                    />
                                </div>
                                <span v-if="form.errors.prep_time" class="text-danger mt-2 d-block">
                                    {{ form.errors.prep_time }}
                                </span>
                            </div>

                            <!-- Cook Time -->
                            <div class="col-md-6 mb-4">
                                <label for="cook_time" class="form-label fw-bold">Cook Time (minutes)</label>
                                <div class="position-relative">
                                    <i class="fa fa-fire input-icon"></i>
                                    <input
                                        id="cook_time"
                                        name="cook_time"
                                        v-model="form.cook_time"
                                        placeholder="Cooking time"
                                        class="form-control search-input"
                                        type="number"
                                        min="1"
                                    />
                                </div>
                                <span v-if="form.errors.cook_time" class="text-danger mt-2 d-block">
                                    {{ form.errors.cook_time }}
                                </span>
                            </div>

                            <!-- Description -->
                            <div class="col-md-12 mb-4">
                                <label for="description" class="form-label fw-bold">Description</label>
                                <div class="position-relative">
                                    <textarea
                                        id="description"
                                        name="description"
                                        v-model="form.description"
                                        placeholder="Enter recipe description"
                                        class="form-control"
                                        rows="4"
                                    ></textarea>
                                </div>
                                <span v-if="form.errors.description" class="text-danger mt-2 d-block">
                                    {{ form.errors.description }}
                                </span>
                            </div>

                            <!-- Recipe Image Upload -->
                            <div class="col-md-12 mb-4">
                                <label for="recipe_image" class="form-label fw-bold">Recipe Image</label>
                                <br>
                                <input
                                    type="file"
                                    @change="handleImageUpload"
                                    class="form-control"
                                    accept="image/*"
                                />
                                <br>
                                <img
                                    v-if="imageUrl"
                                    :src="imageUrl"
                                    alt="Recipe Image"
                                    class="mt-4 recipe-preview-image"
                                />
                                <p v-if="form.errors.recipe_image" class="text-danger mt-2">{{ form.errors.recipe_image }}</p>
                            </div>

                            <!-- Ingredients Selection -->
                            <div class="col-md-12 mb-4">
                                <label class="form-label fw-bold">Ingredients</label>
                                <div class="ingredients-section">
                                    <div class="d-flex mb-3">
                                        <div class="flex-grow-1 me-2">
                                            <select v-model="selectedIngredient" class="form-control">
                                                <option value="">Select an ingredient</option>
                                                <option v-for="ingredient in availableIngredients" :key="ingredient.id" :value="ingredient">
                                                    {{ ingredient.name }}
                                                </option>
                                            </select>
                                        </div>
                                        <div class="me-2" style="width: 150px;">
                                            <input 
                                                v-model="selectedGroup" 
                                                placeholder="Group (e.g., Main, Sauce)" 
                                                class="form-control"
                                                type="text"
                                            />
                                        </div>
                                        <button type="button" @click="addIngredient" class="btn btn-primary">Add</button>
                                    </div>
                                    
                                    <!-- Selected Ingredients List -->
                                    <div v-if="form.ingredients.length > 0" class="selected-ingredients">
                                        <h6>Selected Ingredients:</h6>
                                        <div class="ingredients-list">
                                            <div v-for="(ingredient, index) in form.ingredients" :key="index" 
                                                 class="ingredient-item d-flex align-items-center justify-content-between mb-2 p-2 border rounded">
                                                <div>
                                                    <strong>{{ ingredient.name }}</strong>
                                                    <span v-if="ingredient.group" class="text-muted"> ({{ ingredient.group }})</span>
                                                </div>
                                                <button type="button" @click="removeIngredient(index)" class="btn btn-sm btn-danger">Remove</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Is Featured -->
                            <div class="col-md-12 mb-4">
                                <div class="form-check">
                                    <input
                                        id="is_featured"
                                        name="is_featured"
                                        v-model="form.is_featured"
                                        class="form-check-input"
                                        type="checkbox"
                                    />
                                    <label for="is_featured" class="form-check-label fw-bold">
                                        Featured Recipe
                                    </label>
                                </div>
                                <small class="text-muted">Featured recipes will be highlighted on the homepage</small>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">{{ id ? 'UPDATE' : 'CREATE' }}</button>
                            <Link :href="`/admin/recipe`" class="btn btn-secondary">CANCEL</Link>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useForm, router, Link, usePage } from '@inertiajs/vue3'
import { createToaster } from "@meforma/vue-toaster";
import { ref, computed } from "vue";

const toaster = createToaster();
const page = usePage();

const urlParams = new URLSearchParams(window.location.search)
let id = ref(parseInt(urlParams.get('id')))

const form = useForm({
    title: '',
    description: '',
    category_id: '',
    user_id: '',
    prep_time: '',
    cook_time: '',
    serving_size: '',
    is_featured: 0,
    recipe_image: '',
    ingredients: [],
    id: id.value,
})

let apiEndpoint = "/admin/create-recipe";
let recipe = page.props.recipe;
let categories = page.props.categories || [];
let ingredients = page.props.ingredients || [];
let users = page.props.users || [];

// Ingredient selection
const selectedIngredient = ref(null);
const selectedGroup = ref('Main');

// Available ingredients (filter out already selected ones)
const availableIngredients = computed(() => {
    return ingredients.filter(ingredient => 
        !form.ingredients.some(selected => selected.id === ingredient.id)
    );
});

if (id.value && recipe !== null && recipe !== undefined) {
    apiEndpoint = "/admin/update-recipe";
    // Fill the form with existing data
    form.title = recipe.title || '';
    form.description = recipe.description || '';
    form.category_id = recipe.category_id || '';
    form.user_id = recipe.user_id || '';
    form.prep_time = recipe.prep_time || '';
    form.cook_time = recipe.cook_time || '';
    form.serving_size = recipe.serving_size || '';
    form.is_featured = recipe.is_featured === 1 ? true : false;
    form.recipe_image = recipe.recipe_image || '';
    form.id = recipe.id;
    
    // Fill ingredients if editing
    if (recipe.ingredients && recipe.ingredients.length > 0) {
        form.ingredients = recipe.ingredients.map(ingredient => ({
            id: ingredient.id,
            name: ingredient.name,
            group: ingredient.pivot.ingredient_group || 'Main'
        }));
    }
}

// Image Upload
const imageUrl = ref(form.recipe_image ? `/storage/${form.recipe_image}` : "/empty.png");

const handleImageUpload = (event) => {
    const file = event.target.files[0];
    if (file) {
        form.recipe_image = file;
        imageUrl.value = URL.createObjectURL(file);
    }
};

// Ingredient management functions
const addIngredient = () => {
    if (selectedIngredient.value) {
        form.ingredients.push({
            id: selectedIngredient.value.id,
            name: selectedIngredient.value.name,
            group: selectedGroup.value || 'Main'
        });
        selectedIngredient.value = null;
        selectedGroup.value = 'Main';
    }
};

const removeIngredient = (index) => {
    form.ingredients.splice(index, 1);
};

function submit() {
    form.post(apiEndpoint, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/admin/recipe");
            } else {
                toaster.error(page.props.flash.message);
            }
        },
        onError: (errors) => {
            Object.keys(errors).forEach(key => {
                if (errors[key]) {
                    toaster.error(errors[key]);
                }
            });
        }
    });
}
</script>

<style scoped>
.recipe-preview-image {
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 8px;
    border: 2px solid #ddd;
}

.input-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #6c757d;
    z-index: 10;
}

.form-control, .form-select {
    border: 2px solid #e9ecef;
    border-radius: 8px;
    padding: 12px;
}

/* Ingredients Section Styles */
.ingredients-section {
    border: 1px solid #e9ecef;
    border-radius: 8px;
    padding: 15px;
    background-color: #f8f9fa;
}

.ingredient-item {
    background-color: white;
}

.selected-ingredients h6 {
    margin-top: 15px;
    margin-bottom: 10px;
    color: #495057;
}
</style>
