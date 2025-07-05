<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-edit food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Create' }} Blog Post</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Create a new' }} blog article</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/admin/blog`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-12">
                    <form @submit.prevent="submit" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-12">

                                <!-- Author Selection -->
                                <div class="mb-4">
                                    <label for="user_id" class="form-label fw-bold">Author</label>
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
                                                {{ user.name }} ({{ user.email }})
                                            </option>
                                        </select>
                                    </div>
                                    <span v-if="form.errors.user_id" class="text-danger mt-2 d-block">
                                        {{ form.errors.user_id }}
                                    </span>
                                </div>
                                <!-- Blog Title Input -->
                                <div class="mb-4">
                                    <label for="title" class="form-label fw-bold">Blog Title</label>
                                    <div class="position-relative">
                                        <i class="fa fa-heading input-icon"></i>
                                        <input
                                            id="title"
                                            name="title"
                                            v-model="form.title"
                                            placeholder="Enter Blog Title"
                                            class="form-control search-input"
                                            type="text"
                                        />
                                    </div>
                                    <span v-if="form.errors.title" class="text-danger mt-2 d-block">
                                        {{ form.errors.title }}
                                    </span>
                                </div>

                                <!-- Blog Excerpt Input -->
                                <div class="mb-4">
                                    <label for="excerpt" class="form-label fw-bold">Excerpt (Optional)</label>
                                    <div class="position-relative">
                                        <i class="fa fa-quote-left input-icon"></i>
                                        <textarea
                                            id="excerpt"
                                            name="excerpt"
                                            v-model="form.excerpt"
                                            placeholder="Enter a brief excerpt..."
                                            class="form-control search-input"
                                            rows="3"
                                        ></textarea>
                                    </div>
                                    <span v-if="form.errors.excerpt" class="text-danger mt-2 d-block">
                                        {{ form.errors.excerpt }}
                                    </span>
                                </div>

                                <!-- Blog Content Input -->
                                <div class="mb-4">
                                    <label for="content" class="form-label fw-bold">Blog Content</label>
                                    <div class="position-relative">
                                        <i class="fa fa-file-text input-icon"></i>
                                        <textarea
                                            id="content"
                                            name="content"
                                            v-model="form.content"
                                            placeholder="Enter blog content..."
                                            class="form-control search-input"
                                            rows="15"
                                        ></textarea>
                                    </div>
                                    <span v-if="form.errors.content" class="text-danger mt-2 d-block">
                                        {{ form.errors.content }}
                                    </span>
                                </div>

                                <!-- Image Upload -->
                                <div class="mb-4">
                                    <label for="image" class="form-label fw-bold">Featured Image</label>
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
                                        alt="Blog Image"
                                        class="mt-3 blog-image-preview"
                                    />
                                    <span v-if="errors.image" class="text-danger mt-2 d-block">
                                        {{ errors.image }}
                                    </span>
                                </div>

                            </div>
                            
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">SAVE</button>
                            <Link :href="`/admin/blog`" class="btn btn-secondary">CANCEL</Link>
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
    title: '',
    excerpt: '',
    content: '',
    user_id: '',
    image: '',
    id: id, 
})

const page = usePage()

let apiEndpoint = "/admin/create-blog";
let list = page.props.list;
let users = page.props.users || [];

if(id.value !== 0 && list !== null){
    apiEndpoint = "/admin/update-blog";
    // fill the form with existing data
    form.title = list['title']
    form.excerpt = list['excerpt'] || ''
    form.content = list['content']
    form.user_id = list['user_id']
    form.id = list['id']
    form.image = list['image']
} else {   
    form.image = '';
}

// Validation Errors
const errors = ref({});

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
                router.get("/admin/blog");
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
    top: 15px;
    color: #666;
    z-index: 1;
}

.search-input {
    padding-left: 45px;
}

.blog-image-preview {
    width: 100%;
    max-width: 300px;
    height: 200px;
    object-fit: cover;
    border-radius: 8px;
    border: 3px solid #ddd;
}

select.search-input {
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6,9 12,15 18,9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 1rem center;
    background-size: 1em;
}

textarea.search-input {
    resize: vertical;
    min-height: 80px;
}

textarea#content {
    height: 300px !important;
    /* border: 1px solid red !important; */
    margin-left: 3px;
    min-height: 300px !important;
}
</style>
