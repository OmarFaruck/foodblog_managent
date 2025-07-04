<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\DirectionController;
use App\Http\Controllers\Admin\IngredientController;
use App\Http\Controllers\Admin\NutritionFactController;
use App\Http\Controllers\Admin\RecipeController as AdminRecipeController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Frontend\PageController;
use App\Http\Controllers\Frontend\RecipeController;
use App\Http\Controllers\Frontend\SubscriberController;
use App\Http\Middleware\SessionAuthenticate;
use App\Models\Recipe;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Frontend\BlogController;




Route::get('/', [PageController::class, 'home'])->name('HomePage');

Route::get('/recipes', [RecipeController::class, 'index'])->name('frontend.recipes.index');
Route::get('/recipe/{id}', [RecipeController::class, 'show'])->name('frontend.recipes.show');

Route::get('/blog', [BlogController::class, 'index'])->name('BlogListPage');
Route::get('/blog/detail', [BlogController::class, 'show'])->name('BlogDetailPage');

Route::get('/about-us', [PageController::class, 'about'])->name('AboutPage');
Route::get('/contact-us', [PageController::class, 'contact'])->name('ContactPage');

Route::post('/subscribe', [SubscriberController::class, 'subscribe'])->name('subscribe');

Route::get('/admin/login', [UserController::class, 'LoginPage'])->name('LoginPage');
Route::post('/admin/login', [UserController::class, 'login'])->name('user.login');
Route::get('/admin/logout', [UserController::class, 'logout'])->name('user.logout');

Route::get('/admin/register', [UserController::class, 'RegistrationPage'])->name('RegistrationPage');
Route::post('/admin/register', [UserController::class, 'register'])->name('user.register');

Route::middleware(SessionAuthenticate::class)->group(callback: function () {
    Route::get('/admin/dashboard', [DashboardController::class, 'index'])->name('DashboardPage');

    Route::get('/admin/category', [CategoryController::class, 'CategoryPage'])->name('CategoryPage');
    Route::get('/admin/CategorySavePage', [CategoryController::class, 'CategorySavePage'])->name('CategorySavePage');
    Route::post("/admin/create-category",[CategoryController::class,'create']);
    Route::post("/admin/update-category",[CategoryController::class,'update']);
    Route::get("/admin/delete-category/{id}",[CategoryController::class,'delete']);

    // Recipe Routes
    Route::get('/admin/recipe', [AdminRecipeController::class, 'RecipePage'])->name('RecipePage');
    Route::get('/admin/RecipeSavePage', [AdminRecipeController::class, 'RecipeSavePage'])->name('RecipeSavePage');
    Route::post("/admin/create-recipe",[AdminRecipeController::class,'create']);
    Route::post("/admin/update-recipe",[AdminRecipeController::class,'update']);
    Route::get("/admin/delete-recipe/{id}",[AdminRecipeController::class,'delete']);

    // Ingredient Routes
    Route::get('/admin/ingredient', [IngredientController::class, 'IngredientPage'])->name('IngredientPage');
    Route::get('/admin/IngredientSavePage', [IngredientController::class, 'IngredientSavePage'])->name('IngredientSavePage');
    Route::post("/admin/create-ingredient",[IngredientController::class,'create']);
    Route::post("/admin/update-ingredient",[IngredientController::class,'update']);
    Route::get("/admin/delete-ingredient/{id}",[IngredientController::class,'delete']);

    // Direction Routes
    Route::get('/admin/direction', [DirectionController::class, 'DirectionPage'])->name('DirectionPage');
    Route::get('/admin/DirectionSavePage', [DirectionController::class, 'DirectionSavePage'])->name('DirectionSavePage');
    Route::post("/admin/create-direction",[DirectionController::class,'create']);
    Route::post("/admin/update-direction",[DirectionController::class,'update']);
    Route::get("/admin/delete-direction/{id}",[DirectionController::class,'delete']);

    // Nutrition Fact Routes
    Route::get('/admin/nutrition-fact', [NutritionFactController::class, 'NutritionFactPage'])->name('NutritionFactPage');
    Route::get('/admin/NutritionFactSavePage', [NutritionFactController::class, 'NutritionFactSavePage'])->name('NutritionFactSavePage');
    Route::post("/admin/create-nutrition-fact",[NutritionFactController::class,'create']);
    Route::post("/admin/update-nutrition-fact",[NutritionFactController::class,'update']);
    Route::get("/admin/delete-nutrition-fact/{id}",[NutritionFactController::class,'delete']);

});
