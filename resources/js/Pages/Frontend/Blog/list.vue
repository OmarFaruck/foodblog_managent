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
                                <input type="text" class="form-control search-input" placeholder="Search article, news or recipe...">
                                <button class="btn btn-dark search-button" type="button">Search</button>
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
                    <!-- Blog Post 1 -->
                    <div class="blog-post mb-5">
                        <div class="row">
                            <div class="col-lg-4 mb-4 mb-lg-0">
                                <a href="/blog/detail" class="text-decoration-none">
                                    <div class="blog-image-container">
                                        <img src="@/Assets/img/blogs/article-1.png" alt="Crochet Projects for Noodle Lovers" class="img-fluid rounded-4">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8">
                                <h4 class="fw-bold mb-3"><a href="blog-detail.html" class="text-decoration-none text-dark">Crochet Projects for Noodle Lovers</a></h4>
                                <p class="text-muted mb-4">Lorem ipsum dolor sit amet, consectetuipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim</p>
                                <div class="author-info-container d-flex align-items-center">
                                    <div class="author-avatar me-3">
                                        <img src="@/Assets/img/users/chef-4.png" alt="Wade Warren" class="rounded-circle" width="50" height="50">
                                    </div>
                                    <div class="author-info d-flex align-items-center">
                                        <h6 class="mb-0 fw-bold me-3">Wade Warren</h6>
                                        <div class="d-flex align-items-center recipe-meta-item">
                                            <i class="far fa-clock me-2 text-muted"></i>
                                            <p class="text-muted small mb-0">12 November 2021</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog Post 2 -->
                    <div class="blog-post mb-5">
                        <div class="row">
                            <div class="col-lg-4 mb-4 mb-lg-0">
                                <a href="blog-detail.html" class="text-decoration-none">
                                    <div class="blog-image-container">
                                        <img src="@/Assets/img/blogs/article-2.png" alt="10 Vegetarian Recipes To Eat This Month" class="img-fluid rounded-4">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8">
                                <h4 class="fw-bold mb-3"><a href="blog-detail.html" class="text-decoration-none text-dark">10 Vegetarian Recipes To Eat This Month</a></h4>
                                <p class="text-muted mb-4">Lorem ipsum dolor sit amet, consectetuipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim</p>
                                <div class="author-info-container d-flex align-items-center">
                                    <div class="author-avatar me-3">
                                        <img src="@/Assets/img/users/chef-2.png" alt="Robert Fox" class="rounded-circle" width="50" height="50">
                                    </div>
                                    <div class="author-info d-flex align-items-center">
                                        <h6 class="mb-0 fw-bold me-3">Robert Fox</h6>
                                        <div class="d-flex align-items-center recipe-meta-item">
                                            <i class="far fa-clock me-2 text-muted"></i>
                                            <p class="text-muted small mb-0">12 November 2021</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog Post 3 -->
                    <div class="blog-post mb-5">
                        <div class="row">
                            <div class="col-lg-4 mb-4 mb-lg-0">
                                <a href="blog-detail.html" class="text-decoration-none">
                                    <div class="blog-image-container">
                                        <img src="@/Assets/img/blogs/article-3.png" alt="Full Guide to Becoming a Professional Chef" class="img-fluid rounded-4">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8">
                                <h4 class="fw-bold mb-3"><a href="blog-detail.html" class="text-decoration-none text-dark">Full Guide to Becoming a Professional Chef</a></h4>
                                <p class="text-muted mb-4">Lorem ipsum dolor sit amet, consectetuipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim</p>
                                <div class="author-info-container d-flex align-items-center">
                                    <div class="author-avatar me-3">
                                        <img src="@/Assets/img/users/chef-4.png" alt="Dianne Russell" class="rounded-circle" width="50" height="50">
                                    </div>
                                    <div class="author-info d-flex align-items-center">
                                        <h6 class="mb-0 fw-bold me-3">Dianne Russell</h6>
                                        <div class="d-flex align-items-center recipe-meta-item">
                                            <i class="far fa-clock me-2 text-muted"></i>
                                            <p class="text-muted small mb-0">12 November 2021</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog Post 4 -->
                    <div class="blog-post mb-5">
                        <div class="row">
                            <div class="col-lg-4 mb-4 mb-lg-0">
                                <a href="blog-detail.html" class="text-decoration-none">
                                    <div class="blog-image-container">
                                        <img src="@/Assets/img/blogs/article-4.png" alt="Simple & Delicious Vegetarian Lasagna" class="img-fluid rounded-4">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8">
                                <h4 class="fw-bold mb-3"><a href="blog-detail.html" class="text-decoration-none text-dark">Simple & Delicious Vegetarian Lasagna</a></h4>
                                <p class="text-muted mb-4">Lorem ipsum dolor sit amet, consectetuipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim</p>
                                <div class="author-info-container d-flex align-items-center">
                                    <div class="author-avatar me-3">
                                        <img src="@/Assets/img/users/chef-4.png" alt="Dianne Russell" class="rounded-circle" width="50" height="50">
                                    </div>
                                    <div class="author-info d-flex align-items-center">
                                        <h6 class="mb-0 fw-bold me-3">Dianne Russell</h6>
                                        <div class="d-flex align-items-center recipe-meta-item">
                                            <i class="far fa-clock me-2 text-muted"></i>
                                            <p class="text-muted small mb-0">12 November 2021</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Blog Post 5 -->
                    <div class="blog-post mb-5">
                        <div class="row">
                            <div class="col-lg-4 mb-4 mb-lg-0">
                                <a href="blog-detail.html" class="text-decoration-none">
                                    <div class="blog-image-container">
                                        <img src="@/Assets/img/blogs/article-5.png" alt="Comfort Food For Rainy Days" class="img-fluid rounded-4">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8">
                                <h4 class="fw-bold mb-3"><a href="blog-detail.html" class="text-decoration-none text-dark">Comfort Food For Rainy Days</a></h4>
                                <p class="text-muted mb-4">Lorem ipsum dolor sit amet, consectetuipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim</p>
                                <div class="author-info-container d-flex align-items-center">
                                    <div class="author-avatar me-3">
                                        <img src="@/Assets/img/users/chef-4.png" alt="Guy Hawkins" class="rounded-circle" width="50" height="50">
                                    </div>
                                    <div class="author-info d-flex align-items-center recipe-meta-item">
                                        <h6 class="mb-0 fw-bold me-3">Guy Hawkins</h6>
                                        <div class="d-flex align-items-center">
                                            <i class="far fa-clock me-2 text-muted"></i>
                                            <p class="text-muted small mb-0">12 November 2021</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <div class="pagination-container d-flex justify-content-center my-5">
                        <nav aria-label="Blog pagination">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-right"></i></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                
                <!-- Right Column - Sidebar -->
                <div class="col-lg-4">
                    <!-- Tasty Recipes Section -->
                    <div class="other-recipes mb-5">
                        <h3 class="fw-bold mb-4">Tasty Recipes</h3>
                        
                        <!-- Recipe Item 1 -->
                        <div class="recipe-item d-flex mb-4">
                            <div class="recipe-thumb me-3">
                                <a href="recipe-detail.html">
                                    <img src="@/Assets/img/recipes/food-13.png" alt="Chicken Meatball" class="rounded-4 recipe-thumb-img">
                                </a>
                            </div>
                            <div class="recipe-info">
                                <h5 class="fw-bold mb-2"><a href="recipe-detail.html" class="text-decoration-none text-dark">Chicken Meatballs with Cream Cheese</a></h5>
                                <p class="text-muted small mb-0">By Andreas Paula</p>
                            </div>
                        </div>
                        
                        <!-- Recipe Item 2 -->
                        <div class="recipe-item d-flex mb-4">
                            <div class="recipe-thumb me-3">
                                <a href="recipe-detail.html">
                                    <img src="@/Assets/img/recipes/food-15.png" alt="Traditional Bolognaise" class="rounded-4 recipe-thumb-img">
                                </a>
                            </div>
                            <div class="recipe-info">
                                <h5 class="fw-bold mb-2"><a href="recipe-detail.html" class="text-decoration-none text-dark">Traditional Bolognaise Ragu</a></h5>
                                <p class="text-muted small mb-0">By Andreas Paula</p>
                            </div>
                        </div>
                        
                        <!-- Recipe Item 3 -->
                        <div class="recipe-item d-flex mb-4">
                            <div class="recipe-thumb me-3">
                                <a href="recipe-detail.html">
                                    <img src="@/Assets/img/recipes/food-14.png" alt="Chinese Dumplings" class="rounded-4 recipe-thumb-img">
                                </a>
                            </div>
                            <div class="recipe-info">
                                <h5 class="fw-bold mb-2"><a href="recipe-detail.html" class="text-decoration-none text-dark">Pork and Chive Chinese Dumplings</a></h5>
                                <p class="text-muted small mb-0">By Andreas Paula</p>
                            </div>
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
                    <div class="tags-section mb-5">
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

</script>