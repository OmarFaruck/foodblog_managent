<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6 center-screen">
                <div class="card animated fadeIn w-100 p-4 food-card">
                    <div class="text-center mb-4">
                        <h3 class="mt-3 food-heading font-lobster">Foodieland.</h3>
                        <p class="text-muted">Create an account to share recipes, save favorites, and connect with fellow food enthusiasts</p>
                    </div>
                    
                    <form @submit.prevent="submit">
                        <div class="card-body">
                            <div class="row g-3">                                <div class="col-md-12">                                    <div class="input-group mb-3 auth-input-group">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                        <input id="name" v-model="form.name" placeholder="Your Name" class="form-control" type="text"/>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="input-group mb-3 auth-input-group">
                                        <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                        <input id="email" v-model="form.email" placeholder="Email Address" class="form-control" type="email"/>
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="input-group mb-3 auth-input-group">
                                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                        <input id="password" v-model="form.password" placeholder="Create Password" class="form-control" type="password"/>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="d-grid">                                        <button type="submit" class="btn w-100 btn-success">
                                            Register
                                        </button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="text-center mt-4">
                                <p class="mb-0">
                                    <span class="text-muted">Already have an account?</span>
                                    <Link class="ms-2 food-link elegant-link" href="/login">Sign in here</Link>
                                </p>
                            </div>
                            
                            <div class="food-benefits mt-4">
                                <h6 class="text-dark"><i class="fa fa-check-circle me-2"></i>Benefits of joining:</h6>
                                <div class="row g-2 mt-2">
                                    <div class="col-md-6">
                                        <div class="benefit-item">
                                            <i class="fa fa-bookmark me-2"></i> Save favorite recipes
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="benefit-item">
                                            <i class="fa fa-share-alt me-2"></i> Share your own recipes
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="benefit-item">
                                            <i class="fa fa-bell me-2"></i> Get notified about new recipes
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="benefit-item">
                                            <i class="fa fa-users me-2"></i> Join food discussions
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>



<script setup>
import {useForm, router, usePage, Link} from '@inertiajs/vue3'
const form = useForm({email:'', name:'', mobile:'', password:''})
import { createToaster } from "@meforma/vue-toaster";

const toaster = createToaster();
const page = usePage()
function submit(){
    if(form.email.length===0){
        toaster.error("Email Required")
    }
    else if(form.name.length===0) {
        toaster.error("Name Required")
    }
    else if(form.password.length===0) {
        toaster.error("Password Required")
    }
    else {
        form.post("/register",{
            onSuccess:()=>{
                if(page.props.flash.status===true){
                    router.get("/login")
                }
                else {                    toaster.error(page.props.flash.message)
                }
            }
        })
    }
}
</script>

