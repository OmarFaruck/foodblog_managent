<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Direction;
use App\Models\Recipe;
use Illuminate\Support\Facades\Storage;

class DirectionController
{
    function DirectionPage(Request $request)
    {
        $user_id = $request->header('id');
        $recipe_filter = $request->query('recipe');
        
        $query = Direction::with(['recipe'])
                          ->orderBy('recipe_id', 'asc')
                          ->orderBy('step_number', 'asc');
        
        if ($recipe_filter) {
            $query->where('recipe_id', $recipe_filter);
        }
        
        $list = $query->get();
        return Inertia::render('Admin/Direction/DirectionPage', [
            'list' => $list,
            'recipeFilter' => $recipe_filter
        ]);
    }

    function DirectionSavePage(Request $request)
    {
        $direction_id = $request->query('id');
        $recipe_id = $request->query('recipe_id');
        $direction = Direction::with(['recipe'])->where('id', $direction_id)->first();
        $recipes = Recipe::orderBy('title')->get();
        
        return Inertia::render('Admin/Direction/DirectionSavePage', [
            'direction' => $direction,
            'recipes' => $recipes,
            'preSelectedRecipeId' => $recipe_id
        ]);
    }

    function create(Request $request)
    {
        // Validating the request
        $validatedData = $request->validate([
            'recipe_id' => 'required|exists:recipes,id',
            'step_number' => 'required|integer|min:1',
            'instruction' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        try {
            $imagePath = null;
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = now()->format('YmdHis') . '_step_' . $image->getClientOriginalName();
                $imagePath = $image->storeAs('directions', $imageName, 'public');
            }

            Direction::create([
                'recipe_id' => $validatedData['recipe_id'],
                'step_number' => $validatedData['step_number'],
                'instruction' => $validatedData['instruction'],
                'image' => $imagePath,
            ]);

            return redirect()->route('DirectionSavePage')->with([
                'message' => 'Direction Created Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('DirectionSavePage')->with([
                'message' => 'Direction Creation Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request)
    {
        // Validating the request
        $validatedData = $request->validate([
            'recipe_id' => 'required|exists:recipes,id',
            'step_number' => 'required|integer|min:1',
            'instruction' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        try {
            $direction_id = $request->input('id');
            $direction = Direction::where('id', $direction_id)->first();

            $imagePath = $direction->image; // Keep existing image by default

            if ($request->hasFile('image')) {
                // Delete old image if it exists
                if ($direction->image) {
                    Storage::disk('public')->delete($direction->image);
                }
                
                $image = $request->file('image');
                $imageName = now()->format('YmdHis') . '_step_' . $image->getClientOriginalName();
                $imagePath = $image->storeAs('directions', $imageName, 'public');
            }

            $direction->update([
                'recipe_id' => $validatedData['recipe_id'],
                'step_number' => $validatedData['step_number'],
                'instruction' => $validatedData['instruction'],
                'image' => $imagePath,
            ]);

            return redirect()->route('DirectionSavePage')->with([
                'message' => 'Direction Updated Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('DirectionSavePage')->with([
                'message' => 'Direction Update Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function delete(Request $request)
    {
        try {
            $direction_id = $request->id;
            $direction = Direction::where('id', $direction_id)->first();

            if ($direction->image && Storage::disk('public')->exists($direction->image)) {
                Storage::disk('public')->delete($direction->image);
            }
            
            $direction->delete();

            return redirect()->route('DirectionPage')->with([
                'message' => 'Direction Deleted Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (Exception $e) {
            return redirect()->route('DirectionPage')->with([
                'message' => 'Direction Deletion Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
}
