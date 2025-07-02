<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-list-ol food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Create' }} Direction</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Add a new' }} cooking step for a recipe</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/direction`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-8">
                    <form @submit.prevent="submit" enctype="multipart/form-data">
                        <div class="row">
                            <!-- Recipe Selection -->
                            <div class="col-md-6 mb-4">
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

                            <!-- Step Number -->
                            <div class="col-md-6 mb-4">
                                <label for="step_number" class="form-label fw-bold">Step Number</label>
                                <div class="position-relative">
                                    <i class="fa fa-sort-numeric-up input-icon"></i>
                                    <input
                                        id="step_number"
                                        name="step_number"
                                        v-model="form.step_number"
                                        placeholder="Step number"
                                        class="form-control search-input"
                                        type="number"
                                        min="1"
                                    />
                                </div>
                                <span v-if="form.errors.step_number" class="text-danger mt-2 d-block">
                                    {{ form.errors.step_number }}
                                </span>
                            </div>

                            <!-- Instruction -->
                            <div class="col-md-12 mb-4">
                                <label for="instruction" class="form-label fw-bold">Instruction</label>
                                <div class="position-relative">
                                    <textarea
                                        id="instruction"
                                        name="instruction"
                                        v-model="form.instruction"
                                        placeholder="Enter step instruction"
                                        class="form-control"
                                        rows="4"
                                    ></textarea>
                                </div>
                                <span v-if="form.errors.instruction" class="text-danger mt-2 d-block">
                                    {{ form.errors.instruction }}
                                </span>
                            </div>

                            <!-- Step Image Upload -->
                            <div class="col-md-12 mb-4">
                                <label for="image" class="form-label fw-bold">Step Image (Optional)</label>
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
                                    alt="Step Image"
                                    class="mt-4 step-preview-image"
                                />
                                <p v-if="form.errors.image" class="text-danger mt-2">{{ form.errors.image }}</p>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">{{ id ? 'UPDATE' : 'CREATE' }}</button>
                            <Link :href="`/direction`" class="btn btn-secondary">CANCEL</Link>
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
    step_number: '',
    instruction: '',
    image: '',
    id: id.value,
})

let apiEndpoint = "/create-direction";
let direction = page.props.direction;
let recipes = page.props.recipes || [];
let preSelectedRecipeId = page.props.preSelectedRecipeId;

if (id.value && direction !== null && direction !== undefined) {
    apiEndpoint = "/update-direction";
    // Fill the form with existing data
    form.recipe_id = direction.recipe_id || '';
    form.step_number = direction.step_number || '';
    form.instruction = direction.instruction || '';
    form.image = direction.image || '';
    form.id = direction.id;
} else if (preSelectedRecipeId) {
    // Pre-select recipe if coming from recipe page
    form.recipe_id = preSelectedRecipeId;
}

// Image Upload
const imageUrl = ref(form.image ? `/storage/${form.image}` : "/empty.png");

const handleImageUpload = (event) => {
    const file = event.target.files[0];
    if (file) {
        form.image = file;
        imageUrl.value = URL.createObjectURL(file);
    }
};

function submit() {
    form.post(apiEndpoint, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/direction");
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
.step-preview-image {
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
