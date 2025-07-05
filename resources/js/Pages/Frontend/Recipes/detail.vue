<template>
    <FrontendLayout :relatedRecipes="relatedRecipes" :showRelatedRecipes="true">
        <!-- recipe header Section -->
        <section class="recipe-header">
            <div class="container">
                <div class="row align-items-center justify-content-between">
                    <!-- Left Side Content -->
                    <div class="col-lg-8">
                        <h1 class="display-4 fw-bold mb-4">{{ recipe.title }}</h1>
                        
                        <div class="d-flex flex-wrap align-items-center mb-4">
                            <!-- Author Info -->
                            <div class="d-flex align-items-center me-4 mb-3 mb-md-0">
                                <div class="author-avatar me-2">
                                    <!-- <div class="avatar-circle bg-primary text-white d-flex align-items-center justify-content-center rounded-circle" style="width: 50px; height: 50px;"> -->
                                        <!-- {{ recipe.user.name.charAt(0).toUpperCase() }} -->
                                          <!-- <img :src="`/storage/${recipe.user.avatar}`" alt="Author" class="rounded-circle me-3" width="50" height="50">
                                    </div> -->
                                    <div class="author-avatar me-2">
                                        <img :src="`/storage/${recipe.user.avatar}`" alt="John Smith" class="rounded-circle" width="50" height="50">
                                    </div>                                    
                                </div>
                                <div>
                                    <h6 class="mb-0 fw-bold">{{ recipe.user.name }}</h6>
                                    <span class="text-muted small">{{ formatDate(recipe.created_at) }}</span>
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
                                        <p class="small text-uppercase mb-0 text-muted">PREP TIME</p>
                                        <p class="fw-medium mb-0">{{ recipe.prep_time }} Minutes</p>
                                    </div>
                                </div>
                                
                                <!-- Cook Time -->
                                <div class="recipe-meta-item d-flex align-items-center me-4 mb-3 mb-md-0">
                                    <div class="me-3">
                                        <i class="far fa-clock me-2"></i>
                                    </div>
                                    <div>
                                        <p class="small text-uppercase mb-0 text-muted">COOK TIME</p>
                                        <p class="fw-medium mb-0">{{ recipe.cook_time }} Minutes</p>
                                    </div>
                                </div>
                                
                                <!-- Serving Size -->
                                <div class="recipe-meta-item d-flex align-items-center me-4 mb-3 mb-md-0">
                                    <div class="me-3">
                                        <i class="fas fa-users me-2"></i>
                                    </div>
                                    <div>
                                        <p class="small text-uppercase mb-0 text-muted">SERVINGS</p>
                                        <p class="fw-medium mb-0">{{ recipe.serving_size }}</p>
                                    </div>
                                </div>
                                
                                <!-- Category -->
                                <div class="recipe-meta-item d-flex align-items-center mb-3 mb-md-0">
                                    <div class="me-3">
                                        <i class="fas fa-utensils me-2"></i>
                                    </div>
                                    <div>
                                        <p class="small text-uppercase mb-0 text-muted">CATEGORY</p>
                                        <p class="fw-medium mb-0">{{ recipe.category.name }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Right Side Action Buttons -->
                    <div class="col-lg-3 text-lg-end">
                        <div class="d-flex justify-content-lg-end justify-content-start">
                            <!-- Print Button -->
                            <div class="action-button-container text-center me-4">
                                <a href="#" class="action-button d-inline-flex align-items-center justify-content-center mb-2">
                                    <i class="fas fa-print"></i>
                                </a>
                                <p class="small fw-medium text-uppercase mb-0">PRINT</p>
                            </div>
                            
                            <!-- Share Button -->
                            <div class="action-button-container text-center">
                                <a href="#" class="action-button d-inline-flex align-items-center justify-content-center mb-2">
                                    <i class="fas fa-share-alt"></i>
                                </a>
                                <p class="small fw-medium text-uppercase mb-0">SHARE</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>  

<!-- Recipe Detail Section with Image and Nutrition Info -->
    <section class="recipe-detail-section">
        <div class="container">
            <div class="row g-5 align-items-stretch">
                <!-- Left Column - Recipe Image with Video Play Button -->
                <div class="col-lg-9 d-flex">
                    <div class="recipe-image-container position-relative w-100 d-flex rounded-4 overflow-hidden" style="height: 450px;">
                        <img 
                            :src="`/storage/${recipe.recipe_image}` || '/images/empty.png'" 
                            :alt="recipe.title" 
                            class="img-fluid w-100 h-100"
                            style="object-fit: cover; object-position: center;"
                        >
                        <a href="https://www.youtube.com/watch?v=qH__o17xHls" target="_blank" class="video-play-button position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                            <i class="fas fa-play"></i>
                        </a>
                    </div>
                </div>
                
                <!-- Right Column - Nutrition Information -->
                <div class="col-lg-3 d-flex">
                    <div class="nutrition-panel rounded-4 p-4 bg-light-blue w-100 d-flex flex-column">
                        <h5 class="fw-bold mb-4">Nutrition Information</h5>
                        
                        <div class="nutrition-list" v-if="recipe.nutrition_facts">
                            <!-- Calories -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3" v-if="recipe.nutrition_facts.calories">
                                <span class="nutrition-name">Calories</span>
                                <span class="nutrition-value fw-semibold">{{ recipe.nutrition_facts.calories }} kcal</span>
                            </div>
                            
                            <!-- Total Fat -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3" v-if="recipe.nutrition_facts.total_fat">
                                <span class="nutrition-name">Total Fat</span>
                                <span class="nutrition-value fw-semibold">{{ recipe.nutrition_facts.total_fat }} g</span>
                            </div>
                            
                            <!-- Protein -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3" v-if="recipe.nutrition_facts.protein">
                                <span class="nutrition-name">Protein</span>
                                <span class="nutrition-value fw-semibold">{{ recipe.nutrition_facts.protein }} g</span>
                            </div>
                            
                            <!-- Carbohydrate -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3" v-if="recipe.nutrition_facts.carbohydrate">
                                <span class="nutrition-name">Carbohydrate</span>
                                <span class="nutrition-value fw-semibold">{{ recipe.nutrition_facts.carbohydrate }} g</span>
                            </div>
                            
                            <!-- Cholesterol -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center" v-if="recipe.nutrition_facts.cholesterol">
                                <span class="nutrition-name">Cholesterol</span>
                                <span class="nutrition-value fw-semibold">{{ recipe.nutrition_facts.cholesterol }} mg</span>
                            </div>
                        </div>
                        
                        <p class="recipe-description mt-4 text-muted">
                            {{ recipe.description }}
                        </p>
                        <div class="mt-auto"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Recipe Description Section -->
    <section class="recipe-description-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="mb-5">
                        <p class="text-muted" style="white-space: pre-line;">{{ recipe.description }}</p>
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
                    <h2 class="fw-bold mb-5">Ingredients</h2>
                    <!-- Dynamic Ingredients by Group -->
                    <div 
                        v-for="group in ingredientGroups" 
                        :key="group.name" 
                        class="ingredients-category mb-5"
                    >
                        <h5 class="fw-bold mb-4">{{ group.name }}</h5>
                        <div class="ingredients-list">
                            <div 
                                v-for="ingredient in group.ingredients" 
                                :key="ingredient.id" 
                                class="ingredient-item d-flex align-items-center mb-4"
                            >
                                <div 
                                    class="ingredient-checkbox me-3" 
                                    :class="{ 'checked': checkedIngredients[ingredient.id] }"
                                    @click="toggleIngredient(ingredient.id)"
                                >
                                    <i v-if="checkedIngredients[ingredient.id]" class="fas fa-check"></i>
                                </div>
                                <span 
                                    class="ingredient-text" 
                                    :class="{ 'checked': checkedIngredients[ingredient.id] }"
                                >
                                    {{ ingredient.name }}
                                </span>
                            </div>
                        </div>
                    </div>

                    <h2 class="fw-bold my-5">Directions</h2>

                    <!-- Dynamic Directions Section -->
                    <div class="ingredients-category mb-5">
                        <div 
                            v-for="direction in recipe.directions" 
                            :key="direction.id" 
                            class="ingredient-item d-flex align-items-start mb-5"
                        >
                            <div class="d-flex align-items-center me-3">
                                <div 
                                    class="ingredient-checkbox direction-checkbox me-3" 
                                    :class="{ 'checked': checkedDirections[direction.id] }"
                                    @click="toggleDirection(direction.id)"
                                >
                                    <i v-if="checkedDirections[direction.id]" class="fas fa-check"></i>
                                </div>
                                <div class="step-number">{{ direction.step_number }}</div>
                            </div>
                            <div>
                                <div class="direction-content">
                                    <p 
                                        class="text-muted mb-4" 
                                        :class="{ 'checked': checkedDirections[direction.id] }"
                                        style="white-space: pre-line;"
                                    >
                                        {{ direction.instruction }}
                                    </p>
                                    
                                    <!-- Step Image (if available) -->
                                    <div v-if="direction.image" class="mb-4 mt-4">
                                        <img 
                                            :src="`/storage/${direction.image}`" 
                                            :alt="`Cooking step ${direction.step_number}`" 
                                            class="img-fluid rounded-4 w-100"
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
                <!-- Right Column - Sidebar -->
                <div class="col-lg-4">
                    <!-- Other Recipes Section -->
                    <div class="other-recipes mb-5">
                        <h3 class="fw-bold mb-4">Other Recipe</h3>
                        <div 
                            v-for="relatedRecipe in relatedRecipes.slice(0, 3)" 
                            :key="relatedRecipe.id" 
                            class="recipe-item d-flex mb-4"
                        >
                            <div class="recipe-thumb me-3">
                                <img 
                                    :src=" `/storage/${relatedRecipe.recipe_image}` || '/images/empty.png'" 
                                    :alt="relatedRecipe.title" 
                                    class="rounded-4 recipe-thumb-img"
                                >
                            </div>
                            <div class="recipe-info">
                                <Link 
                                    :href="`/recipe/${relatedRecipe.id}`"
                                    class="text-decoration-none text-dark"
                                >
                                    <h5 class="fw-bold mb-2">{{ relatedRecipe.title }}</h5>
                                </Link>
                                <p class="text-muted small mb-0">By {{ relatedRecipe.user.name }}</p>
                            </div>
                        </div>    
                        <!-- Promotional Banner -->
                        <div class="promo-banner text-center p-4">
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
import { computed, ref } from 'vue';
import { formatDate } from '@/utilities/date.js';

// Props received from controller
const props = defineProps({
    recipe: Object,
    relatedRecipes: Array
});

// Reactive state for checked items
const checkedIngredients = ref({});
const checkedDirections = ref({});

// Toggle functions
const toggleIngredient = (ingredientId) => {
    checkedIngredients.value[ingredientId] = !checkedIngredients.value[ingredientId];
};

const toggleDirection = (directionId) => {
    checkedDirections.value[directionId] = !checkedDirections.value[directionId];
};

// Group ingredients by their group/category
const ingredientGroups = computed(() => {
    if (!props.recipe.ingredients) return [];
    
    const groups = {};
    
    props.recipe.ingredients.forEach(ingredient => {
        const groupName = ingredient.pivot.ingredient_group || 'Main Ingredients';
        
        if (!groups[groupName]) {
            groups[groupName] = {
                name: groupName,
                ingredients: []
            };
        }
        
        groups[groupName].ingredients.push(ingredient);
    });
    
    return Object.values(groups);
});

</script>

<style scoped>

/* Strikethrough effect for checked items */
.ingredient-text.checked,
.text-muted.checked {
    text-decoration: line-through;
    opacity: 0.6;
    transition: all 0.3s ease;
}

</style>