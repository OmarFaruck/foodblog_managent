<template>
    <div>
        <nav id="topNav" class="navbar fixed-top bg-success" :class="isNavOpen ? 'top-navbar' : 'top-navbar-expand'">
            <div class="container-fluid">
                <a id="MenuBar" @click="NavOpenClose" class="icon-nav mx-0 my-1 h5">
                    <i class="fa text-white fa-bars"></i>
                </a>
                <Link href="/logout" class="text-white text-decoration-none fs-6 me-5">
                    <i class="fa fa-sign-out-alt"></i> Logout
                </Link>
            </div>
        </nav>
        <div id="sideNav" :class="isNavOpen ? 'side-nav-open' : 'side-nav-close'">
            <div class="side-nav-top text-center">
                <img alt="" class="side-nav-logo" src="../Assets/img/logo.png" />
            </div>

            <Link href="/dashboard" class="side-bar-item" :class="{ active: activeMenu === '/dashboard' }" @click="setActiveMenu('/dashboard')">
                <span class="side-bar-item-icon"><i class="fa fa-tachometer-alt text-green"/></span>
                <span class="side-bar-item-caption">Dashboard</span>
            </Link>

            <Link href="/category" class="side-bar-item" :class="{ active: activeMenu === '/category' }" @click="setActiveMenu('/category')">
                <span class="side-bar-item-icon"><i class="fa fa-th-list text-green"/></span>
                <span class="side-bar-item-caption">Category</span>
            </Link>

        </div>
        <div id="content" :class="isNavOpen ? 'content' : 'content-expand'">
            <div class="container-fluid">
                <main>
                    <slot></slot>
                </main>
            </div>
        </div>
    </div>
</template>


<script setup>
import { ref, watchEffect } from 'vue';
import { Link, usePage } from '@inertiajs/vue3';

const activeMenu = ref(localStorage.getItem('activeMenu') || window.location.pathname);

watchEffect(() => {
    localStorage.setItem('activeMenu', activeMenu.value);
});

const setActiveMenu = (path) => {
    activeMenu.value = path;
};


// Track sidebar state
const isNavOpen = ref(localStorage.getItem('isNavOpen') === 'true');

const NavOpenClose = () => {
    isNavOpen.value = !isNavOpen.value;
    localStorage.setItem('isNavOpen', isNavOpen.value);
};

</script>

<style scoped>
.active {
    background-color: #28a745; /* Green background */
    color: white !important;
}

</style>

