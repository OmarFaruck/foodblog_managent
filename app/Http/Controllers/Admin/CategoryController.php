<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;

class CategoryController
{
    function CategoryPage(Request $request)
    {
        $user_id=$request->header('id');
        $list= Category::orderBy('id','desc')->get();
        return Inertia::render('Admin/Category/CategoryPage',['list'=>$list]);
    }

    function CategorySavePage(Request $request)
    {
        $category_id=$request->query('id');
        $list=Category::where('id',$category_id)->first();
        return Inertia::render('Admin/Category/CategorySavePage',['list'=>$list]);

    }

    function create(Request $request){

        // Validating the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'icon' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Image validation
        ]);

        //dd($request->all());

        try {

            if ($request->hasFile('icon')) {
                $imagePath = $request->file('icon')->store('categories', 'public');
            } else {
                $imagePath = null; // No image uploaded
            }

            Category::create([
                'name' => $validatedData['name'],
                'icon' => $imagePath,
            ]);

            return redirect()->route('CategorySavePage')->with([
                'message' => 'Create Successful',
                'status' => true,
                'error' => ''
            ]);
        }catch (Exception $e){
            return redirect()->route('CategorySavePage')->with([
                'message' => 'Create Fail',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request){

        // Validating the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'icon' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Image validation
        ]);

        try {

            $category_id = $request->input('id');
            $category = Category::where('id', $category_id)->first();            

            if ($request->hasFile('icon')) {
                // Deleting old image if it exists
                if ($category->icon) {
                    Storage::disk('public')->delete($category->icon);
                }
                $imagePath = $request->file('icon')->store('categories', 'public');
            } else {
                $imagePath = $category->icon; // Keep the existing image if no new image is uploaded
            }

            $category->update([
                'name' => $validatedData['name'],
                'icon' => $imagePath,
            ]);

            $data = ['message' => 'Update Successful', 'status' => true, 'error' => ''];
        }catch (Exception $e){
            $data = ['message' => 'Update Fail', 'status' => false, 'error' => $e->getMessage()];
        }

        return  redirect()->route('CategorySavePage')->with($data);
    }



    function delete(Request $request){

        try {
            $category_id=$request->id;
            $category = Category::where('id', $category_id)->first();

            if ($category->icon && Storage::disk('public')->exists($category->icon)) {
                Storage::disk('public')->delete($category->icon);
            }
            $category->delete();

            $data = ['message' => 'Delete Successful', 'status' => true, 'error' => ''];
            return  redirect()->route('CategoryPage')->with($data);

        }catch (Exception $e){
            $data =['message'=>'Delete Fail','status'=>false,'error'=>''];
            return  redirect()->route('CategoryPage')->with($data);
        }

    }


}
