<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-leaf food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Create' }} Ingredient</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Add a new' }} ingredient for your recipes</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/ingredient`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-6">
                    <form @submit.prevent="submit">
                        <!-- Ingredient Name Input -->
                        <div class="mb-4">
                            <label for="name" class="form-label fw-bold">Ingredient Name</label>
                            <div class="position-relative">
                                <i class="fa fa-leaf input-icon"></i>
                                <input
                                    id="name"
                                    name="name"
                                    v-model="form.name"
                                    placeholder="Enter Ingredient Name"
                                    class="form-control search-input"
                                    type="text"
                                />
                            </div>
                            <span v-if="form.errors.name" class="text-danger mt-2 d-block">
                                {{ form.errors.name }}
                            </span>
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">{{ id ? 'UPDATE' : 'CREATE' }}</button>
                            <Link :href="`/ingredient`" class="btn btn-secondary">CANCEL</Link>
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
    name: '',
    id: id.value,
})

let apiEndpoint = "/create-ingredient";
let ingredient = page.props.ingredient;

if (id.value && ingredient !== null && ingredient !== undefined) {
    apiEndpoint = "/update-ingredient";
    // Fill the form with existing data
    form.name = ingredient.name || '';
    form.id = ingredient.id;
}

function submit() {
    form.post(apiEndpoint, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/ingredient");
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

.form-control {
    border: 2px solid #e9ecef;
    border-radius: 8px;
    padding: 12px;
}

.form-control:focus {
    border-color: #80bdff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

</style>
