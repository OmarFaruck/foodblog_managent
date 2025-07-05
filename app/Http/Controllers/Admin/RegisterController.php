<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class RegisterController extends Controller
{

    public function RegistrationPage(Request $request)
    {
        $email=$request->session()->get('email','default'); //dd($email);

        if($email != 'default') {
            return redirect()->route('DashboardPage');
        }
        return Inertia::render('Admin/User/Register');
    }   
    
    function register(Request $request){

        try {
            $email=$request->input('email');
            $name=$request->input('name');
            $role='user';
            $password=$request->input('password');

            User::create([
                'name'=>$name,
                'email'=>$email,
                'role'=>$role,
                'password'=>Hash::make($password)
            ]);

            session()->flash('message', 'Registration Successful');
            session()->flash('status', true);
            session()->flash('error', '');

            return  redirect()->route('RegistrationPage');
        }
        catch (\Exception $e) {
            session()->flash('message', 'Registration Fail');
            session()->flash('status', false);
            session()->flash('error', $e->getMessage());
        }

    } 
}
