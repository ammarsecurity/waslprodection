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
    <title>{{ $generaleSetting?->title ?? config('app.name', 'Laravel') }} {{ __('Admin Login') }}</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="">

    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/login.css') }}">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
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

    .logo_right img {
        height: 90px;
    }

    .logo_right {
        position: absolute;
        top: 15%;
        right: 47%;
        transform: translateX(47%);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 0;
    }

    .logo_right .site_name {
        font-size: 26px;
        font-weight: 900;
        color: #848589;
        text-transform: capitalize;
        text-align: center;
        letter-spacing: 0.5px;
        font-family: 'Cairo', sans-serif;
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

<body style="background: url({{ asset('assets/images/admin-bg.svg') }})">

    <!-- Language Toggle Button -->
    <div class="language-toggle" onclick="toggleLanguage()">
        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
        </svg>
        <span id="langText">English</span>
    </div>

    <section class="login-section">

        <div class="thumbnail position-relative text-primary">
            <img src="{{ asset('assets/images/login.svg') }}" alt="thumbnail" width="100%" loading="lazy" />
            <div class="logo_right">
                <img src="{{ $generaleSetting?->favicon ?? asset('assets/favicon.png') }}" alt="logo"
                    loading="lazy" />
                <span class="site_name">{{ $generaleSetting?->name ?? config('app.name') }}</span>
            </div>
        </div>

        <!-- Login Card -->
        <div class="card loginCard">
            <div class="card-body">
                @if (app()->isLocal())
                    <div class="d-flex justify-content-between align-items-center gap-2">
                        <span class="powerBy">Powered by <a class="text-primary text-decoration-none fw-bold"
                                href="https://razinsoft.com/" target="_blank">RazinSoft</a>
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
                        <span class="fw-bold text-primary text-capitalize">
                            {{ $generaleSetting?->name ?? config('app.name', 'Laravel') }}
                        </span>
                    </p>

                    <h2 class="pageTitle">{{ __('Login To Admin') }}</h2>
                </div>

                <hr>

                <form action="{{ route('admin.login.submit') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="email">{{ __('Enter Address') }}</label>
                        <input type="email" value="{{ old('email') }}" name="email" id="email"
                            class="form-control" placeholder="{{ __('Enter Email Address') }}">

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
                                placeholder="{{ __('Enter Password') }}">
                            <span class="eye" onclick="showHidePassword()">
                                <svg id="togglePassword" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                                    <circle cx="12" cy="12" r="3"/>
                                </svg>
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

                    @if (app()->isLocal())
                        <div class="credentials-section">
                            <div class="item">
                                <div class="header">{{ __('Admin Credentials') }}</div>
                                <div class="content">
                                    <div class="credentials">
                                        <span>{{ __('Email') }}: root@readyecommerce.com</span>
                                        <span>{{ __('Password') }}: secret</span>
                                    </div>
                                    <div class="copyBtn" onclick="loginAdmin()">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
                                            <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="header">{{ __('Shop Credentials') }}</div>
                                <div class="content">
                                    <div class="credentials">
                                        <span>{{ __('Email') }}: shop@readyecommerce.com</span>
                                        <span>{{ __('Password') }}: secret</span>
                                    </div>
                                    <div class="copyBtn" onclick="gotoShopLogin()">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
                                            <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
                                        </svg>
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
            
            // toggle the SVG icon
            if (type === "password") {
                toggle.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
            } else {
                toggle.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';
            }
        }

        var email = document.getElementById("email");
        var password = document.getElementById("password");

        function loginAdmin() {
            email.value = 'root@readyecommerce.com';
            password.value = 'secret';

            if (!sessionStorage.getItem('fromShop')) {
                Toast.fire({
                    icon: 'success',
                    title: '{{ __('Admin Credentials Copied') }}'
                });
            }
        }

        const checkSession = () => {
            if (sessionStorage.getItem('fromShop')) {
                loginAdmin();
                sessionStorage.removeItem('fromShop');
            }
        }

        const gotoShopLogin = () => {
            sessionStorage.setItem('fromAdmin', true);
            window.open("{{ route('shop.login') }}", '_blank');
        }

        checkSession();

        // Language Toggle Function
        function toggleLanguage() {
            const currentLang = document.documentElement.lang;
            const newLang = currentLang === 'ar' ? 'en' : 'ar';
            const newDir = newLang === 'ar' ? 'rtl' : 'ltr';
            
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

</body>

</html>
