@extends('layouts.app')
@section('content')
<div class="container-fluid">
    <div class="row mb-3">
        <div class="col">
            <h3 class="mb-0">{{ __('Edit Delivery Charge') }}</h3>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card mt-3">
                <div class="card-body">
                    <form action="{{ route('shop.province_delivery_charges.update', $charge->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="mb-3">
                            <label for="province_name" class="form-label">{{ __('Province Name') }}</label>
                            <input type="text" name="province_name" id="province_name" class="form-control" value="{{ $charge->province_name }}" required>
                        </div>
                        <div class="mb-3">
                            <label for="delivery_charge" class="form-label">{{ __('Delivery Charge') }}</label>
                            <input type="number" name="delivery_charge" id="delivery_charge" class="form-control" value="{{ $charge->delivery_charge }}" required min="0">
                        </div>
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">{{ __('Update') }}</button>
                            <a href="{{ route('shop.province_delivery_charges.index') }}" class="btn btn-secondary">{{ __('Cancel') }}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
