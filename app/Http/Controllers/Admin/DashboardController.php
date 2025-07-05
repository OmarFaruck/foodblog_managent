<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Recipe;
use App\Models\Category;
use App\Models\Blog;
use App\Models\Subscriber;
use App\Models\Ingredient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $user_id = $request->header('id');
        $user_role = $request->session()->get('role', 'user');

        // Calculate food blog statistics based on user role
        if ($user_role === 'admin') {
            // Admin sees all statistics
            $stats = [
                'recipes' => Recipe::count(),
                'categories' => Category::count(),
                'blogs' => Blog::count(),
                'subscribers' => Subscriber::count(),
                'featured_recipes' => Recipe::where('is_featured', true)->count(),
                'ingredients' => Ingredient::count(),
                'avg_cook_time' => $this->getAverageCookTime(),
                'monthly_recipes' => $this->getMonthlyRecipes(),
                'recipes_growth' => $this->getRecipeGrowth(),
            ];
        } else {
            // Regular users see only their own statistics
            $stats = [
                'recipes' => Recipe::where('user_id', $user_id)->count(),
                'categories' => Category::count(), // Categories are visible to all
                'blogs' => Blog::where('user_id', $user_id)->count(),
                'subscribers' => 0, // Regular users don't have access to subscribers
                'featured_recipes' => Recipe::where('user_id', $user_id)->where('is_featured', true)->count(),
                'ingredients' => Ingredient::count(), // Ingredients are visible to all
                'avg_cook_time' => $this->getAverageCookTime($user_id),
                'monthly_recipes' => $this->getMonthlyRecipes($user_id),
                'recipes_growth' => $this->getRecipeGrowth($user_id),
            ];
        }

        return Inertia::render('Admin/User/DashboardPage', [
            'list' => $stats
        ]);
    }

    /**
     * Calculate average cook time across all recipes or user's recipes
     */
    private function getAverageCookTime($user_id = null)
    {
        $query = Recipe::whereNotNull('cook_time')
            ->where('cook_time', '>', 0);
            
        if ($user_id) {
            $query->where('user_id', $user_id);
        }
        
        $avgCookTime = $query->avg('cook_time');
        
        return $avgCookTime ? round($avgCookTime) : 0;
    }

    /**
     * Get recipes created this month (all or user's)
     */
    private function getMonthlyRecipes($user_id = null)
    {
        $query = Recipe::whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year);
            
        if ($user_id) {
            $query->where('user_id', $user_id);
        }
        
        return $query->count();
    }

    /**
     * Calculate recipe growth percentage compared to last month (all or user's)
     */
    private function getRecipeGrowth($user_id = null)
    {
        $currentMonthQuery = Recipe::whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year);
            
        $lastMonthQuery = Recipe::whereMonth('created_at', Carbon::now()->subMonth()->month)
            ->whereYear('created_at', Carbon::now()->subMonth()->year);
            
        if ($user_id) {
            $currentMonthQuery->where('user_id', $user_id);
            $lastMonthQuery->where('user_id', $user_id);
        }
        
        $currentMonth = $currentMonthQuery->count();
        $lastMonth = $lastMonthQuery->count();

        if ($lastMonth == 0) {
            return $currentMonth > 0 ? 100 : 0;
        }

        $growth = (($currentMonth - $lastMonth) / $lastMonth) * 100;
        return round($growth, 1);
    }
}
