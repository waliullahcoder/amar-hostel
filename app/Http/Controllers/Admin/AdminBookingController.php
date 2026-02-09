<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Service;
use App\Models\Category;
use App\Models\Booking;
use App\Models\Testimonial;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
class AdminBookingController extends Controller
{
    // Dashboard
    public function index()
    {
        $bookings = Booking::get();

        return view('admin.bookings.index', compact('bookings'));
    }


    public function update(Request $request, Booking $booking)
    {
        $request->validate([
            'status' => 'required'
        ]);

        $booking->update([
            'status' => $request->status
        ]);

        return back()->with('success','Booking status updated successfully');
    }


}