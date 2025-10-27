@extends('admin.layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-3">
        <div class="col">
            <h3 class="mb-0">Guest Orders</h3>
        </div>
    </div>

    <div class="card">
        <div class="card-body table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Order Code</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Governorate</th>
                        <th>Area</th>
                        <th>Nearest Landmark</th>
                        <th>Subtotal</th>
                        <th>Delivery</th>
                        <th>Total</th>
                        <th>Created At</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($guestOrders as $order)
                        <tr>
                            <td>{{ $order->id }}</td>
                            <td>{{ $order->order_code }}</td>
                            <td>{{ $order->name }}</td>
                            <td>{{ $order->phone }}</td>
                            <td>{{ $order->governorate }}</td>
                            <td>{{ $order->area }}</td>
                            <td>{{ $order->nearest_landmark }}</td>
                            <td>{{ showCurrency(number_format($order->subtotal, 2)) }}</td>
                            <td>{{ showCurrency(number_format($order->delivery_charge, 2)) }}</td>
                            <td>{{ showCurrency(number_format($order->total, 2)) }}</td>
                            <td>{{ $order->created_at->format('Y-m-d H:i') }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="11" class="text-center">No guest orders found.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="mt-3">
                {{ $guestOrders->links() }}
            </div>
        </div>
    </div>
</div>
@endsection


