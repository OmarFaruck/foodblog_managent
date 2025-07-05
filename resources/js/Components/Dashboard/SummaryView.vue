
<template>
    <div class="container-fluid">
        <div class="row">
            <!-- Total Recipes -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="recipes">{{ page.props.list['recipes'] || 0 }}</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">Total Recipes</p>
                                    <div class="mt-2">
                                        <span class="badge bg-success-soft text-success rounded-pill px-2 py-1">
                                            <i class="fas fa-arrow-up text-xs me-1"></i>
                                            +{{ page.props.list['recipes_growth'] || 0 }}% this month
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-orange shadow-orange rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-utensils text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Food Categories -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="categories">{{ page.props.list['categories'] || 0 }}</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">Food Categories</p>
                                    <div class="mt-2">
                                        <span class="badge bg-info-soft text-info rounded-pill px-2 py-1">
                                            <i class="fas fa-layer-group text-xs me-1"></i>
                                            Diverse cuisine
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-primary shadow-primary rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-th-large text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Blog Articles -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="blogs">{{ page.props.list['blogs'] || 0 }}</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">Blog Articles</p>
                                    <div class="mt-2">
                                        <span class="badge bg-warning-soft text-warning rounded-pill px-2 py-1">
                                            <i class="fas fa-edit text-xs me-1"></i>
                                            Content rich
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-success shadow-success rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-newspaper text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Newsletter Subscribers -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="subscribers">{{ page.props.list['subscribers'] || 0 }}</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">Subscribers</p>
                                    <div class="mt-2">
                                        <span class="badge bg-danger-soft text-danger rounded-pill px-2 py-1">
                                            <i class="fas fa-heart text-xs me-1"></i>
                                            Loyal readers
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-info shadow-info rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-users text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Featured Recipes -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="featured">{{ page.props.list['featured_recipes'] || 0 }}</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">Featured Recipes</p>
                                    <div class="mt-2">
                                        <span class="badge bg-purple-soft text-purple rounded-pill px-2 py-1">
                                            <i class="fas fa-star text-xs me-1"></i>
                                            Chef's choice
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-warning shadow-warning rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-crown text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total Ingredients -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="ingredients">{{ page.props.list['ingredients'] || 0 }}</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">Unique Ingredients</p>
                                    <div class="mt-2">
                                        <span class="badge bg-success-soft text-success rounded-pill px-2 py-1">
                                            <i class="fas fa-leaf text-xs me-1"></i>
                                            Fresh & varied
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-danger shadow-danger rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-seedling text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Average Cook Time -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="avg_time">{{ page.props.list['avg_cook_time'] || 0 }}</span>
                                        <span class="text-sm">min</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">Avg Cook Time</p>
                                    <div class="mt-2">
                                        <span class="badge bg-info-soft text-info rounded-pill px-2 py-1">
                                            <i class="fas fa-clock text-xs me-1"></i>
                                            Quick & easy
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-secondary shadow-secondary rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-stopwatch text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recipes This Month -->
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 animated fadeIn p-2">
                <div class="card card-stats border-0 shadow-lg h-100">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <div>
                                    <h3 class="mb-0 text-dark font-weight-bold">
                                        <span id="monthly_recipes">{{ page.props.list['monthly_recipes'] || 0 }}</span>
                                    </h3>
                                    <p class="mb-0 text-muted text-sm">This Month</p>
                                    <div class="mt-2">
                                        <span class="badge bg-gradient-primary text-white rounded-pill px-2 py-1">
                                            <i class="fas fa-calendar-alt text-xs me-1"></i>
                                            New additions
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 text-end">
                                <div class="icon icon-shape bg-gradient-dark shadow-dark rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="fas fa-chart-line text-white text-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>


<script setup>
import { usePage } from '@inertiajs/vue3';
const page = usePage()

// Default values for food blog statistics
page.props.list = page.props.list || {
    recipes: 0,
    categories: 0,
    blogs: 0,
    subscribers: 0,
    featured_recipes: 0,
    ingredients: 0,
    avg_cook_time: 0,
    monthly_recipes: 0,
    recipes_growth: 0
}
</script>

<style scoped>
.card-stats {
    transition: all 0.3s ease;
    border-radius: 15px;
}

.card-stats:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
}

.icon-shape {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.bg-gradient-orange {
    background: linear-gradient(45deg, #ff9a56, #ff6b35);
}

.bg-gradient-primary {
    background: linear-gradient(45deg, #667eea, #764ba2);
}

.bg-gradient-success {
    background: linear-gradient(45deg, #56ab2f, #a8e6cf);
}

.bg-gradient-info {
    background: linear-gradient(45deg, #00d2ff, #3a7bd5);
}

.bg-gradient-warning {
    background: linear-gradient(45deg, #f093fb, #f5576c);
}

.bg-gradient-danger {
    background: linear-gradient(45deg, #ff416c, #ff4b2b);
}

.bg-gradient-secondary {
    background: linear-gradient(45deg, #8360c3, #2ebf91);
}

.bg-gradient-dark {
    background: linear-gradient(45deg, #434343, #000000);
}

.shadow-orange {
    box-shadow: 0 4px 20px 0 rgba(255, 107, 53, 0.25);
}

.shadow-primary {
    box-shadow: 0 4px 20px 0 rgba(102, 126, 234, 0.25);
}

.shadow-success {
    box-shadow: 0 4px 20px 0 rgba(86, 171, 47, 0.25);
}

.shadow-info {
    box-shadow: 0 4px 20px 0 rgba(0, 210, 255, 0.25);
}

.shadow-warning {
    box-shadow: 0 4px 20px 0 rgba(240, 147, 251, 0.25);
}

.shadow-danger {
    box-shadow: 0 4px 20px 0 rgba(255, 65, 108, 0.25);
}

.shadow-secondary {
    box-shadow: 0 4px 20px 0 rgba(131, 96, 195, 0.25);
}

.shadow-dark {
    box-shadow: 0 4px 20px 0 rgba(67, 67, 67, 0.25);
}

.bg-success-soft {
    background-color: rgba(40, 167, 69, 0.1);
}

.bg-info-soft {
    background-color: rgba(23, 162, 184, 0.1);
}

.bg-warning-soft {
    background-color: rgba(255, 193, 7, 0.1);
}

.bg-danger-soft {
    background-color: rgba(220, 53, 69, 0.1);
}

.bg-purple-soft {
    background-color: rgba(111, 66, 193, 0.1);
}

.text-purple {
    color: #6f42c1;
}

.badge {
    font-size: 0.75em;
    font-weight: 500;
}

.animated.fadeIn {
    animation-duration: 0.6s;
    animation-fill-mode: both;
    animation-name: fadeIn;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

