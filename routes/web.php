<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\RecipeController;
use App\Http\Controllers\Admin\IngredientController;
use App\Http\Controllers\Admin\DirectionController;
use App\Http\Controllers\Admin\NutritionFactController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\SessionAuthenticate;
use Illuminate\Support\Facades\Route;




Route::get('/', [UserController::class, 'index']);

Route::get('/login', [UserController::class, 'LoginPage'])->name('LoginPage');
Route::post('/login', [UserController::class, 'login'])->name('user.login');
Route::get('/logout', [UserController::class, 'logout'])->name('user.logout');

Route::get('/register', [UserController::class, 'RegistrationPage'])->name('RegistrationPage');
Route::post('/register', [UserController::class, 'register'])->name('user.register');

Route::middleware(SessionAuthenticate::class)->group(callback: function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('DashboardPage');

    Route::get('/category', [CategoryController::class, 'CategoryPage'])->name('CategoryPage');
    Route::get('/CategorySavePage', [CategoryController::class, 'CategorySavePage'])->name('CategorySavePage');
    Route::post("/create-category",[CategoryController::class,'create']);
    Route::post("/update-category",[CategoryController::class,'update']);
    Route::get("/delete-category/{id}",[CategoryController::class,'delete']);
    
    // Recipe Routes
    Route::get('/recipe', [RecipeController::class, 'RecipePage'])->name('RecipePage');
    Route::get('/RecipeSavePage', [RecipeController::class, 'RecipeSavePage'])->name('RecipeSavePage');
    Route::post("/create-recipe",[RecipeController::class,'create']);
    Route::post("/update-recipe",[RecipeController::class,'update']);
    Route::get("/delete-recipe/{id}",[RecipeController::class,'delete']);
    
    // Ingredient Routes
    Route::get('/ingredient', [IngredientController::class, 'IngredientPage'])->name('IngredientPage');
    Route::get('/IngredientSavePage', [IngredientController::class, 'IngredientSavePage'])->name('IngredientSavePage');
    Route::post("/create-ingredient",[IngredientController::class,'create']);
    Route::post("/update-ingredient",[IngredientController::class,'update']);
    Route::get("/delete-ingredient/{id}",[IngredientController::class,'delete']);
    
    // Direction Routes
    Route::get('/direction', [DirectionController::class, 'DirectionPage'])->name('DirectionPage');
    Route::get('/DirectionSavePage', [DirectionController::class, 'DirectionSavePage'])->name('DirectionSavePage');
    Route::post("/create-direction",[DirectionController::class,'create']);
    Route::post("/update-direction",[DirectionController::class,'update']);
    Route::get("/delete-direction/{id}",[DirectionController::class,'delete']);
    
    // Nutrition Fact Routes
    Route::get('/nutrition-fact', [NutritionFactController::class, 'NutritionFactPage'])->name('NutritionFactPage');
    Route::get('/NutritionFactSavePage', [NutritionFactController::class, 'NutritionFactSavePage'])->name('NutritionFactSavePage');
    Route::post("/create-nutrition-fact",[NutritionFactController::class,'create']);
    Route::post("/update-nutrition-fact",[NutritionFactController::class,'update']);
    Route::get("/delete-nutrition-fact/{id}",[NutritionFactController::class,'delete']);
        
});
