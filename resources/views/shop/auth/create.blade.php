<!doctype html>
<html lang="ar" dir="rtl">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="ar">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- App favicon -->
    <link rel="shortcut icon" type="image/png" href="{{ $generaleSetting?->favicon ?? asset('assets/favicon.png') }}" />

    <!-- App title -->
    <title>{{ $generaleSetting?->title ?? config('app.name', 'ReadyEcommerce') }} {{ __('Become A Seller') }}</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description"
        content="{{ $generaleSetting?->name ?? config('app.name', 'ReadyEcommerce') }} {{ __('Become A Seller') }}">

    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/login.css') }}">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<style>
    * {
        font-family: 'Cairo', 'Inter', sans-serif !important;
    }
    
    body {
        direction: rtl;
        text-align: right;
    }
    
    .registerCard {
        text-align: right;
    }
    
    .form-control {
        text-align: right;
    }
    
    .form-control::placeholder {
        text-align: right;
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

    .main-container {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .register-card {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(20px);
        box-shadow: var(--shadow-xl);
        width: 100%;
        max-width: 1200px;
        overflow: hidden;
        animation: slideInUp 0.8s ease-out;
    }

    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(50px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .card-header {
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
        color: white;
        padding: 2rem;
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .card-header::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
        opacity: 0.3;
    }

    .card-header h1 {
        font-size: 2.5rem;
        font-weight: 700;
        margin: 0;
        position: relative;
        z-index: 1;
    }

    .card-header p {
        font-size: 1.1rem;
        opacity: 0.9;
        margin: 0.5rem 0 0 0;
        position: relative;
        z-index: 1;
    }

    .card-body {
        padding: 3rem;
    }

    .progress-container {
        margin-bottom: 3rem;
    }

    .progress-steps {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 2rem;
        position: relative;
    }

    .progress-line {
        position: absolute;
        top: 50%;
        left: 0;
        right: 0;
        height: 2px;
        background: var(--border-color);
        z-index: 1;
    }

    .progress-line-fill {
        height: 100%;
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        transition: width 0.5s ease;
        border-radius: 1px;
    }

    .step-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 0.5rem;
        position: relative;
        z-index: 2;
    }

    .step-number {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        background: white;
        border: 3px solid var(--border-color);
        color: var(--text-secondary);
    }

    .step-item.active .step-number {
        background: var(--primary-color);
        border-color: var(--primary-color);
        color: white;
        transform: scale(1.1);
        box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.2);
    }

    .step-item.completed .step-number {
        background: var(--accent-color);
        border-color: var(--accent-color);
        color: white;
    }

    .step-item.completed .step-number::before {
        content: '✓';
        font-size: 1.2rem;
    }

    .step-label {
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--text-secondary);
        text-align: center;
    }

    .step-item.active .step-label {
        color: var(--primary-color);
        font-weight: 600;
    }

    .form-section {
        background: white;
        border-radius: 16px;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-sm);
        border: 1px solid var(--border-color);
        transition: all 0.3s ease;
        direction: ltr !important;
    }

    .form-section:hover {
        box-shadow: var(--shadow-md);
        transform: translateY(-2px);
    }

    .section-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 1.5rem;
        padding-bottom: 0.5rem;
        border-bottom: 2px solid var(--primary-color);
        display: inline-block;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-label {
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 0.5rem;
        display: block;
        font-size: 0.95rem;
    }

    .form-control {
        width: 100%;
        padding: 0.875rem 1rem;
        border: 2px solid var(--border-color);
        border-radius: 12px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: white;
        text-align: right;
    }

    .form-control:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
        transform: translateY(-1px);
    }

    .form-control::placeholder {
        color: var(--text-secondary);
        text-align: right;
    }

    .form-control.is-invalid {
        border-color: #ef4444;
        box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
    }

    .invalid-feedback {
        color: #ef4444;
        font-size: 0.875rem;
        margin-top: 0.25rem;
        display: block;
    }

    .file-upload-area {
        border: 2px dashed var(--border-color);
        border-radius: 12px;
        padding: 2rem;
        text-align: center;
        transition: all 0.3s ease;
        cursor: pointer;
        background: var(--secondary-color);
    }

    .file-upload-area:hover {
        border-color: var(--primary-color);
        background: rgba(99, 102, 241, 0.05);
    }

    .file-upload-area.dragover {
        border-color: var(--primary-color);
        background: rgba(99, 102, 241, 0.1);
        transform: scale(1.02);
    }

    .preview-container {
        margin-top: 1rem;
        text-align: center;
    }

    .preview-image {
        width: 120px;
        height: 120px;
        object-fit: cover;
        border-radius: 12px;
        box-shadow: var(--shadow-md);
        transition: transform 0.3s ease;
        margin-bottom: 24px;
    }

    .preview-image:hover {
        transform: scale(1.05);
    }

    .btn {
        padding: 0.875rem 2rem;
        border-radius: 12px;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
        text-align: center;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 0.5rem;
        text-decoration: none;
    }

    .btn-primary {
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
        color: white;
        box-shadow: var(--shadow-md);
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-lg);
        background: linear-gradient(135deg, var(--primary-dark) 0%, #3730a3 100%);
    }

    .btn-secondary {
        background: white;
        color: var(--text-primary);
        border: 2px solid var(--border-color);
    }

    .btn-secondary:hover {
        background: var(--secondary-color);
        border-color: var(--primary-color);
        transform: translateY(-1px);
    }

    .btn:disabled {
        opacity: 0.6;
        cursor: not-allowed;
        transform: none !important;
    }

    .action-buttons {
        display: flex;
        gap: 1rem;
        justify-content: flex-end;
        margin-top: 2rem;
    }

    .back-btn {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: var(--text-secondary);
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
        padding: 0.5rem 1rem;
        border-radius: 8px;
    }

    .back-btn:hover {
        color: var(--primary-color);
        background: rgba(99, 102, 241, 0.1);
        transform: translateX(-2px);
    }

    .gender-options {
        display: flex;
        gap: 1rem;
    }

    .gender-option {
        flex: 1;
        padding: 1rem;
        border: 2px solid var(--border-color);
        border-radius: 12px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease;
        background: white;
    }

    .gender-option:hover {
        border-color: var(--primary-color);
        background: rgba(99, 102, 241, 0.05);
    }

    .gender-option.selected {
        border-color: var(--primary-color);
        background: rgba(99, 102, 241, 0.1);
        color: var(--primary-color);
        font-weight: 600;
    }

    .gender-option input[type="radio"] {
        display: none;
    }

    .loading-spinner {
        display: none;
        width: 20px;
        height: 20px;
        border: 2px solid transparent;
        border-top: 2px solid currentColor;
        border-radius: 50%;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }

    .btn.loading .loading-spinner {
        display: inline-block;
    }

    .btn.loading .btn-text {
        display: none;
    }

    /* RTL Adjustments */
    .row {
        flex-direction: row-reverse;
    }

    .d-flex {
        flex-direction: row-reverse;
    }

    .justify-content-between {
        flex-direction: row;
    }

    .align-items-center {
        align-items: center;
    }

    .text-center {
        text-align: center !important;
    }

    .col-md-6,
    .col-md-7,
    .col-md-5,
    .col-md-12 {
        text-align: right;
    }

    .ratio1x1,
    .ratio4x1 {
        text-align: center;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .main-container {
            padding: 10px;
        }

        .card-header {
            padding: 1.5rem;
        }

        .card-header h1 {
            font-size: 2rem;
        }

        .card-body {
            padding: 1.5rem;
        }

        .progress-steps {
            gap: 1rem;
        }

        .step-number {
            width: 40px;
            height: 40px;
            font-size: 1rem;
        }

        .form-section {
            padding: 1.5rem;
        }

        .action-buttons {
            flex-direction: column;
        }

        .btn {
            width: 100%;
        }

        .gender-options {
            flex-direction: column;
        }
    }

    @media (max-width: 480px) {
        .card-header h1 {
            font-size: 1.75rem;
        }

        .card-body {
            padding: 1rem;
        }

        .form-section {
            padding: 1rem;
        }

        .progress-steps {
            gap: 0.5rem;
        }

        .step-number {
            width: 35px;
            height: 35px;
            font-size: 0.9rem;
        }
    }

    /* Animation Classes */
    .fade-in {
        animation: fadeIn 0.5s ease-in;
    }

    .slide-in-right {
        animation: slideInRight 0.5s ease-out;
    }

    .slide-in-left {
        animation: slideInLeft 0.5s ease-out;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

    @keyframes slideInRight {
        from {
            opacity: 0;
            transform: translateX(30px);
        }

        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes slideInLeft {
        from {
            opacity: 0;
            transform: translateX(-30px);
        }

        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    /* Success Animation */
    .success-checkmark {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background: var(--accent-color);
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1rem;
        animation: scaleIn 0.5s ease-out;
    }

    .success-checkmark svg {
        color: white;
        width: 50px;
        height: 50px;
    }

    @keyframes scaleIn {
        0% {
            transform: scale(0);
        }

        50% {
            transform: scale(1.2);
        }

        100% {
            transform: scale(1);
        }
    }
</style>

<body style="background: url({{ asset('assets/images/shop-bg.svg') }})">

    <section class="login-section">

        <div class="thumbnail">
            <img src="{{ asset('assets/images/shop-register.png') }}" alt="thumbnail" width="100%">
        </div>

        <!-- Register Card -->
        <div class="card registerCard">
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

                    <h2 class="pageTitle">{{ __('Become A Seller') }}</h2>
                </div>

                <hr>

                <!-- Progress Steps -->
                <div class="progress-container">
                    <div class="progress-steps">
                        <div class="progress-line">
                            <div class="progress-line-fill" id="progressFill" style="width: 0%"></div>
                        </div>
                        <div class="step-item active" id="step1-indicator">
                            <div class="step-number">1</div>
                            <div class="step-label">{{ __('User Information') }}</div>
                        </div>
                        <div class="step-item" id="step2-indicator">
                            <div class="step-number">2</div>
                            <div class="step-label">{{ __('Shop Information') }}</div>
                        </div>
                    </div>
                </div>

                <!-- Back Button -->
                <div class="back-btn d-none" id="backBtn" tabindex="16">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="m12 19-7-7 7-7" />
                        <path d="M19 12H5" />
                    </svg>
                    <span>{{ __('Back') }}</span>
                </div>
                <!-- Form -->
                <form action="{{ route('shop.register.submit') }}" method="POST" enctype="multipart/form-data"
                    id="registerForm">
                    @csrf

                    <!-- Step 1: User Information -->
                    <div class="step fade-in" id="step1">
                        <!-- Profile Photo Section -->
                        <div class="form-section">
                            <h3 class="section-title">{{ __('Profile Photo') }}</h3>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="preview-container">
                                        <img id="previewProfile" src="{{ asset('default/default.jpg') }}"
                                            alt="{{ __('Profile Preview') }}" class="preview-image">
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="file-upload-area"
                                        onclick="document.getElementById('profile_photo').click()">
                                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                            stroke-linejoin="round" class="mb-3" style="color: var(--primary-color);">
                                            <path
                                                d="M14.5 4h-5L7 7H4a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-3l-2.5-3z" />
                                            <circle cx="12" cy="13" r="3" />
                                        </svg>
                                        <h5>{{ __('Upload Profile Photo') }}</h5>
                                        <p class="text-muted">{{ __('Click to upload or drag and drop') }}</p>
                                        <small class="text-muted">{{ __('PNG, JPG up to 10MB (1:1 ratio)') }}</small>
                                        <input type="file" name="profile_photo" id="profile_photo" accept="image/*"
                                            required style="display: none;"
                                            onchange="previewFile(event, 'previewProfile')" tabindex="11">
                                    </div>
                                    <div class="invalid-feedback" id="profile_photo_error"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Personal Information -->
                        <div class="form-section">
                            <h3 class="section-title">{{ __('Personal Information') }}</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">{{ __('First Name') }} <span
                                                class="text-danger">*</span></label>
                                        <input type="text" name="first_name" class="form-control"
                                            placeholder="{{ __('Enter your first name') }}" required tabindex="1">
                                        <div class="invalid-feedback" id="first_name_error"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">{{ __('Last Name') }}</label>
                                        <input type="text" name="last_name" class="form-control"
                                            placeholder="{{ __('Enter your last name') }}" tabindex="2">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">{{ __('Phone Number') }} <span
                                                class="text-danger">*</span></label>
                                        <input type="tel" name="phone" class="form-control"
                                            placeholder="{{ __('Enter your phone number') }}" required tabindex="3">
                                        <div class="invalid-feedback" id="phone_error"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">{{ __('Gender') }}</label>
                                        <div class="gender-options">
                                            <label class="gender-option">
                                                <input type="radio" name="gender" value="male" tabindex="4">
                                                <svg width="32" height="32" viewBox="0 0 24 24" fill="none"
                                                    stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="mb-2">
                                                    <circle cx="10" cy="14" r="8" />
                                                    <path d="m14 2 4 4-4 4" />
                                                    <path d="M18 6h-4v4" />
                                                </svg>
                                                <div>{{ __('Male') }}</div>
                                            </label>
                                            <label class="gender-option">
                                                <input type="radio" name="gender" value="female" tabindex="5">
                                                <svg width="32" height="32" viewBox="0 0 24 24" fill="none"
                                                    stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="mb-2">
                                                    <circle cx="12" cy="8" r="7" />
                                                    <path d="M12 15v8" />
                                                    <path d="m9 18 3 3 3-3" />
                                                </svg>
                                                <div>{{ __('Female') }}</div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Account Information -->
                        <div class="form-section">
                            <h3 class="section-title">{{ __('Account Information') }}</h3>
                            <div class="form-group">
                                <label class="form-label">{{ __('Email Address') }} <span
                                        class="text-danger">*</span></label>
                                <input type="email" name="email" class="form-control"
                                    placeholder="{{ __('Enter your email address') }}" required tabindex="6">
                                <div class="invalid-feedback" id="email_error"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">{{ __('Password') }} <span
                                                class="text-danger">*</span></label>
                                        <input type="password" name="password" class="form-control"
                                            placeholder="{{ __('Enter your password') }}" required tabindex="7">
                                        <div class="invalid-feedback" id="password_error"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">{{ __('Confirm Password') }} <span
                                                class="text-danger">*</span></label>
                                        <input type="password" name="password_confirmation" class="form-control"
                                            placeholder="{{ __('Confirm your password') }}" required tabindex="8">
                                        <div class="invalid-feedback" id="password_confirmation_error"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="action-buttons">
                            <button type="button" class="btn btn-primary" id="nextBtn" tabindex="14">
                                <span class="btn-text">{{ __('Next Step') }}</span>
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="m12 19-7-7 7-7" />
                                    <path d="M19 12H5" />
                                </svg>
                            </button>
                        </div>
                    </div>
                    <!-- Step 2: Shop Information -->
                    <div class="step" id="step2" style="display: none">
                        <!-- Shop Basic Information -->
                        <div class="form-section">
                            <h3 class="section-title">{{ __('Shop Basic Information') }}</h3>
                            <div class="form-group">
                                <label class="form-label">{{ __('Shop Name') }} <span
                                        class="text-danger">*</span></label>
                                <input type="text" name="shop_name" class="form-control"
                                    placeholder="{{ __('Enter your shop name') }}" required tabindex="9">
                            </div>
                            <div class="form-group">
                                <label class="form-label">{{ __('Shop Address') }}</label>
                                <textarea name="address" class="form-control" rows="3"
                                    placeholder="{{ __('Enter your shop address') }}" tabindex="10"></textarea>
                            </div>
                        </div>

                        <!-- Shop Logo -->
                        <div class="form-section">
                            <h3 class="section-title">{{ __('Shop Logo') }}</h3>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="preview-container">
                                        <img id="previewShopLogo"
                                            src="{{ asset('default/default.jpg') }}"
                                            alt="{{ __('Shop Logo Preview') }}" class="preview-image">
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="file-upload-area"
                                        onclick="document.getElementById('shop_logo').click()">
                                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                            stroke-linejoin="round" class="mb-3" style="color: var(--primary-color);">
                                            <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                                            <circle cx="9" cy="9" r="2" />
                                            <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                                        </svg>
                                        <h5>{{ __('Upload Shop Logo') }}</h5>
                                        <p class="text-muted">{{ __('Click to upload your shop logo') }}</p>
                                        <small class="text-muted">{{ __('PNG, JPG up to 5MB (1:1 ratio)') }}</small>
                                        <input type="file" name="shop_logo" id="shop_logo" accept="image/*" required
                                            style="display: none;" onchange="previewFile(event, 'previewShopLogo')"
                                            tabindex="12">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Shop Banner -->
                        <div class="form-section">
                            <h3 class="section-title">{{ __('Shop Banner') }}</h3>
                            <div class="file-upload-area" onclick="document.getElementById('shop_banner').click()">
                                <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="mb-3"
                                    style="color: var(--primary-color);">
                                    <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                                    <circle cx="9" cy="9" r="2" />
                                    <path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21" />
                                </svg>
                                <h5>{{ __('Upload Shop Banner') }}</h5>
                                <p class="text-muted">{{ __('Click to upload your shop banner') }}</p>
                                <small
                                    class="text-muted">{{ __('PNG, JPG up to 10MB (4:1 ratio, 2000x500px recommended)') }}</small>
                                <input type="file" name="shop_banner" id="shop_banner" accept="image/*" required
                                    style="display: none;" onchange="previewFile(event, 'shopBanner')" tabindex="13">
                            </div>
                            <div class="preview-container mt-3">
                                <img id="shopBanner"
                                    src="{{ asset('default/default.jpg') }}"
                                    alt="{{ __('Shop Banner Preview') }}" class="preview-image"
                                    style="width: 100%; max-width: 400px; height: 100px; object-fit: cover;">
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="action-buttons">
                            <button type="submit" class="btn btn-primary" id="submitBtn" tabindex="15">
                                <span class="btn-text">{{ __('Complete Registration') }}</span>
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20 6 9 17l-5-5" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script src="{{ asset('assets/scripts/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('assets/scripts/jquery-3.6.3.min.js') }}"></script>
    <script>
        $(document).ready(function () {
            let currentStep = 1;
            const totalSteps = 2;

            // Initialize progress
            updateProgress();

            // Next button click
            $('#nextBtn').on('click', function () {
                if (validateStep(currentStep)) {
                    nextStep();
                }
            });

            // Back button click
            $('#backBtn').on('click', function () {
                prevStep();
            });

            // Gender selection
            $('.gender-option').on('click', function () {
                $('.gender-option').removeClass('selected');
                $(this).addClass('selected');
                $(this).find('input[type="radio"]').prop('checked', true);
            });

            // File upload drag and drop
            $('.file-upload-area').on('dragover', function (e) {
                e.preventDefault();
                $(this).addClass('dragover');
            });

            $('.file-upload-area').on('dragleave', function (e) {
                e.preventDefault();
                $(this).removeClass('dragover');
            });

            $('.file-upload-area').on('drop', function (e) {
                e.preventDefault();
                $(this).removeClass('dragover');
                const files = e.originalEvent.dataTransfer.files;
                if (files.length > 0) {
                    const input = $(this).find('input[type="file"]')[0];
                    input.files = files;
                    $(input).trigger('change');
                }
            });

            // Real-time validation
            $('input[required]').on('blur', function () {
                validateField($(this));
            });

            // Form submission
            $('#registerForm').on('submit', function (e) {
                e.preventDefault();
                if (validateStep(currentStep)) {
                    submitForm();
                }
            });

            function nextStep() {
                if (currentStep < totalSteps) {
                    $('#step' + currentStep).hide();
                    currentStep++;
                    $('#step' + currentStep).show().addClass('fade-in');
                    $('#backBtn').removeClass('d-none');
                    updateProgress();
                    updateStepIndicators();
                }
            }

            function prevStep() {
                if (currentStep > 1) {
                    $('#step' + currentStep).hide();
                    currentStep--;
                    $('#step' + currentStep).show().addClass('fade-in');
                    if (currentStep === 1) {
                        $('#backBtn').addClass('d-none');
                    }
                    updateProgress();
                    updateStepIndicators();
                }
            }

            function updateProgress() {
                const progress = ((currentStep - 1) / (totalSteps - 1)) * 100;
                $('#progressFill').css('width', progress + '%');
            }

            function updateStepIndicators() {
                $('.step-item').removeClass('active completed');
                for (let i = 1; i <= currentStep; i++) {
                    if (i < currentStep) {
                        $('#step' + i + '-indicator').addClass('completed');
                    } else {
                        $('#step' + i + '-indicator').addClass('active');
                    }
                }
            }

            function validateStep(step) {
                let valid = true;
                clearAllErrors();

                if (step === 1) {
                    valid = validateStep1() && valid;
                } else if (step === 2) {
                    valid = validateStep2() && valid;
                }

                return valid;
            }

            function validateStep1() {
                let valid = true;

                // Profile photo
                if (!$('#profile_photo')[0].files.length) {
                    showError('#profile_photo_error', '{{ __('Profile photo is required.') }}');
                    valid = false;
                }

                // First name
                if (!$('input[name="first_name"]').val().trim()) {
                    showError('#first_name_error', '{{ __('First name is required.') }}');
                    valid = false;
                }

                // Phone
                const phone = $('input[name="phone"]').val().trim();
                if (!phone) {
                    showError('#phone_error', '{{ __('Phone number is required.') }}');
                    valid = false;
                } else if (!/^[\+]?[0-9\s\-\(\)]{10,}$/.test(phone)) {
                    showError('#phone_error', '{{ __('Please enter a valid phone number.') }}');
                    valid = false;
                }

                // Email
                const email = $('input[name="email"]').val().trim();
                if (!email) {
                    showError('#email_error', '{{ __('Email is required.') }}');
                    valid = false;
                } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                    showError('#email_error', '{{ __('Please enter a valid email address.') }}');
                    valid = false;
                }

                // Password
                const password = $('input[name="password"]').val();
                if (!password) {
                    showError('#password_error', '{{ __('Password is required.') }}');
                    valid = false;
                } else if (password.length < 6) {
                    showError('#password_error', '{{ __('Password must be at least 6 characters long.') }}');
                    valid = false;
                }

                // Confirm password
                const passwordConfirmation = $('input[name="password_confirmation"]').val();
                if (!passwordConfirmation) {
                    showError('#password_confirmation_error', '{{ __('Password confirmation is required.') }}');
                    valid = false;
                } else if (password !== passwordConfirmation) {
                    showError('#password_confirmation_error', '{{ __('Passwords do not match.') }}');
                    valid = false;
                }

                return valid;
            }

            function validateStep2() {
                let valid = true;

                // Shop name
                if (!$('input[name="shop_name"]').val().trim()) {
                    showError('#shop_name_error', '{{ __('Shop name is required.') }}');
                    valid = false;
                }

                // Shop logo
                if (!$('#shop_logo')[0].files.length) {
                    showError('#shop_logo_error', '{{ __('Shop logo is required.') }}');
                    valid = false;
                }

                // Shop banner
                if (!$('#shop_banner')[0].files.length) {
                    showError('#shop_banner_error', '{{ __('Shop banner is required.') }}');
                    valid = false;
                }

                return valid;
            }

            function validateField(field) {
                const fieldName = field.attr('name');
                const value = field.val().trim();

                if (field.prop('required') && !value) {
                    showError('#' + fieldName + '_error', '{{ __('This field is required.') }}');
                    return false;
                }

                // Email validation
                if (fieldName === 'email' && value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
                    showError('#' + fieldName + '_error', '{{ __('Please enter a valid email address.') }}');
                    return false;
                }

                // Phone validation
                if (fieldName === 'phone' && value && !/^[\+]?[0-9\s\-\(\)]{10,}$/.test(value)) {
                    showError('#' + fieldName + '_error', '{{ __('Please enter a valid phone number.') }}');
                    return false;
                }

                // Password validation
                if (fieldName === 'password' && value && value.length < 6) {
                    showError('#' + fieldName + '_error', '{{ __('Password must be at least 6 characters long.') }}');
                    return false;
                }

                // Password confirmation validation
                if (fieldName === 'password_confirmation' && value) {
                    const password = $('input[name="password"]').val();
                    if (password !== value) {
                        showError('#' + fieldName + '_error', '{{ __('Passwords do not match.') }}');
                        return false;
                    }
                }

                clearError('#' + fieldName + '_error');
                return true;
            }

            function showError(selector, message) {
                $(selector).text(message).show();
                $(selector).closest('.form-group').find('.form-control').addClass('is-invalid');
            }

            function clearError(selector) {
                $(selector).text('').hide();
                $(selector).closest('.form-group').find('.form-control').removeClass('is-invalid');
            }

            function clearAllErrors() {
                $('.invalid-feedback').text('').hide();
                $('.form-control').removeClass('is-invalid');
            }

            function submitForm() {
                const submitBtn = $('#submitBtn');
                submitBtn.addClass('loading').prop('disabled', true);

                // Simulate form submission
                setTimeout(() => {
                    // Here you would normally submit the form
                    // For now, we'll just show a success message
                    showSuccessMessage();
                }, 2000);
            }

            function showSuccessMessage() {
                const successHtml = `
                    <div class="text-center">
                        <div class="success-checkmark">
                            <svg width="50" height="50" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M20 6 9 17l-5-5"/>
                            </svg>
                        </div>
                        <h3>{{ __('Registration Successful!') }}</h3>
                        <p>{{ __('Your account has been created successfully. You can now start selling!') }}</p>
                        <button class="btn btn-primary" onclick="window.location.href='{{ route('shop.login') }}'">
                            {{ __('Go to Login') }}
                        </button>
                    </div>
                `;
                $('.register-card .card-body').html(successHtml);
            }
        });

        // File preview function
        function previewFile(event, previewID) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const output = document.getElementById(previewID);
                    output.src = e.target.result;
                    output.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        }

        // Add smooth scrolling
        $('html, body').css({
            'scroll-behavior': 'smooth'
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