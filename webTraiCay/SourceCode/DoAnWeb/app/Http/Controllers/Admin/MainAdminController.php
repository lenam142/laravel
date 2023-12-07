<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Services\Menu\MenuService;

class MainAdminController extends Controller
{
   
   

    public function index(){
       return view('admin.main',[
       'title'=>'Trang Quản Trị Viên',
    ]);
    }
}
