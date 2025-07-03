<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
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

        return Inertia::render("Frontend/Pages/Home", [
            'featuredRecipe' => $featuredRecipe
        ]);
    }

    public function about(){
        return Inertia::render("Frontend/Pages/About");
    }

    public function contact(){
        return Inertia::render("Frontend/Pages/Contact");
    }    
}
