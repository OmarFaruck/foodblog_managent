
<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-edit food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Create' }} Category</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Add a new' }} category for your delicious recipes</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/admin/category`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-6">
                    <form @submit.prevent="submit" enctype="multipart/form-data">
                        <!-- Category Name Input -->
                        <div class="mb-4">
                            <label for="name" class="form-label fw-bold">Category Name</label>
                            <div class="position-relative">
                                <i class="fa fa-tag input-icon"></i>
                                <input
                                    id="name"
                                    name="name"
                                    v-model="form.name"
                                    placeholder="Enter Category Name"
                                    class="form-control search-input"
                                    type="text"
                                />
                            </div>
                            <span v-if="form.errors.name" class="text-danger mt-2 d-block">
                                {{ form.errors.name }}
                            </span>
                        </div>
                        <div>
                            <label for="icon" class="form-label fw-bold">Icon</label>
                            <br>
                            <input
                                type="file"
                                @change="handleImageUpload"
                                class="w-full p-2 border"
                            />
                            <br>
                            <img
                                v-if="imageUrl"
                                :src="imageUrl"
                                alt="Category Icon"
                                class="mt-4 w-32 h-32 object-cover"
                            />
                            <p v-if="errors.icon" class="text-red-500 text-sm">{{ errors.icon }}</p>
                        </div>
                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">SAVE</button>
                            <Link :href="`/admin/category`" class="btn btn-secondary">CANCEL</Link>
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
const toaster = createToaster();

const urlParams=new URLSearchParams(window.location.search)
let id=ref(parseInt(urlParams.get('id')))

const form = useForm({
    name:'',
    id:id, 
    icon: '',
})

import {ref} from "vue";
const page = usePage()

let apiEndpoint="/admin/create-category";
let list=page.props.list;

if(id.value!==0 && list!==null){
    apiEndpoint="/admin/update-category";
    // fill the form with existing
    form.name=list['name']
    form.id=list['id']
    form.icon=list['icon']
} else {   
    form.icon = '';
}

// console.log(list)

// Validation Errors
const errors = ref({});

// Image Upload
const imageUrl = ref(form.icon ? `/storage/${form.icon}` : "/empty.png");

const handleImageUpload = (event) => {
    const file = event.target.files[0];
    //console.log(file)
    if (file) {
        form.icon = file;
        imageUrl.value = URL.createObjectURL(file);
        //console.log(form)
    }
};

function submit() {
    // The useForm from Inertia already handles FormData creation for file uploads
    // No need to create FormData manually as Inertia will handle it
    
    // If you want to see what's being submitted, you can log the form object:
    // console.log('Form data being submitted:', {
    //     name: form.name,
    //     id: form.id,
    //     icon: form.icon instanceof File ? `File: ${form.icon.name}` : form.icon
    // });
    
    form.post(apiEndpoint, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/admin/category");
            } else {
                toaster.error(page.props.flash.message);
            }
        },
        onError: (errors) => {
            if (errors.name) {
                toaster.error(errors.name);
            }
        }
    });
}

</script>
