<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-chart-pie food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Create' }} Nutrition Facts</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Add' }} nutritional information for a recipe</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/nutrition-fact`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-8">
                    <form @submit.prevent="submit">
                        <div class="row">
                            <!-- Recipe Selection -->
                            <div class="col-md-12 mb-4">
                                <label for="recipe_id" class="form-label fw-bold">Recipe</label>
                                <div class="position-relative">
                                    <i class="fa fa-utensils input-icon"></i>
                                    <select
                                        id="recipe_id"
                                        name="recipe_id"
                                        v-model="form.recipe_id"
                                        class="form-control search-input"
                                    >
                                        <option value="">Select Recipe</option>
                                        <option v-for="recipe in recipes" :key="recipe.id" :value="recipe.id">
                                            {{ recipe.title }}
                                        </option>
                                    </select>
                                </div>
                                <span v-if="form.errors.recipe_id" class="text-danger mt-2 d-block">
                                    {{ form.errors.recipe_id }}
                                </span>
                            </div>

                            <!-- Calories -->
                            <div class="col-md-6 mb-4">
                                <label for="calories" class="form-label fw-bold">Calories</label>
                                <div class="position-relative">
                                    <i class="fa fa-fire input-icon"></i>
                                    <input
                                        id="calories"
                                        name="calories"
                                        v-model="form.calories"
                                        placeholder="Calories"
                                        class="form-control search-input"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                    />
                                </div>
                                <span v-if="form.errors.calories" class="text-danger mt-2 d-block">
                                    {{ form.errors.calories }}
                                </span>
                            </div>

                            <!-- Protein -->
                            <div class="col-md-6 mb-4">
                                <label for="protein" class="form-label fw-bold">Protein (g)</label>
                                <div class="position-relative">
                                    <i class="fa fa-dumbbell input-icon"></i>
                                    <input
                                        id="protein"
                                        name="protein"
                                        v-model="form.protein"
                                        placeholder="Protein in grams"
                                        class="form-control search-input"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                    />
                                </div>
                                <span v-if="form.errors.protein" class="text-danger mt-2 d-block">
                                    {{ form.errors.protein }}
                                </span>
                            </div>

                            <!-- Fat -->
                            <div class="col-md-6 mb-4">
                                <label for="fat" class="form-label fw-bold">Fat (g)</label>
                                <div class="position-relative">
                                    <i class="fa fa-cheese input-icon"></i>
                                    <input
                                        id="fat"
                                        name="fat"
                                        v-model="form.fat"
                                        placeholder="Fat in grams"
                                        class="form-control search-input"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                    />
                                </div>
                                <span v-if="form.errors.fat" class="text-danger mt-2 d-block">
                                    {{ form.errors.fat }}
                                </span>
                            </div>

                            <!-- Carbohydrates -->
                            <div class="col-md-6 mb-4">
                                <label for="carbohydrates" class="form-label fw-bold">Carbohydrates (g)</label>
                                <div class="position-relative">
                                    <i class="fa fa-bread-slice input-icon"></i>
                                    <input
                                        id="carbohydrates"
                                        name="carbohydrates"
                                        v-model="form.carbohydrates"
                                        placeholder="Carbohydrates in grams"
                                        class="form-control search-input"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                    />
                                </div>
                                <span v-if="form.errors.carbohydrates" class="text-danger mt-2 d-block">
                                    {{ form.errors.carbohydrates }}
                                </span>
                            </div>

                            <!-- Cholesterol -->
                            <div class="col-md-12 mb-4">
                                <label for="cholesterol" class="form-label fw-bold">Cholesterol (mg)</label>
                                <div class="position-relative">
                                    <i class="fa fa-heartbeat input-icon"></i>
                                    <input
                                        id="cholesterol"
                                        name="cholesterol"
                                        v-model="form.cholesterol"
                                        placeholder="Cholesterol in milligrams"
                                        class="form-control search-input"
                                        type="number"
                                        step="0.1"
                                        min="0"
                                    />
                                </div>
                                <span v-if="form.errors.cholesterol" class="text-danger mt-2 d-block">
                                    {{ form.errors.cholesterol }}
                                </span>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">{{ id ? 'UPDATE' : 'CREATE' }}</button>
                            <Link :href="`/nutrition-fact`" class="btn btn-secondary">CANCEL</Link>
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
import { ref } from "vue";

const toaster = createToaster();
const page = usePage();

const urlParams = new URLSearchParams(window.location.search)
let id = ref(parseInt(urlParams.get('id')))

const form = useForm({
    recipe_id: '',
    calories: '',
    protein: '',
    fat: '',
    carbohydrates: '',
    cholesterol: '',
    id: id.value,
})

let apiEndpoint = "/create-nutrition-fact";
let nutritionFact = page.props.nutritionFact;
let recipes = page.props.recipes || [];
let preSelectedRecipeId = page.props.preSelectedRecipeId;

if (id.value && nutritionFact !== null && nutritionFact !== undefined) {
    apiEndpoint = "/update-nutrition-fact";
    // Fill the form with existing data
    form.recipe_id = nutritionFact.recipe_id || '';
    form.calories = nutritionFact.calories || '';
    form.protein = nutritionFact.protein || '';
    form.fat = nutritionFact.fat || '';
    form.carbohydrates = nutritionFact.carbohydrates || '';
    form.cholesterol = nutritionFact.cholesterol || '';
    form.id = nutritionFact.id;
} else if (preSelectedRecipeId) {
    // Pre-select recipe if coming from recipe page
    form.recipe_id = preSelectedRecipeId;
}

function submit() {
    form.post(apiEndpoint, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/nutrition-fact");
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
.input-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #6c757d;
    z-index: 10;
}

.search-input {
    padding-left: 45px;
}

.form-control, .form-select {
    border: 2px solid #e9ecef;
    border-radius: 8px;
    padding: 12px;
}

.form-control:focus, .form-select:focus {
    border-color: #80bdff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.btn-edit {
    background-color: #28a745;
    border-color: #28a745;
    color: white;
    padding: 10px 20px;
    font-weight: bold;
}

.btn-edit:hover {
    background-color: #218838;
    border-color: #1e7e34;
}
</style>
