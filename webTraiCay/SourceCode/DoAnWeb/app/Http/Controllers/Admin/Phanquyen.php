<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;

class Phanquyen extends Controller{

    public function __construct()
    {
        $this->middleware('auth',['except' => 'getOut']);
    }

    // public function quyen(){
    //     if(!Auth::user()){
    //         return redirect()->route('login');
    //     }
    //     if(Auth::user()->phanquyen === 'admin'){
    //         return redirect()->route('admin');
    //     }
    //     if(Auth::user()->phanquyen === 'khach'){
    //         return redirect()->route('trangchu');
    //     }
    // }
    public function getOut(){
        Auth::logout();
        return redirect()->route('login');
    }
}