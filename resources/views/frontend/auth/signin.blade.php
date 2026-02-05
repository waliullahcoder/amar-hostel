@extends('layouts.frontend.app')

@section('content')
<div class="auth-page py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5">

                <div class="card shadow-sm">
                    <div class="card-body p-4">

                        <h4 class="text-center mb-3">Login to your account</h4>
                        <p class="text-center text-muted mb-4">
                            Welcome back! Please login to continue
                        </p>

                        <form method="POST" action="">
                            @csrf

                            <!-- EMAIL -->
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input type="email"
                                       name="email"
                                       value="{{ old('email') }}"
                                       class="form-control"
                                       required>
                            </div>

                            <!-- PASSWORD -->
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password"
                                       name="password"
                                       class="form-control"
                                       required>
                            </div>

                            <!-- REMEMBER -->
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <input type="checkbox" name="remember" id="remember">
                                    <label for="remember">Remember me</label>
                                </div>
                                <a href="" class="small">
                                    Forgot password?
                                </a>
                            </div>

                            <!-- BUTTON -->
                            <button type="submit" class="btn btn-danger w-100">
                                Login
                            </button>
                        </form>

                        <p class="text-center mt-3 mb-0">
                            Don't have an account?
                            <a href="{{ route('auth.signupPage') }}">Sign up</a>
                        </p>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
