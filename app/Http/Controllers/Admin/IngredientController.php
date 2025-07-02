<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Ingredient;

class IngredientController
{
    function IngredientPage(Request $request)
    {
        $user_id = $request->header('id');
        $list = Ingredient::orderBy('id', 'desc')->get();
        return Inertia::render('Admin/Ingredient/IngredientPage', ['list' => $list]);
    }

    function IngredientSavePage(Request $request)
    {
        $ingredient_id = $request->query('id');
        $ingredient = Ingredient::where('id', $ingredient_id)->first();
        
        return Inertia::render('Admin/Ingredient/IngredientSavePage', [
            'ingredient' => $ingredient
        ]);
    }

    function create(Request $request)
    {
        // Validating the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255|unique:ingredients,name',
        ]);

        try {
            Ingredient::create([
                'name' => $validatedData['name'],
            ]);

            return redirect()->route('IngredientSavePage')->with([
                'message' => 'Ingredient Created Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('IngredientSavePage')->with([
                'message' => 'Ingredient Creation Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request)
    {
        // Validating the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255|unique:ingredients,name,' . $request->input('id'),
        ]);

        try {
            $ingredient_id = $request->input('id');
            $ingredient = Ingredient::where('id', $ingredient_id)->first();

            $ingredient->update([
                'name' => $validatedData['name'],
            ]);

            return redirect()->route('IngredientSavePage')->with([
                'message' => 'Ingredient Updated Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('IngredientSavePage')->with([
                'message' => 'Ingredient Update Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function delete(Request $request)
    {
        try {
            $ingredient_id = $request->id;
            $ingredient = Ingredient::where('id', $ingredient_id)->first();
            
            $ingredient->delete();

            return redirect()->route('IngredientPage')->with([
                'message' => 'Ingredient Deleted Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('IngredientPage')->with([
                'message' => 'Ingredient Deletion Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
}
