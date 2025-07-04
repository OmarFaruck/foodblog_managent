<template>
    <FrontendLayout>
    <!-- Recipe Header Section -->
    <section class="blog-header py-5 mt-5">
        <div class="container">
            <div class="text-center">
                <h1 class="display-4 fw-bold mb-3">Simple and Tasty Recipes</h1>
                <p class="text-muted mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
                
                <!-- Search Bar -->
                <div class="row justify-content-center mb-5">
                    <div class="col-lg-7">
                        <div class="search-container">
                            <div class="input-group">
                                <input 
                                    type="text" 
                                    class="form-control search-input" 
                                    placeholder="Search for a recipe..."
                                    v-model="searchForm.search"
                                    @keyup.enter="searchRecipes"
                                >
                                <button class="btn btn-dark search-button" type="button" @click="searchRecipes">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- Recipe Cards Section -->
    <section class="recipes-listing">
        <div class="container">
            <div class="row g-4">
                <!-- Recipe Card 1 -->
                 <div class="col-lg-3">
                    <h2 class="fw-semibold mb-4">Categories</h2>
                    <div class="category-filters">
                        <div 
                            v-for="category in categories" 
                            :key="category.id" 
                            class="category-filter-item d-flex align-items-center mb-4"
                        >
                            <div class="category-checkbox me-3">
                                <input 
                                    type="checkbox" 
                                    :id="'category-' + category.id" 
                                    :value="category.id"
                                    v-model="searchForm.categories"
                                    @change="filterRecipes"
                                    class="category-input visually-hidden"
                                >
                                <label :for="'category-' + category.id" class="category-checkbox-label"></label>
                            </div>
                            <label :for="'category-' + category.id" class="category-label fs-5">
                                {{ category.name }} ({{ category.recipes_count }})
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="featured-recipe-cards">
                        <!-- Recipe Cards Row -->
                        <div class="row g-5">
                            <div 
                                v-for="recipe in recipes.data" 
                                :key="recipe.id" 
                                class="col-lg-4 col-md-6"
                            >
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img 
                                            :src="recipe.recipe_image || '/images/empty.png'" 
                                            :alt="recipe.title"
                                            class="img-fluid w-100"
                                        >
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <Link 
                                            :href="`/recipe/detail`" 
                                            class="text-decoration-none text-dark"
                                        >
                                            <h5 class="featured-recipe-title mb-2">{{ recipe.title }}</h5>
                                        </Link>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>{{ recipe.prep_time + recipe.cook_time }} Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>{{ recipe.category.name }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Pagination -->
            <div class="pagination-container d-flex justify-content-center mt-5" v-if="shouldShowPagination">
                <nav aria-label="Recipe pagination">
                    <ul class="pagination">
                        <!-- Previous Button -->
                        <li class="page-item" :class="{ disabled: !canGoPrev }">
                            <button 
                                class="page-link" 
                                @click="prevPage"
                                :disabled="!canGoPrev"
                            >
                                <i class="fas fa-angle-left"></i>
                            </button>
                        </li>
                        
                        <!-- Page Numbers -->
                        <li 
                            v-for="page in visiblePages" 
                            :key="page" 
                            class="page-item" 
                            :class="{ 
                                active: page === currentPage,
                                disabled: page === '...'
                            }"
                        >
                            <button 
                                v-if="page !== '...'" 
                                class="page-link" 
                                @click="goToPage(page)"
                            >
                                {{ page }}
                            </button>
                            <span v-else class="page-link">{{ page }}</span>
                        </li>
                        
                        <!-- Next Button -->
                        <li class="page-item" :class="{ disabled: !canGoNext }">
                            <button 
                                class="page-link" 
                                @click="nextPage"
                                :disabled="!canGoNext"
                            >
                                <i class="fas fa-angle-right"></i>
                            </button>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>

    </FrontendLayout>
</template>

<script setup>
import FrontendLayout from '@/Layout/FrontendLayout.vue';
import { Link } from '@inertiajs/vue3';
import { ref, computed } from 'vue';
import { usePagination, useSearch } from '@/utilities/pagination.js';

// Props received from controller
const props = defineProps({
    recipes: Object,
    categories: Array,
    filters: Object
});

// Reactive form for search and filters
const searchForm = ref({
    search: props.filters.search || '',
    categories: props.filters.categories || []
});

// Convert props to reactive refs for utilities
const recipesData = computed(() => props.recipes);
const filtersData = computed(() => searchForm.value);

// Use pagination utility
const {
    goToPage,
    nextPage,
    prevPage,
    visiblePages,
    shouldShowPagination,
    paginationInfo,
    canGoPrev,
    canGoNext,
    currentPage,
    lastPage
} = usePagination(recipesData, filtersData, '', {
    preserveState: true,
    preserveScroll: true,
    maxVisiblePages: 5
});

// Use search utility
const { search: performSearch } = useSearch(searchForm, '', {
    preserveState: true,
    preserveScroll: true
});

// Search recipes function
const searchRecipes = () => {
    performSearch();
};

// Filter recipes by category
const filterRecipes = () => {
    performSearch();
};

</script>