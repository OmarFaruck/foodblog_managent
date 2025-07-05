<template>
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow-sm py-3">
        <div class="container">
            <a class="navbar-brand fs-3" href="index.html">
                <span class="logo-font">Foodieland<span class="logo-dot">.</span></span>
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item px-2">
                        <Link class="nav-link active fw-medium" href="/">Home</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link class="nav-link fw-medium" href="/recipes">Recipes</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link class="nav-link fw-medium" href="/blog">Blog</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link class="nav-link fw-medium" href="/contact-us">Contact</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link class="nav-link fw-medium" href="/about-us">About Us</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link href="/admin/login" class="nav-link fw-medium">Login</Link>
                    </li>
                </ul>
                
                <div class="social-links d-flex">
                    <a href="#" class="social-icon me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-icon me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </nav>

    <slot />

    <!-- Newsletter Section -->
    <section id="newsletter" class="py-5">
        <div class="container">
            <div class="newsletter-container position-relative rounded-4">
                <div class="newsletter-content text-center">
                    <h2 class="display-5 fw-bold mb-3">
                        Deliciousness to your inbox
                    </h2>
                    <p class="text-muted mb-4">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor 
                        incididunt ut labore et dolore magna aliqut enim ad minim
                    </p>
                    <form @submit.prevent="subscribeNewsletter" class="newsletter-form mx-auto">
                        <div class="input-group">
                            <input 
                                type="email" 
                                class="form-control" 
                                placeholder="Your email address..." 
                                v-model="email"
                                :disabled="isLoading"
                                >
                            <button class="btn btn-dark px-4" type="submit" :disabled="isLoading">
                                <span v-if="isLoading" class="spinner-border spinner-border-sm me-2" role="status"></span>
                                {{ isLoading ? 'Subscribing...' : 'Subscribe' }}
                            </button>
                        </div>
                    </form>
                </div>
                
                <!-- Decorative images -->
                <div class="newsletter-image-left">
                    <img src="../Assets/img/newsletter/newsletter-1.png" alt="Decorative food image" class="img-fluid">
                </div>
                <div class="newsletter-image-right">
                    <img src="../Assets/img/newsletter/newsletter-2.png" alt="Decorative food image" class="img-fluid">
                </div>
            </div>
        </div>
    </section>    

    <!-- You may like these recipes too Section -->
    <section id="recipes" class="py-5" v-if="relatedRecipes && relatedRecipes.length > 0 && showRelatedRecipes">
        <div class="container">
            <!-- Section Header -->
            <div class="text-center mb-5">
                <h2 class="fw-bold mb-3">You may like these recipes too</h2>
            </div>

            <div class="featured-recipe-cards">
                <!-- Recipe Cards Row -->
                <div class="row g-5">
                    <div 
                        v-for="relatedRecipe in relatedRecipes" 
                        :key="relatedRecipe.id" 
                        class="col-lg-3 col-md-6"
                    >
                        <div class="featured-recipe-card bg-white overflow-hidden h-100">
                            <div class="featured-recipe-image position-relative rounded-4">
                                <img 
                                    :src="`/storage/${relatedRecipe.recipe_image}` || '/images/empty.png'" 
                                    :alt="relatedRecipe.title" 
                                    class="img-fluid w-100"
                                >
                                <button class="btn btn-like position-absolute"><i class="far fa-heart"></i></button>
                            </div>
                            <div class="featured-recipe-content p-3">
                                <Link 
                                    :href="`/recipe/${relatedRecipe.id}`"
                                    class="text-decoration-none text-dark"
                                >
                                    <h5 class="featured-recipe-title mb-2">{{ relatedRecipe.title }}</h5>
                                </Link>
                                <div class="featured-recipe-meta d-flex align-items-center">
                                    <div class="me-3">
                                        <i class="far fa-clock me-1"></i>
                                        <span>{{ relatedRecipe.prep_time + relatedRecipe.cook_time }} Minutes</span>
                                    </div>
                                    <div>
                                        <i class="fas fa-utensils me-1"></i>
                                        <span>{{ relatedRecipe.category.name }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </section>

    <!-- Footer -->
    <footer class="footer bg-white py-5">
        <div class="container">
            <div class="footer-main">
                <div class="footer-left">
                    <h3 class="mb-3">
                        <span class="logo-font">Foodieland<span class="logo-dot">.</span></span>
                    </h3>
                    <p class="footer-description">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    </p>
                </div>
                <div class="footer-right">
                    <nav class="footer-nav">
                        <Link href="/" class="footer-link">Home</Link>
                        <Link href="/recipes" class="footer-link">Recipes</Link>
                        <Link href="/blog" class="footer-link">Blog</Link>
                        <Link href="/contact-us" class="footer-link">Contact</Link>
                        <Link href="/about-us" class="footer-link">About us</Link>
                    </nav>
                </div>
            </div>
            
            <hr class="footer-divider">
            
            <div class="footer-bottom position-relative">
                <p class="copyright">
                    © 2025 Flowbase. Powered by <span class="webflow-text">Webflow</span>
                </p>
                <div class="footer-social">
                    <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </footer>    

</template>

<script setup>
import { Link } from '@inertiajs/vue3';
import { ref } from 'vue';
import { createToaster } from "@meforma/vue-toaster";
import axios from 'axios';

// Props
const props = defineProps({
    relatedRecipes: {
        type: Array,
        default: () => []
    },
    showRelatedRecipes: {
        type: Boolean,
        default: false
    }
});

const toast = createToaster();
const email = ref('');
const isLoading = ref(false);

const subscribeNewsletter = async () => {
    if (!email.value) {
        toast.error('Please enter your email address');
        return;
    }

    isLoading.value = true;

    try {
        const response = await axios.post('/subscribe', {
            email: email.value
        });

        if (response.data.success) {
            toast.success(response.data.message);
            email.value = ''; // Clear the form
        }
    } catch (error) {
        if (error.response && error.response.data) {
            toast.error(error.response.data.message);
        } else {
            toast.error('Something went wrong. Please try again.');
        }
    } finally {
        isLoading.value = false;
    }
};

</script>
