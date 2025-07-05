<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Recipe;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;

class RecipeController
{
    function RecipePage(Request $request)
    {
        $user_id = $request->header('id');
        $user_role = $request->session()->get('role', 'user');
        
        // Admin users can see all recipes, regular users can only see their own
        if ($user_role === 'admin') {
            $list = Recipe::with(['category', 'user'])
                         ->withCount(['directions', 'nutritionFacts', 'ingredients'])
                         ->orderBy('id', 'desc')
                         ->get();
        } else {
            $list = Recipe::with(['category', 'user'])
                         ->withCount(['directions', 'nutritionFacts', 'ingredients'])
                         ->where('user_id', $user_id)
                         ->orderBy('id', 'desc')
                         ->get();
        }
        
        return Inertia::render('Admin/Recipe/RecipePage', ['list' => $list]);
    }

    function RecipeSavePage(Request $request)
    {
        $recipe_id = $request->query('id');
        $user_id = $request->header('id');
        $user_role = $request->session()->get('role', 'user');
        
        // Build the query
        $query = Recipe::with(['category', 'user', 'ingredients']);
        if ($recipe_id) {
            $query->where('id', $recipe_id);
            
            // If regular user, ensure they can only access their own recipes
            if ($user_role !== 'admin') {
                $query->where('user_id', $user_id);
            }
        }
        
        $recipe = $query->first();
        
        // If regular user tries to access someone else's recipe, redirect
        if ($recipe_id && !$recipe && $user_role !== 'admin') {
            return redirect()->route('RecipePage')->with([
                'message' => 'Access denied. You can only edit your own recipes.',
                'status' => false,
                'error' => 'Unauthorized access'
            ]);
        }
        
        $categories = Category::orderBy('name')->get();
        $ingredients = \App\Models\Ingredient::orderBy('name')->get();
        
        // Get users list - admin gets all users, regular user gets only themselves
        if ($user_role === 'admin') {
            $users = \App\Models\User::orderBy('name')->get();
        } else {
            $users = \App\Models\User::where('id', $user_id)->get();
        }
        
        return Inertia::render('Admin/Recipe/RecipeSavePage', [
            'recipe' => $recipe,
            'categories' => $categories,
            'ingredients' => $ingredients,
            'users' => $users
        ]);
    }

    function create(Request $request)
    {
        try {
            $user_id = $request->header('id');
            $user_role = $request->session()->get('role', 'user');
            
            // Validating the request
            $validatedData = $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'category_id' => 'required|exists:categories,id',
                'user_id' => 'required|exists:users,id',
                'prep_time' => 'required|integer|min:1',
                'cook_time' => 'required|integer|min:1',
                'serving_size' => 'required|integer|min:1',
                'is_featured' => 'boolean',
                'recipe_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
                'ingredients' => 'nullable|array',
                'ingredients.*.id' => 'required|exists:ingredients,id',
                'ingredients.*.group' => 'nullable|string|max:255',
            ]);

