// Minimal JavaScript for Foodieland Template (Laravel/Inertia/Vue compatible)
// This file contains only essential JavaScript needed before transitioning to Vue components

document.addEventListener('DOMContentLoaded', function() {
    // Initialize only essential components
    initializeNavbar();
    initializeRecipeActions();
    initializeCategoryFilters();
    initializeScrollEffects();
    initializeAnimations();
    initializeScrollToTop();
    initializeLazyLoading();
    initializeIngredientCheckboxes();
    initializeCategoryCards();
    initializeInstagramPosts();
    initializeHeroAnimations();
});

// Recipe card actions - minimal version for initial template
function initializeRecipeActions() {
    // Handle like buttons
    const likeButtons = document.querySelectorAll('.btn-like, .btn-like-large');
    
    likeButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const heartIcon = this.querySelector('i');
            
            // Toggle between filled and outline heart
            if (heartIcon.classList.contains('far')) {
                heartIcon.classList.remove('far');
                heartIcon.classList.add('fas');
                showNotification('Recipe added to favorites!', 'success');
            } else {
                heartIcon.classList.remove('fas');
                heartIcon.classList.add('far');
                showNotification('Recipe removed from favorites!', 'info');
            }
        });
    });
}

// Navbar functionality
function initializeNavbar() {
    const navbar = document.querySelector('.navbar');
    const navLinks = document.querySelectorAll('.nav-link');
    
    if (!navbar) return;
    
    // Navbar scroll effect
    window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
    
    // Smooth scrolling for nav links
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            
            if (href.startsWith('#')) {
                e.preventDefault();
                const target = document.querySelector(href);
                
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                    
                    // Update active nav link
                    navLinks.forEach(l => l.classList.remove('active'));
                    this.classList.add('active');
                    
                    // Close mobile menu if open
                    const navbarCollapse = document.querySelector('.navbar-collapse');
                    if (navbarCollapse && navbarCollapse.classList.contains('show')) {
                        const bsCollapse = new bootstrap.Collapse(navbarCollapse);
                        bsCollapse.hide();
                    }
                }
            }
        });
    });
    
    // Update active nav link on scroll
    window.addEventListener('scroll', debounce(updateActiveNavLink, 10));
}

// Update active navigation link based on scroll position
function updateActiveNavLink() {
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-link[href^="#"]');
    
    let current = '';
    
    sections.forEach(section => {
        const sectionTop = section.offsetTop - 100;
        const sectionHeight = section.offsetHeight;
        
        if (window.scrollY >= sectionTop && window.scrollY < sectionTop + sectionHeight) {
            current = section.getAttribute('id');
        }
    });
    
    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === `#${current}`) {
            link.classList.add('active');
        }
    });
}

// Scroll effects and animations
function initializeScrollEffects() {
    // Parallax effect for hero section
    window.addEventListener('scroll', debounce(function() {
        const scrolled = window.pageYOffset;
        const heroImage = document.querySelector('.hero-image');
        const floatingElements = document.querySelectorAll('.floating-element');
        
        if (heroImage) {
            heroImage.style.transform = `translateY(${scrolled * 0.1}px)`;
        }
        
        floatingElements.forEach((element, index) => {
            const speed = 0.05 + (index * 0.02);
            element.style.transform = `translateY(${scrolled * speed}px)`;
        });
    }, 10));
}

