<!DOCTYPE html><html lang="en">
    <head>
     <meta name="robots" content="noindex, nofollow">
{{-- <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com"> --}}

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="frontend/images/favicon.png" type="image/png">
        <title>Amar Hostel</title>
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