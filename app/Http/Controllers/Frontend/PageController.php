<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Recipe;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactEmail;

class PageController extends Controller
{
    public function home(){
        // Get featured recipe with author information
        $featuredRecipe = Recipe::with(['user', 'category'])
            ->where('is_featured', true)
            ->inRandomOrder()
            ->first(); //dd($featuredRecipe);

        // Get categories for display
        $categories = Category::orderBy('name')->limit(6)->get();          
        
        // Get featured recipes for "Simple and tasty recipes" section
        $featuredRecipes = Recipe::with(['user', 'category'])
            ->where('is_featured', true)
            ->where('id', '!=', $featuredRecipe ? $featuredRecipe->id : 0) // Exclude the main featured recipe
            ->orderBy('created_at', 'desc')
            ->limit(6)
            ->get();

        // Get random recipes for "Try this delicious recipe" section
        $randomRecipes = Recipe::with(['user', 'category'])
            ->inRandomOrder()
            ->limit(8)
            ->get();

        return Inertia::render("Frontend/Pages/Home", [
            'featuredRecipe' => $featuredRecipe,
            'categories' => $categories,
            'featuredRecipes' => $featuredRecipes,
            'randomRecipes' => $randomRecipes
        ]);
    }

    public function about(){
        return Inertia::render("Frontend/Pages/About");
    }

    public function contact(){
        return Inertia::render("Frontend/Pages/Contact");
    }    

    public function contact_store(Request $request)
    {
        try{
            //dd($request->input());
            $name = $request->input('name');
            $email = $request->input('email');
            $subject = $request->input('subject');
            $enquiryType = $request->input('enquiryType');
            $message = $request->input('description');

            Mail::to("developntest@gmail.com")->send(new ContactEmail($name, $email, $subject, $enquiryType, $message));

            return redirect()->route('ContactPage')->with([
                'message' => 'Message Sent Successful',
                'status' => true,
                'error' => ''
            ]);

        } catch (\Exception $e){
            return redirect()->route('ContactPage')->with([
                'message' => 'Message Sent Fail',
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }    
}
