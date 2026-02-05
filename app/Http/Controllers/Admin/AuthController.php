<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (Auth::check()) {
            return redirect()->route('admin.dashboard');
        }

        return view('admin.auth.login');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function login(Request $request)
    {
        if ($request->isMethod('GET')) {
            return redirect()->route('admin.login.index');
        }

        $request->validate([
            'user_name' => 'required|string',
            'password' => 'required|string',
        ]);

        $user = User::where('user_name', $request->user_name)->where('status', 1)->first();
        if (!$user) {
            return redirect()->back()->withErrors('User does not exist or is inactive!')->withInput();
        }

        if (Auth::attempt($request->only('user_name', 'password'), $request->filled('remember'))) {
            $intendedUrl = Session::pull('url.intended', route('admin.dashboard'));
            return redirect()->intended($intendedUrl)->with('success', 'Logged in successfully!');
        }

        return redirect()->back()->withErrors('Invalid username or password!')->withInput();
    }

    public function dashboard(Request $request)
    {
        return view('admin.auth.dashbaord');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit()
    {
        return view('admin.profile.index');
    }

    public function changeImages(Request $request)
    {
        $user = Auth::user();

        $user->update([
            'cover_image' => $request->hasFile('cover_image') ? HelperClass::saveImage($request->cover_image, 1200, 'admin/avatar', $user->cover_image) : $user->cover_image,
            'image' => $request->hasFile('profile_image') ? HelperClass::saveImage($request->profile_image, 300, 'admin/avatar', $user->image) : $user->image,
        ]);

        return back()->withSuccessMessage('Images updated successfully!');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $user = Auth::user();

        $request->validate([
            'email' => 'required|email|unique:users,email,' . $user->id,
            'name' => 'required|string|max:255',
            'phone' => 'nullable|string|max:20',
            'address' => 'nullable|string|max:255',
        ]);

        $user->update($request->only(['name', 'email', 'phone', 'address']));

        return back()->withSuccessMessage('Information updated successfully!');
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|string|min:8|confirmed',
        ]);

        $user = Auth::user();

        if (!Hash::check($request->old_password, $user->password)) {
            return back()->withErrors('Old password does not match!');
        }

        $user->update(['password' => bcrypt($request->new_password)]);

        return back()->withSuccessMessage('Password updated successfully!');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('admin.login.index');
    }

    public function sidebar()
    {
        $key = 'session-sidebar';

        if (!Session::has($key)) {
            Session::put($key, 'session-sidebar');
        } else {
            Session::forget($key);
        }

        return response()->json(['status' => 'toggled']);
    }
}
