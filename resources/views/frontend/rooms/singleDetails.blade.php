@extends('layouts.frontend.app')

@section('content')
<style>
.room_details_area{
    padding:10px;
    background:#f8f9fa;
}

/* Gallery window */
.gallery-box{
    background:#fff;
    border-radius:14px;
    padding:15px;
    box-shadow:0 12px 30px rgba(0,0,0,.08);
}

/* Main image */
.gallery-main img{
    width:100%;
    height:300px;
    object-fit:cover;
    border-radius:10px;
}

/* Thumbnails inside same box */
.gallery-thumbs{
    display:flex;
    justify-content:center;
    gap:10px;
    margin-top:12px;
}

.thumb{
    width:65px;
    height:55px;
    object-fit:cover;
    border-radius:6px;
    cursor:pointer;
    opacity:.6;
    border:2px solid transparent;
    transition:.25s;
}

.thumb:hover{
    opacity:1;
}

.thumb.active{
    opacity:1;
    border-color:#0d6efd;
}

/* Details */
.price{
    font-size:28px;
    font-weight:700;
    color:#dc3545;
    margin:10px 0 15px;
}

.price span{
    font-size:14px;
    color:#6c757d;
}
.text-success{
    color: #2fac3c;
    font-weight:bold;
}
.features{
    list-style:none;
    padding:0;
    margin:20px 0;
}

.features li{
    margin-bottom:8px;
}

.btn-book{
    display:inline-block;
    padding:14px 40px;
    background:#0d6efd;
    color:#fff;
    border-radius:30px;
    text-decoration:none;
    font-weight:600;
}
.btn-book:hover{
    background:#084298;
    color:#fff;
}

</style>
<style>
.room-tabs-section{
    padding:70px 0;
    background:#fff;
}

/* Tabs Header */
.tabs-header{
    display:flex;
    gap:15px;
    border-bottom:2px solid #eee;
    margin-bottom:25px;
}

.tab-btn{
    background:none;
    border:none;
    padding:12px 25px;
    font-weight:600;
    cursor:pointer;
    color:#6c757d;
    position:relative;
}

.tab-btn.active{
    color:#0d6efd;
}

.tab-btn.active::after{
    content:'';
    position:absolute;
    left:0;
    bottom:-2px;
    width:100%;
    height:3px;
    background:#0d6efd;
}

/* Tabs Content */
.tabs-content{
    background:#f9fafb;
    padding:30px;
    border-radius:12px;
}

.tab-content{
    display:none;
    animation:fade .3s ease-in-out;
}

.tab-content.active{
    display:block;
}

@keyframes fade{
    from{opacity:0; transform:translateY(10px)}
    to{opacity:1; transform:translateY(0)}
}

/* Review box */
.review-box{
    background:#fff;
    padding:15px 20px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,.06);
    margin-bottom:15px;
}

/* Facilities grid */
.facility-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
    gap:12px;
}
</style>


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

<section class="room_details_area">
    <div class="container">
        <div class="row g-5 align-items-start">

            <!-- ONE WINDOW GALLERY -->
            <div class="col-lg-6">
                <div class="gallery-box">

                    <!-- Main Image -->
                    <div class="gallery-main">
                        <img id="mainImage"
                             src="{{ asset('storage/'.$room->image) }}"
                             alt="{{ $room->name }}">
                    </div>

                    <!-- Thumbnails INSIDE same window -->
                    <div class="gallery-thumbs">
                        @foreach([$room->image, $room->image2, $room->image3, $room->image4] as $key => $img)
                            @if($img)
                                <img src="{{ asset('storage/'.$img) }}"
                                     class="thumb {{ $key === 0 ? 'active' : '' }}"
                                     data-img="{{ asset('storage/'.$img) }}">
                            @endif
                        @endforeach
                    </div>

                </div>
            </div>

            <!-- DETAILS -->
            <div class="col-lg-6">
                <h2>{{ $room->name }}</h2>

                <div class="price">
                    ৳ {{ number_format($room->price) }}
                    <span>/ night</span>
                </div>
                <div class="text-success">
                    <strong>Available: {{ $room->capacity}}</strong>
                    <span> Capacity</span>
                </div>

                <p class="text-muted">
                    {{ $room->description ?? 'A modern, clean and comfortable room for your perfect stay.' }}
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
</section>
<!-- ================= TABS SECTION ================= -->
<section class="room-tabs-section">
    <div class="container">

        <!-- Tabs Header -->
        <div class="tabs-header">
            <button class="tab-btn active" data-tab="info">Information</button>
            <button class="tab-btn" data-tab="review">Review</button>
            <button class="tab-btn" data-tab="facilities">Facilities</button>
        </div>

        <!-- Tabs Content -->
        <div class="tabs-content">

            <!-- Information -->
            <div class="tab-content active" id="info">
                <h4>Room Information</h4>
                <p>
                    {{ $room->description ?? 'This room offers a comfortable stay with modern facilities, perfect for families and business travelers.' }}
                </p>
                <ul>
                    <li>Check-in: 12:00 PM</li>
                    <li>Check-out: 11:00 AM</li>
                    <li>Max Guests: 2–4</li>
                    <li>Room Size: 350 sq ft</li>
                </ul>
            </div>

            <!-- Review -->
            <div class="tab-content" id="review">
                <h4>Guest Reviews</h4>

                <div class="review-box">
                    <strong>⭐ ⭐ ⭐ ⭐ ⭐</strong>
                    <p>Very clean room and friendly staff. Highly recommended!</p>
                    <small>— Rahim, Dhaka</small>
                </div>

                <div class="review-box">
                    <strong>⭐ ⭐ ⭐ ⭐</strong>
                    <p>Comfortable stay, good service, worth the price.</p>
                    <small>— Karim, Chattogram</small>
                </div>
            </div>

            <!-- Facilities -->
            <div class="tab-content" id="facilities">
                <h4>Room Facilities</h4>
                <div class="facility-grid">
                    <span>✔ Free WiFi</span>
                    <span>✔ Air Condition</span>
                    <span>✔ LED TV</span>
                    <span>✔ Attached Bathroom</span>
                    <span>✔ Hot Water</span>
                    <span>✔ Room Service</span>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- ================= END TABS ================= -->

<script>
document.addEventListener('DOMContentLoaded', function () {
    const mainImage = document.getElementById('mainImage');
    const thumbs = document.querySelectorAll('.thumb');

    thumbs.forEach(thumb => {
        thumb.addEventListener('click', function () {
            mainImage.src = this.dataset.img;

            thumbs.forEach(t => t.classList.remove('active'));
            this.classList.add('active');
        });
    });
});
</script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.tab-btn');
    const contents = document.querySelectorAll('.tab-content');

    buttons.forEach(btn => {
        btn.addEventListener('click', function () {
            buttons.forEach(b => b.classList.remove('active'));
            contents.forEach(c => c.classList.remove('active'));

            this.classList.add('active');
            document.getElementById(this.dataset.tab).classList.add('active');
        });
    });
});
</script>

@endsection
