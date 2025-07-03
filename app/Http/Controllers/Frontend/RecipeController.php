<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class RecipeController extends Controller
{
    //
    function index()
    {
        return Inertia::render("Frontend/Recipes/list");
    }

    function show(){
        return Inertia::render("Frontend/Recipes/detail");
    }
}
