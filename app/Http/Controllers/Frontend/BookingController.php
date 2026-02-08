<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Booking;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BookingController extends Controller
{
    // Show rooms for booking
    public function index(Request $request)
    {
        $query = Room::query();

        if ($request->room_type) {
            $query->where('name', 'like', '%' . $request->room_type . '%');
        }

        if ($request->guests) {
            $query->where('capacity', '>=', $request->guests);
        }

        $rooms = $query->get();

        return view('frontend.booking.hostelBooking', compact('rooms'));
    }

    // Show booking form
    public function bookRoom($id)
    {
        $room = Room::findOrFail($id);
        return view('frontend.booking.bookRoom', compact('room'));
    }

    // Confirm booking
    public function confirmBooking(Request $request, $id)
    {
        $room = Room::findOrFail($id);

        $request->validate([
            'check_in'  => 'required|date|after_or_equal:today',
            'check_out' => 'required|date|after:check_in',
            'guests'    => 'required|integer|min:1|max:' . $room->capacity,
        ]);

        DB::transaction(function () use ($request, $room) {

            // Create booking
            $booking = Booking::create([
                'user_id'     => Auth::id(),
                'room_id'     => $room->id,
                'check_in'    => $request->check_in,
                'check_out'   => $request->check_out,
                'guests'      => $request->guests,
                'total_price' => $room->price * $request->guests, // price calculation
                'status'      => 'confirmed',
            ]);

            // Decrease room capacity
            $room->decrement('capacity', $request->guests);
        });

        return redirect()
            ->route('booking.index')
            ->with('success', 'Booking confirmed successfully! 🎉');
    }
}
