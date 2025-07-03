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
                                <input type="text" class="form-control search-input" placeholder="Search for a recipe...">
                                <button class="btn btn-dark search-button" type="button">Search</button>
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
                        <div class="category-filter-item d-flex align-items-center mb-4">
                            <div class="category-checkbox me-3">
                                <input type="checkbox" id="breakfast" class="category-input visually-hidden">
                                <label for="breakfast" class="category-checkbox-label"></label>
                            </div>
                            <label for="breakfast" class="category-label fs-5">Breakfast</label>
                        </div>
                        
                        <div class="category-filter-item d-flex align-items-center mb-4">
                            <div class="category-checkbox me-3">
                                <input type="checkbox" id="vegan" class="category-input visually-hidden">
                                <label for="vegan" class="category-checkbox-label"></label>
                            </div>
                            <label for="vegan" class="category-label fs-5">Vegan</label>
                        </div>
                        
                        <div class="category-filter-item d-flex align-items-center mb-4">
                            <div class="category-checkbox me-3">
                                <input type="checkbox" id="meat" class="category-input visually-hidden">
                                <label for="meat" class="category-checkbox-label"></label>
                            </div>
                            <label for="meat" class="category-label fs-5">Meat</label>
                        </div>
                        
                        <div class="category-filter-item d-flex align-items-center mb-4">
                            <div class="category-checkbox me-3">
                                <input type="checkbox" id="dessert" class="category-input visually-hidden">
                                <label for="dessert" class="category-checkbox-label"></label>
                            </div>
                            <label for="dessert" class="category-label fs-5">Dessert</label>
                        </div>
                        
                        <div class="category-filter-item d-flex align-items-center mb-4">
                            <div class="category-checkbox me-3">
                                <input type="checkbox" id="lunch" class="category-input visually-hidden">
                                <label for="lunch" class="category-checkbox-label"></label>
                            </div>
                            <label for="lunch" class="category-label fs-5">Lunch</label>
                        </div>
                        
                        <div class="category-filter-item d-flex align-items-center mb-4">
                            <div class="category-checkbox me-3">
                                <input type="checkbox" id="chocolate" class="category-input visually-hidden">
                                <label for="chocolate" class="category-checkbox-label"></label>
                            </div>
                            <label for="chocolate" class="category-label fs-5">Chocolate</label>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="featured-recipe-cards">
                        <!-- Recipe Cards Row -->
                        <div class="row g-5">
                            <!-- Recipe Card 1 -->
                            <div class="col-lg-4 col-md-6">
                                <div class="featured-recipe-card bg-white overflow-hidden h-100">
                                    <div class="featured-recipe-image position-relative rounded-4">
                                        <img src="@/Assets/img/recipes/food-18.png" alt="Mixed Tropical Fruit Salad with Superfood Boosts" class="img-fluid w-100">
                                        <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                                    </div>
                                    <div class="featured-recipe-content p-3">
                                        <Link href="/recipe/detail" class="text-decoration-none text-dark">
                                            <h5 class="featured-recipe-title mb-2">Mixed Tropical Fruit Salad with Superfood Boosts</h5>
                                        </Link>
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
                            <div class="col-lg-4 col-md-6">
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
                            <div class="col-lg-4 col-md-6">
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
                            <div class="col-lg-4 col-md-6">
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
                            <div class="col-lg-4 col-md-6">
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
                            <div class="col-lg-4 col-md-6">
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
                            <div class="col-lg-4 col-md-6">
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
                            <div class="col-lg-4 col-md-6">
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
            
            <!-- Pagination -->
            <div class="pagination-container d-flex justify-content-center mt-5">
                <nav aria-label="Recipe pagination">
                    <ul class="pagination">
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-right"></i></a></li>
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

</script>