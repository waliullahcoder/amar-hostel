<?php

use App\Http\Controllers\Frontend\ViewController;
use App\Http\Controllers\Frontend\UserController;
use App\Http\Controllers\Frontend\BookingController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;

Route::get('/clear', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    Artisan::call('clear-compiled');
    return back()->withSuccessMessage('Cache Cleared Successfully!');
})->name('admin.cache.clear');


Route::get('/storage-link', function () {
    Artisan::call('storage:link');
    return back()->withSuccessMessage('Storage linked successfully!');
})->name('admin.storage.link');

Route::get('/', [ViewController::class, 'index'])->name('home');
Route::get('/about', [ViewController::class, 'aboutPage'])->name('aboutPage');
Route::get('/gallery', [ViewController::class, 'galleryPage'])->name('galleryPage');
Route::get('/rooms', [ViewController::class, 'roomsPage'])->name('roomsPage');
Route::get('/room/details/{id}', [ViewController::class, 'singleDetails'])->name('singleDetails');
//Login Register
Route::get('/contact', [ViewController::class, 'contactPage'])->name('contactPage');
Route::get('/signin', [ViewController::class, 'signinPage'])->name('auth.signinPage');
Route::get('/signup', [ViewController::class, 'signupPage'])->name('auth.signupPage');

Route::get('/login', function () {
    return redirect()->route('auth.signinPage');
})->name('login');

Route::post('/signin', [UserController::class, 'signinPost'])->name('user.signinPost');
Route::post('/signup', [UserController::class, 'signupPost'])->name('user.signupPost');
/* ---------- USER DASHBOARD (Protected) ---------- */
Route::middleware(['auth'])->group(function () {
    Route::get('/user/dashboard', [UserController::class, 'dashboard'])
        ->name('frontend.user.dashboard');
    Route::get('/user/profile/edit', [UserController::class, 'updateEditProfile'])
    ->name('user.profile.edit');
    Route::post('/user/profile/update', [UserController::class, 'updateProfile'])
    ->name('user.profile.update');
    Route::post('/logout', [UserController::class, 'logout'])->name('logout');
});

// Booking section
Route::prefix('booking')->name('booking.')->group(function () {
    Route::get('/', [BookingController::class, 'index'])->name('index'); // room listing
    Route::get('/search', [BookingController::class, 'index'])->name('search'); // search route
    Route::get('/room/{id}', [BookingController::class, 'bookRoom'])->name('bookRoom'); // booking form
    Route::post('/confirm/{id}', [BookingController::class, 'confirmBooking'])->name('confirmBooking'); // confirm booking
});
