<template>
    <FrontendLayout :relatedRecipes="randomRecipes" :showRelatedRecipes="true">
       
<!-- About Us Header Section -->
    <section class="about-header py-5 mt-5">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <!-- Left Side Content -->
                <div class="col-lg-12 text-center">
                    <h1 class="display-4 fw-bold mb-4">About Us</h1>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Experience Section -->
    <section class="experience-section py-5 mt-4">
        <div class="container">
            <div class="row align-items-center g-5">
                <!-- Left Column (Content) -->
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <h2 class="display-4 fw-bold mb-4">23 Years Of Experience In Cooking Services</h2>
                    <p class="mb-4">
                        Sed ut perspiciatis unde omnis natus error lutatem accusantium doloremque
                        laudantium totam rem apam eaquepsa quae abillo inventore veritatis quasi arctecto
                        beatae vitae dicta sunt explicabo. Nemo enim ipsamya voluptatem quia voluptas sit
                        aspernatur aut odifugi sed quia consequuntur magni dolores eos qui ratioluptatem
                        sequi nesciunt.
                    </p>
                    <p class="mb-5">
                        Neque porro quisquam est qui dolorem ipsum quia dolor sit amet
                        consectetur adipiscing elit. Sed quia non numquam eius modi tempora incidunt ut labore
                        et dolore magnam aliquam quaerat voluptatem.
                    </p>
                    <a href="#" class="btn btn-dark btn-lg px-5 py-3 rounded-3 fw-semibold">DISCOVER MORE</a>
                </div>
                
                <!-- Right Column (Image) -->
                <div class="col-lg-6">
                    <div class="experience-image-container">
                        <img src="@/Assets/img/users/our-experience.jpg" alt="Cooking Experience" class="img-fluid rounded-4">
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Our Chef Section -->
    <section class="our-chefs-section py-5 bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-12 text-center">
                    <h2 class="display-4 fw-bold mb-3">Our Professional Chefs</h2>
                    <p class="text-muted mb-5 mx-auto" style="max-width: 700px;">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor 
                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                    </p>
                </div>
            </div>

            <div class="row g-4">
                <!-- Chef 1 -->
                <div class="col-lg-3 col-md-6">
                    <div class="chef-card">
                        <div class="chef-image">
                            <img src="@/Assets/img/users/chef-1.png" alt="Chef" class="img-fluid">
                        </div>
                        <div class="chef-info text-center">
                            <h4 class="fw-bold mb-2">Marcellus H. Waddell</h4>
                            <p class="text-primary fw-medium">Senior Chef</p>
                            <div class="chef-social mt-3">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chef 2 -->
                <div class="col-lg-3 col-md-6">
                    <div class="chef-card">
                        <div class="chef-image">
                            <img src="@/Assets/img/users/chef-2.png" alt="Chef" class="img-fluid">
                        </div>
                        <div class="chef-info text-center">
                            <h4 class="fw-bold mb-2">Ronald W. Robison</h4>
                            <p class="text-primary fw-medium">Senior Chef</p>
                            <div class="chef-social mt-3">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chef 3 -->
                <div class="col-lg-3 col-md-6">
                    <div class="chef-card">
                        <div class="chef-image">
                            <img src="@/Assets/img/users/chef-3.png" alt="Chef" class="img-fluid">
                        </div>
                        <div class="chef-info text-center">
                            <h4 class="fw-bold mb-2">Kenneth B. Deshazo</h4>
                            <p class="text-primary fw-medium">Senior Chef</p>
                            <div class="chef-social mt-3">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chef 4 -->
                <div class="col-lg-3 col-md-6">
                    <div class="chef-card">
                        <div class="chef-image">
                            <img src="@/Assets/img/users/chef-4.png" alt="Chef" class="img-fluid">
                        </div>
                        <div class="chef-info text-center">
                            <h4 class="fw-bold mb-2">Robert H. Houston</h4>
                            <p class="text-primary fw-medium">Senior Chef</p>
                            <div class="chef-social mt-3">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
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
import { Link } from '@inertiajs/vue3';

// Props from the controller
const props = defineProps({
    randomRecipes: Array,
});

</script>