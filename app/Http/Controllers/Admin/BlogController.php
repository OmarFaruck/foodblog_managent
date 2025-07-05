<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Blog;
use App\Models\User;
use Illuminate\Support\Facades\Storage;

class BlogController
{
    function BlogPage(Request $request)
    {
        $list = Blog::with('user')->orderBy('id','desc')->get();
        return Inertia::render('Admin/Blog/BlogPage',['list'=>$list]);
    }

    function BlogSavePage(Request $request)
    {
        $blog_id = $request->query('id');
        $list = Blog::with('user')->where('id', $blog_id)->first();
        $users = User::orderBy('name')->get();
        return Inertia::render('Admin/Blog/BlogSavePage',['list'=>$list, 'users'=>$users]);
    }

    function create(Request $request){
        // Debug: Check what's being sent (uncomment to debug)
         //dd($request->all(), $request->hasFile('image'), $request->file('image')?->getMimeType());
        
        try {
            // Validating the request
            $validatedData = $request->validate([
                'title' => 'required|string|max:255',
                'excerpt' => 'required|string|max:500',
                'content' => 'required|string',
                'user_id' => 'required|exists:users,id',
                'image' => 'required|file|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
            ]);

            if ($request->hasFile('image')) {
                $file = $request->file('image');
                $fileName = now()->format('YmdHis') . '_' . $file->getClientOriginalName();
                $imagePath = $file->storeAs('blog-items', $fileName, 'public');
            } else {
                $imagePath = null;
            }

            Blog::create([
                'title' => $validatedData['title'],
                'excerpt' => $validatedData['excerpt'],
                'content' => $validatedData['content'],
                'user_id' => $validatedData['user_id'],
                'image' => $imagePath,
            ]);

            return redirect()->route('BlogSavePage')->with([
                'message' => 'Blog Post Created Successfully',
                'status' => true,
                'error' => ''
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return redirect()->route('BlogSavePage')->withErrors($e->errors())->withInput();
        } catch (Exception $e) {
            return redirect()->route('BlogSavePage')->with([
                'message' => 'Blog Post Creation Failed',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    function update(Request $request){
        $blog_id = $request->input('id');

        // Remove empty image field if it exists
        if ($request->has('image') && empty($request->file('image'))) {
            $request->request->remove('image');
        }

        // Validating the request
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'excerpt' => 'required|string|max:500',
            'content' => 'required|string',
            'user_id' => 'required|exists:users,id',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
        ]);

        try {
            $blog = Blog::where('id', $blog_id)->first();

            if ($request->hasFile('image')) {
                // Delete old image if it exists
                if ($blog->image) {
                    Storage::disk('public')->delete($blog->image);
                }
                $file = $request->file('image');
                $fileName = now()->format('YmdHis') . '_' . $file->getClientOriginalName();
                $imagePath = $file->storeAs('blog-items', $fileName, 'public');
            } else {
                $imagePath = $blog->image; // Keep the existing image
            }

            $blog->update([
                'title' => $validatedData['title'],
                'excerpt' => $validatedData['excerpt'],
                'content' => $validatedData['content'],
                'user_id' => $validatedData['user_id'],
                'image' => $imagePath,
            ]);

            $data = ['message' => 'Blog Post Updated Successfully', 'status' => true, 'error' => ''];
        } catch (Exception $e) {
            $data = ['message' => 'Blog Post Update Failed', 'status' => false, 'error' => $e->getMessage()];
        }

        return redirect()->route('BlogSavePage')->with($data);
    }

    function delete(Request $request){
        try {
            $blog_id = $request->id;
            $blog = Blog::where('id', $blog_id)->first();

            if ($blog->image && Storage::disk('public')->exists($blog->image)) {
                Storage::disk('public')->delete($blog->image);
            }
            
            $blog->delete();

            $data = ['message' => 'Blog Post Deleted Successfully', 'status' => true, 'error' => ''];
            return redirect()->route('BlogPage')->with($data);

        } catch (Exception $e) {
            $data = ['message' => 'Blog Post Deletion Failed', 'status' => false, 'error' => ''];
            return redirect()->route('BlogPage')->with($data);
        }
    }
}
