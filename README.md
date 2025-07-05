# 🍽️ FoodBlog - Complete Food Blog Platform

A comprehensive food blog platform built with Laravel, Inertia.js, and Vue 3. This isn't just an admin panel - it's a complete solution with a stunning public website for visitors and a powerful admin system for content creators!

## ✨ What Makes This Special?

This is a full-stack food blog platform that gives you everything you need:
- **Beautiful Public Website** - Where visitors discover recipes and read food stories
- **Powerful Admin Panel** - Where you create and manage all content
- **Role-Based Access** - Perfect for solo bloggers or teams of food writers
- **Modern Technology** - Built with the latest web technologies for speed and reliability

## 🌐 Public Website Features

**🏠 Homepage**
- Stunning hero section with featured recipe of the day
- Browse recipes by categories with beautiful icons
- Featured recipes showcase with engaging layouts
- Instagram feed integration (@foodieland)
- Responsive design that looks great on all devices

**📚 Recipe Discovery**
- Browse all recipes with search and category filtering
- Beautiful recipe cards with images and quick info
- Detailed recipe pages with ingredients, directions, and nutrition facts
- Related recipes suggestions to keep visitors engaged
- Interactive ingredient checklists and direction steps

**📖 Blog & Articles**
- Engaging blog listing with search functionality
- Individual blog post pages with rich content formatting
- Author information and publication dates
- Related articles to increase engagement
- Social sharing options for each post

**👨‍🍳 About & Contact**
- Meet the team page showcasing professional chefs
- Contact form with automatic email notifications
- Beautiful chef profiles with social media links
- Company story and experience highlights

## 🎛️ Admin Panel Features

**📝 Content Creation**
- Rich text editor with formatting toolbar (bold, italic, lists, headings, alignment)
- Image upload with drag-and-drop and instant preview
- Recipe builder with ingredients, directions, and nutrition facts
- Blog post editor with excerpts and featured images
- Category management for organizing content

**👥 User Management & Roles**
- **Admins**: Full access to everything - manage all recipes, blog posts, categories, and users
- **Regular Users**: Perfect for individual bloggers - create and manage only their own content
- Automatic content scoping - users only see their own recipes and blog posts
- Role-adaptive interface that changes based on permissions

**📊 Dashboard & Analytics**
- Admins get site-wide statistics (total recipes, blog posts, categories, users)
- Regular users see their personal stats and recent activity
- Clean, intuitive interface that's easy to navigate
- Real-time data updates and interactive charts

**🎨 User Experience**
- Beautiful, responsive design that works on all devices
- Smart forms with auto-complete and validation
- Toast notifications for actions and feedback
- Responsive data tables that work on mobile and desktop
- Modern Vue 3 components with smooth transitions

## 🚀 Getting Started

### Prerequisites
- PHP 8.1 or higher
- Composer
- Node.js & NPM
- SQLite (or your preferred database)

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd FoodBlog
   ```

2. **Install PHP dependencies**
   ```bash
   composer install
   ```

3. **Install JavaScript dependencies**
   ```bash
   npm install
   ```

4. **Set up your environment**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

5. **Database setup**
   ```bash
   php artisan migrate --seed
   ```

6. **Build assets**
   ```bash
   npm run build
   ```

7. **Start the development server**
   ```bash
   php artisan serve
   ```

Visit `http://localhost:8000` and start creating delicious content!

### Access the Platform

**Public Website**: `http://localhost:8000`
- Browse recipes, read blog posts, contact form

**Admin Panel**: `http://localhost:8000/admin`
- Create and manage content, user management, analytics

## 👤 User Roles Explained

### Admin Users
- See everything and can manage all content
- Access to user management
- Global statistics and insights
- Can assign blog posts and recipes to any user

### Regular Users  
- Perfect for individual food bloggers
- Can only create and manage their own content
- Personalized dashboard with their own stats
- Cannot see or edit other users' content

## 🛠️ Built With Love Using

**Backend Technologies:**
- **Laravel 11** - The robust PHP framework that powers everything
- **Inertia.js** - Seamless SPA experience without the API complexity
- **SQLite** - Simple, file-based database (easily switchable)

**Frontend Technologies:**
- **Vue 3** - Reactive and intuitive user interface with Composition API
- **Bootstrap 5** - Beautiful, responsive styling and components
- **Vite** - Lightning-fast build tool for modern development
- **Font Awesome** - Beautiful icons throughout the interface
- **Vue Toaster** - Elegant toast notifications for user feedback

## 📁 Project Structure

The magic happens in these key directories:

**Backend:**
- `app/Models/` - Recipe, Blog, Category, and User models
- `app/Http/Controllers/Admin/` - Admin panel logic
- `app/Http/Controllers/Frontend/` - Public website logic
- `app/Http/Middleware/` - Role-based access control and request handling
- `database/migrations/` - Database structure
- `routes/web.php` - Application routes with role-based access

**Frontend:**
- `resources/js/Components/` - Reusable Vue 3 components (forms, tables, cards)
- `resources/js/Layout/` - Page layouts and navigation components
- `resources/js/Pages/Admin/` - Admin panel pages and views
- `resources/js/Pages/Frontend/` - Public website pages (Home, Recipes, Blog, About, Contact)
- `resources/css/` - Custom styles and theme configuration
- `public/build/` - Compiled frontend assets

## 🎉 Ready to Cook?

This food blog platform is perfect for:
- **Individual food bloggers** who want both a professional admin panel and a beautiful public website
- **Food websites with multiple contributors** - admins manage content while the public enjoys the recipes
- **Culinary schools** managing student recipes with a public showcase
- **Restaurant chains** sharing their secret recipes with the world
- **Food communities** where chefs can create content and visitors can discover amazing recipes

**What your visitors will see:**
- 🏠 **Homepage**: Stunning hero section with featured recipes and easy category browsing
- 📚 **Recipe Collection**: Searchable recipe database with beautiful layouts
- 📖 **Blog Articles**: Engaging food stories and culinary experiences
- 👨‍🍳 **About Section**: Meet the chefs and learn the story behind the food
- 📞 **Contact Page**: Easy way for visitors to get in touch

**What you'll manage:**
- 🎛️ **Admin Dashboard**: Full control over all content and users
- ✏️ **Content Creation**: Rich text editors for recipes and blog posts
- 👥 **User Management**: Role-based access for your team
- 📊 **Analytics**: Track your content performance

Start your culinary journey today and create something delicious! 🍳👨‍🍳👩‍🍳

---

## 📧 Email Features

- **Contact Form**: Automatic email notifications when visitors submit the contact form
- **Subscriber Management**: Built-in subscriber system for newsletters
- **Professional Templates**: Clean, branded email templates

## 🔧 Technical Features

- **SEO Friendly**: Clean URLs and meta tags for better search engine visibility
- **Mobile First**: Responsive design that works perfectly on all devices
- **Fast Loading**: Optimized images and modern build tools for quick page loads
- **Secure**: Role-based authentication and CSRF protection
- **Scalable**: Built on Laravel's robust architecture for growth

## 📝 License

This project is open-source and available under the MIT License. Feel free to use it for your food blog adventures!
