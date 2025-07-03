<template>
    <FrontendLayout>
      
<!-- recipe header Section -->
    <section class="recipe-header">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <!-- Left Side Content -->
                <div class="col-lg-12 text-center">
                    <h1 class="display-4 fw-bold mb-4">Contact Us</h1>
                </div>
                

            </div>
        </div>
    </section>
    
    <!-- Contact Form Section -->
    <section class="contact-form-section py-4">
        <div class="container">
            <div class="row justify-content-center g-5">
                <!-- Left Column (Image) -->
                <div class="col-lg-5 mb-4 mb-lg-0">
                    <div class="contact-image-container light-blue-gradient">
                        <img src="@/Assets/img/contact-us/Cook-contact.png" alt="Chef" class="img-fluid rounded-4 contact-chef-image">
                    </div>
                </div>
                
                <!-- Right Column (Form) -->
                <div class="col-lg-7">
                    <form class="contact-form">
                        <div class="row">
                            <!-- Name -->
                            <div class="col-md-6 mb-4">
                                <label for="name" class="form-label text-uppercase small">Name</label>
                                <input type="text" class="form-control form-control-lg rounded-3" id="name" placeholder="Enter your name...">
                            </div>
                            
                            <!-- Email -->
                            <div class="col-md-6 mb-4">
                                <label for="email" class="form-label text-uppercase small">Email Address</label>
                                <input type="email" class="form-control form-control-lg rounded-3" id="email" placeholder="Your email address...">
                            </div>
                            
                            <!-- Subject -->
                            <div class="col-md-6 mb-4">
                                <label for="subject" class="form-label text-uppercase small">Subject</label>
                                <input type="text" class="form-control form-control-lg rounded-3" id="subject" placeholder="Enter subject...">
                            </div>
                            
                            <!-- Enquiry Type -->
                            <div class="col-md-6 mb-4">
                                <label for="enquiryType" class="form-label text-uppercase small">Enquiry Type</label>
                                <select class="form-select form-select-lg rounded-3" id="enquiryType">
                                    <option selected>Advertising</option>
                                    <option>Recipe Submission</option>
                                    <option>Collaboration</option>
                                    <option>Feedback</option>
                                    <option>Other</option>
                                </select>
                            </div>
                            
                            <!-- Message -->
                            <div class="col-12 mb-4">
                                <label for="message" class="form-label text-uppercase small">Messages</label>
                                <textarea class="form-control form-control-lg rounded-3" id="message" rows="5" placeholder="Enter your messages..."></textarea>
                            </div>
                            
                            <!-- Submit Button -->
                            <div class="col-12">
                                <button type="submit" class="btn btn-dark btn-lg px-5 py-3 rounded-3 fw-semibold">Submit</button>
                            </div>
                        </div>
                    </form>
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