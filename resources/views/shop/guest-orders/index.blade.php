@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-3">
        <div class="col">
            <h3 class="mb-0">{{ __('Guest Orders') }}</h3>
        </div>
    </div>

    <div class="card">
        <div class="card-body table-responsive">
            <form method="GET" class="row g-3 mb-3">
                <div class="col-md-3">
                    <label class="form-label">{{ __('Order Code') }}</label>
                    <input type="text" name="code" value="{{ request('code') }}" class="form-control" placeholder="GXXXXXXXX">
                </div>
                <div class="col-md-3">
                    <label class="form-label">{{ __('Name') }}</label>
                    <input type="text" name="name" value="{{ request('name') }}" class="form-control" placeholder="{{ __('Name') }}">
                </div>
                <div class="col-md-3">
                    <label class="form-label">{{ __('Phone') }}</label>
                    <input type="text" name="phone" value="{{ request('phone') }}" class="form-control" placeholder="07XXXXXXXX">
                </div>
                <div class="col-md-3 d-flex align-items-end gap-2">
                    <div class="w-50">
                        <label class="form-label">{{ __('From') }}</label>
                        <input type="date" name="from" value="{{ request('from') }}" class="form-control">
                    </div>
                    <div class="w-50">
                        <label class="form-label">{{ __('To') }}</label>
                        <input type="date" name="to" value="{{ request('to') }}" class="form-control">
                    </div>
                </div>
                <div class="col-md-2">
                    <label class="form-label">{{ __('Status') }}</label>
                    <select name="status" class="form-select">
                        <option value="">{{ __('All') }}</option>
                        @foreach(\App\Models\GuestOrder::STATUSES as $s)
                            <option value="{{ $s }}" {{ request('status') === $s ? 'selected' : '' }}>{{ __(ucfirst($s)) }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-12 d-flex gap-2">
                    <button class="btn btn-primary">{{ __('Filter') }}</button>
                    <a href="{{ route('shop.guest-orders.index') }}" class="btn btn-outline-secondary">{{ __('Reset') }}</a>
                </div>
            </form>
            <table class="table table-striped align-middle">
                <thead>
                    <tr>
                        <th>{{ __('#') }}</th>
                        <th>{{ __('Order Code') }}</th>
                        <th>{{ __('Name') }}</th>
                        <th>{{ __('Phone') }}</th>
                        <th>{{ __('Status') }}</th>
                        <th>{{ __('Subtotal') }}</th>
                        <th>{{ __('Delivery') }}</th>
                        <th>{{ __('Total') }}</th>
                        <th>{{ __('Created At') }}</th>
                        <th>{{ __('Actions') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($guestOrders as $order)
                        <tr>
                            <td>{{ $order->id }}</td>
                            <td>
                                <a href="{{ route('shop.guest-orders.show', $order->id) }}" class="text-primary fw-medium">
                                    {{ $order->order_code }}
                                </a>
                            </td>
                            <td>{{ $order->name }}</td>
                            <td>
                                <a href="tel:{{ $order->phone }}" class="text-decoration-none">
                                    {{ $order->phone }}
                                </a>
                            </td>
                            <td>
                                <span class="badge 
                                    @if($order->status === 'pending') bg-warning
                                    @elseif($order->status === 'processing') bg-info  
                                    @elseif($order->status === 'completed') bg-success
                                    @else bg-danger
                                    @endif text-uppercase">
                                    {{ __($order->status) }}
                                </span>
                            </td>
                            <td>{{ showCurrency(number_format($order->subtotal, 2)) }}</td>
                            <td>
                                @if($order->delivery_charge > 0)
                                    <span class="text-primary">{{ showCurrency(number_format($order->delivery_charge, 2)) }}</span>
                                @else
                                    <span class="text-success fw-medium">{{ __('Free') }}</span>
                                @endif
                            </td>
                            <td class="fw-bold">{{ showCurrency(number_format($order->total, 2)) }}</td>
                            <td>
                                <small class="text-muted">{{ $order->created_at->format('Y-m-d') }}</small><br>
                                <small class="text-muted">{{ $order->created_at->format('H:i') }}</small>
                            </td>
                            <td>
                                <div class="d-flex gap-1">
                                    <a href="{{ route('shop.guest-orders.show', $order->id) }}" 
                                       class="btn btn-sm btn-outline-primary" 
                                       title="{{ __('View Details') }}">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="{{ route('shop.guest-orders.invoice', $order->id) }}" 
                                       class="btn btn-sm btn-outline-success" 
                                       title="{{ __('Print Invoice') }}"
                                       target="_blank">
                                        <i class="fas fa-print"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="10" class="text-center py-4">
                                <div class="d-flex flex-column align-items-center">
                                    <i class="fas fa-shopping-cart fa-3x text-muted mb-3"></i>
                                    <h5 class="text-muted">{{ __('No guest orders found.') }}</h5>
                                    <p class="text-muted mb-0">{{ __('Guest orders will appear here when customers place orders.') }}</p>
                                </div>
                            </td>
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


