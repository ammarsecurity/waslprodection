@extends('layouts.app')
@section('content')
<div class="container-fluid">
    <div class="row mb-3">
        <div class="col">
            <h3 class="mb-0">{{ __('Province Delivery Charges Management') }}</h3>
        </div>
        <div class="col-auto">
            <a href="{{ route('shop.province_delivery_charges.create') }}" class="btn btn-primary mb-3">{{ __('Add New Delivery Charge') }}</a>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card mt-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>{{ __('Province') }}</th>
                                    <th>{{ __('Delivery Charge') }}</th>
                                    <th>{{ __('Actions') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($provinceDeliveryCharges as $charge)
                                <tr>
                                    <td>{{ $charge->province_name }}</td>
                                    <td>{{ number_format($charge->delivery_charge) }}</td>
                                    <td>
                                        <a href="{{ route('shop.province_delivery_charges.edit', $charge->id) }}" class="btn btn-sm btn-warning">{{ __('Edit') }}</a>
                                        <form action="{{ route('shop.province_delivery_charges.destroy', $charge->id) }}" method="POST" style="display:inline-block;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('{{ __('Are you sure you want to delete?') }}')">{{ __('Delete') }}</button>
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
