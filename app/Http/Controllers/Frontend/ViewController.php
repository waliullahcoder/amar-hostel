<?php

namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
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
    
}
