<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;
use Inertia\Response;

class UserController extends Controller
{
    public function index(): Response
    {
        return Inertia::render('User/Index');
    }

    public function LoginPage(Request $request)
    {
        $email=$request->session()->get('email','default'); //dd($email);

        if($email != 'default') {
            return redirect()->route('DashboardPage');
        }

        return Inertia::render('User/Login');
    }  
    
    function login(Request $request) { //dd(Hash::make($request->input('password')));

        // Retrieving the user by email
        $user = User::where('email', $request->input('email'))->first();

        // Checking if user exists and verify password
        if ($user && Hash::check($request->input('password'), $user->password)) {

            $email=$request->input('email');
            $request->session()->put('email',$email);
            $request->session()->put('user_id',$user->id);
            $request->session()->put('name',$user->name);

            session()->flash('message', 'Login Successful');
            session()->flash('status', true);
            session()->flash('error', '');

            return redirect()->route('DashboardPage');
        }

        // Login failed
        return back()->with([
            'message' => 'Login Failed',
            'status' => false,
            'error' => 'Invalid email or password'
        ]);

    }    

    function logout(Request $request){
//        echo 'logout'; exit;
        $request->session()->flush();
        return redirect()->route('LoginPage');

    }    

    public function RegistrationPage(Request $request)
    {
        $email=$request->session()->get('email','default'); //dd($email);

        if($email != 'default') {
            return redirect()->route('DashboardPage');
        }
        return Inertia::render('User/Register');
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
                'password'=>$password
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
