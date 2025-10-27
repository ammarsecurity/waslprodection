@extends('layouts.app')
@section('header-title', __('Province Delivery Charges Management'))
@section('content')
<div class="container">
    <h2 class="mb-4">{{ __('Province List and Delivery Prices') }}</h2>
    <a href="{{ route('admin.province_delivery_charges.create') }}" class="btn btn-primary mb-3">{{ __('Add New Province') }}</a>
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>{{ __('Province') }}</th>
                <th>{{ __('Delivery Price') }}</th>
                <th>{{ __('Actions') }}</th>
            </tr>
        </thead>
        <tbody>
            @foreach($charges as $charge)
            <tr>
                <td>{{ $charge->province_name }}</td>
                <td>{{ number_format($charge->delivery_charge, 2) }}</td>
                <td>
                    <a href="{{ route('admin.province_delivery_charges.edit', $charge->id) }}" class="btn btn-sm btn-warning">{{ __('Edit') }}</a>
                    <form action="{{ route('admin.province_delivery_charges.destroy', $charge->id) }}" method="POST" style="display:inline-block;">
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
@endsection
