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
                        <Link :class="navClass('/')" href="/">Home</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link :class="navClass('/recipes')" href="/recipes">Recipes</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link :class="navClass('/blog')" href="/blog">Blog</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link :class="navClass('/contact-us')" href="/contact-us">Contact</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link :class="navClass('/about-us')" href="/about-us">About Us</Link>
                    </li>
                    <li class="nav-item px-2">
                        <Link :class="navClass('/admin/login')" href="/admin/login">Login</Link>
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
                                v-model="form.email"
                                :disabled="form.processing"
                                >
                            <button class="btn btn-dark px-4" type="submit" :disabled="form.processing">
                                <span v-if="form.processing" class="spinner-border spinner-border-sm me-2" role="status"></span>
                                {{ form.processing ? 'Subscribing...' : 'Subscribe' }}
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
import { Link, usePage, useForm } from '@inertiajs/vue3';
import { ref, computed } from 'vue';
import { createToaster } from "@meforma/vue-toaster";

const page = usePage();

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

const currentUrl = computed(() => page.url)

const navClass = (path) => {
    return currentUrl.value === path
        ? 'nav-link active fw-medium' // Active link style
        : 'nav-link fw-medium' // Inactive link style
}

const toast = createToaster();

// Create form using Inertia's useForm helper
const form = useForm({
    email: ''
});

const subscribeNewsletter = () => {
    if (!form.email) {
        toast.error('Please enter your email address');
        return;
    }

    form.post('/subscribe', {
        onSuccess: (page) => {
            // Check for success flash message
            if (page.props.flash?.success) {
                toast.success(page.props.flash.success);
            } else {
                toast.success('Successfully subscribed to newsletter!');
            }
            form.reset('email'); // Clear the email field
        },
        onError: (errors) => {
            // Handle validation errors
            if (errors.email) {
                toast.error(errors.email);
            } else if (page.props.flash?.error) {
                toast.error(page.props.flash.error);
            } else {
                toast.error('Something went wrong. Please try again.');
            }
        },
        onFinish: () => {
            // This runs regardless of success or error
            // You can add any cleanup logic here if needed
        }
    });
};

</script>
