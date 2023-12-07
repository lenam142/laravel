<?php
namespace App\Http\Services;
use Illuminate\Http\Request;
use App\Jobs\sendMail;
use App\Models\Cart;
use App\Models\Customer;
use App\Models\Product;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CartService{

    public function create($request){
        $soluong = (int)$request->input('num_product');
        $product_id = (int)$request->input('product_id');

        if ($soluong <= 0 || $product_id <= 0) {
            Session::flash('error', 'Số lượng hoặc Sản phẩm không chính xác');
            return false;
        }

        $carts = Session::get('carts');
        if (is_null($carts)) {
            Session::put('carts', [
                $product_id => $soluong
            ]);
             return true;
        }
        // dd($carts);
        $exists = Arr::exists($carts,$product_id);
        if($exists){
            $carts[$product_id] = $carts[$product_id]+$soluong;
            Session::put('carts', $carts);
            return true;
        }
        $carts[$product_id] = $soluong;
        Session::put('carts',$carts);
        // dd($carts);
        return true;
    }

    public function getProduct(){
        $carts = Session::get('carts');
        if(is_null($carts)) return [];
        // dd($carts);

        $productId = array_keys($carts);
        return Product::select('id','name','price','price_sale','thumb')
        ->where('active',1)
        ->whereIn('id',$productId)
        ->get();
    }
    public function update($request){
        Session::put('carts',$request->input('num_product'));
        return true;
    }
    public function remove($id)
    {
        $carts = Session::get('carts');
        unset($carts[$id]);

        Session::put('carts', $carts);
        return true;
    }

    public function getCustomer(){
        return Customer::orderByDesc('id')->paginate(15);
    }
    public function addCart($request)
    {
        try {
            DB::beginTransaction();
            $carts = Session::get('carts');
            if (is_null($carts))
                return false;

            $customer = Customer::create([
                'name' => $request->input('name'),
                'phone' => $request->input('phone'),
                'address' => $request->input('address'),
                'email' => $request->input('email'),
                'content' => $request->input('content')
            ]);
            $this->infoProductCart($carts, $customer->id);

            DB::commit();
            Session::flash('success', 'Đặt Hàng Thành Công');

            #Queue
            sendMail::dispatch($request->input('email'))->delay(now()->addSeconds(2));

            Session::forget('carts');
        } catch (\Exception $err) {
            DB::rollBack();
            Session::flash('error', 'Đặt Hàng Lỗi, Vui lòng thử lại sau');
            return false;
        }

        return true;
    }
    protected function infoProductCart($carts, $customer_id)
    {
        $productId = array_keys($carts);
        $products = Product::select('id', 'name', 'price', 'price_sale', 'thumb')
            ->where('active', 1)
            ->whereIn('id', $productId)
            ->get();

        $data = [];
        foreach ($products as $product) {
            $data[] = [
                'customer_id' => $customer_id,
                'product_id' => $product->id,
                'pty'   => $carts[$product->id],
                'price' => $product->price_sale != 0 ? $product->price_sale : $product->price
            ];
        }

        return Cart::insert($data);
    }


    public function getProductForCart($customer)
    {
        return $customer->carts()->with(['product' => function ($query) {
            $query->select('id', 'name', 'thumb');
        }])->get();
    }
    public function processPayment(Request $request)
    {
        $customerData = [
        'name' => $request->input('name'),
        'phone' => $request->input('phone'),
        'address' => $request->input('address'),
        'email' => $request->input('email'),
        'content' => $request->input('content')
    ];

    $total = $request->input('total'); // Lấy giá trị $total từ request

    $customer = Customer::where('email', $customerData['email'])->first();

    // if ($customer) {
    //     // Thực hiện thanh toán khi thông tin khách hàng đúng

    //     return view('payment.success', ['customer' => $customerData, 'total' => $total]);
    // } else {
    //     return redirect()->back()->with('error', 'Thông tin khách hàng không đúng.');
    // }
}

}