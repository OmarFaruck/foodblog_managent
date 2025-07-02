<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\NutritionFact;
use App\Models\Recipe;

class NutritionFactController
{
    function NutritionFactPage(Request $request)
    {
        $user_id = $request->header('id');
        $recipe_filter = $request->query('recipe');
        
        $query = NutritionFact::with(['recipe'])
                              ->orderBy('id', 'desc');
        
        if ($recipe_filter) {
            $query->where('recipe_id', $recipe_filter);
        }
        
        $list = $query->get();
        return Inertia::render('Admin/NutritionFact/NutritionFactPage', [
            'list' => $list,
            'recipeFilter' => $recipe_filter
        ]);
    }

    function NutritionFactSavePage(Request $request)
    {
        $nutrition_fact_id = $request->query('id');
        $recipe_id = $request->query('recipe_id');
        $nutritionFact = NutritionFact::with(['recipe'])->where('id', $nutrition_fact_id)->first();
        $recipes = Recipe::orderBy('title')->get();
        
        return Inertia::render('Admin/NutritionFact/NutritionFactSavePage', [
            'nutritionFact' => $nutritionFact,
            'recipes' => $recipes,
            'preSelectedRecipeId' => $recipe_id
        ]);
    }

    function create(Request $request)
    {
        // Validating the request
        $validatedData = $request->validate([
            'recipe_id' => 'required|exists:recipes,id|unique:nutrition_facts,recipe_id',
            'calories' => 'nullable|numeric|min:0',
            'protein' => 'nullable|numeric|min:0',
            'fat' => 'nullable|numeric|min:0',
            'carbohydrates' => 'nullable|numeric|min:0',
            'cholesterol' => 'nullable|numeric|min:0',
        ]);

        try {
            NutritionFact::create([
                'recipe_id' => $validatedData['recipe_id'],
                'calories' => $validatedData['calories'],
                'protein' => $validatedData['protein'],
                'fat' => $validatedData['fat'],
                'carbohydrates' => $validatedData['carbohydrates'],
                'cholesterol' => $validatedData['cholesterol'],
            ]);

            return redirect()->route('NutritionFactSavePage')->with([
                'message' => 'Nutrition Facts Created Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('NutritionFactSavePage')->with([
                'message' => 'Nutrition Facts Creation Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request)
    {
        // Validating the request
        $validatedData = $request->validate([
            'recipe_id' => 'required|exists:recipes,id|unique:nutrition_facts,recipe_id,' . $request->input('id'),
            'calories' => 'nullable|numeric|min:0',
            'protein' => 'nullable|numeric|min:0',
            'fat' => 'nullable|numeric|min:0',
            'carbohydrates' => 'nullable|numeric|min:0',
            'cholesterol' => 'nullable|numeric|min:0',
        ]);

        try {
            $nutrition_fact_id = $request->input('id');
            $nutritionFact = NutritionFact::where('id', $nutrition_fact_id)->first();

            $nutritionFact->update([
                'recipe_id' => $validatedData['recipe_id'],
                'calories' => $validatedData['calories'],
                'protein' => $validatedData['protein'],
                'fat' => $validatedData['fat'],
                'carbohydrates' => $validatedData['carbohydrates'],
                'cholesterol' => $validatedData['cholesterol'],
            ]);

            return redirect()->route('NutritionFactSavePage')->with([
                'message' => 'Nutrition Facts Updated Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('NutritionFactSavePage')->with([
                'message' => 'Nutrition Facts Update Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function delete(Request $request)
    {
        try {
            $nutrition_fact_id = $request->id;
            $nutritionFact = NutritionFact::where('id', $nutrition_fact_id)->first();
            
            $nutritionFact->delete();

            return redirect()->route('NutritionFactPage')->with([
                'message' => 'Nutrition Facts Deleted Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('NutritionFactPage')->with([
                'message' => 'Nutrition Facts Deletion Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
}
