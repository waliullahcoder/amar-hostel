@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">Hostel Room Booking</h2>
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Booking</li>
            </ol>
        </div>
    </div>
</section>
<!--================ Breadcrumb Area =================-->

<!--================ Booking Area =================-->
<section class="booking_area section_gap">
    <div class="container">
        <div class="row">

            <!-- FILTER / SIDEBAR -->
            <div class="col-lg-3 mb-4">
                <div class="card shadow-sm rounded-4">
                    <div class="card-body p-3">
                        <h5 class="mb-3">Filters</h5>

                        <form action="{{ route('booking.search') }}" method="GET">
                            <!-- Room Type -->
                            <div class="mb-3">
                                <label>Room Type</label>
                                <select name="room_type" class="form-select">
                                    <option value="">All Rooms</option>
                                    <option value="double-deluxe">Double Deluxe</option>
                                    <option value="single-deluxe">Single Deluxe</option>
                                    <option value="honeymoon-suite">Honeymoon Suite</option>
                                    <option value="economy-double">Economy Double</option>
                                </select>
                            </div>

                            <!-- Guests -->
                            <div class="mb-3">
                                <label>Guests</label>
                                <input type="number" name="guests" class="form-control" min="1" placeholder="1">
                            </div>

                            <!-- Submit -->
                            <button type="submit" class="btn btn-primary w-100 rounded-pill">
                                Search
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- ROOMS LIST -->
            <div class="col-lg-9">
                <div class="row g-4">

                    @forelse($rooms as $room)
                    <div class="col-md-6">
                        <div class="card shadow-sm rounded-4 h-100 hover-shadow">
                            <img src="{{ asset($room->thumbnail) }}" class="card-img-top rounded-top-4" alt="{{ $room->name }}">
                            <div class="card-body p-3 p-lg-4">
                                <h5 class="card-title fw-bold">{{ $room->name }}</h5>
                                <p class="text-muted mb-2">{{ $room->description }}</p>
                                <p class="fw-semibold mb-2">Price: ৳{{ $room->price }} / night</p>

                                <a href="{{ route('booking.bookRoom', $room->id) }}"
                                   class="btn btn-success w-100 rounded-pill">
                                   Book Now
                                </a>
                            </div>
                        </div>
                    </div>
                    @empty
                    <div class="col-12">
                        <div class="alert alert-warning text-center">
                            No rooms available.
                        </div>
                    </div>
                    @endforelse

                </div>
            </div>

        </div>
    </div>
</section>
<!--================ Booking Area =================-->

@endsection

@push('styles')
<style>
/* Hover effect for room cards */
.hover-shadow:hover {
    transform: translateY(-5px);
    transition: all 0.3s ease;
    box-shadow: 0 15px 30px rgba(0,0,0,0.15) !important;
}
</style>
@endpush
