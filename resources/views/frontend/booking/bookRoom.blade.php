@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb =================-->
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

<!--================ Booking =================-->
<section class="booking_area section_gap">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-10">

                <div class="booking_card shadow-lg">

                    <!-- ROOM INFO -->
                    <div class="booking_header text-center">
                        <h3>{{ $room->name }}</h3>
                        <p>Capacity: {{ $room->capacity }} Guests</p>
                        <h4>৳ {{ number_format($room->price) }} <span>/ per guest</span></h4>
                    </div>

                    {{-- Errors --}}
                    @if($errors->any())
                        <div class="alert alert-danger m-4">
                            <ul class="mb-0">
                                @foreach($errors->all() as $error)
                                    <h2 style="color:#f86565;text-align:center;">{{ $error }}</h2>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <!-- FORM -->
                    <form action="{{ route('booking.confirmBooking', $room->id) }}" method="POST" class="p-4 p-lg-5">
                    @csrf

                    <div class="row g-4">

                        <!-- CHECK IN -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Check In</label>
                            <input type="date" name="check_in" class="form-control booking_field"
                            value="{{ now()->format('Y-m-d') }}"
                             required>
                        </div>

                        <!-- CHECK OUT -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Check Out</label>
                            <input type="date" name="check_out" class="form-control booking_field" 
                            value="{{ now()->format('Y-m-d') }}"
                            required>
                        </div>

                        <!-- DURATION -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Duration</label>
                            <select name="duration" class="form-select booking_field" required>
                                <option value="day">Day</option>
                                <option value="night">Night</option>
                                <option value="week">Week</option>
                                <option value="month">Month</option>
                                <option value="custom">Custom</option>
                            </select>
                        </div>

                        <!-- GUESTS -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Guests</label>
                            <input type="number"
                                id="guests"
                                name="guests"
                                min="1"
                                max="{{ $room->capacity }}"
                                class="form-control booking_field"
                                placeholder="Enter number of guests"
                                required>
                        </div>

                        <!-- TOTAL PRICE -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Total Price</label>
                            <input type="text"
                                id="total_price"
                                name="total_price"
                                class="form-control booking_field total_price"
                                readonly>
                        </div>

                        <!-- BUTTON -->
                        <div class="col-md-6" style="margin-top:30px;">
                            <button type="submit" class="btn theme_btn button_hover">
                                Confirm Booking
                            </button>
                        </div>

                    </div>
                </form>


                </div>

            </div>
        </div>

    </div>
   <script>
    document.addEventListener('DOMContentLoaded', function () {

        const guestInput = document.getElementById('guests');
        const totalPriceInput = document.getElementById('total_price');

        const pricePerGuest = {{ $room->price }};

        guestInput.addEventListener('input', function () {
            let guests = parseInt(this.value);

            if (!isNaN(guests) && guests > 0) {
                let total = guests * pricePerGuest;
                totalPriceInput.value = '৳ ' + total.toLocaleString();
            } else {
                totalPriceInput.value = '';
            }
        });

    });
</script>

</section>

@endsection
