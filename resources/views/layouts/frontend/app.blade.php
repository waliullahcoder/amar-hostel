<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <title>Amar Hostel | Affordable & Comfortable Hostel Booking</title>
    <meta name="description" content="Amar Hostel offers affordable, comfortable and secure accommodation with modern facilities. Book rooms easily with best price guarantee for students, travelers and professionals.">
    <meta name="keywords" content="Amar Hostel, hostel booking, budget hostel, student hostel, affordable hostel, room booking, hostel in Bangladesh, cheap accommodation, hostel rooms">
    <meta name="author" content="Amar Hostel">
    <meta name="robots" content="index, follow">
    <link rel="icon" href="frontend/images/favicon.png" type="image/png">
    <link rel="shortcut icon" href="{{ asset('./backend/frontend/images/logo/favicon.png') }}"
        type="image/x-icon" />
        <!-- Bootstrap CSS -->
      @include('layouts.frontend.partial.styles')
    </head>
    <body>
        <!--================Header Area =================-->
      @include('layouts.frontend.partial.header')
        <!--================Header Area =================-->
        
        <!--================Banner Area =================-->
      @include('layouts.frontend.partial.banner')
        <!--================Banner Area =================-->
        
        <!--================ Accomodation Area  =================-->
        @include('layouts.frontend.partial.rooms')
        <!--================ Accomodation Area  =================-->
        
        <!--================ Facilities Area  =================-->
       @include('layouts.frontend.partial.services')
        <!--================ Facilities Area  =================-->
        
        <!--================ About History Area  =================-->
        @include('layouts.frontend.partial.about')
        <!--================ About History Area  =================-->
        
        <!--================ Testimonial Area  =================-->
       @include('layouts.frontend.partial.testimonial')
        <!--================ Testimonial Area  =================-->
        
        <!--================ Gallery  =================-->
        @include('layouts.frontend.partial.gallery')
        <!--================ Recent Area  =================-->
        
        <!--================ start footer Area  =================-->	
        @include('layouts.frontend.partial.footer')
		<!--================ End footer Area  =================-->
        
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
       @include('layouts.frontend.partial.scripts')

</body>
</html>