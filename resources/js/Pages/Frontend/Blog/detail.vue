<template>
    <FrontendLayout>
    
<!-- recipe header Section -->
    <section class="recipe-header">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <!-- Left Side Content -->
                <div class="col-lg-12 text-center">
                    <h1 class="display-4 fw-bold mb-4">{{ blog.title }}</h1>
                    
                    <div class="d-flex flex-wrap align-items-center justify-content-center mb-4">
                        <!-- Author Info -->
                        <div class="d-flex align-items-center  me-4 mb-3 mb-md-0">
                            <div class="author-avatar me-2">
                                <img src="@/Assets/img/users/chef-4.png" alt="Author" class="rounded-circle" width="50" height="50">
                            </div>
                            <div>
                                <h6 class="mb-0 fw-bold">{{ blog.user.name }}</h6>
                            </div>
                        </div>
                        
                        <!-- Recipe Metadata -->
                        <div class="d-flex flex-wrap">
                            <!-- Prep Time -->
                            <div class="recipe-meta-item d-flex align-items-center me-4 mb-3 mb-md-0">
                                <div class="me-3">
                                    <i class="far fa-clock me-2"></i>
                                </div>
                                <div>
                                    <p class="fw-medium mb-0">{{ formatDate(blog.created_at) }}</p>
                                </div>
                            </div>
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <!-- blog detail image -->
    <section class="recipe-detail-section py-4">
        <div class="container">
            <div class="row g-5 align-items-stretch">
                <div class="col-lg-12 d-flex">
                    <div class="recipe-image-container position-relative w-100 d-flex">
                        <img 
                            :src="blog.image ? `/storage/${blog.image}` : '/images/placeholder-blog.jpg'" 
                            :alt="blog.title" 
                            class="img-fluid w-100 object-fit-cover"
                        >
                    </div>
                </div>
            </div>
        </div>
    </section>    

    <!-- Ingredients and Sidebar Section -->
    <section class="ingredients-section py-4">
        <div class="container">
            <div class="row g-5">
                <!-- Left Column - Ingredients -->
                <div class="col-lg-8">

                    <!-- Directions Section -->
                    <div class="mb-5">
                        <!-- Blog Content -->
                        <div class="d-flex align-items-start mb-4">
                            <div>
                                <!-- Blog Excerpt -->
                                <div v-if="blog.excerpt" class="mb-4">
                                    <p class="text-muted fs-5 fst-italic">{{ blog.excerpt }}</p>
                                </div>
                                
                                <!-- Blog Content -->
                                <div class="blog-content" v-html="blog.content"></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Right Column - Sidebar -->
                <div class="col-lg-4">
                        <!-- Right Column - share section -->
                        <div class="share-section pt-4 pb-4">
                            <div class="bg-white rounded-3 p-4 text-center">
                                <p class="text-uppercase fw-bold small mb-4">Share this on:</p>
                                <div class="d-flex flex-column gap-4">
                                    <a href="#" class="share-link text-decoration-none text-dark">
                                        <i class="fab fa-facebook-f me-3"></i>
                                    </a>
                                    <a href="#" class="share-link text-decoration-none text-dark">
                                        <i class="fab fa-twitter me-3"></i>
                                    </a>
                                    <a href="#" class="share-link text-decoration-none text-dark">
                                        <i class="fab fa-instagram me-3"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>        
    </section>    


    <section id="related-articles" class="py-5">
    <div class="container">
        <!-- Section Header -->
        <div class="text-center mb-5">
            <h2 class="fw-bold mb-3">You may like these articles too</h2>
        </div>

        <div class="featured-recipe-cards">
                    <!-- Recipe Cards Row -->
                    <div class="row g-5">
                        <!-- Related Blog Cards -->
                        <div v-for="relatedBlog in relatedBlogs" :key="relatedBlog.id" class="col-lg-3 col-md-6">
                            <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                <div class="featured-recipe-image position-relative rounded-4">
                                    <Link :href="`/blog/${relatedBlog.id}`">
                                        <img 
                                            :src="relatedBlog.image ? `/storage/${relatedBlog.image}` : '/images/placeholder-blog.jpg'" 
                                            :alt="relatedBlog.title" 
                                            class="img-fluid w-100"
                                            style="height: 200px; object-fit: cover;"
                                        >
                                    </Link>
                                </div>
                                <div class="featured-recipe-content p-3">
                                    <h5 class="featured-recipe-title mb-2">
                                        <Link :href="`/blog/${relatedBlog.id}`" class="text-decoration-none text-dark">
                                            {{ truncateTitle(relatedBlog.title, 50) }}
                                        </Link>
                                    </h5>
                                    <div class="featured-recipe-meta d-flex align-items-center">
                                        <div class="me-3">
                                            <i class="far fa-clock me-1"></i>
                                            <span>{{ formatDate(relatedBlog.created_at) }}</span>
                                        </div>
                                        <div>
                                            <i class="fas fa-user me-1"></i>
                                            <span>{{ relatedBlog.user.name }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Show placeholder cards if less than 4 related blogs -->
                        <div v-if="relatedBlogs.length === 0" class="col-12 text-center">
                            <p class="text-muted">No related articles found.</p>
                        </div>
                </div>
            </div>            
    </div>
    </section>

        <section id="recipes" class="py-5">
        <div class="container">
            <!-- Section Header -->
            <div class="text-center mb-5">
                <h2 class="fw-bold mb-3">You may like these recipes too</h2>
            </div>

            <div class="featured-recipe-cards">
                        <!-- Recipe Cards Row -->
                        <div class="row g-5">
                            <!-- Recipe Cards -->
                            <div v-for="recipe in randomRecipes" :key="recipe.id" class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <Link :href="`/recipe/${recipe.id}`">
                                            <img 
                                                :src="recipe.recipe_image ? `/storage/${recipe.recipe_image}` : '/images/placeholder-recipe.jpg'" 
                                                :alt="recipe.title" 
                                                class="img-fluid w-100"
                                                style="height: 200px; object-fit: cover;"
                                            >
                                        </Link>
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">
                                            <Link :href="`/recipe/${recipe.id}`" class="text-decoration-none text-dark">
                                                {{ truncateTitle(recipe.title, 50) }}
                                            </Link>
                                        </h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>{{ recipe.prep_time }} Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>{{ recipe.category ? recipe.category.name : 'Recipe' }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Show placeholder message if no recipes -->
                            <div v-if="randomRecipes.length === 0" class="col-12 text-center">
                                <p class="text-muted">No recipes found.</p>
                            </div>
                    </div>
                </div>            
        </div>
        </section>        

    </FrontendLayout>
</template>

<script setup>
import FrontendLayout from '@/Layout/FrontendLayout.vue';
import { Link } from '@inertiajs/vue3';

// Props from the controller
const props = defineProps({
    blog: Object,
    relatedBlogs: Array,
    randomRecipes: Array,
});

// Helper methods
const formatDate = (dateString) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString('en-US', options);
};

const truncateTitle = (title, length = 50) => {
    if (!title) return '';
    return title.length > length ? title.substring(0, length) + '...' : title;
};

</script>