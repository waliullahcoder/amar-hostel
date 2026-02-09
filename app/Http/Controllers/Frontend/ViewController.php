<?php

namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use Illuminate\Support\Facades\Auth;
class ViewController extends Controller
{
    protected $frontEndService;
    public function __construct(FrontEndService $frontEndService)
    {
        $this->frontEndService = $frontEndService;
    }

    public function index()
    {
        $rooms = $this->frontEndService->allRooms();
        $services = $this->frontEndService->allServices();
        $testimonials = $this->frontEndService->allTestimonials();

        return view('frontend.home', compact('rooms','services','testimonials'));
    }

    public function roomDetails($id)
    {
        $room = $this->frontEndService->getRoom($id);
        return view('frontend.room-details', compact('room'));
    }

    public function services()
    {
        $services = $this->frontEndService->allServices();
        return view('frontend.services', compact('services'));
    }

    public function contactPage()
    {
        return view('frontend.contact.contact');
    }
    public function aboutPage()
    {
        return view('frontend.about.about');
    }
    public function galleryPage()
    {
        return view('frontend.gallery.gallery');
    }

    // public function bookingPage()
    // {
    //     return view('frontend.booking.booking');
    // }

    public function signinPage()
    {
        if (Auth::check()) {
            return redirect()->route('home');
        }
        return view('frontend.auth.signin');
    }
    

    public function signupPage()
    {
        if (Auth::check()) {
                return redirect()->route('home');
            }
        return view('frontend.auth.signup');
    }


    public function singleDetails($id)
    {
        $room = $this->frontEndService->getRoom($id);
        return view('frontend.rooms.singleDetails', compact('room'));
    }
    
}
