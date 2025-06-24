<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\SessionAuthenticate;
use Illuminate\Support\Facades\Route;


Route::get('/', [UserController::class, 'index']);

Route::get('/login', [UserController::class, 'LoginPage'])->name('LoginPage');
Route::post('/login', [UserController::class, 'login'])->name('user.login');
Route::get('/logout', [UserController::class, 'logout'])->name('user.logout');

Route::get('/register', [UserController::class, 'RegistrationPage'])->name('RegistrationPage');
Route::post('/register', [UserController::class, 'register'])->name('user.register');

Route::middleware(SessionAuthenticate::class)->group(callback: function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('DashboardPage');
});