            // Regular users can only create recipes for themselves
            if ($user_role !== 'admin' && $validatedData['user_id'] != $user_id) {
                return redirect()->route('RecipeSavePage')->with([
                    'message' => 'Access denied. You can only create recipes for yourself.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }

            $imagePath = null;
            if ($request->hasFile('recipe_image')) {
                $image = $request->file('recipe_image');
                $imageName = now()->format('YmdHis') . '_' . $image->getClientOriginalName();
                $imagePath = $image->storeAs('recipe-items', $imageName, 'public');
            }
            
            $recipe = Recipe::create([
                'title' => $validatedData['title'],
                'description' => $validatedData['description'],
                'category_id' => $validatedData['category_id'],
                'user_id' => $validatedData['user_id'],
                'prep_time' => $validatedData['prep_time'],
                'cook_time' => $validatedData['cook_time'],
                'serving_size' => $validatedData['serving_size'],
                'is_featured' => $request->input('is_featured') === true ? 1 : 0,
                'recipe_image' => $imagePath,
            ]);

            // Attach ingredients if provided
            if ($request->has('ingredients') && is_array($request->ingredients)) {
                $ingredientData = [];
                foreach ($request->ingredients as $ingredient) {
                    $ingredientData[$ingredient['id']] = [
                        'ingredient_group' => $ingredient['group'] ?? 'Main'
                    ];
                }
                $recipe->ingredients()->attach($ingredientData);
            }

            return redirect()->route('RecipeSavePage')->with([
                'message' => 'Recipe Created Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('RecipeSavePage')->with([
                'message' => 'Recipe Creation Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request)
    {
        try {
            $recipe_id = $request->input('id');
            $user_id = $request->header('id');
            $user_role = $request->session()->get('role', 'user');
            
            // Remove empty recipe_image field if it exists
            if ($request->has('recipe_image') && empty($request->file('recipe_image'))) {
                $request->request->remove('recipe_image');
            }

            // Validating the request
            $validatedData = $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'category_id' => 'required|exists:categories,id',
                'user_id' => 'required|exists:users,id',
                'prep_time' => 'required|integer|min:1',
                'cook_time' => 'required|integer|min:1',
                'serving_size' => 'required|integer|min:1',
                'is_featured' => 'boolean',
                'recipe_image' => 'nullable|file|image|mimes:jpeg,png,jpg,gif|max:2048',
                'ingredients' => 'nullable|array',
                'ingredients.*.id' => 'required|exists:ingredients,id',
                'ingredients.*.group' => 'nullable|string|max:255',
            ]);

            $recipe = Recipe::where('id', $recipe_id)->first();
            
            // Check if recipe exists
            if (!$recipe) {
                return redirect()->route('RecipePage')->with([
                    'message' => 'Recipe not found',
                    'status' => false,
                    'error' => 'Recipe not found'
                ]);
            }
            
            // Regular users can only update their own recipes
            if ($user_role !== 'admin' && $recipe->user_id != $user_id) {
                return redirect()->route('RecipePage')->with([
                    'message' => 'Access denied. You can only edit your own recipes.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }
            
            // Regular users can only update to their own user_id
            if ($user_role !== 'admin' && $validatedData['user_id'] != $user_id) {
                return redirect()->route('RecipeSavePage', ['id' => $recipe_id])->with([
                    'message' => 'Access denied. You can only assign recipes to yourself.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }

            $imagePath = $recipe->recipe_image; // Keep existing image by default

            if ($request->hasFile('recipe_image')) {
                // Delete old image if it exists
                if ($recipe->recipe_image) {
                    Storage::disk('public')->delete($recipe->recipe_image);
                }
                
                $image = $request->file('recipe_image');
                $imageName = now()->format('YmdHis') . '_' . $image->getClientOriginalName();
                $imagePath = $image->storeAs('recipe-items', $imageName, 'public');
            }
            //dd($request->all());
            $recipe->update([
                'title' => $validatedData['title'],
                'description' => $validatedData['description'],
                'category_id' => $validatedData['category_id'],
                'user_id' => $validatedData['user_id'],
                'prep_time' => $validatedData['prep_time'],
                'cook_time' => $validatedData['cook_time'],
                'serving_size' => $validatedData['serving_size'],
                'is_featured' => $request->input('is_featured') === true ? 1 : 0,
                'recipe_image' => $imagePath,
            ]);

            // Update ingredients
            $recipe->ingredients()->detach(); // Remove all existing ingredients
            
            if ($request->has('ingredients') && is_array($request->ingredients)) {
                $ingredientData = [];
                foreach ($request->ingredients as $ingredient) {
                    $ingredientData[$ingredient['id']] = [
                        'ingredient_group' => $ingredient['group'] ?? 'Main'
                    ];
                }
                $recipe->ingredients()->attach($ingredientData);
            }

            return redirect()->route('RecipeSavePage')->with([
                'message' => 'Recipe Updated Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('RecipeSavePage')->with([
                'message' => 'Recipe Update Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function delete(Request $request)
    {
        try {
            $recipe_id = $request->id;
            $user_id = $request->header('id');
            $user_role = $request->session()->get('role', 'user');
            
            $recipe = Recipe::where('id', $recipe_id)->first();
            
            if (!$recipe) {
                return redirect()->route('RecipePage')->with([
                    'message' => 'Recipe not found',
                    'status' => false,
                    'error' => 'Recipe not found'
                ]);
            }
            
            // Regular users can only delete their own recipes
            if ($user_role !== 'admin' && $recipe->user_id != $user_id) {
                return redirect()->route('RecipePage')->with([
                    'message' => 'Access denied. You can only delete your own recipes.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }

            if ($recipe->recipe_image && Storage::disk('public')->exists($recipe->recipe_image)) {
                Storage::disk('public')->delete($recipe->recipe_image);
            }
            
            $recipe->delete();

            return redirect()->route('RecipePage')->with([
                'message' => 'Recipe Deleted Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('RecipePage')->with([
                'message' => 'Recipe Deletion Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
}
