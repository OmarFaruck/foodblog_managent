<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Recipe;
use App\Models\Category;
use Illuminate\Http\Request;
use Inertia\Inertia;

class RecipeController extends Controller
{
    function index(Request $request)
    {
        $query = Recipe::with(['category', 'user', 'nutritionFacts']);

        // Search functionality
        if ($request->has('search') && $request->search) {
            $query->where('title', 'like', '%' . $request->search . '%');
        }

        // Category filtering
        if ($request->has('categories') && is_array($request->categories) && count($request->categories) > 0) {
            $query->whereIn('category_id', $request->categories);
        }

        // Pagination with 9 recipes per page
        $recipes = $query->orderBy('created_at', 'desc')->paginate(9);

        // Get all categories for the filter
        $categories = Category::withCount('recipes')->get();

        return Inertia::render("Frontend/Recipes/list", [
            'recipes' => $recipes,
            'categories' => $categories,
            'filters' => [
                'search' => $request->search,
                'categories' => $request->categories ?? [],
            ]
        ]);
    }

    function show(){
        return Inertia::render("Frontend/Recipes/detail");
    }
}
