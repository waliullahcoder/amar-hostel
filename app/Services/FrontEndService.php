<?php

namespace App\Services;

use App\Models\Room;
use App\Models\Service;
use App\Models\Testimonial;

class FrontEndService
{
    public function allRooms()
    {
        return Room::where('status', true)->get();
    }

    public function getRoom($id)
    {
        return Room::findOrFail($id);
    }

    public function allServices()
    {
        return Service::all();
    }

    public function allTestimonials()
    {
        return Testimonial::all();
    }
}
