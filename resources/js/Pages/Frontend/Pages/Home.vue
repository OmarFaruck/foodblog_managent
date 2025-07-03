<template>
    <FrontendLayout>

      <!-- Hero Section -->
    <section id="home" class="hero-section">
        <div class="container">
            <div class=" rounded-40">
                <div class="row g-0 hero-wrapper">
                    <div class="col-lg-6">
                        <div class="hero-content">
                            <div class="hero-badge mb-4">
                                <img src="@/Assets/img/hand-picked-recipes/hot-recipe.png" alt="Hot Recipe" class="badge-icon">
                                Hot Recipes
                            </div>
                            <h1 class="mb-4">
                                {{ featuredRecipe.title }}
                            </h1>
                            <p class="mb-5 text-muted w-100">
                                {{ featuredRecipe.description }}
                            </p>
                            <div class="mb-4">
                                <div class="hero-meta-badge hero-meta-badge2 me-2">
                                    <i class="far fa-clock me-2"></i>
                                    <span>{{ formatTime(featuredRecipe.cook_time) }}</span>
                                </div>
                                <div class="hero-meta-badge hero-meta-badge2">
                                    <i class="fas fa-utensils me-2"></i>
                                   <span>{{ featuredRecipe.category.name }}</span>
                                </div>
                            </div>
                            <div class="d-flex flex-wrap align-items-center justify-content-between mb-5">
                                <div class="hero-author d-flex align-items-center">
                                    <img src="@/Assets/img/users/chef-2.png" alt="Author" class="rounded-circle me-3" width="50" height="50">
                                    <div>
                                        <h6 class="mb-0">{{ featuredRecipe.user.name }}</h6>
                                        <small class="text-muted">{{ formatDate(featuredRecipe.created_at) }}</small>
                                    </div>
                                </div>
                                <div class="mt-3 mt-sm-0">
                                    <Link href="/recipe/detail" class="btn btn-dark btn-lg view-recipes-btn">
                                        View Recipes
                                        <i class="fas fa-chevron-right"></i>
                                    </Link>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 position-relative">
                            <div 
                            class="hero-image-wrapper bg-hero"
                            :style="`background-image: url('/storage/${featuredRecipe.recipe_image}')`">
                            </div>
                            <!-- Floating elements -->
                            <div class="floating-element floating-1">
                                <img src="@/Assets/img/hand-picked-recipes/food-2.png" 
                                     alt="Side dish" class="img-fluid shadow rounded-circle">
                            </div>
                            <div class="floating-element floating-2">
                                <img src="@/Assets/img/hand-picked-recipes/food-3.png" 
                                     alt="Side dish" class="img-fluid shadow rounded-circle">
                            </div>
                    </div>
                    
                    <!-- Hand-picked recipes badge in the middle -->
                    <div class="hand-picked-recipes-badge">
                        <img src="@/Assets/img/hand-picked-recipes/hand-picked-recipes.png" alt="Hand Picked Recipes">
                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- Categories Section -->
    <section id="categories" class="py-5">
        <div class="container">
            <div class="categories-header d-flex align-items-center justify-content-between mb-5">
                <h2 class="fw-bold mb-0">Categories</h2>
                <a href="#" class="btn btn-outline-primary">View All Categories</a>
            </div>
            
            <div class="row g-4">
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="category-card category-breakfast">
                        <div class="category-icon">
                            <img src="@/Assets/img/categories/breakfast.png" 
                                 alt="Breakfast" class="img-fluid">
                        </div>
                        <h5 class="category-title">Breakfast</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="category-card category-vegan">
                        <div class="category-icon">
                            <img src="@/Assets/img/categories/vegan.png" 
                                 alt="Vegan" class="img-fluid">
                        </div>
                        <h5 class="category-title">Vegan</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="category-card category-meat">
                        <div class="category-icon">
                            <img src="@/Assets/img/categories/meat.png" 
                                 alt="Meat" class="img-fluid">
                        </div>
                        <h5 class="category-title">Meat</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="category-card category-dessert">
                        <div class="category-icon">
                            <img src="@/Assets/img/categories/dessert.png" 
                                 alt="Dessert" class="img-fluid">
                        </div>
                        <h5 class="category-title">Dessert</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="category-card category-lunch">
                        <div class="category-icon">
                            <img src="@/Assets/img/categories/lunch.png" 
                                 alt="Lunch" class="img-fluid">
                        </div>
                        <h5 class="category-title">Lunch</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="category-card category-chocolate">
                        <div class="category-icon">
                            <img src="@/Assets/img/categories/chocolate.png" 
                                 alt="Chocolate" class="img-fluid">
                        </div>
                        <h5 class="category-title">Chocolate</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>        

    <!-- Simple and Tasty Recipes Section -->
    <section id="recipes" class="py-5">
        <div class="container">
            <!-- Section Header -->
            <div class="text-center mb-5">
                <h2 class="fw-bold mb-3">Simple and tasty recipes</h2>
                <p class="text-muted mx-auto" style="max-width: 600px;">
                    Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod tempor incididunt ut 
                    labore et dolore magna aliqut enim ad minim
                </p>
            </div>
            
            <!-- Recipe Cards -->
            <div class="row g-5">
                <!-- Recipe Card 1 -->
                <div class="col-lg-4 col-md-6">
                    <div class="recipe-card rounded-4 overflow-hidden h-100">
                        <div class="recipe-image position-relative">
                            <img src="@/Assets/img/recipes/food-13.png" alt="Big and Juicy Wagyu Beef Cheeseburger" class="img-fluid w-100">
                            <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                        </div>
                        <div class="recipe-content p-4">
                            <h4 class="recipe-title mb-3">Big and Juicy Wagyu Beef Cheeseburger</h4>
                            <div class="recipe-meta d-flex align-items-center mb-4">
                                <div class="me-4">
                                    <i class="far fa-clock me-2"></i>
                                    <span>30 Minutes</span>
                                </div>
                                <div>
                                    <i class="fas fa-utensils me-2"></i>
                                    <span>Snack</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recipe Card 2 -->
                <div class="col-lg-4 col-md-6">
                    <div class="recipe-card rounded-4 overflow-hidden h-100">
                        <div class="recipe-image position-relative">
                            <img src="@/Assets/img/recipes/food-14.png" alt="Fresh Lime Roasted Salmon with Ginger Sauce" class="img-fluid w-100">
                            <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                        </div>
                        <div class="recipe-content p-4">
                            <h4 class="recipe-title mb-3">Fresh Lime Roasted Salmon with Ginger Sauce</h4>
                            <div class="recipe-meta d-flex align-items-center mb-4">
                                <div class="me-4">
                                    <i class="far fa-clock me-2"></i>
                                    <span>30 Minutes</span>
                                </div>
                                <div>
                                    <i class="fas fa-utensils me-2"></i>
                                    <span>Fish</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recipe Card 3 -->
                <div class="col-lg-4 col-md-6">
                    <div class="recipe-card rounded-4 overflow-hidden h-100">
                        <div class="recipe-image position-relative">
                            <img src="@/Assets/img/recipes/food-15.png" alt="Strawberry Oatmeal Pancake with Honey Syrup" class="img-fluid w-100">
                            <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                        </div>
                        <div class="recipe-content p-4">
                            <h4 class="recipe-title mb-3">Strawberry Oatmeal Pancake with Honey Syrup</h4>
                            <div class="recipe-meta d-flex align-items-center mb-4">
                                <div class="me-4">
                                    <i class="far fa-clock me-2"></i>
                                    <span>30 Minutes</span>
                                </div>
                                <div>
                                    <i class="fas fa-utensils me-2"></i>
                                    <span>Breakfast</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recipe Card 4 -->
                <div class="col-lg-4 col-md-6">
                    <div class="recipe-card rounded-4 overflow-hidden h-100">
                        <div class="recipe-image position-relative">
                            <img src="@/Assets/img/recipes/food-16.png" alt="Fresh and Healthy Mixed Mayonnaise Salad" class="img-fluid w-100">
                            <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                        </div>
                        <div class="recipe-content p-4">
                            <h4 class="recipe-title mb-3">Fresh and Healthy Mixed Mayonnaise Salad</h4>
                            <div class="recipe-meta d-flex align-items-center mb-4">
                                <div class="me-4">
                                    <i class="far fa-clock me-2"></i>
                                    <span>30 Minutes</span>
                                </div>
                                <div>
                                    <i class="fas fa-utensils me-2"></i>
                                    <span>Healthy</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recipe Card 5 -->
                <div class="col-lg-4 col-md-6">
                    <div class="recipe-card rounded-4 overflow-hidden h-100">
                        <div class="recipe-image position-relative">
                            <img src="@/Assets/img/recipes/food-17.png" alt="Chicken Meatballs with Cream Cheese" class="img-fluid w-100">
                            <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                        </div>
                        <div class="recipe-content p-4">
                            <h4 class="recipe-title mb-3">Chicken Meatballs with Cream Cheese</h4>
                            <div class="recipe-meta d-flex align-items-center mb-4">
                                <div class="me-4">
                                    <i class="far fa-clock me-2"></i>
                                    <span>30 Minutes</span>
                                </div>
                                <div>
                                    <i class="fas fa-utensils me-2"></i>
                                    <span>Meat</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- View All Button -->
            <div class="text-center mt-5">
                <a href="#" class="btn btn-dark btn-lg px-5 py-3 view-all-btn">
                    View All Recipes
                    <i class="fas fa-chevron-right ms-2"></i>
                </a>
            </div>
        </div>
    </section>        

    <!-- Chef Section -->
    <section id="chef" class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="chef-content">
                        <h2 >
                            Everyone can be a chef<br>
                            in their own kitchen
                        </h2>
                        <p class="lead text-muted">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor 
                            incididunt ut labore et dolore magna aliqua enim ad minim veniam
                        </p>
                        <a href="#" class="learn-more-btn">
                            Learn More
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="chef-image-wrapper position-relative">
                        <div class="chef-main-image-container">
                            <img src="@/Assets/img/chef/cooker-1.png" 
                                 alt="Chef" class="chef-main-image">
                        </div>
                        <!-- Floating food elements -->
                        <div class="floating-food floating-food-1">
                            <img src="@/Assets/img/chef/meat.png" alt="Meat">
                        </div>
                        <div class="floating-food floating-food-2">
                            <img src="@/Assets/img/chef/tomato.png" alt="Tomato">
                        </div>
                        <div class="floating-food floating-food-3">
                            <img src="@/Assets/img/chef/onion.png" alt="Onion">
                        </div>
                        <div class="floating-food floating-food-4">
                            <img src="@/Assets/img/chef/lettuce.png" alt="Lettuce">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>        

    <!-- Instagram Section -->
    <section id="instagram" class="instagram-section py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold mb-4">
                    Check out <span class="instagram-handle">@foodieland</span> on Instagram
                </h2>
                <p class="text-muted mb-5">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor 
                    incididunt ut labore et dolore magna aliqua enim ad minim
                </p>
            </div>
            
            <div class="row g-4 mb-5">
                <div class="col-lg-3 col-md-6">
                    <div class="instagram-card">
                        <div class="instagram-card-header">
                            <img src="@/Assets/img/users/chef-4.png" alt="Profile" class="rounded-circle me-2" width="30" height="30">
                            <span>Foodieland.</span>
                            <i class="fas fa-ellipsis-h ms-auto"></i>
                        </div>
                        <div class="instagram-card-image">
                            <img src="@/Assets/img/hand-picked-recipes/food-1.png" alt="Food post" class="img-fluid">
                        </div>
                        <div class="instagram-card-actions">
                            <div class="actions-left">
                                <i class="far fa-heart"></i>
                                <i class="far fa-comment"></i>
                                <i class="far fa-paper-plane"></i>
                            </div>
                            <div class="actions-right">
                                <i class="far fa-bookmark"></i>
                            </div>
                        </div>
                        <div class="instagram-card-info">
                            <p class="mb-0">Liked by <strong>craig_love</strong> and <strong>44,686</strong> others</p>
                            <p class="mb-0"><strong>Foodieland.</strong> The vegetables dishes need to have certain vitamin for those people</p>
                            <small class="text-muted">September 19</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="instagram-card">
                        <div class="instagram-card-header">
                            <img src="@/Assets/img/users/chef-4.png" alt="Profile" class="rounded-circle me-2" width="30" height="30">
                            <span>Foodieland.</span>
                            <i class="fas fa-ellipsis-h ms-auto"></i>
                        </div>
                        <div class="instagram-card-image">
                            <img src="@/Assets/img/hand-picked-recipes/food-2.png" alt="Food post" class="img-fluid">
                        </div>
                        <div class="instagram-card-actions">
                            <div class="actions-left">
                                <i class="far fa-heart"></i>
                                <i class="far fa-comment"></i>
                                <i class="far fa-paper-plane"></i>
                            </div>
                            <div class="actions-right">
                                <i class="far fa-bookmark"></i>
                            </div>
                        </div>
                        <div class="instagram-card-info">
                            <p class="mb-0">Liked by <strong>craig_love</strong> and <strong>44,686</strong> others</p>
                            <p class="mb-0"><strong>Foodieland.</strong> Sweet food can bring someone into happiness as long as they don't eat to much</p>
                            <small class="text-muted">September 19</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="instagram-card">
                        <div class="instagram-card-header">
                            <img src="@/Assets/img/users/chef-4.png" alt="Profile" class="rounded-circle me-2" width="30" height="30">
                            <span>Foodieland.</span>
                            <i class="fas fa-ellipsis-h ms-auto"></i>
                        </div>
                        <div class="instagram-card-image">
                            <img src="@/Assets/img/hand-picked-recipes/food-3.png" alt="Food post" class="img-fluid">
                        </div>
                        <div class="instagram-card-actions">
                            <div class="actions-left">
                                <i class="far fa-heart"></i>
                                <i class="far fa-comment"></i>
                                <i class="far fa-paper-plane"></i>
                            </div>
                            <div class="actions-right">
                                <i class="far fa-bookmark"></i>
                            </div>
                        </div>
                        <div class="instagram-card-info">
                            <p class="mb-0">Liked by <strong>craig_love</strong> and <strong>44,686</strong> others</p>
                            <p class="mb-0"><strong>Foodieland.</strong> What are you doing before start cooking? prepare the tools or ingredients?</p>
                            <small class="text-muted">September 19</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="instagram-card">
                        <div class="instagram-card-header">
                            <img src="@/Assets/img/users/chef-4.png" alt="Profile" class="rounded-circle me-2" width="30" height="30">
                            <span>Foodieland.</span>
                            <i class="fas fa-ellipsis-h ms-auto"></i>
                        </div>
                        <div class="instagram-card-image">
                            <img src="@/Assets/img/hand-picked-recipes/food-1.png" alt="Food post" class="img-fluid">
                        </div>
                        <div class="instagram-card-actions">
                            <div class="actions-left">
                                <i class="far fa-heart"></i>
                                <i class="far fa-comment"></i>
                                <i class="far fa-paper-plane"></i>
                            </div>
                            <div class="actions-right">
                                <i class="far fa-bookmark"></i>
                            </div>
                        </div>
                        <div class="instagram-card-info">
                            <p class="mb-0">Liked by <strong>craig_love</strong> and <strong>44,686</strong> others</p>
                            <p class="mb-0"><strong>Foodieland.</strong> Steak never be wrong, It's suitable for you who want romantic dinner</p>
                            <small class="text-muted">September 19</small>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- <div class="pagination-dots mb-5">
                <span class="dot active"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div> -->
            
            <div class="text-center">
                <a href="#" class="btn btn-dark btn-lg instagram-visit-btn">
                    <i class="fab fa-instagram me-2"></i>
                    Visit Our Instagram
                </a>
            </div>
        </div>
    </section>        

