<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;

class PaymentController extends Controller
{

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

    if ($customer) {
        // Thực hiện thanh toán khi thông tin khách hàng đúng

        return view('payment.success', ['customer' => $customerData, 'total' => $total]);
    } else {
        return redirect()->back()->with('error', 'Thông tin khách hàng không đúng.');
    }
}
}
