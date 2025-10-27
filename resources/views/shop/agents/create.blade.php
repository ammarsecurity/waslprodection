@extends('layouts.app')

@section('header-title', __('Add Agent'))

@section('content')
    <div class="page-title">
        <div class="d-flex gap-2 align-items-center">
            <i class="fa fa-users"></i> {{__('Add New Agent')}}
        </div>
    </div>
    
    <form action="{{ route('shop.agents.store') }}" method="POST">
        @csrf
        <div class="row">
            <div class="col-md-6">
                <div class="card mt-3 h-100">
                    <div class="card-body">
                        <div class="">
                            <x-input 
                                label="Agent Email or Phone" 
                                name="identifier" 
                                type="text" 
                                placeholder="{{ __('Enter customer email or phone number') }}" 
                                required="true"
                            />
                            <small class="text-muted">
                                {{ __('Enter the email or phone number of an existing customer to make them an agent') }}
                            </small>
                        </div>

                        <div class="col-12 d-flex justify-content-end mt-4">
                            <a href="{{ route('shop.agents.index') }}" class="btn btn-secondary me-2 py-2 px-5">
                                {{ __('Cancel') }}
                            </a>
                            <button type="submit" class="btn btn-primary py-2 px-5">
                                {{ __('Add Agent') }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
@endsection

