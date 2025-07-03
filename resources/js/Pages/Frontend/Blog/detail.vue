<template>
    <FrontendLayout>
    
<!-- recipe header Section -->
    <section class="recipe-header">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <!-- Left Side Content -->
                <div class="col-lg-12 text-center">
                    <h1 class="display-4 fw-bold mb-4">Health Japanese Fried Rice</h1>
                    
                    <div class="d-flex flex-wrap align-items-center justify-content-center mb-4">
                        <!-- Author Info -->
                        <div class="d-flex align-items-center  me-4 mb-3 mb-md-0">
                            <div class="author-avatar me-2">
                                <img src="@/Assets/img/users/chef-4.png" alt="John Smith" class="rounded-circle" width="50" height="50">
                            </div>
                            <div>
                                <h6 class="mb-0 fw-bold">John Smith</h6>
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
                                    <p class="fw-medium mb-0">15 March 2022</p>
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
                        <img src="@/Assets/img/post details/image1.jpg" alt="Health Japanese Fried Rice" class="img-fluid w-100 object-fit-cover">
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
                        <!-- Direction Step 1 -->
                        <div class="d-flex align-items-start mb-4">
                            <div>
                                <h5 class="fw-bold mb-3">How did you start out in the food industry?</h5>
                                <p class="text-muted mb-5">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac ultrices odio. Nulla at congue diam, at dignissim turpis. Ut vehicula sed velit a faucibus. In feugiat vestibulum velit vel pulvinar. Fusce id mollis ex. Praesent feugiat elementum ex ut suscipit.
                                </p>

                                <h5 class="fw-bold mb-3">What do you like most about your job?</h5>
                                <p class="text-muted mb-5">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac ultrices odio. Nulla at congue diam, at dignissim turpis. Ut vehicula sed velit a faucibus. In feugiat vestibulum velit vel pulvinar. Fusce id mollis ex. Praesent feugiat elementum ex ut suscipit.
                                </p>                                
                                
                                <!-- Step Image -->
                                 <h5 class="fw-bold mb-3">Do you cook at home on your days off?</h5>
                                <div class="mb-4 mt-4">
                                    <img src="@/Assets/img/recipes/direction.png" alt="Cooking step 1" class="img-fluid rounded-4 w-100">
                                </div>
                                
                                <p class="text-muted">
                                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni 
                                    dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor 
                                    sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore 
                                    magnam aliquam quaerat voluptatem.
                                </p>

                                <h5 class="fw-bold mt-5 mb-3">What would your advice be to young people looking to get their foot in the door?</h5>
                                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac ultrices odio. Nulla at congue diam, at dignissim turpis. Ut vehicula sed velit a faucibus. In feugiat vestibulum velit vel pulvinar. Fusce id mollis ex. Praesent feugiat elementum ex ut suscipit.</p>

                                <blockquote class="blockquote mt-5">
                                        <p class="mb-0 fs-3 fst-italic">"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac ultrices odio."</p>
                                </blockquote>

                                <h5 class="fw-bold mt-5 mb-3">What is the biggest misconception that people have about being a professional chef?</h5>
                                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac ultrices odio. Nulla at congue diam, at dignissim turpis. Ut vehicula sed velit a faucibus. In feugiat vestibulum velit vel pulvinar. Fusce id mollis ex. Praesent feugiat elementum ex ut suscipit.</p>                                    


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