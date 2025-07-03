<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BlogController extends Controller
{
    function index()
    {
        return Inertia::render("Frontend/Blog/list");
    }

    function show(){
        return Inertia::render("Frontend/Blog/detail");
    }
}
