<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Slider;
use App\Models\HomeSection;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use App\Models\Booking;
use App\Models\Room;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Session;
class UserController extends Controller
{
    protected $frontEndService;
    public function __construct(FrontEndService $frontEndService)
    {
        $this->frontEndService = $frontEndService;
    }

    public function signinPost(Request $request)
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {

            if (auth()->user()->role_status != 0) {
                Auth::logout();
                return redirect()->back()->with('success', 'You are not allowed here');
            }
            //Booking pending after login booking confirmed
           
        /* 🔥 LOGIN SUCCESS — CHECK PENDING BOOKING */
        if (Session::has('pending_booking')) {

            $data = Session::get('pending_booking');
            $room = Room::findOrFail($data['room_id']);

            DB::transaction(function () use ($data, $room) {

                Booking::create([
                    'user_id'     => Auth::id(),
                    'room_id'     => $room->id,
                    'check_in'    => $data['check_in'],
                    'check_out'   => $data['check_out'],
                    'guests'      => $data['guests'],
                    'total_price' => $room->price * $data['guests'],
                    'status'      => 'pending',
                ]);

                // capacity কমানো
                $room->decrement('capacity', $data['guests']);
            });

            Session::forget('pending_booking');

            return redirect()
                ->route('booking.index')
                ->with('success', 'Booking confirmed successfully after login 🎉');
        }


            return redirect()->route('frontend.user.dashboard')->with('success', 'Logged in successfully');
        }

        return back()
            ->withErrors(['email' => 'Invalid email or password'])
            ->withInput();
    }


        public function signupPost(Request $request)
        {
           
            $request->validate([
                'name'     => 'required|string|max:255',
                'email'    => 'required|email|unique:users,email',
                'password' => 'required|min:6|confirmed', // 👈 confirm handled here
            ]);

            $user = User::create([
                'name'        => $request->name,
                'user_name'   => strtolower(str_replace(' ', '', $request->name)),
                'email'       => $request->email,
                'password'    => Hash::make($request->password),
                'role_status' => 0,
            ]);
            Auth::login($user);

            return redirect()
                ->route('frontend.user.dashboard')
                ->with('success', 'Welcome 🎉 Account created successfully');
        }


    public function dashboard()
    {
        if (auth()->user()->role_status != 0) {
            abort(403);
        }
        return view('frontend.user.dashboard');
    }

    public function updateEditProfile()
    {
        $menus = $this->frontEndService->getMenu();
        return view('frontend.user.profile_edit', compact('menus'));
    }


        public function updateProfile(Request $request)
        {
            $user = Auth::user();

            $request->validate([
                'name'  => 'required|string|max:255',
                'email' => 'required|email|unique:users,email,' . $user->id,
                'phone' => 'nullable|string|max:20',
                'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            ]);

            $user->name  = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->address = $request->address;

            /* ===== IMAGE UPDATE ===== */
            if ($request->hasFile('image')) {

                // delete old image
                if ($user->image && Storage::disk('public')->exists($user->image)) {
                    Storage::disk('public')->delete($user->image);
                }

                // save new image
                $user->image = HelperClass::saveImage(
                    $request->file('image'),
                    800,
                    'users/profile',
                    $user->image
                );
            }
            $user->save();

            return back()->with('success', 'Profile updated successfully');
        }




    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('auth.signinPage')->with('success', 'You have been logged out successfully');
    }

    
}