// Initialize animations
function initializeAnimations() {
    // Intersection Observer for scroll animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, observerOptions);
    
    // Observe elements for animation
    const animateElements = document.querySelectorAll('.category-card, .instagram-card, .chef-content, .recipe-card, .featured-recipe-card');
    animateElements.forEach(el => {
        observer.observe(el);
    });
    
    // Add CSS for animation if not already added
    if (!document.querySelector('style[data-animations]')) {
        const style = document.createElement('style');
        style.setAttribute('data-animations', 'true');
        style.textContent = `
            .category-card, .instagram-card, .chef-content, .recipe-card, .featured-recipe-card {
                opacity: 0;
                transform: translateY(30px);
                transition: all 0.6s ease;
            }
            
            .animate-in {
                opacity: 1 !important;
                transform: translateY(0) !important;
            }
            
            .navbar.scrolled {
                background-color: rgba(255, 255, 255, 0.95) !important;
                backdrop-filter: blur(10px);
                box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            }
            
            .scroll-to-top {
                position: fixed;
                bottom: 30px;
                right: 30px;
                width: 50px;
                height: 50px;
                background: #ff6b35;
                color: white;
                border: none;
                border-radius: 50%;
                cursor: pointer;
                opacity: 0;
                visibility: hidden;
                transform: translateY(20px);
                transition: all 0.3s ease;
                z-index: 1000;
                box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3);
            }
            
            .scroll-to-top.show {
                opacity: 1;
                visibility: visible;
                transform: translateY(0);
            }
            
            .scroll-to-top:hover {
                background: #e55a2b;
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(255, 107, 53, 0.4);
            }
            
            .category-card:hover {
                transform: translateY(-10px) scale(1.02);
                transition: all 0.3s ease;
            }
            
            .recipe-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }
            
            .featured-recipe-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }
            
            .loading {
                overflow: hidden;
            }
            
            .loaded .hero-content > * {
                animation: fadeInUp 0.6s ease forwards;
            }
            
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            @keyframes slideIn {
                from {
                    transform: translateX(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
        `;
        document.head.appendChild(style);
    }
}

// Scroll to top functionality
function initializeScrollToTop() {
    // Create scroll to top button
    const scrollToTopBtn = document.createElement('button');
    scrollToTopBtn.className = 'scroll-to-top';
    scrollToTopBtn.innerHTML = '<i class="fas fa-arrow-up"></i>';
    document.body.appendChild(scrollToTopBtn);
    
    // Show/hide scroll to top button
    window.addEventListener('scroll', debounce(function() {
        if (window.scrollY > 300) {
            scrollToTopBtn.classList.add('show');
        } else {
            scrollToTopBtn.classList.remove('show');
        }
    }, 10));
    
    // Scroll to top functionality
    scrollToTopBtn.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// Lazy loading for images
function initializeLazyLoading() {
    const images = document.querySelectorAll('img[data-src]');
    
    if (images.length === 0) return;
    
    const imageObserver = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });
    
    images.forEach(img => {
        imageObserver.observe(img);
    });
}

// Initialize ingredient checkboxes
function initializeIngredientCheckboxes() {
    const ingredientCheckboxes = document.querySelectorAll('.ingredient-checkbox');
    
    ingredientCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('click', function() {
            this.classList.toggle('checked');
            
            // Also toggle the checked class on the sibling text
            const ingredientText = this.nextElementSibling;
            if (ingredientText && ingredientText.classList.contains('ingredient-text')) {
                ingredientText.classList.toggle('checked');
            } else {
                // If the structure is different, find the text element within the parent
                const parent = this.closest('.ingredient-item');
                if (parent) {
                    const textElement = parent.querySelector('.ingredient-text');
                    if (textElement) {
                        textElement.classList.toggle('checked');
                    }
                }
            }
            
            // Add check icon when checked
            if (this.classList.contains('checked')) {
                if (!this.querySelector('i')) {
                    const icon = document.createElement('i');
                    icon.className = 'fas fa-check';
                    this.appendChild(icon);
                }
            } else {
                const icon = this.querySelector('i');
                if (icon) {
                    icon.remove();
                }
            }
        });
    });
}

