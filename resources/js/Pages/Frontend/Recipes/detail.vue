<template>
    <FrontendLayout>
    
<!-- recipe header Section -->
    <section class="recipe-header">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <!-- Left Side Content -->
                <div class="col-lg-8">
                    <h1 class="display-4 fw-bold mb-4">Health Japanese Fried Rice</h1>
                    
                    <div class="d-flex flex-wrap align-items-center mb-4">
                        <!-- Author Info -->
                        <div class="d-flex align-items-center me-4 mb-3 mb-md-0">
                            <div class="author-avatar me-2">
                                <img src="@/Assets/img/users/chef-4.png" alt="John Smith" class="rounded-circle" width="50" height="50">
                            </div>
                            <div>
                                <h6 class="mb-0 fw-bold">John Smith</h6>
                                <span class="text-muted small">15 March 2022</span>
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
                                    <p class="fw-medium mb-0">15 Minutes</p>
                                </div>
                            </div>
                            
                            <!-- Cook Time -->
                            <div class="recipe-meta-item d-flex align-items-center me-4 mb-3 mb-md-0">
                                <div class="me-3">
                                    <i class="far fa-clock me-2"></i>
                                </div>
                                <div>
                                    <p class="small text-uppercase mb-0 text-muted">COOK TIME</p>
                                    <p class="fw-medium mb-0">15 Minutes</p>
                                </div>
                            </div>
                            
                            <!-- Category -->
                            <div class="recipe-meta-item d-flex align-items-center mb-3 mb-md-0">
                                <div class="me-3">
                                    <i class="fas fa-utensils me-2"></i>
                                </div>
                                <div>
                                    <p class="small text-uppercase mb-0 text-muted">CATEGORY</p>
                                    <p class="fw-medium mb-0">Chicken</p>
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
    <section class="recipe-detail-section py-4">
        <div class="container">
            <div class="row g-5 align-items-stretch">
                <!-- Left Column - Recipe Image with Video Play Button -->
                <div class="col-lg-9 d-flex">
                    <div class="recipe-image-container position-relative w-100 d-flex">
                        <img src="@/Assets/img/post details/image1.jpg" alt="Health Japanese Fried Rice" class="img-fluid w-100 object-fit-cover">
                        <a href="https://www.youtube.com/watch?v=qH__o17xHls" target="_blank" class="video-play-button position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                            <i class="fas fa-play"></i>
                        </a>
                    </div>
                </div>
                
                <!-- Right Column - Nutrition Information -->
                <div class="col-lg-3 d-flex">
                    <div class="nutrition-panel rounded-4 p-4 bg-light-blue w-100 d-flex flex-column">
                        <h5 class="fw-bold mb-4">Nutrition Information</h5>
                        
                        <div class="nutrition-list">
                            <!-- Calories -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3">
                                <span class="nutrition-name">Calories</span>
                                <span class="nutrition-value fw-semibold">219.9 kcal</span>
                            </div>
                            
                            <!-- Total Fat -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3">
                                <span class="nutrition-name">Total Fat</span>
                                <span class="nutrition-value fw-semibold">10.7 g</span>
                            </div>
                            
                            <!-- Protein -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3">
                                <span class="nutrition-name">Protein</span>
                                <span class="nutrition-value fw-semibold">7.9 g</span>
                            </div>
                            
                            <!-- Carbohydrate -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center mb-3">
                                <span class="nutrition-name">Carbohydrate</span>
                                <span class="nutrition-value fw-semibold">22.3 g</span>
                            </div>
                            
                            <!-- Cholesterol -->
                            <div class="nutrition-item d-flex justify-content-between align-items-center">
                                <span class="nutrition-name">Cholesterol</span>
                                <span class="nutrition-value fw-semibold">37.4 mg</span>
                            </div>
                        </div>
                        
                        <p class="recipe-description mt-4 text-muted">
                            adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                        <div class="mt-auto"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Recipe Description Section -->
    <section class="recipe-description-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="mb-5">
                        <p class="text-muted">
                            This healthy Japanese fried rice recipe is a delicious and nutritious twist on the classic dish. Using brown rice and packed with fresh vegetables, it delivers all the flavor while reducing calories and adding essential nutrients. The combination of sesame oil, ginger, and soy sauce creates an authentic taste that will transport you straight to Japan.
                        </p>
                        <p class="text-muted">
                            Perfect for a quick weeknight dinner, this recipe is versatile enough to accommodate whatever vegetables you have on hand. The secret to getting that perfect texture is using cold, day-old rice - this prevents the rice from becoming mushy when stir-fried.
                        </p>
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
                    
                    <!-- Main Dish Ingredients -->
                    <div class="ingredients-category mb-5">
                        <h5 class="fw-bold mb-4">For main dish</h5>
                        <div class="ingredients-list">
                            <!-- Ingredient 1 (checked) -->
                            <div class="ingredient-item d-flex align-items-center mb-4">
                                <div class="ingredient-checkbox checked me-3">
                                    <i class="fas fa-check"></i>
                                </div>
                                <span class="ingredient-text checked">Lorem ipsum dolor sit amet</span>
                            </div>
                            
                            <!-- Ingredient 2 -->
                            <div class="ingredient-item d-flex align-items-center mb-4">
                                <div class="ingredient-checkbox me-3"></div>
                                <span class="ingredient-text">Lorem ipsum dolor sit amet</span>
                            </div>
                            
                            <!-- Ingredient 3 -->
                            <div class="ingredient-item d-flex align-items-center mb-4">
                                <div class="ingredient-checkbox me-3"></div>
                                <span class="ingredient-text">Lorem ipsum dolor sit amet</span>
                            </div>
                            
                            <!-- Ingredient 4 -->
                            <div class="ingredient-item d-flex align-items-center mb-4">
                                <div class="ingredient-checkbox me-3"></div>
                                <span class="ingredient-text">Lorem ipsum dolor sit amet</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Sauce Ingredients -->
                    <div class="ingredients-category">
                        <h5 class="fw-bold mb-4">For the sauce</h5>
                        <div class="ingredients-list">
                            <!-- Sauce Ingredient 1 -->
                            <div class="ingredient-item d-flex align-items-center mb-4">
                                <div class="ingredient-checkbox me-3"></div>
                                <span class="ingredient-text">Lorem ipsum dolor sit amet</span>
                            </div>
                            
                            <!-- Sauce Ingredient 2 -->
                            <div class="ingredient-item d-flex align-items-center mb-4">
                                <div class="ingredient-checkbox me-3"></div>
                                <span class="ingredient-text">Lorem ipsum dolor sit amet</span>
                            </div>
                            
                            <!-- Sauce Ingredient 3 -->
                            <div class="ingredient-item d-flex align-items-center mb-4">
                                <div class="ingredient-checkbox me-3"></div>
                                <span class="ingredient-text">Lorem ipsum dolor sit amet</span>
                            </div>
                        </div>
                    </div>

                    <h2 class="fw-bold my-5">Directions</h2>

                    <!-- Directions Section -->
                    <div class="ingredients-category mb-5">
                        <!-- Direction Step 1 -->
                        <div class="ingredient-item d-flex align-items-start mb-4">
                            <div class="d-flex align-items-center me-3">
                                <div class="ingredient-checkbox direction-checkbox me-3"></div>
                                <div class="step-number">1</div>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-3 ingredient-text">Lorem ipsum dolor sit amet</h5>
                                <p class="text-muted mb-4">
                                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni 
                                    dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor 
                                    sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore 
                                    magnam aliquam quaerat voluptatem.
                                </p>
                                
                                <!-- Step Image -->
                                <div class="mb-4 mt-4">
                                    <img src="@/Assets/img/recipes/direction.png" alt="Cooking step 1" class="img-fluid rounded-4 w-100">
                                </div>
                                
                                <p class="text-muted">
                                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni 
                                    dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor 
                                    sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore 
                                    magnam aliquam quaerat voluptatem.
                                </p>
                            </div>
                        </div>
                        
                        <!-- Direction Step 2 -->
                        <div class="ingredient-item d-flex align-items-start mb-4">
                            <div class="d-flex align-items-center me-3">
                                <div class="ingredient-checkbox direction-checkbox me-3"></div>
                                <div class="step-number">2</div>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-3 ingredient-text">Lorem ipsum dolor sit amet</h5>
                                <p class="text-muted">
                                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni 
                                    dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor 
                                    sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore 
                                    magnam aliquam quaerat voluptatem.
                                </p>
                            </div>
                        </div>
                        
                        <!-- Direction Step 3 -->
                        <div class="ingredient-item d-flex align-items-start mb-4">
                            <div class="d-flex align-items-center me-3">
                                <div class="ingredient-checkbox direction-checkbox me-3"></div>
                                <div class="step-number">3</div>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-3 ingredient-text">Lorem ipsum dolor sit amet</h5>
                                <p class="text-muted">
                                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni 
                                    dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor 
                                    sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore 
                                    magnam aliquam quaerat voluptatem.
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                
                <!-- Right Column - Sidebar -->
                <div class="col-lg-4">
                    <!-- Other Recipes Section -->
                    <div class="other-recipes mb-5">
                        <h3 class="fw-bold mb-4">Other Recipe</h3>
                        
                        <!-- Recipe Item 1 -->
                        <div class="recipe-item d-flex mb-4">
                            <div class="recipe-thumb me-3">
                                <img src="@/Assets/img/recipes/food-13.png" alt="Chicken Meatball" class="rounded-4 recipe-thumb-img">
                            </div>
                            <div class="recipe-info">
                                <h5 class="fw-bold mb-2">Chicken Meatball with Creamy Cheese</h5>
                                <p class="text-muted small mb-0">By Andreas Paula</p>
                            </div>
                        </div>
                        
                        <!-- Recipe Item 2 -->
                        <div class="recipe-item d-flex mb-4">
                            <div class="recipe-thumb me-3">
                                <img src="@/Assets/img/recipes/food-20.png" alt="Creamy Chicken" class="rounded-4 recipe-thumb-img">
                            </div>
                            <div class="recipe-info">
                                <h5 class="fw-bold mb-2">The Creamiest Creamy Chicken and Bacon Pasta</h5>
                                <p class="text-muted small mb-0">By Andreas Paula</p>
                            </div>
                        </div>
                        
                        <!-- Recipe Item 3 -->
                        <div class="recipe-item d-flex mb-4">
                            <div class="recipe-thumb me-3">
                                <img src="@/Assets/img/recipes/food-15.png" alt="Chicken and Rice" class="rounded-4 recipe-thumb-img">
                            </div>
                            <div class="recipe-info">
                                <h5 class="fw-bold mb-2">The Best Easy One Pot Chicken and Rice</h5>
                                <p class="text-muted small mb-0">By Andreas Paula</p>
                            </div>
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
                            <!-- Recipe Card 1 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-18.png" alt="Mixed Tropical Fruit Salad with Superfood Boosts" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Mixed Tropical Fruit Salad with Superfood Boosts</h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>30 Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>Healthy</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Recipe Card 2 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-19.png" alt="Big and Juicy Wagyu Beef Cheeseburger" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Big and Juicy Wagyu Beef Cheeseburger</h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>30 Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>Western</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        <!-- Second Row of Recipe Cards -->
                            <!-- Recipe Card 3 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-20.png" alt="Healthy Japanese Fried Rice with Asparagus" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Healthy Japanese Fried Rice with Asparagus</h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>30 Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>Healthy</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Recipe Card 4 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-13.png" alt="Cauliflower Walnut Vegetarian Taco Meat" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Cauliflower Walnut Vegetarian Taco Meat</h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>30 Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>Eastern</span>
                                            </div>
                                        </div>
                                    </div>
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

</script>