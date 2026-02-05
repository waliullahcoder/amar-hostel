<?php

use App\Http\Controllers\Frontend\ViewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;

Route::get('/', [ViewController::class, 'index'])->name('home');

//Login Register
Route::get('/signin', [ViewController::class, 'signinPage'])->name('auth.signinPage');
Route::get('/login', function () {
    return redirect()->route('auth.signinPage');
})->name('login');

Route::get('/signup', [ViewController::class, 'signupPage'])->name('auth.signupPage');

Route::post('/signin', [UserController::class, 'signinPost'])->name('user.signinPost');
Route::post('/signup', [UserController::class, 'signupPost'])->name('user.signupPost');
