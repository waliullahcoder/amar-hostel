@extends('layouts.frontend.app')

@section('content')
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">Book Room</h2>
            <ol class="breadcrumb">
                <li><a href="{{ route('booking.index') }}">Booking</a></li>
                <li class="active">{{ $room->name }}</li>
            </ol>
        </div>
    </div>
</section>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card shadow-sm rounded-4 p-4">

                @if($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <h4 class="mb-3 fw-bold">{{ $room->name }}</h4>
                <p class="text-muted">Available capacity: {{ $room->capacity }}</p>
                <p class="fw-semibold mb-4">Price per guest: ৳{{ $room->price }}</p>

                <form action="{{ route('booking.confirmBooking', $room->id) }}" method="POST">
                    @csrf

                    <div class="mb-3">
                        <label>Check-in Date</label>
                        <input type="date" name="check_in" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Check-out Date</label>
                        <input type="date" name="check_out" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Number of Guests</label>
                        <input type="number" name="guests" class="form-control" min="1" max="{{ $room->capacity }}" required>
                    </div>

                    <button type="submit" class="btn btn-success w-100 rounded-pill">Confirm Booking</button>
                </form>

            </div>
        </div>
    </div>
</div>
@endsection
