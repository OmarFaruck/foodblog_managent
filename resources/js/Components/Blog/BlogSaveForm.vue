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
                                            :disabled="isUserSelectionDisabled"
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
                                    <small v-if="isUserSelectionDisabled" class="text-muted">
                                        You can only create blog posts for yourself.
                                    </small>
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
                    
                    <!-- Rich Text Toolbar -->
                    <div class="editor-toolbar">
                        <button type="button" @click="execCommand('bold')" class="editor-btn" title="Bold">
                            <i class="fa fa-bold"></i>
                        </button>
                        <button type="button" @click="execCommand('italic')" class="editor-btn" title="Italic">
                            <i class="fa fa-italic"></i>
                        </button>
                        <button type="button" @click="execCommand('underline')" class="editor-btn" title="Underline">
                            <i class="fa fa-underline"></i>
                        </button>
                        <button type="button" @click="execCommand('insertUnorderedList')" class="editor-btn" title="Bullet List">
                            <i class="fa fa-list-ul"></i>
                        </button>
                        <button type="button" @click="execCommand('insertOrderedList')" class="editor-btn" title="Numbered List">
                            <i class="fa fa-list-ol"></i>
                        </button>
                        <button type="button" @click="execCommand('justifyLeft')" class="editor-btn" title="Align Left">
                            <i class="fa fa-align-left"></i>
                        </button>
                        <button type="button" @click="execCommand('justifyCenter')" class="editor-btn" title="Align Center">
                            <i class="fa fa-align-center"></i>
                        </button>
                        <button type="button" @click="execCommand('justifyRight')" class="editor-btn" title="Align Right">
                            <i class="fa fa-align-right"></i>
                        </button>
                        <select @change="formatBlock($event)" class="editor-select">
                            <option value="">Format</option>
                            <option value="h1">Heading 1</option>
                            <option value="h2">Heading 2</option>
                            <option value="h3">Heading 3</option>
                            <option value="p">Paragraph</option>
                        </select>
                    </div>
                    
                    <!-- Rich Text Editor -->
                    <div 
                        ref="editor"
                        class="rich-text-editor"
                        contenteditable="true"
                        @input="updateContent"
                        @blur="updateContent"
                        v-html="form.content"
                        placeholder="Write your blog content here..."
                    ></div>
                    
                    <!-- Hidden textarea for form submission -->
                    <textarea 
                        v-model="form.content" 
                        style="display: none;"
                        name="content"
                    ></textarea>
                    
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
import {ref, computed, onMounted} from "vue";

const toaster = createToaster();

// Rich text editor functions
const editor = ref(null);

const execCommand = (command, value = null) => {
    document.execCommand(command, false, value);
    updateContent();
};

const formatBlock = (event) => {
    const value = event.target.value;
    if (value) {
        document.execCommand('formatBlock', false, `<${value}>`);
        updateContent();
        event.target.value = '';
    }
};

const updateContent = () => {
    if (editor.value) {
        form.content = editor.value.innerHTML;
    }
};

const urlParams = new URLSearchParams(window.location.search)
let id = ref(parseInt(urlParams.get('id')) || null)

const form = useForm({
    title: '',
    excerpt: '',
    content: '',
    user_id: '',
    image: '',
    id: id, 
})

const page = usePage()

// Get user data from Inertia shared props
const user = computed(() => page.props.auth?.user || null);
const userRole = computed(() => user.value?.role || 'user');

// Check if user selection should be disabled (for regular users)
const isUserSelectionDisabled = computed(() => userRole.value !== 'admin');

let apiEndpoint = "/admin/create-blog";
let list = page.props.list;
let users = page.props.users || [];

if(id.value && list !== null){
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

// Auto-select user for regular users after component is mounted
onMounted(() => {
    // For new blogs and regular users, auto-select current user
    if (!id.value && userRole.value !== 'admin' && users.length > 0) {
        form.user_id = users[0].id; // Regular users only see themselves in the list
    }
});

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

select.search-input:disabled {
    background-color: #f8f9fa;
    color: #6c757d;
    cursor: not-allowed;
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

/* Rich Text Editor Styles */
.editor-toolbar {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    padding: 8px;
    border: 1px solid #ddd;
    border-bottom: none;
    background-color: #f8f9fa;
    gap: 4px;
}

.editor-btn {
    background: none;
    border: 1px solid transparent;
    padding: 6px 8px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    color: #333;
    transition: all 0.2s;
}

.editor-btn:hover {
    background-color: #e9ecef;
    border-color: #adb5bd;
}

.editor-btn:active {
    background-color: #dee2e6;
}

.editor-select {
    padding: 4px 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 13px;
    background-color: white;
}

.rich-text-editor {
    min-height: 300px;
    border: 1px solid #ddd;
    border-top: none;
    padding: 15px;
    background-color: white;
    font-size: 14px;
    line-height: 1.6;
    overflow-y: auto;
}

.rich-text-editor:focus {
    outline: none;
    border-color: #80bdff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.rich-text-editor[contenteditable="true"]:empty:before {
    content: attr(placeholder);
    color: #999;
    font-style: italic;
}

.rich-text-editor h1 {
    font-size: 2rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.rich-text-editor h2 {
    font-size: 1.75rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.rich-text-editor h3 {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.rich-text-editor p {
    margin-bottom: 1rem;
}

.rich-text-editor ul, .rich-text-editor ol {
    margin-bottom: 1rem;
    padding-left: 2rem;
}

.rich-text-editor li {
    margin-bottom: 0.25rem;
}
</style>
