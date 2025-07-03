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
                        <a class="nav-link active fw-medium" href="index.html">Home</a>
                    </li>
                    <li class="nav-item px-2">
                        <a class="nav-link fw-medium" href="recipe-list.html">Recipes</a>
                    </li>
                    <li class="nav-item px-2">
                        <a class="nav-link fw-medium" href="blog-detail.html">Blog</a>
                    </li>
                    <li class="nav-item px-2">
                        <a class="nav-link fw-medium" href="contact-us.html">Contact</a>
                    </li>
                    <li class="nav-item px-2">
                        <a class="nav-link fw-medium" href="about-us.html">About Us</a>
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
                    <form class="newsletter-form mx-auto">
                        <div class="input-group">
                            <input type="email" class="form-control" 
                                   placeholder="Your email address..." required>
                            <button class="btn btn-dark px-4" type="submit">
                                Subscribe
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
                        <a href="recipe-list.html" class="footer-link">Recipes</a>
                        <a href="blog-detail.html" class="footer-link">Blog</a>
                        <a href="contact-us.html" class="footer-link">Contact</a>
                        <a href="about-us.html" class="footer-link">About us</a>
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

</script>
