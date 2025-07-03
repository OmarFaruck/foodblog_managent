<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PageController extends Controller
{
    public function home(){
        return Inertia::render("Frontend/Pages/Home");
    }

    public function about(){
        return Inertia::render("Frontend/Pages/About");
    }

    public function contact(){
        return Inertia::render("Frontend/Pages/Contact");
    }    
}
