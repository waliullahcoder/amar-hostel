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

        $oldStatus = $booking->status;
        $newStatus = $request->status;

        // Only when status is changing
        if ($oldStatus !== $newStatus && !in_array($oldStatus, ['cancelled', 'checked_out']) ) {

            // If booking is checked_out or cancelled
            if (in_array($newStatus, ['checked_out', 'cancelled'])) {

                // Increase room capacity by guests count
                if ($booking->room) {
                    $booking->room->increment('capacity', $booking->guests);
                }
            }

            // OPTIONAL: if status goes BACK from cancelled → confirmed
            // if (in_array($oldStatus, ['checked_out', 'cancelled']) 
            //     && in_array($newStatus, ['pending', 'confirmed', 'checked_in'])) {

            //     if ($booking->room) {
            //         $booking->room->decrement('capacity', $booking->guests);
            //     }
            // }
        }

        // Update booking status
        $booking->update([
            'status' => $newStatus
        ]);

        return back()->with('success', 'Booking status updated successfully');
    }



}