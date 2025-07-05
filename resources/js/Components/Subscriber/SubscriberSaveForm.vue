<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-envelope-plus food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Add' }} Subscriber</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Add a new' }} newsletter subscriber</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/admin/subscriber`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-6">
                    <form @submit.prevent="submit">
                        <!-- Email Input -->
                        <div class="mb-4">
                            <label for="email" class="form-label fw-bold">Email Address</label>
                            <div class="position-relative">
                                <i class="fa fa-envelope input-icon"></i>
                                <input
                                    id="email"
                                    name="email"
                                    v-model="form.email"
                                    placeholder="Enter Email Address"
                                    class="form-control search-input"
                                    type="email"
                                />
                            </div>
                            <span v-if="form.errors.email" class="text-danger mt-2 d-block">
                                {{ form.errors.email }}
                            </span>
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">SAVE</button>
                            <Link :href="`/admin/subscriber`" class="btn btn-secondary">CANCEL</Link>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import {useForm,router,Link,usePage} from '@inertiajs/vue3'
import { createToaster } from "@meforma/vue-toaster";
import {ref} from "vue";

const toaster = createToaster();

const urlParams = new URLSearchParams(window.location.search)
let id = ref(parseInt(urlParams.get('id')))

const form = useForm({
    email: '',
    id: id, 
})

const page = usePage()

let apiEndpoint = "/admin/create-subscriber";
let list = page.props.list;

if(id.value !== 0 && list !== null){
    apiEndpoint = "/admin/update-subscriber";
    // fill the form with existing data
    form.email = list['email']
    form.id = list['id']
}

function submit() {
    form.post(apiEndpoint, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/admin/subscriber");
            } else {
                toaster.error(page.props.flash.message);
            }
        },
        onError: (errors) => {
            Object.keys(errors).forEach(key => {
                toaster.error(errors[key]);
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
    color: #666;
    z-index: 1;
}

.search-input {
    padding-left: 45px;
}
</style>
