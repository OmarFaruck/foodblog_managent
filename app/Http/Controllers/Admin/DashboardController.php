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

        // Calculate food blog statistics
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

        return Inertia::render('Admin/User/DashboardPage', [
            'list' => $stats
        ]);
    }

    /**
     * Calculate average cook time across all recipes
     */
    private function getAverageCookTime()
    {
        $avgCookTime = Recipe::whereNotNull('cook_time')
            ->where('cook_time', '>', 0)
            ->avg('cook_time');
        
        return $avgCookTime ? round($avgCookTime) : 0;
    }

    /**
     * Get recipes created this month
     */
    private function getMonthlyRecipes()
    {
        return Recipe::whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year)
            ->count();
    }

    /**
     * Calculate recipe growth percentage compared to last month
     */
    private function getRecipeGrowth()
    {
        $currentMonth = Recipe::whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year)
            ->count();

        $lastMonth = Recipe::whereMonth('created_at', Carbon::now()->subMonth()->month)
            ->whereYear('created_at', Carbon::now()->subMonth()->year)
            ->count();

        if ($lastMonth == 0) {
            return $currentMonth > 0 ? 100 : 0;
        }

        $growth = (($currentMonth - $lastMonth) / $lastMonth) * 100;
        return round($growth, 1);
    }
}
