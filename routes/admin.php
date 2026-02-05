<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\{
    AuthController,
    AdminController,
};

Route::middleware('guest')->group(function () {
    Route::get('/', [AuthController::class, 'index'])->name('login.index');
    Route::match(['get', 'post'], '/login', [AuthController::class, 'login'])->name('login');
});
Route::post('/sidebar', [AuthController::class, 'sidebar'])->name('sidebar');


Route::group(['middleware' => ['admin']], function () {
    Route::get('/dashboard', [AuthController::class, 'dashboard'])->name('dashboard');
    Route::get('/profile', [AuthController::class, 'edit'])->name('profile.index');
    Route::put('/change-images', [AuthController::class, 'changeImages'])->name('change-images');
    Route::put('/change-password', [AuthController::class, 'changePassword'])->name('change-password');
    Route::put('/profile', [AuthController::class, 'update'])->name('profile.update');
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');


    // Rooms
    Route::get('rooms', [AdminController::class,'rooms'])->name('rooms');
    // Route::get('rooms/create', [AdminController::class,'roomCreate'])->name('rooms.create');
    Route::post('rooms/store', [AdminController::class,'roomStore'])->name('rooms.store');
    // Route::get('rooms/{room}/edit', [AdminController::class,'roomEdit'])->name('rooms.edit');
    Route::put('rooms/{room}', [AdminController::class,'roomUpdate'])->name('rooms.update');
    Route::delete('rooms/{room}', [AdminController::class,'roomDelete'])->name('rooms.delete');

    // Services
    Route::get('services', [AdminController::class,'services'])->name('services');
    Route::get('services/create', [AdminController::class,'serviceCreate'])->name('services.create');
    Route::post('services/store', [AdminController::class,'serviceStore'])->name('services.store');
    Route::get('services/{service}/edit', [AdminController::class,'serviceEdit'])->name('services.edit');
    Route::put('services/{service}', [AdminController::class,'serviceUpdate'])->name('services.update');
    Route::delete('services/{service}', [AdminController::class,'serviceDelete'])->name('services.delete');

    // Bookings
    Route::get('bookings', [AdminController::class,'bookings'])->name('bookings');
    Route::get('bookings/{booking}', [AdminController::class,'bookingView'])->name('bookings.view');
    Route::post('bookings/{booking}/status', [AdminController::class,'bookingStatus'])->name('bookings.status');

    // Testimonials
    Route::get('testimonials', [AdminController::class,'testimonials'])->name('testimonials');
    Route::get('testimonials/create', [AdminController::class,'testimonialCreate'])->name('testimonials.create');
    Route::post('testimonials/store', [AdminController::class,'testimonialStore'])->name('testimonials.store');
    Route::get('testimonials/{testimonial}/edit', [AdminController::class,'testimonialEdit'])->name('testimonials.edit');
    Route::put('testimonials/{testimonial}', [AdminController::class,'testimonialUpdate'])->name('testimonials.update');
    Route::delete('testimonials/{testimonial}', [AdminController::class,'testimonialDelete'])->name('testimonials.delete');

       
});

