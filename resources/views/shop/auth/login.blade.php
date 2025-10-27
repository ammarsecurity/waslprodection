<!doctype html>
<html lang="{{ session('locale', 'ar') }}" dir="{{ session('locale', 'ar') === 'ar' ? 'rtl' : 'ltr' }}">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="{{ session('locale', 'ar') }}">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- App favicon -->
    <link rel="shortcut icon" type="image/png" href="{{ $generaleSetting?->favicon ?? asset('assets/favicon.png') }}" />

    <!-- App title -->
    <title>{{ $generaleSetting?->title ?? config('app.name', 'ReadyEcommerce') }} Shop Login</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description"
        content="{{ $generaleSetting?->name ?? config('app.name', 'ReadyEcommerce') }} shop pannel login">

    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/login.css') }}">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    
    <style>
        * {
            font-family: 'Cairo', 'Inter', sans-serif !important;
        }
        
        [dir="rtl"] body {
            direction: rtl;
            text-align: right;
        }

        [dir="ltr"] body {
            direction: ltr;
            text-align: left;
        }
        
        [dir="rtl"] .loginCard {
            text-align: right;
        }

        [dir="ltr"] .loginCard {
            text-align: left;
        }
        
        [dir="rtl"] .form-control {
            text-align: right;
        }

        [dir="ltr"] .form-control {
            text-align: left;
        }
        
        [dir="rtl"] .form-control::placeholder {
            text-align: right;
        }

        [dir="ltr"] .form-control::placeholder {
            text-align: left;
        }
        
        .credentials-section .item .content {
            flex-direction: row-reverse;
        }
        
        .credentials-section .item .content .credentials {
            text-align: right;
        }
        
        .d-flex {
            flex-direction: row-reverse;
        }
        
        .justify-content-between {
            justify-content: space-between;
        }
        
        .align-items-center {
            align-items: center;
        }
        
        .gap-2 > * + * {
            margin-right: 0.5rem;
            margin-left: 0;
        }
        
        .mt-2 {
            margin-top: 0.5rem;
        }
        
        .mb-3 {
            margin-bottom: 1rem;
        }
        
        .text-center {
            text-align: center !important;
        }
        
        .pagePera {
            text-align: center;
        }
        
        .pageTitle {
            text-align: center;
        }
        
        .passwordInput .eye {
            left: 10px;
            right: auto;
        }
        
        .credentials-section .copyBtn {
            margin-left: 0;
            margin-right: 10px;
        }
        
        .powerBy {
            text-align: left;
        }
        
        .version {
            text-align: right;
        }
        
        .d-flex.justify-content-between {
            flex-direction: row;
        }
        
        .d-flex.justify-content-between .powerBy {
            text-align: left;
        }
        
        .d-flex.justify-content-between .version {
            text-align: right;
        }

        .language-toggle {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 8px 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .language-toggle:hover {
            background: #f8fafc;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .language-toggle svg {
            width: 20px;
            height: 20px;
            color: #64748b;
        }

        .language-toggle span {
            font-size: 14px;
            font-weight: 500;
            color: #475569;
        }
    </style>
</head>

<body style="background: url({{ asset('assets/images/shop-bg.svg') }})">

    <!-- Language Toggle Button -->
    <div class="language-toggle" onclick="toggleLanguage()">
        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
        </svg>
        <span id="langText">English</span>
    </div>

    <section class="login-section">

        <div class="thumbnail">
            <img src="{{ asset('assets/images/shop-login.png') }}" alt="thumbnail" width="100%">
        </div>

        <!-- Login Card -->
        <div class="card loginCard">
            <div class="card-body">
                @if (app()->isLocal())
                    <div class="d-flex justify-content-between align-items-center gap-2">
                        <span class="powerBy">Powered by <a class="text-primary text-decoration-none fw-bold"
                                href="#" target="_blank">Tanfeeth Technologies</a>
                            ©{{ date('Y') }}</span>
                        <span class="version fw-bold">v{{ config('app.version') }}</span>
                    </div>
                @endif

                <div class="text-center mt-4">
                    <img src="{{ $generaleSetting?->logo ?? asset('assets/logo.png') }}" alt="" height="80"
                        style="max-width: 100%">
                </div>

                <div class="page-content text-center mb-4">
                    <p class="pagePera my-3">
                        {{ __('Welcome to') }}
                        <span
                            class="fw-bold text-primary">{{ $generaleSetting?->name ?? config('app.name', 'Laravel') }}</span>
                    </p>

                    <h2 class="pageTitle">{{ __('Login To Shop') }}</h2>
                </div>

                <hr>

                <form action="{{ route('shop.login.submit') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="email">{{ __('Enter Address') }}</label>
                        <input type="email" value="{{ old('email') }}" name="email" id="email"
                            class="form-control" placeholder="{{ __('Enter Email Address') }}" value="{{ old('email') }}">

                        @error('email')
                            <span class="text text-danger" role="alert">
                                <span>{{ $message }}</span>
                            </span>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="password">{{ __('Password') }}</label>
                        <div class="position-relative passwordInput">
                            <input type="password" name="password" id="password" class="form-control"
                                placeholder="{{ __('Enter Password') }}" value="{{ old('password') }}">
                            <span class="eye" onclick="showHidePassword()">
                                <i class="fa fa-eye-slash" id="togglePassword"></i>
                            </span>
                        </div>
                        @error('password')
                            <span class="text text-danger" role="alert">
                                <span>{{ $message }}</span>
                            </span>
                        @enderror
                    </div>

                    @if ($GoogleReCaptcha?->is_active)
                        <div>
                            <div class="g-recaptcha" data-sitekey="{{ $GoogleReCaptcha?->site_key }}"></div>
                        </div>
                        @error('g-recaptcha-response')
                            <span class="text text-danger">{{ $message }}</span>
                        @enderror
                    @endif

                    <button class="btn loginButton" type="submit">{{ __('Login') }}</button>

                    @if (!app()->isLocal())
                        <div class="mt-2 d-flex justify-content-between align-items-center flex-wrap gap-2">
                            <a href="{{ route('shop.register') }}"
                                class="btn btn-sm btn-outline-primary text-decoration-none">{{ __('Register As Seller') }}</a>
                        </div>
                    @endif

                    @if (app()->isLocal())
                        <div class="credentials-section">
                            <div class="item">
                                <div class="header">{{ __('Shop Credentials') }}</div>
                                <div class="content">
                                    <div class="credentials">
                                        <span>{{ __('Email') }}: shop@readyecommerce.com</span>
                                        <span>{{ __('Password') }}: secret</span>
                                    </div>
                                    <div class="copyBtn" onclick="loginShop()">
                                        <i class="fa-regular fa-copy"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="header">{{ __('Admin Credentials') }}</div>
                                <div class="content">
                                    <div class="credentials">
                                        <span>{{ __('Email') }}: root@readyecommerce.com</span>
                                        <span>{{ __('Password') }}: secret</span>
                                    </div>
                                    <div class="copyBtn" onclick="gotoAdminLogin()">
                                        <i class="fa-regular fa-copy"></i>
                                    </div>
                                </div>
                            </div>

                        </div>
                    @endif
                </form>
            </div>
        </div>
    </section>
    <script src="{{ asset('assets/scripts/sweetalert2.min.js') }}"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var themeColor = "{{ $generaleSetting?->primary_color ?? '#EE456B' }}";
            document.documentElement.style.setProperty('--theme_color', themeColor);
        });

        const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
            }
        });

        function showHidePassword() {
            const toggle = document.getElementById("togglePassword");
            const password = document.getElementById("password");

            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);
            // toggle the icon
            toggle.classList.toggle("fa-eye");
            toggle.classList.toggle("fa-eye-slash");
        }

        var email = document.getElementById("email");
        var password = document.getElementById("password");

        const checkSession = () => {
            if (sessionStorage.getItem('fromAdmin')) {
                loginShop();
                sessionStorage.removeItem('fromAdmin');
            }
        }

        function loginShop() {
            email.value = 'shop@readyecommerce.com';
            password.value = 'secret';

            if (!sessionStorage.getItem('fromAdmin')) {
                Toast.fire({
                    icon: 'success',
                    title: '{{ __('Shop Credentials Copied') }}'
                });
            }
        }

        function gotoAdminLogin() {
            sessionStorage.setItem('fromShop', true);
            window.open("{{ route('admin.login') }}", '_blank');
        }

        checkSession();

        // Language Toggle Function
        function toggleLanguage() {
            const currentLang = document.documentElement.lang;
            const newLang = currentLang === 'ar' ? 'en' : 'ar';
            
            // Change language via server
            window.location.href = "{{ route('change.language') }}?language=" + newLang;
        }

        // Update button text based on current language
        document.addEventListener("DOMContentLoaded", function() {
            const currentLang = document.documentElement.lang;
            const langText = document.getElementById('langText');
            if (currentLang === 'ar') {
                langText.textContent = 'English';
            } else {
                langText.textContent = 'العربية';
            }
        });
    </script>

    @if (session('successAlert'))
        <script>
            Swal.fire({
                icon: 'success',
                title: '{{ __('Registration Successful') }}',
                text: "{{ session('successAlert') }}"
            });
        </script>
    @endif

    @if (session('error'))
        <script>
            Swal.fire({
                icon: 'error',
                title: "{{ __('Oops...') }}",
                text: "{{ session('error') }}"
            });
        </script>
    @endif
</body>

</html>
