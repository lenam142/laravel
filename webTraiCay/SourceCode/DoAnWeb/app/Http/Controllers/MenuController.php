<?php

namespace App\Http\Controllers;

use App\Http\Services\Menu\MenuService;
use Illuminate\Http\Request;

class MenuController extends Controller
{ //su dung de load menu và sản phẩm của menu đó

    protected $menuService;

    public function __construct(MenuService $menuService)
    {
        $this->menuService = $menuService;
    }

    public function index($id){
        $menu = $this->menuService->getId($id);
        // dd($menu);
        $products = $this->menuService->getProduct($menu);
       // dd($products);
       return view('menu',[
        'title' => $menu->name,
        'products' => $products,
        'menu' => $menu
       ]);
        
    }
}
