<template>
    <FrontendLayout :relatedRecipes="randomRecipes" :showRelatedRecipes="true">
      
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
                    <form class="contact-form" @submit.prevent="submit">
                        <div class="row">
                            <!-- Name -->
                            <div class="col-md-6 mb-4">
                                <label for="name" class="form-label text-uppercase small">Name</label>
                                <input type="text" v-model="form.name" class="form-control form-control-lg rounded-3" id="name" placeholder="Enter your name...">
                            </div>
                            
                            <!-- Email -->
                            <div class="col-md-6 mb-4">
                                <label for="email" class="form-label text-uppercase small">Email Address</label>
                                <input type="email" v-model="form.email" class="form-control form-control-lg rounded-3" id="email" placeholder="Your email address...">
                            </div>
                            
                            <!-- Subject -->
                            <div class="col-md-6 mb-4">
                                <label for="subject" class="form-label text-uppercase small">Subject</label>
                                <input type="text" v-model="form.subject" class="form-control form-control-lg rounded-3" id="subject" placeholder="Enter subject...">
                            </div>
                            
                            <!-- Enquiry Type -->
                            <div class="col-md-6 mb-4">
                                <label for="enquiryType" class="form-label text-uppercase small">Enquiry Type</label>
                                <select v-model="form.enquiryType" class="form-select form-select-lg rounded-3" id="enquiryType">
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
                                <textarea v-model="form.message" class="form-control form-control-lg rounded-3" id="message" rows="5" placeholder="Enter your messages..."></textarea>
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
import { Link, useForm, usePage } from '@inertiajs/vue3';
import { createToaster } from "@meforma/vue-toaster";


const form = useForm({ email: '', name: '', message: '', subject: '', enquiryType: '' });
const toaster = createToaster();
const page = usePage();

// Props from the controller
const props = defineProps({
    randomRecipes: Array,
});

function submit() {

    if (form.name.length === 0) {
        toaster.error("Name Required");
        return;
    }

    if (form.email.length === 0) {
        toaster.error("Email Required");
        return;
    }

    if (form.message.length === 0) {
        toaster.error("Message Required");
        return;
    }

    if (form.subject.length === 0) {
        toaster.error("Subject Required");
        return;
    }

    if (form.enquiryType.length === 0) {
        toaster.error("Enquiry Type Required");
        return;
    }

    form.post("/contact", {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                //form.reset();
                //router.get("/contact");
            } else {
                toaster.error(page.props.flash.message);
            }
        }
    });
}

</script>