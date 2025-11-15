@extends('layouts.app')

@section('header-title', __('Add New Shop'))

@section('content')
    <div class="page-title">
        <div class="d-flex gap-2 align-items-center">
            <i class="fa-solid fa-shop"></i> {{ __('Add New Shop') }}
        </div>
    </div>
    <form action="{{ route('admin.shop.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <!--######## User Information ##########-->
        <div class="card mt-3">
            <div class="card-body">

                <div class="d-flex gap-2 border-bottom pb-2">
                    <i class="fa-solid fa-user"></i>
                    <h5>
                        {{ __('User Information') }}
                    </h5>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <x-input type="text" name="first_name" label="{{ __('First Name') }}" placeholder="{{ __('Enter owner first name') }}" required />
                    </div>
                    <div class="col-md-6">
                        <x-input type="text" name="last_name" label="{{ __('Last Name') }}" placeholder="{{ __('Enter owner last name') }}" />
                    </div>
                    <div class="col-md-6">
                        <x-input type="text" name="phone" label="{{ __('Phone Number') }}" placeholder="{{ __('Enter phone number') }}" required />
                    </div>
                    <div class="col-md-6">
                        <x-select label="{{ __('Gender') }}" name="gender">
                            <option value="">{{ __('Select Gender') }}</option>
                            <option value="male">{{ __('Male') }}</option>
                            <option value="female">{{ __('Female') }}</option>
                        </x-select>
                    </div>
                    <div class="col-md-12">
                        <x-input type="text" name="chat_id" label="{{ __('Chat ID') }}" placeholder="{{ __('Enter Chat ID') }}" />
                        <small class="form-text text-muted">
                            {{ __('هذا الحقل هو معرف الكروب أو القناة في تلغرام لاستلام إشعارات الطلبات تلقائياً.') }}
                        </small>
                    </div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center justify-content-center">
                            <div class="ratio1x1">
                                <img id="previewProfile" src="{{ asset('default/profile.jpg') }}" alt=""
                                    width="100%">
                            </div>
                        </div>
                        <div class="mt-3">
                            <x-file name="profile_photo" label="{{ __('User Profile Photo (Ratio 1:1)') }}" preview="previewProfile" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--######## Account Information ##########-->
        <div class="card mt-4">
            <div class="card-body">

                <div class="d-flex gap-2 border-bottom pb-2">
                    <i class="fa-solid fa-user"></i>
                    <h5>
                        {{ __('Account Information') }}
                    </h5>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <x-input type="email" name="email" label="Email" placeholder="Enter Email Address" required="true" />
                    </div>

                    <div class="col-md-4 mt-3 mt-md-0">
                        <x-input type="password" name="password" label="Password" placeholder="Enter Password" required="true" />
                    </div>

                    <div class="col-md-4 mt-3 mt-md-0">
                        <x-input type="password" name="password_confirmation" label="Confirm Password"
                            placeholder="Enter Confirm Password" required="true" />
                    </div>
                </div>
            </div>
        </div>

        <!--######## Shop Information ##########-->
        <div class="card mt-4 mb-4">
            <div class="card-body">

                <div class="d-flex gap-2 border-bottom pb-2">
                    <i class="fa-solid fa-user"></i>
                    <h5>
                        {{ __('Shop Information') }}
                    </h5>
                </div>
                @php
                    $appHost = parse_url(config('app.url'), PHP_URL_HOST) ?? request()->getHost();
                    $appHost = preg_replace('/^www\./', '', $appHost);
                @endphp
                <div class="row mt-3">
                    <div class="col-md-6">
                        <x-input type="text" name="shop_name" label="{{ __('Shop Name') }}" placeholder="{{ __('Enter Shop Name') }}" required />
                    </div>
                    <div class="col-md-6">
                        <x-input type="text" name="address" label="{{ __('Address') }}" placeholder="{{ __('Enter Address') }}" />
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <x-input type="text" name="slug" label="{{ __('Shop Slug') }}" placeholder="{{ __('auto-generated if empty') }}" value="{{ old('slug') }}" />
                        <small class="form-text text-muted">
                            {{ __('Used to build internal links (e.g. /shops/slug). Lowercase letters, numbers and dashes only.') }}
                        </small>
                    </div>
                    <div class="col-md-4 mt-3 mt-md-0">
                        <x-input type="text" name="subdomain" label="{{ __('Subdomain') }}" placeholder="{{ __('example') }}" value="{{ old('subdomain') }}" class="domain-dependent" />
                        <small class="form-text text-muted">
                            {{ __('A URL of the form') }} https://{{ __('subdomain') }}.{{ $appHost }}
                        </small>
                    </div>
                    <div class="col-md-4 mt-3 mt-md-0">
                        <x-input type="text" name="custom_domain" label="{{ __('Custom Domain') }}" placeholder="{{ __('shop.example.com') }}" value="{{ old('custom_domain') }}" class="domain-dependent" />
                        <small class="form-text text-muted">
                            {{ __('Enter a full domain that already points (DNS + SSL) to this shop.') }}
                            <a class="ms-1" data-bs-toggle="collapse" href="#customDomainHelpCreate" role="button" aria-expanded="false" aria-controls="customDomainHelpCreate">
                                {{ __('Show details') }}
                            </a>
                        </small>
                        <div class="collapse mt-2" id="customDomainHelpCreate">
                            <div class="small text-muted border rounded p-2">
                                <ol class="mb-1">
                                    <li>{{ __('Add an A/ALIAS record that points your domain to this server IP.') }}</li>
                                    <li>{{ __('Configure an SSL certificate for the domain (Let\'s Encrypt or other).') }}</li>
                                    <li>{{ __('After DNS propagation, enter the domain here and save the shop.') }}</li>
                                </ol>
                                <span class="fw-semibold">{{ __('Note: DNS propagation may take a few minutes to hours.') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <input type="hidden" name="is_root_shop" value="0">
                        <div class="form-check form-switch mt-2">
                            <input class="form-check-input" type="checkbox" role="switch" id="isRootShop" name="is_root_shop" value="1" {{ old('is_root_shop') ? 'checked' : '' }}>
                            <label class="form-check-label fw-semibold" for="isRootShop">{{ __('Set as Root Shop') }}</label>
                        </div>
                        <small class="form-text text-muted">
                            {{ __('This shop will act as the main marketplace domain. Only one shop can be root at a time.') }}
                        </small>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="d-flex align-items-center justify-content-center mb-2">
                            <div class="ratio1x1">
                                <img src="{{ asset('default/default.jpg') }}" id="previewShopLogo" alt=""
                                    width="100%">
                            </div>
                        </div>
                        <x-file name="shop_logo" label="{{ __('Shop Logo (Ratio 1:1)') }}" preview="previewShopLogo" required />
                    </div>

                    <div class="col-md-6">
                        <div class="d-flex align-items-center justify-content-center mb-2">
                            <div class="ratio4x1">
                                <img src="{{ asset('default/default.jpg') }}" id="shopBanner" alt=""
                                    width="100%">
                            </div>
                        </div>
                        <x-file name="shop_banner" label="{{ __('Shop Banner (Ratio 4:1)') }}" preview="shopBanner" />
                    </div>
                </div>

                <div class="mt-3">
                    <label for="description" class="form-label">{{ __('Description') }}</label>
                    <textarea name="description" class="form-control @error('description') is-invalid @enderror" 
                        id="description" rows="3" placeholder="{{ __('Enter shop description') }}" 
                        onkeyup="checkDescription()" maxlength="200">{{ old('description') }}</textarea>
                    @error('description')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                    <div class="form-text">
                        <span id="charCount">0</span>/200 {{ __('characters') }}
                    </div>
                </div>

                <div class="d-flex justify-content-end mt-4">
                    <button class="btn btn-primary py-2 px-5">
                        {{ __('Submit') }}
                    </button>
                </div>

            </div>
        </div>
    </form>
@endsection
@push('scripts')
    <script>
        function checkDescription() {
            const description = document.getElementById('description');
            const charCount = document.getElementById('charCount');
            const maxLength = 200;
            
            const currentLength = description.value.length;
            charCount.textContent = currentLength;
            
            if (currentLength > maxLength) {
                charCount.style.color = 'red';
                description.classList.add('is-invalid');
            } else {
                charCount.style.color = 'inherit';
                description.classList.remove('is-invalid');
            }
        }
        
        // Initialize character count on page load
        document.addEventListener('DOMContentLoaded', function() {
            checkDescription();
            const rootToggle = document.getElementById('isRootShop');
            const domainInputs = document.querySelectorAll('.domain-dependent');

            const toggleDomainInputs = () => {
                const disabled = rootToggle.checked;
                domainInputs.forEach(input => input.disabled = disabled);
            };

            if (rootToggle) {
                rootToggle.addEventListener('change', toggleDomainInputs);
                toggleDomainInputs();
            }
        });
    </script>
@endpush
