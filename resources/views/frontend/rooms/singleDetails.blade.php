@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb =================-->
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">{{ $room->name }}</h2>
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Details</li>
            </ol>
        </div>
    </div>
</section>
<!--================ End Breadcrumb =================-->

<!--================ Room Details =================-->
<section class="room_details_area section_gap">
    <div class="container">
        <div class="row align-items-center">

            <!-- IMAGE DISPLAY -->
            <div class="col-md-6">
                <div class="room_main_image mb-3">
                    <img id="mainImage" 
                         src="{{ $room->image ? asset('storage/'.$room->image) : asset('frontend/images/room1.jpg') }}"
                         class="img-fluid rounded shadow-sm"
                         style="width:100%; max-height:450px; object-fit:cover;">
                </div>

                <!-- THUMBNAILS -->
                <div class="d-flex gap-2 justify-content-start">
                    @foreach([$room->image, $room->image2, $room->image3,$room->image4] as $img)
                        @if($img)
                            <img src="{{ asset('storage/'.$img) }}" 
                                 class="img-thumbnail thumb-img shadow-sm"
                                 style="width:100px; height:80px; object-fit:cover; cursor:pointer;">
                        @endif
                    @endforeach
                </div>
            </div>

            <!-- DETAILS -->
            <div class="col-md-6">
                <div class="room_details_content">
                    <h2 class="mb-3">{{ $room->name }}</h2>

                    <h4 class="text-danger mb-3">
                        ৳ {{ number_format($room->price) }} 
                        <small class="text-muted fs-6">/ night</small>
                    </h4>

                    <p class="text-muted mb-4">
                        {{ $room->description ?? 'Comfortable and well-furnished room for a pleasant stay.' }}
                    </p>

                    <ul class="list-unstyled mb-4">
                        <li>✔ Free WiFi</li>
                        <li>✔ Air Condition</li>
                        <li>✔ Attached Bathroom</li>
                        <li>✔ 24/7 Service</li>
                    </ul>

                    <a href="{{ route('booking.bookRoom', $room->id) }}" 
                       class="btn theme_btn button_hover px-5 py-2">
                        Book Now
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>
<!--================ End Room Details =================-->

@endsection

@section('styles')
<style>
    .thumb-img:hover {
        border: 2px solid #0d6efd;
        transition: 0.3s;
    }
    .room_details_area {
        padding: 60px 0;
    }
    .breadcrumb_area {
        padding: 50px 0;
        background-color: #f8f9fa;
    }
</style>
@endsection

@section('scripts')
<script>
    // Thumbnail click → change main image
    document.querySelectorAll('.thumb-img').forEach(img => {
        img.addEventListener('click', function(){
            document.getElementById('mainImage').src = this.src;
        });
    });
</script>
@endsection
