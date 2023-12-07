@extends('main')

@section('content')
    <div class="container mt-4">
        @if(isset($customer) && isset($total))
            <div class="card">
                <div class="card-body">
                    <h4>Thông tin khách hàng:</h4>
                    <ul class="list-group">
                        <li class="list-group-item">Tên khách hàng: {{ $customer['name'] }}</li>
                        <li class="list-group-item">Số điện thoại: {{ $customer['phone'] }}</li>
                        <li class="list-group-item">Địa chỉ: {{ $customer['address'] }}</li>
                        <li class="list-group-item">Email: {{ $customer['email'] }}</li>
                    </ul>
                    <p class="mt-3">Tổng tiền thanh toán: {{ number_format($total, 0, '', '.') }}</p>
                </div>
                <div class="card-header bg-success text-white">
                    <h2 class="text-center">Thanh toán thành công!</h2>
                </div>
            </div>
        @else
            <div class="alert alert-danger mt-4">
                <p>{{ session('error') }}</p>
            </div>
        @endif
    </div>
@endsection