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
        $user_id = $request->header('id');
        $user_role = $request->session()->get('role', 'user');
        
        // Admin users can see all blogs, regular users can only see their own
        if ($user_role === 'admin') {
            $list = Blog::with('user')->orderBy('id','desc')->get();
        } else {
            $list = Blog::with('user')->where('user_id', $user_id)->orderBy('id','desc')->get();
        }
        
        return Inertia::render('Admin/Blog/BlogPage',['list'=>$list]);
    }

    function BlogSavePage(Request $request)
    {
        $blog_id = $request->query('id');
        $user_id = $request->header('id');
        $user_role = $request->session()->get('role', 'user');
        
        // Build the query
        $query = Blog::with('user');
        if ($blog_id) {
            $query->where('id', $blog_id);
            
            // If regular user, ensure they can only access their own blogs
            if ($user_role !== 'admin') {
                $query->where('user_id', $user_id);
            }
        }
        
        $list = $query->first();
        
        // If regular user tries to access someone else's blog, redirect
        if ($blog_id && !$list && $user_role !== 'admin') {
            return redirect()->route('BlogPage')->with([
                'message' => 'Access denied. You can only edit your own blog posts.',
                'status' => false,
                'error' => 'Unauthorized access'
            ]);
        }
        
        // Get users list - admin gets all users, regular user gets only themselves
        if ($user_role === 'admin') {
            $users = User::orderBy('name')->get();
        } else {
            $users = User::where('id', $user_id)->get();
        }
        
        return Inertia::render('Admin/Blog/BlogSavePage',['list'=>$list, 'users'=>$users]);
    }

    function create(Request $request){
        // Debug: Check what's being sent (uncomment to debug)
         //dd($request->all(), $request->hasFile('image'), $request->file('image')?->getMimeType());
        
        try {
            $user_id = $request->header('id');
            $user_role = $request->session()->get('role', 'user');
            
            // Validating the request
            $validatedData = $request->validate([
                'title' => 'required|string|max:255',
                'excerpt' => 'required|string|max:500',
                'content' => 'required|string',
                'user_id' => 'required|exists:users,id',
                'image' => 'required|file|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
            ]);

            // Regular users can only create blogs for themselves
            if ($user_role !== 'admin' && $validatedData['user_id'] != $user_id) {
                return redirect()->route('BlogSavePage')->with([
                    'message' => 'Access denied. You can only create blog posts for yourself.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }

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
        $user_id = $request->header('id');
        $user_role = $request->session()->get('role', 'user');

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
            
            // Check if blog exists
            if (!$blog) {
                return redirect()->route('BlogPage')->with([
                    'message' => 'Blog post not found',
                    'status' => false,
                    'error' => 'Blog post not found'
                ]);
            }
            
            // Regular users can only update their own blogs
            if ($user_role !== 'admin' && $blog->user_id != $user_id) {
                return redirect()->route('BlogPage')->with([
                    'message' => 'Access denied. You can only edit your own blog posts.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }
            
            // Regular users can only update to their own user_id
            if ($user_role !== 'admin' && $validatedData['user_id'] != $user_id) {
                return redirect()->route('BlogSavePage', ['id' => $blog_id])->with([
                    'message' => 'Access denied. You can only assign blog posts to yourself.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }

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
            $user_id = $request->header('id');
            $user_role = $request->session()->get('role', 'user');
            
            $blog = Blog::where('id', $blog_id)->first();
            
            if (!$blog) {
                return redirect()->route('BlogPage')->with([
                    'message' => 'Blog post not found',
                    'status' => false,
                    'error' => 'Blog post not found'
                ]);
            }
            
            // Regular users can only delete their own blogs
            if ($user_role !== 'admin' && $blog->user_id != $user_id) {
                return redirect()->route('BlogPage')->with([
                    'message' => 'Access denied. You can only delete your own blog posts.',
                    'status' => false,
                    'error' => 'Unauthorized access'
                ]);
            }

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
