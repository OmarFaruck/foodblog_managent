<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Recipe;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BlogController extends Controller
{
    function index(Request $request)
    {
        $search = $request->get('search');
        $page = $request->get('page', 1);
        $perPage = 5;

        // Get blogs with search functionality
        $blogsQuery = Blog::with('user')
            ->when($search, function($query, $search) {
                return $query->where('title', 'like', "%{$search}%")
                           ->orWhere('excerpt', 'like', "%{$search}%")
                           ->orWhere('content', 'like', "%{$search}%");
            })
            ->orderBy('created_at', 'desc');

        $blogs = $blogsQuery->paginate($perPage);

        // Get recent recipes for sidebar
        $recentRecipes = Recipe::with('user')
            ->orderBy('created_at', 'desc')
            ->limit(3)
            ->get();

        return Inertia::render("Frontend/Blog/list", [
            'blogs' => $blogs,
            'recentRecipes' => $recentRecipes,
            'search' => $search,
        ]);
    }

    function show($id){
        // Get the specific blog with user relationship
        $blog = Blog::with('user')->findOrFail($id);
        
        // Get related blogs (same author or recent blogs)
        $relatedBlogs = Blog::with('user')
            ->where('id', '!=', $id)
            ->orderBy('created_at', 'desc')
            ->limit(4)
            ->get();

        // Get random recipes for "You may like these recipes too" section
        $randomRecipes = Recipe::with(['user', 'category'])
            ->inRandomOrder()
            ->limit(4)
            ->get();

        return Inertia::render("Frontend/Blog/detail", [
            'blog' => $blog,
            'relatedBlogs' => $relatedBlogs,
            'randomRecipes' => $randomRecipes,
        ]);
    }
}
