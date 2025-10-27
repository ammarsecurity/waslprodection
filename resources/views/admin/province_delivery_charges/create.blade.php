@extends('layouts.app')
@section('header-title', __('Add New Province'))
@section('content')
<div class="container">
    <h2 class="mb-4">{{ __('Add New Province') }}</h2>
    <form action="{{ route('admin.province_delivery_charges.store') }}" method="POST">
        @csrf
        <div class="form-group mb-3">
            <label for="province_name">{{ __('Province Name') }}</label>
            <input type="text" name="province_name" id="province_name" class="form-control" required>
        </div>
        <div class="form-group mb-3">
            <label for="delivery_charge">{{ __('Delivery Charge') }}</label>
            <input type="number" name="delivery_charge" id="delivery_charge" class="form-control" step="0.01" min="0" required>
        </div>
        <button type="submit" class="btn btn-success">{{ __('Save') }}</button>
        <a href="{{ route('admin.province_delivery_charges.index') }}" class="btn btn-secondary">{{ __('Cancel') }}</a>
    </form>
</div>
@endsection
