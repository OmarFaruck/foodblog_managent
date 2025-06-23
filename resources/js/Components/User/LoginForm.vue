<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 animated fadeIn col-lg-6 center-screen">
                <div class="card w-90  p-4">
                    <form @submit.prevent="submit">
                        <div class="card-body">
                            <h4>SIGN IN</h4>
                            <br/>
                            <input id="email" v-model="form.email"  placeholder="User Email" class="form-control" type="email"/>
                            <br/>
                            <input id="password" v-model="form.password" placeholder="User Password" class="form-control" type="password"/>
                            <br/>
                            <button type="submit"  class="btn w-100 btn-success">Login</button>
                            <hr/>
                            <div class="text-center mt-3">
                                <span>
                                    <strong>Login:</strong> admin@foodblog.com <br> <strong>Password:</strong>:123
                                    <!--Link class="text-center ms-3 h6" href="/register">Sign Up </Link>
                                    <span class="ms-1">|</span>
                                    <Link class="text-center ms-3 h6" href="/send-otp">Forget Password</Link-->
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>


<script setup>
import { useForm, router, usePage, Link } from '@inertiajs/vue3';
import { createToaster } from "@meforma/vue-toaster";
const toaster = createToaster();

const form = useForm({
    email: '',
    password: ''
});

const page = usePage();

function submit() {
    if (!form.email) {
        toaster.error("Email Required");
    } else if (!form.password) {
        toaster.error("Password Required");
    } else {
        form.post("/login", {
            onSuccess: () => {
                //console.log(page.props.flash);

                if (page.props.flash.status) {
                    router.get("/dashboard");
                } else {
                    //console.log('inside error');
                    toaster.error(page.props.flash.message);
                }
            }
        });
    }
}
</script>
