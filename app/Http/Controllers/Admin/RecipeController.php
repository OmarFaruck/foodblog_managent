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
        //dd('inside recipe page');
        $list = Recipe::with(['category', 'user'])
                     ->withCount(['directions', 'nutritionFacts', 'ingredients'])
                     ->orderBy('id', 'desc')
                     ->get();
        return Inertia::render('Admin/Recipe/RecipePage', ['list' => $list]);
    }

    function RecipeSavePage(Request $request)
    {
        $recipe_id = $request->query('id');
        $recipe = Recipe::with(['category', 'user', 'ingredients'])->where('id', $recipe_id)->first();
        $categories = Category::orderBy('name')->get();
        $ingredients = \App\Models\Ingredient::orderBy('name')->get();
        
        return Inertia::render('Admin/Recipe/RecipeSavePage', [
            'recipe' => $recipe,
            'categories' => $categories,
            'ingredients' => $ingredients
        ]);
    }

    function create(Request $request)
    {
        // Validating the request
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'category_id' => 'required|exists:categories,id',
            'prep_time' => 'required|integer|min:1',
            'cook_time' => 'required|integer|min:1',
            'serving_size' => 'required|integer|min:1',
            'is_featured' => 'boolean',
            'recipe_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'ingredients' => 'nullable|array',
            'ingredients.*.id' => 'required|exists:ingredients,id',
            'ingredients.*.group' => 'nullable|string|max:255',
        ]);

        try {
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
                'user_id' => $request->header('id'), // Get from session/auth
                'prep_time' => $validatedData['prep_time'],
                'cook_time' => $validatedData['cook_time'],
                'serving_size' => $validatedData['serving_size'],
                'is_featured' => $request->boolean('is_featured'),
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
        // Validating the request
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'category_id' => 'required|exists:categories,id',
            'prep_time' => 'required|integer|min:1',
            'cook_time' => 'required|integer|min:1',
            'serving_size' => 'required|integer|min:1',
            'is_featured' => 'boolean',
            'recipe_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'ingredients' => 'nullable|array',
            'ingredients.*.id' => 'required|exists:ingredients,id',
            'ingredients.*.group' => 'nullable|string|max:255',
        ]);

        try {
            $recipe_id = $request->input('id');
            $recipe = Recipe::where('id', $recipe_id)->first();

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

            $recipe->update([
                'title' => $validatedData['title'],
                'description' => $validatedData['description'],
                'category_id' => $validatedData['category_id'],
                'prep_time' => $validatedData['prep_time'],
                'cook_time' => $validatedData['cook_time'],
                'serving_size' => $validatedData['serving_size'],
                'is_featured' => $request->boolean('is_featured'),
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
            $recipe = Recipe::where('id', $recipe_id)->first();

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
