<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Service;
use App\Models\Booking;
use App\Models\Testimonial;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
class AdminController extends Controller
{
    // Dashboard
    public function dashboard()
    {
        $rooms = Room::count();
        $services = Service::count();
        $bookings = Booking::count();
        $testimonials = Testimonial::count();

        return view('admin.dashboard', compact('rooms', 'services', 'bookings', 'testimonials'));
    }

    // ================= ROOMS =================
    public function rooms()
    {
        $rooms = Room::all();
        return view('admin.rooms.index', compact('rooms'));
    }

    public function roomCreate()
    {
        return view('admin.rooms.create');
    }


    public function roomStore(Request $request)
    {
        $data = $request->validate([
            'name'             => 'required|string|max:255',
            'price'            => 'required|numeric',
            'capacity'         => 'required|integer',
            'description'      => 'nullable|string',
            'available'        => 'nullable|boolean',

            // room image
            'image'            => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',

            // SEO
            'meta_title'       => 'nullable|string|max:255',
            'meta_description' => 'nullable|string',
            'meta_keywords'    => 'nullable|string',
            'meta_image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        /* ---------- SLUG ---------- */
        $data['slug'] = Str::slug($request->name);

        /* ---------- ROOM IMAGE ---------- */
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')
                ->store('rooms', 'public');   // storage/app/public/rooms
        }

        /* ---------- SEO IMAGE ---------- */
        if ($request->hasFile('meta_image')) {
            $data['meta_image'] = $request->file('meta_image')
                ->store('rooms/seo', 'public');
        }

        Room::create($data);

        return back()->with('success', 'Room Created Successfully');
    }



    public function roomEdit(Room $room)
    {
        return view('admin.rooms.edit', compact('room'));
    }


    public function roomUpdate(Request $request, Room $room)
    {
        $data = $request->validate([
            'name'             => 'required|string|max:255',
            'price'            => 'required|numeric',
            'capacity'         => 'required|integer',
            'description'      => 'nullable|string',
            'available'        => 'nullable|boolean',

            // Room image
            'image'            => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',

            // SEO
            'meta_title'       => 'nullable|string|max:255',
            'meta_description' => 'nullable|string',
            'meta_keywords'    => 'nullable|string',
            'meta_image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        /* ---------- SLUG ---------- */
        $data['slug'] = Str::slug($request->name);

        /* ---------- ROOM IMAGE ---------- */
        if ($request->hasFile('image')) {
            // পুরানো image delete
            if ($room->image && Storage::disk('public')->exists($room->image)) {
                Storage::disk('public')->delete($room->image);
            }

            $data['image'] = $request->file('image')
                ->store('rooms', 'public');
        }

        /* ---------- SEO IMAGE ---------- */
        if ($request->hasFile('meta_image')) {
            // পুরানো meta_image delete
            if ($room->meta_image && Storage::disk('public')->exists($room->meta_image)) {
                Storage::disk('public')->delete($room->meta_image);
            }

            $data['meta_image'] = $request->file('meta_image')
                ->store('rooms/seo', 'public');
        }

        /* ---------- UPDATE ---------- */
        $room->update($data);

        return back()->with('success', 'Room Updated Successfully');
    }



    public function roomDelete(Room $room)
    {
        $room->delete();
        return redirect()->route('admin.rooms')->with('success', 'Room Deleted Successfully');
    }

    // ================= SERVICES =================
    public function services()
    {
        $services = Service::all();
        return view('admin.services.index', compact('services'));
    }

    public function serviceCreate()
    {
        return view('admin.services.create');
    }

    public function serviceStore(Request $request)
    {
        $request->validate([
            'name'=>'required',
        ]);

        Service::create($request->all());
        return redirect()->route('admin.services')->with('success', 'Service Created Successfully');
    }

    public function serviceEdit(Service $service)
    {
        return view('admin.services.edit', compact('service'));
    }

    public function serviceUpdate(Request $request, Service $service)
    {
        $request->validate([
            'name'=>'required',
        ]);

        $service->update($request->all());
        return redirect()->route('admin.services')->with('success', 'Service Updated Successfully');
    }

    public function serviceDelete(Service $service)
    {
        $service->delete();
        return redirect()->route('admin.services')->with('success', 'Service Deleted Successfully');
    }

    // ================= BOOKINGS =================
    public function bookings()
    {
        $bookings = Booking::with('room')->get();
        return view('admin.bookings.index', compact('bookings'));
    }

    public function bookingView(Booking $booking)
    {
        return view('admin.bookings.view', compact('booking'));
    }

    public function bookingStatus(Request $request, Booking $booking)
    {
        $request->validate([
            'status'=>'required|in:pending,confirmed,cancelled'
        ]);

        $booking->update(['status'=>$request->status]);
        return redirect()->route('admin.bookings')->with('success','Booking Status Updated');
    }

    // ================= TESTIMONIALS =================
    public function testimonials()
    {
        $testimonials = Testimonial::all();
        return view('admin.testimonials.index', compact('testimonials'));
    }

    public function testimonialCreate()
    {
        return view('admin.testimonials.create');
    }

    public function testimonialStore(Request $request)
    {
        $request->validate([
            'name'=>'required',
            'message'=>'required',
        ]);

        Testimonial::create($request->all());
        return redirect()->route('admin.testimonials')->with('success', 'Testimonial Created Successfully');
    }

    public function testimonialEdit(Testimonial $testimonial)
    {
        return view('admin.testimonials.edit', compact('testimonial'));
    }

    public function testimonialUpdate(Request $request, Testimonial $testimonial)
    {
        $request->validate([
            'name'=>'required',
            'message'=>'required',
        ]);

        $testimonial->update($request->all());
        return redirect()->route('admin.testimonials')->with('success', 'Testimonial Updated Successfully');
    }

    public function testimonialDelete(Testimonial $testimonial)
    {
        $testimonial->delete();
        return redirect()->route('admin.testimonials')->with('success', 'Testimonial Deleted Successfully');
    }
}
