# 🍽️ FoodBlog Admin Panel

A delicious food blog management system built with Laravel, Inertia.js, and Vue 3. Whether you're a food blogger sharing your culinary adventures or managing a team of writers, this admin panel has everything you need to create mouth-watering content!

## ✨ What Makes This Special?

This isn't just another blog - it's specifically designed for food enthusiasts! Share recipes, write engaging blog posts, and build a community around your love for food.

### 🎯 Key Features

**📝 Recipe Management**
- Create detailed recipes with ingredients, directions, and nutrition facts
- Upload beautiful food photos to make your recipes shine
- Organize recipes by categories for easy browsing
- Rich text editor for detailed cooking instructions

**📰 Blog Posts**
- Write engaging food stories and culinary experiences
- Rich text editor with formatting options (bold, italic, lists, headings)
- Featured images to make your posts visually appealing
- Optional excerpts for preview snippets

**👥 Smart User Roles**
- **Admins**: Full access to everything - manage all recipes, blog posts, categories, and users
- **Regular Users**: Perfect for individual bloggers - create and manage only your own content
- Automatic content scoping - users only see their own recipes and blog posts

**📊 Dashboard Insights**
- Admins get site-wide statistics (total recipes, blog posts, categories, users)
- Regular users see their personal stats and recent activity
- Clean, intuitive interface that's easy to navigate

**🎨 User Experience**
- Beautiful, responsive design that works on all devices
- Intuitive navigation that adapts to your role
- Form validation and helpful error messages
- Toast notifications for actions and feedback

**✨ Admin Panel Features**
- **Rich Text Editor**: Built-in WYSIWYG editor with formatting toolbar (bold, italic, lists, headings, alignment)
- **Image Upload**: Drag-and-drop image uploads with instant preview
- **Smart Forms**: Auto-complete and validation with real-time feedback
- **Role-Adaptive UI**: Interface elements appear/disappear based on user permissions
- **Responsive Tables**: Data tables that work beautifully on mobile and desktop
- **Interactive Dashboard**: Charts and statistics that update in real-time
- **Modern Components**: Vue 3 powered components with smooth transitions and animations

**🌐 Public Website Features**
- **Beautiful Homepage**: Hero section with featured recipes and category browsing
- **Recipe Discovery**: Browse recipes by categories with search functionality
- **Recipe Details**: Full recipe pages with ingredients, directions, nutrition facts, and related recipes
- **Blog Section**: Read food stories and culinary experiences with engaging layouts
- **Blog Articles**: Individual blog post pages with rich content and related articles
- **About Page**: Learn about the chefs and the story behind the food blog
- **Contact Form**: Get in touch with automatic email notifications
- **Responsive Design**: Perfect experience on desktop, tablet, and mobile devices
- **Search & Filter**: Find recipes and blog posts easily with advanced search
- **Social Integration**: Instagram feed integration and social sharing options

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
- `app/Http/Controllers/Admin/` - All the admin panel logic
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
