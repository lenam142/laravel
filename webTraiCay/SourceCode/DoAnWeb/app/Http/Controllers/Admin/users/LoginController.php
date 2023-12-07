<?php

namespace App\Http\Controllers\Admin\users;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class LoginController extends Controller
{
    public function index(){

        return view('admin.users.login',[
            'title'=>'đăng nhập hệ thống'
        ]);
    }
 
    public function store(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email:filter',
            'password' => 'required'
        ]);
        if (Auth::attempt([
            'email' => $request->input('email'),
            'password' => $request->input('password')
        ], $request->input('remember'))) {
            $user = Auth::user();
            if ($user->phanquyen === 'admin') {
                return redirect()->route('admin');
            } else {
                return redirect()->route('home');
            }
        } else {
            return redirect()->route('login')->with('error', 'Thông tin đăng nhập không đúng');
        }

        // $credentials = $request->only('email', 'password');

        // if (Auth::attempt($credentials, $request->input('remember'))) {
        //     $user = Auth::user();
            
        //     if ($user->phanquyen === 'admin') {
        //         return redirect()->route('admin');
        //     } elseif ($user->phanquyen === 'khach') {
        //         return redirect()->route('home');
        //     }
        // }

        Session::flash('error', 'Email hoặc Password không đúng');
        return redirect()->back();
    }
}
