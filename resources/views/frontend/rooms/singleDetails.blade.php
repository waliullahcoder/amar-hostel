@extends('layouts.frontend.app')

@section('content')
<style>
.room_details_area{
    padding:80px 0;
    background:#f8f9fa;
}

/* Main image */
.main-image-box{
    background:#fff;
    padding:15px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,.08);
}

.main-image-box img{
    width:100%;
    height:420px;
    object-fit:cover;
    border-radius:10px;
}

/* Thumbnails */
.thumb-gallery{
    display:flex;
    gap:10px;
    margin-top:15px;
    overflow-x:auto;
}

.thumb-item{
    width:70px;
    height:60px;
    object-fit:cover;
    border-radius:8px;
    cursor:pointer;
    opacity:.6;
    border:2px solid transparent;
    transition:.3s;
    flex-shrink:0;
}

.thumb-item:hover{
    opacity:1;
    transform:translateY(-2px);
}

.thumb-item.active{
    opacity:1;
    border-color:#0d6efd;
}

/* Room info */
.room-info h2{
    font-weight:700;
    margin-bottom:10px;
}

.price{
    font-size:28px;
    font-weight:700;
    color:#dc3545;
    margin-bottom:15px;
}

.price span{
    font-size:14px;
    color:#6c757d;
}

.description{
    color:#6c757d;
    margin-bottom:20px;
}

.features{
    list-style:none;
    padding:0;
    margin-bottom:25px;
}

.features li{
    margin-bottom:8px;
    font-size:15px;
}

/* Book button */
.btn-book{
    display:inline-block;
    padding:14px 40px;
    background:#0d6efd;
    color:#fff;
    font-weight:600;
    border-radius:30px;
    text-decoration:none;
    transition:.3s;
}

.btn-book:hover{
    background:#084298;
    color:#fff;
}
</style>

<!-- ================= Breadcrumb ================= -->
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">{{ $room->name }}</h2>
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Room Details</li>
            </ol>
        </div>
    </div>
</section>

<!-- ================= Room Details ================= -->
<section class="room_details_area">
    <div class="container">
        <div class="row g-5 align-items-start">

            <!-- IMAGE GALLERY -->
            <div class="col-lg-6">

                <!-- Main Image -->
                <div class="main-image-box">
                    <img id="mainImage"
                         src="{{ asset('storage/'.$room->image) }}"
                         alt="{{ $room->name }}">
                </div>

                <!-- Thumbnails -->
                <div class="thumb-gallery">
                    @foreach([$room->image, $room->image2, $room->image3, $room->image4] as $key => $img)
                        @if($img)
                            <img src="{{ asset('storage/'.$img) }}"
                                 class="thumb-item {{ $key === 0 ? 'active' : '' }}"
                                 data-img="{{ asset('storage/'.$img) }}">
                        @endif
                    @endforeach
                </div>

            </div>

            <!-- ROOM INFO -->
            <div class="col-lg-6">
                <div class="room-info">
                    <h2>{{ $room->name }}</h2>

                    <div class="price">
                        ৳ {{ number_format($room->price) }}
                        <span>/ night</span>
                    </div>

                    <p class="description">
                        {{ $room->description ?? 'A modern, clean and comfortable room designed for a perfect stay.' }}
                    </p>

                    <ul class="features">
                        <li>✔ Free WiFi</li>
                        <li>✔ Air Condition</li>
                        <li>✔ Attached Bathroom</li>
                        <li>✔ 24/7 Room Service</li>
                    </ul>

                    <a href="{{ route('booking.bookRoom', $room->id) }}" class="btn-book">
                        Book Now
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const mainImage = document.getElementById('mainImage');
    const thumbs = document.querySelectorAll('.thumb-item');

    thumbs.forEach(thumb => {
        thumb.addEventListener('click', function () {
            mainImage.src = this.dataset.img;

            thumbs.forEach(t => t.classList.remove('active'));
            this.classList.add('active');
        });
    });
});
</script>

@endsection
