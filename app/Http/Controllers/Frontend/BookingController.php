<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Booking;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BookingController extends Controller
{
    // Show rooms for booking
    public function index(Request $request)
    {
        $rooms = Room::where('available', 1);

        if ($request->category_id) {
            $rooms->where('category_id', $request->category_id);
        }

        if ($request->guests) {
            $rooms->where('capacity', '>=', $request->guests);
        }

        return view('frontend.booking.hostelBooking', [
            'rooms' => $rooms->get(),
            'categories' => Category::all()
        ]);
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
