<template>
    <FrontendLayout>
        <!-- Blog Header Section -->
    <section class="blog-header py-5 mt-5">
        <div class="container">
            <div class="text-center">
                <h1 class="display-4 fw-bold mb-3">Blog & Article</h1>
                <p class="text-muted mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
                
                <!-- Search Bar -->
                <div class="row justify-content-center mb-5">
                    <div class="col-lg-7">
                        <div class="search-container">
                            <div class="input-group">
                                <input 
                                    type="text" 
                                    class="form-control search-input" 
                                    placeholder="Search article, news or recipe..."
                                    v-model="searchQuery"
                                    @keyup.enter="performSearch"
                                >
                                <button class="btn btn-dark search-button" type="button" @click="performSearch">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- Blog list Section -->
    <section class="blog-listing">
        <div class="container">
            <div class="row g-5">
                <!-- Left Column - Blog Posts -->
                <div class="col-lg-8">
                    <!-- Show message if no blogs found -->
                    <div v-if="blogs.data.length === 0" class="text-center py-5">
                        <h4 class="text-muted">No blogs found</h4>
                        <p class="text-muted">{{ search ? 'Try adjusting your search terms' : 'No blogs have been published yet' }}</p>
                    </div>

                    <!-- Blog Posts -->
                    <div v-for="blog in blogs.data" :key="blog.id" class="blog-post mb-5">
                        <div class="row">
                            <div class="col-lg-4 mb-4 mb-lg-0">
                                <Link :href="`/blog/${blog.id}`" class="text-decoration-none">
                                    <div class="blog-image-container">
                                        <img 
                                            :src="blog.image ? `/storage/${blog.image}` : '/images/placeholder-blog.jpg'" 
                                            :alt="blog.title" 
                                            class="img-fluid rounded-4"
                                            style="width: 100%; height: 200px; object-fit: cover;"
                                        >
                                    </div>
                                </Link>
                            </div>
                            <div class="col-lg-8">
                                <h4 class="fw-bold mb-3">
                                    <Link :href="`/blog/${blog.id}`" class="text-decoration-none text-dark">
                                        {{ blog.title }}
                                    </Link>
                                </h4>
                                <p class="text-muted mb-4">{{ blog.excerpt || truncateContent(blog.content, 120) }}</p>
                                <div class="author-info-container d-flex align-items-center">
                                    <div class="author-avatar me-3">
                                        <img :src="`/storage/${blog.user.avatar}`" alt="Author" class="rounded-circle" width="50" height="50">
                                    </div>
                                    <div class="author-info d-flex align-items-center">
                                        <h6 class="mb-0 fw-bold me-3">{{ blog.user.name }}</h6>
                                        <div class="d-flex align-items-center recipe-meta-item">
                                            <i class="far fa-clock me-2 text-muted"></i>
                                            <p class="text-muted small mb-0">{{ formatDate(blog.created_at) }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <div v-if="blogs.last_page > 1" class="pagination-container d-flex justify-content-center my-5">
                        <nav aria-label="Blog pagination">
                            <ul class="pagination">
                                <!-- Previous Page -->
                                <li class="page-item" :class="{ disabled: !blogs.prev_page_url }">
                                    <button 
                                        class="page-link" 
                                        @click="goToPage(blogs.current_page - 1)"
                                        :disabled="!blogs.prev_page_url"
                                    >
                                        <i class="fas fa-angle-left"></i>
                                    </button>
                                </li>

                                <!-- Page Numbers -->
                                <li 
                                    v-for="page in visiblePages" 
                                    :key="page" 
                                    class="page-item" 
                                    :class="{ active: page === blogs.current_page }"
                                >
                                    <button class="page-link" @click="goToPage(page)">{{ page }}</button>
                                </li>

                                <!-- Next Page -->
                                <li class="page-item" :class="{ disabled: !blogs.next_page_url }">
                                    <button 
                                        class="page-link" 
                                        @click="goToPage(blogs.current_page + 1)"
                                        :disabled="!blogs.next_page_url"
                                    >
                                        <i class="fas fa-angle-right"></i>
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                
                <!-- Right Column - Sidebar -->
                <div class="col-lg-4">
                    <!-- Tasty Recipes Section -->
                    <div class="other-recipes mb-5">
                        <h3 class="fw-bold mb-4">Tasty Recipes</h3>
                        
                        <!-- Recipe Items -->
                        <div v-for="recipe in recentRecipes" :key="recipe.id" class="recipe-item d-flex mb-4">
                            <div class="recipe-thumb me-3">
                                <Link :href="`/recipe/${recipe.id}`">
                                    <img 
                                        :src="recipe.recipe_image ? `/storage/${recipe.recipe_image}` : '/images/placeholder-recipe.jpg'" 
                                        :alt="recipe.title" 
                                        class="rounded-4 recipe-thumb-img"
                                        style="width: 80px; height: 80px; object-fit: cover;"
                                    >
                                </Link>
                            </div>
                            <div class="recipe-info">
                                <h5 class="fw-bold mb-2">
                                    <Link :href="`/recipe/${recipe.id}`" class="text-decoration-none text-dark">
                                        {{ recipe.title }}
                                    </Link>
                                </h5>
                                <p class="text-muted small mb-0">By {{ recipe.user.name }}</p>
                            </div>
                        </div>

                        <!-- Show message if no recipes -->
                        <div v-if="recentRecipes.length === 0" class="text-center text-muted">
                            <p>No recipes available</p>
                        </div>
                    </div>
                    
                    <!-- Healthy Food Banner -->
                    <!-- Promotional Banner -->
                    <div class="promo-banner text-center p-4 mb-5">
                        <h4 class="promo-text mb-4 font-lobster">
                            Don't forget to eat<br>
                            healthy food
                        </h4>
                        <div class="promo-image-container position-relative mb-3">
                            <div class="star-overlay">
                                <img src="@/Assets/img/recipes/Star-1.png" alt="Star" class="img-fluid">
                            </div>
                            <div class="promo-image">
                                <img src="@/Assets/img/recipes/promotional-banner.png" alt="Healthy Food" class="img-fluid">
                            </div>
                        </div>
                        <p class="promo-website mb-0">www.foodieland.com</p>
                    </div>
                    
                    <!-- Tags Section -->
                    <!-- <div class="tags-section mb-5">
                        <h3 class="fw-bold mb-4">Tags</h3>
                        <div class="tags-container">
                            <a href="#" class="tag-badge">Cooking</a>
                            <a href="#" class="tag-badge">Food</a>
                            <a href="#" class="tag-badge">Foodie</a>
                            <a href="#" class="tag-badge">Health</a>
                            <a href="#" class="tag-badge">Healthy</a>
                            <a href="#" class="tag-badge">Recipe</a>
                            <a href="#" class="tag-badge">Soup</a>
                            <a href="#" class="tag-badge">Vegetable</a>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>
    </section>    

    </FrontendLayout>
</template>

<script setup>
import FrontendLayout from '@/Layout/FrontendLayout.vue';
import { Link, router } from '@inertiajs/vue3';
import { ref, computed } from 'vue';

// Props from the controller
const props = defineProps({
    blogs: Object,
    recentRecipes: Array,
    search: String,
});

// Reactive data
const searchQuery = ref(props.search || '');

// Methods
const performSearch = () => {
    router.get('/blog', { 
        search: searchQuery.value 
    }, {
        preserveState: true,
        replace: true
    });
};

const goToPage = (page) => {
    router.get('/blog', { 
        page: page,
        search: searchQuery.value 
    }, {
        preserveState: true,
        replace: true
    });
};

const truncateContent = (content, length = 120) => {
    if (!content) return '';
    const text = content.replace(/<[^>]*>/g, ''); // Remove HTML tags
    return text.length > length ? text.substring(0, length) + '...' : text;
};

const formatDate = (dateString) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString('en-US', options);
};

// Computed properties
const visiblePages = computed(() => {
    const pages = [];
    const current = props.blogs.current_page;
    const last = props.blogs.last_page;
    const maxVisible = 5;
    
    let start = Math.max(1, current - Math.floor(maxVisible / 2));
    let end = Math.min(last, start + maxVisible - 1);
    
    if (end - start + 1 < maxVisible) {
        start = Math.max(1, end - maxVisible + 1);
    }
    
    for (let i = start; i <= end; i++) {
        pages.push(i);
    }
    
    return pages;
});

</script>