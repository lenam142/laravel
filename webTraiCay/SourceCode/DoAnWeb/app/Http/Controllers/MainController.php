<?php

namespace App\Http\Controllers;

use App\Http\Services\Menu\MenuService;
use App\Http\Services\Product\ProductService;
use Illuminate\Http\Request;

class MainController extends Controller
{
    protected $menu;
    protected $product;

    public function __construct(MenuService $menu, ProductService $product){
            $this->menu = $menu;
            $this->product = $product;
    }
    public function index(){
        return view('home',[
            'title'=>'Shop trai cay',
            'menus' => $this->menu->show(),
            'products' => $this->product->get()

        ]);
    }
    
    public function loadProduct(Request $request){
        $page = $request->input('page',0);
        $result = $this->product->get($page);

        if(count($result)!=0){
            $html = view('product.list',['product' => $result])->render();

            return response()->json([
                'html' => $html
            ]);
        }
        return response()->json(['html'=>'']);
    }
}
