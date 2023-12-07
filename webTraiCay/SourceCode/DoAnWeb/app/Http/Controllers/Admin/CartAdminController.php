<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Services\CartService;
use Illuminate\Http\Request;
use App\Http\Services\Menu\MenuService;

class CartAdminController extends Controller{
    protected $cart;
    public function __construct(CartService $cart)
    {
        $this->cart=$cart;
    }
    public function index(){
        return view('admin.carts.customer',[
            'title' => 'Danh sách đơn đặt hàng',
            'customers' => $this->cart->getCustomer()
        ]);
    }
}