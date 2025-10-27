@extends('layouts.app')

@section('header-title', __('Guest Order') . ' #' . $guestOrder->order_code)
@section('header-subtitle', __('Order details and items'))

@section('content')
<div class="card">
    <div class="card-body">
        <div class="row g-3">
            <div class="col-md-6">
                <h5 class="mb-3">{{ __('Customer Info') }}</h5>
                <div><strong>{{ __('Name') }}:</strong> {{ $guestOrder->name }}</div>
                <div><strong>{{ __('Phone') }}:</strong> {{ $guestOrder->phone }}</div>
            </div>
            <div class="col-md-6">
                <h5 class="mb-3">{{ __('Shipping Address') }}</h5>
                <div><strong>{{ __('Governorate') }}:</strong> {{ $guestOrder->governorate }}</div>
                <div><strong>{{ __('Area') }}:</strong> {{ $guestOrder->area }}</div>
                <div><strong>{{ __('Nearest Landmark') }}:</strong> {{ $guestOrder->nearest_landmark }}</div>
            </div>
        </div>

        <hr class="my-4" />

        <h5 class="mb-3">{{ __('Order Items') }}</h5>
        <form method="POST" action="{{ route('shop.guest-orders.update-status', $guestOrder->id) }}" class="mb-3 d-flex align-items-end gap-2">
            @csrf
            <div class="w-50">
                <label class="form-label">{{ __('Status') }}</label>
                <select name="status" class="form-select">
                    @foreach(\App\Models\GuestOrder::STATUSES as $s)
                        <option value="{{ $s }}" {{ $guestOrder->status === $s ? 'selected' : '' }}>{{ __(ucfirst($s)) }}</option>
                    @endforeach
                </select>
            </div>
            <button class="btn btn-primary">{{ __('Update') }}</button>
        </form>
        <div class="table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>{{ __('Product') }}</th>
                        <th>{{ __('Qty') }}</th>
                        <th>{{ __('Unit Price') }}</th>
                        <th>{{ __('Total') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($guestOrder->items as $idx => $item)
                        <tr>
                            <td>{{ $idx + 1 }}</td>
                            <td class="d-flex align-items-center gap-2">
                                @if($item->product_thumbnail)
                                    <img src="{{ $item->product_thumbnail }}" alt="thumb" width="36" height="36" style="object-fit:cover;border-radius:6px" />
                                @endif
                                <span>{{ $item->product_name }}</span>
                            </td>
                            <td>{{ $item->quantity }}</td>
                            <td>{{ showCurrency(number_format($item->unit_price, 2)) }}</td>
                            <td>{{ showCurrency(number_format($item->unit_price * $item->quantity, 2)) }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="row justify-content-end">
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-2">
                            <span>{{ __('Subtotal') }}</span>
                            <strong>{{ showCurrency(number_format($guestOrder->subtotal, 2)) }}</strong>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>{{ __('Delivery Charge') }}</span>
                            <strong>{{ showCurrency(number_format($guestOrder->delivery_charge, 2)) }}</strong>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between">
                            <span>{{ __('Total') }}</span>
                            <strong>{{ showCurrency(number_format($guestOrder->total, 2)) }}</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


