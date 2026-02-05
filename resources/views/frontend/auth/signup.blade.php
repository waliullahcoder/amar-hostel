@extends('layouts.frontend.app')

@section('content')
<div class="auth-page py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">

                <div class="card shadow-sm">
                    <div class="card-body p-4">

                        <h4 class="text-center mb-3">Create an account</h4>
                        <p class="text-center text-muted mb-4">
                            Sign up to start shopping with us
                        </p>

                        <form method="POST" action="{{route('user.signupPost')}}">
                            @csrf

                            <!-- NAME -->
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text"
                                       name="name"
                                       value="{{ old('name') }}"
                                       class="form-control"
                                       required>
                            </div>

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

                            <!-- CONFIRM PASSWORD -->
                            <div class="mb-3">
                                <label class="form-label">Confirm Password</label>
                                <input type="password"
                                       name="password_confirmation"
                                       class="form-control"
                                       required>
                            </div>

                            <!-- TERMS -->
                            <div class="mb-3">
                                <input type="checkbox" required>
                                <label>
                                    I agree to the
                                    <a href="#">Terms & Conditions</a>
                                </label>
                            </div>

                            <!-- BUTTON -->
                            <button type="submit" class="btn btn-danger w-100">
                                Create Account
                            </button>
                        </form>

                        <p class="text-center mt-3 mb-0">
                            Already have an account?
                            <a href="{{route('auth.signinPage') }}">Login</a>
                        </p>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