<!-- Try This Delicious Recipe Section -->
    <section id="featured-recipe" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 mb-4 mb-lg-0">
                    <div class="row g-5 mb-5">
                        <div class="col-lg-6">
                            <h2 class="fw-bold mb-3">
                                Try this delicious recipe<br>
                                to make your day
                            </h2>
                        </div>
                        <div class="col-lg-6">
                            <p class="text-muted mb-0">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor 
                                incididunt ut labore et dolore magna aliqua enim ad minim veniam, quis nostrud exercitation
                            </p>
                        </div>
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
                        
                        <!-- Third Row of Recipe Cards -->
                            <!-- Recipe Card 5 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-17.png" alt="Rainbow Chicken Salad with Almond Honey Mustard Dressing" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Rainbow Chicken Salad with Almond Honey Mustard Dressing</h5>
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
                            
                            <!-- Recipe Card 6 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-15.png" alt="Barbeque Spicy Sandwiches with Chips" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Barbeque Spicy Sandwiches with Chips</h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>30 Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>Snack</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        <!-- Fourth Row of Recipe Cards -->
                            <!-- Recipe Card 7 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-16.png" alt="Firecracker Vegan Lettuce Wraps - Spicy!" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Firecracker Vegan Lettuce Wraps - Spicy!</h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>30 Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>Seafood</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Recipe Card 8 -->
                            <div class="col-lg-3 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-18.png" alt="Chicken Ramen Soup with Mushroom" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <h5 class="featured-recipe-title mb-2">Chicken Ramen Soup with Mushroom</h5>
                                        <div class="featured-recipe-meta d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="far fa-clock me-1"></i>
                                                <span>30 Minutes</span>
                                            </div>
                                            <div>
                                                <i class="fas fa-utensils me-1"></i>
                                                <span>Japanese</span>
                                            </div>
                                        </div>
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
import { formatTime, formatDate } from '@/utilities/date.js';
import { Link } from '@inertiajs/vue3';

// Define props to receive data from controller
const props = defineProps({
    featuredRecipe: Object
});


</script>

<style scoped>

</style>
