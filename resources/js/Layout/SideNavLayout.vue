<template>
    <div>
        <nav id="topNav" class="navbar fixed-top food-blog-navbar" :class="isNavOpen ? 'top-navbar' : 'top-navbar-expand'">
            <div class="container-fluid">
                <div class="d-flex align-items-center">
                    <a id="MenuBar" @click="NavOpenClose" class="icon-nav mx-2 my-1 h5">
                        <i class="fa text-white fa-bars"></i>
                    </a>
                    <span class="navbar-brand font-lobster text-white ms-2 d-none d-md-block">Foodieland Admin</span>
                </div>
                <div>
                    <Link href="/logout" class="btn-logout">
                        <i class="fa fa-sign-out-alt me-1"></i> Logout
                    </Link>
                </div>
            </div>
        </nav>
        <div id="sideNav" :class="isNavOpen ? 'side-nav-open' : 'side-nav-close'">
            <div class="side-nav-top text-center">
                <h2 class="font-lobster text-white mt-4 mb-2">Foodieland.</h2>
                <p class="sidebar-tagline">Delicious Creations</p>
                <div class="sidebar-divider"></div>
            </div>

            <Link href="/dashboard" class="side-bar-item" :class="{ active: activeMenu === '/dashboard' }" @click="setActiveMenu('/dashboard')">
                <span class="side-bar-item-icon"><i class="fa fa-tachometer-alt"/></span>
                <span class="side-bar-item-caption">Dashboard</span>
            </Link>

            <Link href="/category" class="side-bar-item" :class="{ active: activeMenu === '/category' }" @click="setActiveMenu('/category')">
                <span class="side-bar-item-icon"><i class="fa fa-th-list"/></span>
                <span class="side-bar-item-caption">Categories</span>
            </Link>
            
            <div class="sidebar-divider"></div>
            
            <Link href="#" class="side-bar-item">
                <span class="side-bar-item-icon"><i class="fa fa-utensils"/></span>
                <span class="side-bar-item-caption">Recipes</span>
            </Link>
            
            <Link href="#" class="side-bar-item">
                <span class="side-bar-item-icon"><i class="fa fa-book"/></span>
                <span class="side-bar-item-caption">Blog Posts</span>
            </Link>
            
            <Link href="#" class="side-bar-item">
                <span class="side-bar-item-icon"><i class="fa fa-users"/></span>
                <span class="side-bar-item-caption">Subscribers</span>
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
    background-color: #000000; /* Black background */
    color: white !important;
}

.food-blog-navbar {
    background: linear-gradient(to right, #000000, #333333) !important;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    padding: 10px 15px;
}

.btn-logout {
    color: white;
    text-decoration: none;
    font-weight: 500;
    padding: 8px 16px;
    border-radius: 40px;
    background-color: rgba(255, 255, 255, 0.1);
    transition: all 0.3s ease;
}

.btn-logout:hover {
    background-color: rgba(255, 255, 255, 0.2);
    transform: translateY(-2px);
}

.sidebar-tagline {
    color: #cccccc;
    font-size: 14px;
    font-style: italic;
    margin-bottom: 15px;
}

.sidebar-divider {
    height: 1px;
    background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.1), transparent);
    margin: 15px 20px;
}

#sideNav {
    background: linear-gradient(to bottom, #1a1a1a, #272727) !important;
}

.side-bar-item {
    margin: 5px 10px;
    border-radius: 8px !important;
    transition: all 0.3s ease;
}

.side-bar-item:hover {
    background-color: rgba(255, 255, 255, 0.05) !important;
    transform: translateX(5px);
}

.side-bar-item-icon {
    width: 20px;
    text-align: center;
    margin-right: 10px;
}

</style>

