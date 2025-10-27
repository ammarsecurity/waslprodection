<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ __('Invoice') }} - {{ $guestOrder->order_code }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700&display=swap');
        
        body {
            font-family: 'Cairo', sans-serif;
            background-color: #f8f9fa;
        }
        
        .invoice-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        
        .invoice-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
        }
        
        .invoice-body {
            padding: 2rem;
        }
        
        .invoice-footer {
            background-color: #f8f9fa;
            padding: 1.5rem;
            border-top: 2px solid #dee2e6;
        }
        
        .company-logo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .invoice-table th {
            background-color: #f8f9fa;
            border-top: none;
            font-weight: 600;
        }
        
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.875rem;
        }
        
        .status-pending { background: #fff3cd; color: #856404; }
        .status-processing { background: #d1ecf1; color: #0c5460; }
        .status-completed { background: #d4edda; color: #155724; }
        .status-cancelled { background: #f8d7da; color: #721c24; }
        
        .total-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 10px;
            padding: 1.5rem;
        }
        
        @media print {
            body { 
                background: white !important; 
                color: black !important;
            }
            .invoice-container { 
                box-shadow: none !important; 
                margin: 0 !important;
                max-width: none !important;
            }
            .no-print { 
                display: none !important; 
            }
            .invoice-header {
                background: #667eea !important;
                -webkit-print-color-adjust: exact;
                color-adjust: exact;
            }
        }
        
        .qr-code {
            width: 100px;
            height: 100px;
            border: 2px solid #dee2e6;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="container-fluid py-4">
        <!-- Print Button -->
        <div class="text-center mb-4 no-print">
            <button onclick="window.print()" class="btn btn-primary btn-lg">
                <i class="fas fa-print me-2"></i>{{ __('Print Invoice') }}
            </button>
            <a href="{{ route('shop.guest-orders.show', $guestOrder->id) }}" class="btn btn-secondary btn-lg ms-2">
                <i class="fas fa-arrow-left me-2"></i>{{ __('Back to Order') }}
            </a>
        </div>

        <div class="invoice-container">
            <!-- Invoice Header -->
            <div class="invoice-header">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="d-flex align-items-center">
                            @if($shop->thumbnail)
                                <img src="{{ $shop->thumbnail }}" alt="{{ $shop->name }}" class="company-logo me-3">
                            @else
                                <div class="company-logo bg-white text-primary d-flex align-items-center justify-content-center me-3">
                                    <i class="fas fa-store fa-2x"></i>
                                </div>
                            @endif
                            <div>
                                <h2 class="mb-1">{{ $shop->name }}</h2>
                                <p class="mb-0 opacity-75">
                                    <i class="fas fa-map-marker-alt me-1"></i>
                                    {{ $shop->address ?? __('Shop Address') }}
                                </p>
                                @if($shop->phone)
                                    <p class="mb-0 opacity-75">
                                        <i class="fas fa-phone me-1"></i>
                                        {{ $shop->phone }}
                                    </p>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 text-end">
                        <h1 class="display-6 fw-bold">{{ __('INVOICE') }}</h1>
                        <p class="mb-1 fs-5"># {{ $guestOrder->order_code }}</p>
                        <p class="mb-0">{{ $guestOrder->created_at->format('Y-m-d') }}</p>
                    </div>
                </div>
            </div>

            <!-- Invoice Body -->
            <div class="invoice-body">
                <!-- Customer & Order Info -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-header bg-primary text-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-user me-2"></i>{{ __('Customer Information') }}
                                </h5>
                            </div>
                            <div class="card-body">
                                <p class="mb-2"><strong>{{ __('Name') }}:</strong> {{ $guestOrder->name }}</p>
                                <p class="mb-2"><strong>{{ __('Phone') }}:</strong> 
                                    <a href="tel:{{ $guestOrder->phone }}" class="text-decoration-none">{{ $guestOrder->phone }}</a>
                                </p>
                                <p class="mb-2"><strong>{{ __('Governorate') }}:</strong> {{ $guestOrder->governorate ?? __('N/A') }}</p>
                                <p class="mb-2"><strong>{{ __('Area') }}:</strong> {{ $guestOrder->area ?? __('N/A') }}</p>
                                @if($guestOrder->nearest_landmark)
                                    <p class="mb-0"><strong>{{ __('Nearest Landmark') }}:</strong> {{ $guestOrder->nearest_landmark }}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-header bg-success text-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-receipt me-2"></i>{{ __('Order Details') }}
                                </h5>
                            </div>
                            <div class="card-body">
                                <p class="mb-2"><strong>{{ __('Order Code') }}:</strong> {{ $guestOrder->order_code }}</p>
                                <p class="mb-2"><strong>{{ __('Date') }}:</strong> {{ $guestOrder->created_at->format('Y-m-d H:i') }}</p>
                                <p class="mb-2"><strong>{{ __('Status') }}:</strong> 
                                    <span class="status-badge status-{{ $guestOrder->status }}">
                                        {{ __(ucfirst($guestOrder->status)) }}
                                    </span>
                                </p>
                                <p class="mb-2"><strong>{{ __('Payment Method') }}:</strong> 
                                    @if($guestOrder->payment_method === 'cash')
                                        <i class="fas fa-money-bill-wave text-success me-1"></i>{{ __('Cash on Delivery') }}
                                    @else
                                        <i class="fas fa-credit-card text-primary me-1"></i>{{ __('Online Payment') }}
                                    @endif
                                </p>
                                @if($guestOrder->note)
                                    <p class="mb-0"><strong>{{ __('Note') }}:</strong> {{ $guestOrder->note }}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Items Table -->
                <div class="table-responsive mb-4">
                    <table class="table table-bordered invoice-table">
                        <thead>
                            <tr>
                                <th>{{ __('#') }}</th>
                                <th>{{ __('Product') }}</th>
                                <th class="text-center">{{ __('Qty') }}</th>
                                <th class="text-center">{{ __('Unit Price') }}</th>
                                <th class="text-center">{{ __('Total') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php $shopSubtotal = 0; @endphp
                            @foreach($guestOrder->items as $index => $item)
                                @php 
                                    $itemTotal = $item->unit_price * $item->quantity;
                                    $shopSubtotal += $itemTotal;
                                @endphp
                                <tr>
                                    <td class="text-center">{{ $index + 1 }}</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            @if($item->product_thumbnail)
                                                <img src="{{ $item->product_thumbnail }}" alt="{{ $item->product_name }}" 
                                                     class="rounded me-3" style="width: 50px; height: 50px; object-fit: cover;">
                                            @endif
                                            <div>
                                                <h6 class="mb-1">{{ $item->product_name }}</h6>
                                                @if($item->unit)
                                                    <small class="text-muted">{{ __('Unit') }}: {{ $item->unit }}</small>
                                                @endif
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">{{ $item->quantity }}</td>
                                    <td class="text-center">{{ showCurrency($item->unit_price) }}</td>
                                    <td class="text-center fw-bold">{{ showCurrency($itemTotal) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <!-- Totals -->
                <div class="row justify-content-end">
                    <div class="col-md-6">
                        <div class="total-section">
                            <div class="d-flex justify-content-between mb-2">
                                <span>{{ __('Subtotal') }}:</span>
                                <span class="fw-bold">{{ showCurrency($shopSubtotal) }}</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>{{ __('Delivery Charge') }}:</span>
                                <span class="fw-bold text-primary">
                                    @if($guestOrder->delivery_charge > 0)
                                        {{ showCurrency($guestOrder->delivery_charge) }}
                                    @else
                                        <span class="text-success">{{ __('Free') }}</span>
                                    @endif
                                </span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <span class="h5 fw-bold">{{ __('Total') }}:</span>
                                <span class="h4 fw-bold text-primary">{{ showCurrency($shopSubtotal + $guestOrder->delivery_charge) }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Auto print if print parameter is present
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('print') === '1') {
            setTimeout(() => window.print(), 1000);
        }
    </script>
</body>
</html>
