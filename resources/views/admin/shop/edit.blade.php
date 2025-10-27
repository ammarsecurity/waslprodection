@extends('layouts.app')

@section('header-title', __('Edit Shop'))

@section('content')
    <div class="page-title">
        <div class="d-flex gap-2 align-items-center">
            <i class="fa-solid fa-shop"></i>{{__('Edit Shop')}}
        </div>
    </div>

    <!-- نموذج معلومات المستخدم والحساب -->
    <form action="{{ route('admin.shop.update_user', $shop->user?->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="card mt-3">
            <div class="card-body">
                <div class="d-flex gap-2 border-bottom pb-2">
                    <i class="fa-solid fa-user"></i>
                    <h5>{{ __('User Information') }}</h5>
                </div>
                <div class="row">
                    <div class="col-md-3">
                    <div class="mt-3">
                            <x-input type="text" name="first_name" label="{{ __('First Name') }}" placeholder="{{ __('Enter first name') }}" value="{{ $shop->user?->name }}" required />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mt-3">
                            <x-input label="Last Name" name="last_name" type="text" placeholder="{{ __('Enter last name') }}" :value="$shop->user?->last_name" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mt-3">
                            <x-input label="Phone Number" name="phone" type="number" placeholder="{{ __('Enter phone number') }}" :value="$shop->user?->phone" required="true" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mt-3">
                            <x-select label="Gender" name="gender">
                                <option value="male" {{ __($shop->user?->gender ?? '') == 'male' ? 'selected' : '' }}>{{ __('Male') }}</option>
                                <option value="female" {{ __($shop->user?->gender ?? '') == 'female' ? 'selected' : '' }}>{{ __('Female') }}</option>
                            </x-select>
                        </div>
                    </div>
                </div>
             
                <div class="col-lg-12">
                    <div class="mt-3 d-flex align-items-center justify-content-center">
                        <div class="ratio1x1">
                            <img id="previewProfile" src="{{ $shop->user?->thumbnail ?? asset('default/default.jpg') }}" alt="" width="100%">
                        </div>
                    </div>
                    <div class="mt-3">
                        <x-file name="profile_photo" label="User profile (Ratio 1:1)" preview="previewProfile" />
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-4">
            <div class="card-body">
                <div class="d-flex gap-2 border-bottom pb-2">
                    <i class="fa-solid fa-user"></i>
                    <h5>{{ __('Account Information') }}</h5>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <x-input type="email" name="email" label="Email" placeholder="{{ __('Enter Email Address') }}" :value="$shop->user?->email" required="true" />
                    </div>
                    <div class="col-md-4 mt-3 mt-md-0">
                        <x-input type="password" name="password" label="Password" placeholder="{{ __('Enter Password') }}" />
                    </div>
                    <div class="col-md-4 mt-3 mt-md-0">
                        <x-input type="password" name="password_confirmation" label="Confirm Password" placeholder="{{ __('Enter Confirm Password') }}" />
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-4">
                    <button class="btn btn-success py-2 px-5">
                        {{ __('Update User') }}
                    </button>
                </div>
            </div>
        </div>
    </form>
    <!-- نموذج معلومات المتجر -->
    <form action="{{ route('admin.shop.update_info', $shop->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="card mt-4 mb-4">
            <div class="card-body">
                <div class="d-flex gap-2 border-bottom pb-2">
                    <i class="fa-solid fa-user"></i>
                    <h5>{{ __('Shop Information') }}</h5>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <x-input type="text" name="shop_name" label="Shop Name" placeholder="{{ __('Enter Shop Name') }}" :value="$shop->name" required="true" />
                    </div>
                    <div class="col-md-4 mt-3 mt-md-0">
                        <x-input type="text" name="address" label="Address" placeholder="{{ __('Enter Address') }}" :value="$shop->address" />
                    </div>
                    <div class="col-md-4">
                            <x-input type="text" name="chat_id" label="{{ __('Chat ID') }}" placeholder="{{ __('Enter Chat ID') }}" value="{{ $shop->chat_id }}" />
                            <small class="form-text text-muted">
                                {{ __('هذا الحقل هو معرف الكروب أو القناة في تلغرام لاستلام إشعارات الطلبات تلقائياً.') }}
                            </small>
                    </div>

                    <div class="col-md-6 mt-4">
                        <div class="d-flex align-items-center justify-content-center mb-2">
                            <div class="ratio1x1">
                                <img src="{{ $shop->logo ?? asset('default/default.jpg') }}" id="previewShopLogo" alt="" width="100%">
                            </div>
                        </div>
                        <x-file name="shop_logo" label="Shop logo(Ratio 1:1)" preview="previewShopLogo" />
                    </div>
                   
                    <div class="col-md-6 mt-4">
                        <div class="d-flex align-items-center justify-content-center mb-2">
                            <div class="ratio4x1">
                                <img src="{{ $shop->banner ?? asset('default/default.jpg') }}" id="shopBanner" alt="" width="100%">
                            </div>
                        </div>
                        <x-file name="shop_banner" label="Shop banner Ratio 4:1 (2000 x 500 px)" preview="shopBanner" />
                    </div>
                </div>
                <div class="mt-3">
                    <label for="">
                        {{ __('Description') }}
                    </label>
                    <textarea name="description" class="form-control" id="description" rows="2" placeholder="{{ __('Enter Description') }}" onkeyup="checkDescription()">{{ old('description') ?? $shop->description }}</textarea>
                    @error('description')
                        <p class="text text-danger m-0" id="errorDescription">{{ $message }}</p>
                    @enderror
                    <p class="text text-danger m-0" id="descriptionError"></p>
                </div>
                <div class="d-flex justify-content-end mt-4">
                    <button class="btn btn-primary py-2 px-5">
                        {{ __('Update Shop') }}
                    </button>
                </div>
            </div>
        </div>
    </form>
@endsection
@push('scripts')
    <script>
        function checkDescription() {
            var errDescription = document.getElementById('errorDescription');
            if(errDescription){
                errDescription.remove();
            }

            if(document.getElementById('description').value.length > 200){
                document.getElementById('descriptionError').innerHTML = 'Description must be less than or equal to 220 characters';
            }else{
                document.getElementById('descriptionError').innerHTML = '';
            }
        }
    </script>
@endpush
