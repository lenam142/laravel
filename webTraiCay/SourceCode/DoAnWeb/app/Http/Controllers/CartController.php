<?php

namespace App\Http\Controllers;

use App\Http\Services\CartService;
use App\Models\Cart;
use App\Models\Customer;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    public function index(Request $request){
        $result = $this->cartService->create($request);

        if($request === false){
            return redirect()->back();
        }
        return redirect('/carts');
    }

    public function show(){
        $products = $this->cartService->getProduct();
        
        return view('carts.list',[
            'title' => 'Giỏ Hàng',
            'products' => $products,
            'carts' => Session::get('carts')
        ]);
    }

    public function update(Request $request){
        $this->cartService->update($request);
        return redirect('/carts');
    }

    public function remove($id = 0)
    {
        $this->cartService->remove($id);

        return redirect('/carts');
    }
    public function addCart(Request $request){
        $customerData = [
            'name' => $request->input('name'),
            'phone' => $request->input('phone'),
            'address' => $request->input('address'),
            'email' => $request->input('email'),
            'content' => $request->input('content')
        ];
    
        $total = $request->input('total');
        $customer = Customer::where('email', $customerData['email'])->first();
    
        if ($customer) {
            $customer->name = $customerData['name'];
            $customer->phone = $customerData['phone'];
            $customer->address = $customerData['address'];
            $customer->content = $customerData['content'];
            $customer->save();
        } else {
            $customer = Customer::create($customerData);
        }
        $products = $this->cartService->getProduct(); 
        foreach ($products as $product) {
        $quantity = $request->input('num_product')[$product->id];
        $price = $product->price_sale != 0 ? $product->price_sale : $product->price;
        $totalProductPrice = $price * $quantity;
            Cart::create([
                'customer_id' => $customer->id,
                'product_id' => $product->id,
                'pty' => $quantity,
                'price' => $totalProductPrice 
            ]);
        }
        return view('payment.success', [
            'title' => 'Thanh Toán Thành Công',
            'customer' => $customerData,
            'total' => $total
        ]);
        
    } 
    
}