// Initialize category filter checkboxes
function initializeCategoryFilters() {
    const categoryCheckboxes = document.querySelectorAll('.category-input');
    
    categoryCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            console.log(`Category ${this.id} is ${this.checked ? 'checked' : 'unchecked'}`);
            
            // Add animation class
            const checkboxLabel = this.nextElementSibling;
            if (checkboxLabel) {
                checkboxLabel.classList.add('checkbox-animation');
                
                // Remove animation class after animation completes
                setTimeout(() => {
                    checkboxLabel.classList.remove('checkbox-animation');
                }, 300);
            }
        });
    });
    
    // Optional: Add click event to the entire category item
    const categoryItems = document.querySelectorAll('.category-filter-item');
    categoryItems.forEach(item => {
        item.addEventListener('click', function(event) {
            // Prevent clicking on the label or checkbox directly
            if (event.target !== this) return;
            
            const checkbox = this.querySelector('.category-input');
            if (checkbox) {
                checkbox.checked = !checkbox.checked;
                
                // Dispatch change event to trigger the handler above
                checkbox.dispatchEvent(new Event('change'));
            }
        });
    });
}

// Notification system
function showNotification(message, type = 'info') {
    // Create notification element
    const notification = document.createElement('div');
    notification.className = `alert alert-${type === 'error' ? 'danger' : type === 'success' ? 'success' : 'info'} alert-dismissible fade show`;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 9999;
        max-width: 350px;
        animation: slideIn 0.3s ease-out;
    `;
    
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    document.body.appendChild(notification);
    
    // Auto remove after 5 seconds
    setTimeout(() => {
        if (notification.parentNode) {
            notification.remove();
        }
    }, 5000);
}

// Category card interactions
function initializeCategoryCards() {
    const categoryCards = document.querySelectorAll('.category-card');
    
    categoryCards.forEach(card => {
        card.addEventListener('click', function() {
            const categoryTitle = this.querySelector('.category-title');
            if (categoryTitle) {
                showNotification(`Exploring ${categoryTitle.textContent} recipes...`, 'info');
            }
        });
    });
}

// Instagram post interactions
function initializeInstagramPosts() {
    const instagramCards = document.querySelectorAll('.instagram-card');
    
    instagramCards.forEach(card => {
        card.addEventListener('click', function() {
            showNotification('Opening Instagram post...', 'info');
        });
    });
}

// Hero section animations
function initializeHeroAnimations() {
    const heroContent = document.querySelector('.hero-content');
    
    if (heroContent) {
        const elements = heroContent.querySelectorAll('.hero-badge, h1, p, .mb-4, .d-flex');
        elements.forEach((el, index) => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(20px)';
            
            setTimeout(() => {
                el.style.transition = 'all 0.6s ease';
                el.style.opacity = '1';
                el.style.transform = 'translateY(0)';
            }, index * 200);
        });
    }
}

// Handle window resize
window.addEventListener('resize', debounce(function() {
    updateActiveNavLink();
}, 100));

// Performance optimization
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Add loading class to body initially
document.body.classList.add('loading');

// Remove loading class when everything is loaded
window.addEventListener('load', function() {
    document.body.classList.remove('loading');
    document.body.classList.add('loaded');
});

// Form validation helper functions
function showInputError(inputElement, message) {
    const formGroup = inputElement.parentElement;
    
    // Remove any existing error message
    clearInputError(inputElement);
    
    // Add error class to input
    inputElement.classList.add('is-invalid');
    
    // Create error message
    const errorDiv = document.createElement('div');
    errorDiv.className = 'invalid-feedback';
    errorDiv.textContent = message;
    
    // Add error message after input
    formGroup.appendChild(errorDiv);
}

function clearInputError(inputElement) {
    const formGroup = inputElement.parentElement;
    
    // Remove error class from input
    inputElement.classList.remove('is-invalid');
    
    // Remove any existing error message
    const errorDiv = formGroup.querySelector('.invalid-feedback');
    if (errorDiv) {
        formGroup.removeChild(errorDiv);
    }
}

// Export functions for use in Vue components if needed
window.FoodielandJS = {
    showNotification,
    showInputError,
    clearInputError,
    debounce
};
