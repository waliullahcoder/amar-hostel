<footer class="footer-section">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-md-4 col-6">
                <div class="pb-3">
                    <a href="{{ Route('home') }}">
                        <img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo/logo.jpg') }}"
                            height="50" alt="{{ $settings->app_name }}">
                    </a>
                </div>
                <p>{{ $settings->description }}</p>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">প্রয়োজনীয় লিংক</h5>
                <ul class="footer-list">
                    <li class="footer-item"><a class="footer-link" href="#">যোগাযোগ করুন</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">শপিং ব্যাগ</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">প্রশ্নোত্তর</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">কিভাবে কেনাকাটা করবেন ?</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">শর্তাবলী</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">রিফান্ড নীতিমালা</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">প্রাইভেসী পলিসি</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">জনপ্রিয়</h5>
                <ul class="footer-list">
                    <li class="footer-item"><a class="footer-link" href="#">পছন্দের তালিকা</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">অ্যাকাডেমিক বই</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">ড. আব্দুল্লাহ জাহাঙ্গীর</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">আরিফ আজাদ এর বই</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">প্রি-অর্ডার</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">প্যাকেজ</a></li>
                    <li class="footer-item"><a class="footer-link" href="#">ইলেকট্রনিক্স</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">যোগাযোগ</h5>
                <ul class="footer-contact">
                    <li class="footer-contact-item">
                        <i class="fa fa-map-marker-alt"></i>&nbsp;Head Office: <br>
                        {!! $settings->address !!}
                    </li>
                    <li class="footer-contact-item">
                        <i class="fa fa-mobile-alt"></i>&nbsp;Phone:<br><a
                            href="tel:+88{{ $settings->primary_phone }}">{{ $settings->primary_phone }}</a>
                    </li>
                    <li class="footer-contact-item">
                        <i class="fa fa-envelope"></i>&nbsp;&nbsp;<span>{{ $settings->primary_email }}</span>
                    </li>
                    <li class="footer-contact-item pt-2">
                        @if ($settings->facebook_page)
                            <a class="social-link" target="_blank" href="{{ $settings->facebook_page }}" rel="noopener">
                                <i class="fab fa-facebook"></i>
                            </a>
                        @endif
                        @if ($settings->youtube)
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="{{ $settings->youtube }}" rel="noopener">
                                <i class="fab fa-youtube"></i>
                            </a>
                        @endif
                        @if ($settings->instagram)
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="{{ $settings->instagram }}" rel="noopener">
                                <i class="fab fa-instagram"></i>
                            </a>
                        @endif
                        @if ($settings->twitter)
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="{{ $settings->twitter }}" rel="noopener">
                                <i class="fab fa-twitter"></i>
                            </a>
                        @endif
                        @if ($settings->linkedin)
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="{{ $settings->linkedin }}" rel="noopener">
                                <i class="fab fa-linkedin"></i>
                            </a>
                        @endif
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<div class="footer-bottom py-3">
    <div class="container">
        <div class="copyright">Copyright © {{ date('Y') }} {{ $settings->app_name }}</div>
    </div>
</div>
<!-- End Footer -->

<div class="scrollTop" style="display: none;">
    <svg width="28" height="28" stroke-width="4" aria-hidden="true">
        <path d="M24.5 4.66663H3.5V6.27079H24.5V4.66663Z" fill="currentColor"></path>
        <path
            d="M14 8.19898L5.84953 16.3495L6.98385 17.4838L13.1979 11.2697L13.1979 24.5H14.8021L14.8021 11.2697L21.0162 17.4838L22.1505 16.3495L14 8.19898Z"
            fill="currentColor"></path>
    </svg>
</div>
