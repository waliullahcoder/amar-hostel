<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Room;
use App\Models\Service;
use App\Models\Category;
use App\Models\Booking;
use App\Models\Testimonial;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
class AdminBookingController extends Controller
{
 

public function index(Request $request)
{
    if($request->ajax()){
        $bookings = Booking::with(['room','user'])->select('bookings.*');

        return DataTables::of($bookings)
            ->addIndexColumn()
            ->addColumn('room_name', fn($b) => $b->room->name ?? '-')
            ->addColumn('user_name', fn($b) => $b->user->name ?? '-')
            ->addColumn('available', fn($b) => $b->room->capacity ?? '-')
            ->addColumn('status_badge', function($b){
                $color = match($b->status){
                    'pending'=>'warning',
                    'confirmed'=>'primary',
                    'checked_in'=>'success',
                    'checked_out'=>'secondary',
                    'cancelled'=>'danger',
                    default=>'info',
                };
                return '<span class="badge bg-'.$color.'">'.ucfirst(str_replace('_',' ',$b->status)).'</span>';
            })
            ->addColumn('action', function($b){
                return '
                <button class="btn btn-sm btn-primary editBookingBtn" data-id="'.$b->id.'" data-status="'.$b->status.'">Reservation</button>
                <button class="btn btn-sm btn-success viewBookingBtn" 
                    data-room="'.($b->room->name ?? '-').'" 
                    data-user="'.($b->user->name ?? '-').'" 
                    data-guests="'.$b->guests.'" 
                    data-available="'.($b->room->capacity ?? '-').'"
                    data-checkin="'.$b->check_in.'" 
                    data-checkout="'.$b->check_out.'" 
                    data-total="'.$b->total_price.'" 
                    data-status="'.$b->status.'">View</button>';
            })
            ->rawColumns(['status_badge','action'])
            ->make(true);
    }
    return view('admin.bookings.index');
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
                    $booking->room->increment('available', $booking->guests);
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