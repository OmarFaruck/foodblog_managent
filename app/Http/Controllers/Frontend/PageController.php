<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Recipe;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PageController extends Controller
{
    public function home(){
        // Get featured recipe with author information
        $featuredRecipe = Recipe::with(['user', 'category'])
            ->where('is_featured', true)
            ->inRandomOrder()
            ->first(); //dd($featuredRecipe);

        // Get categories for display
        $categories = Category::orderBy('name')->limit(6)->get();          
        
        // Get featured recipes for "Simple and tasty recipes" section
        $featuredRecipes = Recipe::with(['user', 'category'])
            ->where('is_featured', true)
            ->where('id', '!=', $featuredRecipe ? $featuredRecipe->id : 0) // Exclude the main featured recipe
            ->orderBy('created_at', 'desc')
            ->limit(6)
            ->get();

        // Get random recipes for "Try this delicious recipe" section
        $randomRecipes = Recipe::with(['user', 'category'])
            ->inRandomOrder()
            ->limit(8)
            ->get();

        return Inertia::render("Frontend/Pages/Home", [
            'featuredRecipe' => $featuredRecipe,
            'categories' => $categories,
            'featuredRecipes' => $featuredRecipes,
            'randomRecipes' => $randomRecipes
        ]);
    }

    public function about(){
        return Inertia::render("Frontend/Pages/About");
    }

    public function contact(){
        return Inertia::render("Frontend/Pages/Contact");
    }    
}
