<template>
    <div class="card admin-card">
        <div class="card-body">
            <div class="admin-header row">
                <div class="col">
                    <div class="d-flex align-items-center">
                        <i class="fa fa-user-edit food-icon fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0">{{ id ? 'Edit' : 'Create' }} User</h5>
                            <p class="admin-subtitle mb-0">{{ id ? 'Update' : 'Add a new' }} user to the system</p>
                        </div>
                    </div>
                </div>              
                <div class="col text-end">
                    <Link :href="`/admin/user`" class="btn btn-dark create-btn">BACK TO LIST</Link>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-8">
                    <form @submit.prevent="submit" enctype="multipart/form-data">
                        <!-- User Name Input -->
                        <div class="mb-4">
                            <label for="name" class="form-label fw-bold">Full Name</label>
                            <div class="position-relative">
                                <i class="fa fa-user input-icon"></i>
                                <input
                                    id="name"
                                    name="name"
                                    v-model="form.name"
                                    placeholder="Enter Full Name"
                                    class="form-control search-input"
                                    type="text"
                                />
                            </div>
                            <span v-if="form.errors.name" class="text-danger mt-2 d-block">
                                {{ form.errors.name }}
                            </span>
                        </div>

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

                        <!-- Password Input -->
                        <div class="mb-4">
                            <label for="password" class="form-label fw-bold">
                                Password {{ id ? '(Leave blank to keep current)' : '' }}
                            </label>
                            <div class="position-relative">
                                <i class="fa fa-lock input-icon"></i>
                                <input
                                    id="password"
                                    name="password"
                                    v-model="form.password"
                                    placeholder="Enter Password"
                                    class="form-control search-input"
                                    type="password"
                                />
                            </div>
                            <span v-if="form.errors.password" class="text-danger mt-2 d-block">
                                {{ form.errors.password }}
                            </span>
                        </div>

                        <!-- Confirm Password Input -->
                        <div class="mb-4">
                            <label for="password_confirmation" class="form-label fw-bold">Confirm Password</label>
                            <div class="position-relative">
                                <i class="fa fa-lock input-icon"></i>
                                <input
                                    id="password_confirmation"
                                    name="password_confirmation"
                                    v-model="form.password_confirmation"
                                    placeholder="Confirm Password"
                                    class="form-control search-input"
                                    type="password"
                                />
                            </div>
                        </div>

                        <!-- Role Selection -->
                        <div class="mb-4">
                            <label for="role" class="form-label fw-bold">Role</label>
                            <div class="position-relative">
                                <i class="fa fa-shield-alt input-icon"></i>
                                <select
                                    id="role"
                                    name="role"
                                    v-model="form.role"
                                    class="form-control search-input"
                                >
                                    <option value="">Select Role</option>
                                    <option value="user">User</option>
                                    <option value="admin">Admin</option>
                                </select>
                            </div>
                            <span v-if="form.errors.role" class="text-danger mt-2 d-block">
                                {{ form.errors.role }}
                            </span>
                        </div>

                        <!-- Bio Input -->
                        <div class="mb-4">
                            <label for="bio" class="form-label fw-bold">Bio</label>
                            <div class="position-relative">
                                <i class="fa fa-info-circle input-icon"></i>
                                <textarea
                                    id="bio"
                                    name="bio"
                                    v-model="form.bio"
                                    placeholder="Enter Bio (Optional)"
                                    class="form-control search-input"
                                    rows="3"
                                ></textarea>
                            </div>
                            <span v-if="form.errors.bio" class="text-danger mt-2 d-block">
                                {{ form.errors.bio }}
                            </span>
                        </div>

                        <!-- Avatar Upload -->
                        <div class="mb-4">
                            <label for="avatar" class="form-label fw-bold">Avatar</label>
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
                                alt="User Avatar"
                                class="mt-3 user-avatar-preview"
                            />
                            <span v-if="errors.avatar" class="text-danger mt-2 d-block">
                                {{ errors.avatar }}
                            </span>
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4">
                            <button type="submit" class="btn btn-edit me-2">SAVE</button>
                            <Link :href="`/admin/user`" class="btn btn-secondary">CANCEL</Link>
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
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
    role: '',
    bio: '',
    avatar: '',
    id: id, 
})

const page = usePage()

let apiEndpoint = "/admin/create-user";
let list = page.props.list;

if(id.value !== 0 && list !== null){
    apiEndpoint = "/admin/update-user";
    // fill the form with existing data
    form.name = list['name']
    form.email = list['email']
    form.role = list['role']
    form.bio = list['bio'] || ''
    form.id = list['id']
    form.avatar = list['avatar']
} else {   
    form.avatar = '';
}

// Validation Errors
const errors = ref({});

// Image Upload
const imageUrl = ref(form.avatar ? `/storage/${form.avatar}` : "/empty.png");

const handleImageUpload = (event) => {
    const file = event.target.files[0];
    if (file) {
        form.avatar = file;
        imageUrl.value = URL.createObjectURL(file);
    }
};

function submit() {
    console.log(form.avatar);
    console.log(apiEndpoint);
    form.post(apiEndpoint, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                router.get("/admin/user");
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

.user-avatar-preview {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
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
</style>
