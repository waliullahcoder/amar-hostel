<header class="header_area">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light align-items-center">

            <!-- LEFT: LOGO -->
            <a class="navbar-brand d-flex align-items-center" href="{{ url('/') }}">
                <img src="{{ asset('./backend/images/logo/logo.png') }}" 
                     alt="Logo" class="header-logo">
            </a>

            <!-- MOBILE TOGGLER -->
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- MIDDLE: MENU -->
            <div class="collapse navbar-collapse justify-content-center"
                 id="navbarSupportedContent">
                <ul class="navbar-nav menu_nav">

                    <li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">About</a></li>

                    <!-- Rooms -->
                   <li class="nav-item submenu dropdown"> <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Rooms <span class="ms-1">▼</span> </a> 
                    <ul class="dropdown-menu"> 
                        <li class="nav-item"><a class="nav-link" href="#">Double Deluxe Room</a></li> 
                        <li class="nav-item"><a class="nav-link" href="#">Single Deluxe Room</a></li> 
                        <li class="nav-item"><a class="nav-link" href="#">Honeymoon Suite</a></li> 
                        <li class="nav-item"><a class="nav-link" href="#">Economy Double</a></li> 
                    </ul> 
                    </li>

                    <!-- Services -->
                    <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
                            role="button" aria-haspopup="true" aria-expanded="false">
                                Services <span class="ms-1">▼</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="#">Restaurant & Dining</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Swimming Pool</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Spa & Massage</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Gym & Fitness</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Conference Hall</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Airport Pickup</a></li>
                            </ul>
                        </li>

                    <li class="nav-item"><a class="nav-link" href="#">Gallery</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Booking</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>

                </ul>
            </div>

            <!-- RIGHT: CONTACT INFO -->
            <div class="header-contact d-none d-lg-flex">
                <div class="contact-item">
                    <i class="fa fa-phone"></i>
                    <span>+880 1916-304877</span>
                </div>
                <div class="contact-item">
                    <i class="fa fa-envelope"></i>
                    <span>info@amarhostelbd.com</span>
                </div>
            </div>

        </nav>
    </div>
</header>
