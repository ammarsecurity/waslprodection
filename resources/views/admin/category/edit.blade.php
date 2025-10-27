@extends('layouts.app')

@section('header-title', __('Edit Category'))

@section('content')
    <div class="page-title">
        <div class="d-flex gap-2 align-items-center">
            <i class="fa-solid fa-border-all"></i> {{__('Edit Category')}}
        </div>
    </div>
    <form action="{{ route('admin.category.update', $category->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="row">
            <div class="col-lg-8 m-auto">
                <div class="card mt-3">
                    <div class="card-body">

                        <div class="d-flex gap-2 border-bottom pb-2">
                            <i class="fa-solid fa-user"></i>
                            <h5>
                                {{__('Category Information')}}
                            </h5>
                        </div>

                        <div class="mt-3">
                            <x-input label="Name" name="name" :value="$category->name" type="text" placeholder="Enter Name" required="true"/>
                        </div>
                        <div class="mt-3 d-flex align-items-center justify-content-center">
                            <div class="ratio1x1">
                                <img id="previewProfile" src="{{ $category->thumbnail ?? 'https://placehold.co/500x500/f1f5f9/png' }}" alt="" width="100%">
                            </div>
                        </div>
                        <div class="mt-3">
                            <x-file name="thumbnail" label="Thumbnail (Ratio 1:1)" preview="previewProfile" />
                        </div>

                        <div class="mt-4">
                            <label for="description" class="form-label">
                                {{__('Description')}}
                            </label>
                            <textarea name="description" class="form-control" rows="3" placeholder="Enter description">{{ old('description') ?? $category->description }}</textarea>
                        </div>

                        <div class="mt-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <label for="shop_ids" class="form-label mb-0">
                                    {{__('Select Shops')}} <span class="text-danger">*</span>
                                </label>
                                <div class="d-flex gap-2">
                                    <button type="button" class="btn btn-sm btn-outline-primary" id="selectAllShops">
                                        <i class="fa-solid fa-check-double"></i> {{__('Select All')}}
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" id="deselectAllShops">
                                        <i class="fa-solid fa-times"></i> {{__('Deselect All')}}
                                    </button>
                                </div>
                            </div>
                            
                            <!-- Search Box -->
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="fa-solid fa-search"></i>
                                    </span>
                                    <input type="text" class="form-control" id="shopSearch" placeholder="{{__('Search shops...')}}">
                                </div>
                            </div>

                            <!-- Shops Grid -->
                            <div class="shops-container" style="max-height: 400px; overflow-y: auto; border: 1px solid #e9ecef; border-radius: 8px; padding: 15px;">
                                <div class="row" id="shopsGrid">
                                    @foreach($shops as $shop)
                                        <div class="col-md-6 col-lg-4 mb-3 shop-item" data-shop-name="{{ strtolower($shop->name) }}">
                                            <div class="card h-100 shop-card {{ in_array($shop->id, $selectedShops) ? 'selected' : '' }}">
                                                <div class="card-body p-3">
                                                    <div class="d-flex align-items-start">
                                                        <div class="form-check me-3 mt-1">
                                                            <input class="form-check-input shop-checkbox" type="checkbox" name="shop_ids[]" value="{{ $shop->id }}" id="shop_{{ $shop->id }}" 
                                                                   {{ in_array($shop->id, $selectedShops) ? 'checked' : '' }}>
                                                        </div>
                                                        <div class="flex-grow-1">
                                                            <div class="d-flex align-items-center mb-2">
                                                                @if($shop->thumbnail)
                                                                    <img src="{{ $shop->thumbnail }}" alt="{{ $shop->name }}" class="shop-avatar me-2">
                                                                @else
                                                                    <div class="shop-avatar me-2 bg-primary text-white d-flex align-items-center justify-content-center">
                                                                        <i class="fa-solid fa-store"></i>
                                                                    </div>
                                                                @endif
                                                                <div>
                                                                    <h6 class="mb-0 shop-name">{{ $shop->name }}</h6>
                                                                    @if($shop->address)
                                                                        <small class="text-muted">{{ Str::limit($shop->address, 30) }}</small>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                            @if($shop->description)
                                                                <p class="text-muted small mb-0">{{ Str::limit($shop->description, 60) }}</p>
                                                            @endif
                                                            <div class="d-flex justify-content-between align-items-center mt-2">
                                                                @if($shop->average_rating)
                                                                    <div class="d-flex align-items-center">
                                                                        <i class="fa-solid fa-star text-warning me-1"></i>
                                                                        <small class="text-muted">{{ number_format($shop->average_rating, 1) }}</small>
                                                                    </div>
                                                                @endif
                                                                <small class="text-success">
                                                                    <i class="fa-solid fa-circle-check me-1"></i>
                                                                    {{__('Active')}}
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                
                                <!-- No Results Message -->
                                <div id="noResults" class="text-center py-4 d-none">
                                    <i class="fa-solid fa-search text-muted mb-2" style="font-size: 2rem;"></i>
                                    <p class="text-muted">{{__('No shops found matching your search.')}}</p>
                                </div>
                            </div>
                            
                            @error('shop_ids')
                                <div class="text-danger mt-2">
                                    <i class="fa-solid fa-exclamation-triangle me-1"></i>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>


                        <div class="mt-5 d-flex gap-2 justify-content-between">
                            <a href="{{ route('admin.category.index')}}" class="btn btn-secondary py-2 px-4">
                                {{__('Back')}}
                            </a>

                            <button type="submit" class="btn btn-primary py-2 px-4">
                                {{__('Update')}}
                            </button>

                        </div>

                    </div>

                </div>
            </div>
        </div>

    </form>

    <style>
        .shop-card {
            transition: all 0.3s ease;
            border: 2px solid #e9ecef;
            cursor: pointer;
        }
        
        .shop-card:hover {
            border-color: #007bff;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.15);
            transform: translateY(-2px);
        }
        
        .shop-card.selected {
            border-color: #007bff;
            background-color: #f8f9ff;
        }
        
        .shop-avatar {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            object-fit: cover;
            flex-shrink: 0;
        }
        
        .shop-checkbox:checked + .shop-card {
            border-color: #007bff;
            background-color: #f8f9ff;
        }
        
        .shops-container {
            background-color: #fafbfc;
        }
        
        .shop-item.hidden {
            display: none !important;
        }
        
        .form-check-input:checked {
            background-color: #007bff;
            border-color: #007bff;
        }
        
        .shop-name {
            font-weight: 600;
            color: #2c3e50;
        }
        
        .input-group-text {
            background-color: #f8f9fa;
            border-color: #e9ecef;
        }
        
        #shopSearch:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const shopSearch = document.getElementById('shopSearch');
            const shopItems = document.querySelectorAll('.shop-item');
            const shopCards = document.querySelectorAll('.shop-card');
            const shopCheckboxes = document.querySelectorAll('.shop-checkbox');
            const selectAllBtn = document.getElementById('selectAllShops');
            const deselectAllBtn = document.getElementById('deselectAllShops');
            const noResults = document.getElementById('noResults');
            
            // Search functionality
            shopSearch.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                let visibleCount = 0;
                
                shopItems.forEach(item => {
                    const shopName = item.getAttribute('data-shop-name');
                    if (shopName.includes(searchTerm)) {
                        item.classList.remove('hidden');
                        visibleCount++;
                    } else {
                        item.classList.add('hidden');
                    }
                });
                
                // Show/hide no results message
                if (visibleCount === 0 && searchTerm.length > 0) {
                    noResults.classList.remove('d-none');
                } else {
                    noResults.classList.add('d-none');
                }
            });
            
            // Card click to select
            shopCards.forEach((card, index) => {
                card.addEventListener('click', function(e) {
                    if (e.target.type !== 'checkbox') {
                        const checkbox = this.querySelector('.shop-checkbox');
                        checkbox.checked = !checkbox.checked;
                        updateCardSelection(this, checkbox.checked);
                    }
                });
            });
            
            // Checkbox change
            shopCheckboxes.forEach((checkbox, index) => {
                checkbox.addEventListener('change', function() {
                    const card = this.closest('.shop-card');
                    updateCardSelection(card, this.checked);
                });
            });
            
            // Select All
            selectAllBtn.addEventListener('click', function() {
                shopCheckboxes.forEach(checkbox => {
                    checkbox.checked = true;
                    const card = checkbox.closest('.shop-card');
                    updateCardSelection(card, true);
                });
            });
            
            // Deselect All
            deselectAllBtn.addEventListener('click', function() {
                shopCheckboxes.forEach(checkbox => {
                    checkbox.checked = false;
                    const card = checkbox.closest('.shop-card');
                    updateCardSelection(card, false);
                });
            });
            
            function updateCardSelection(card, isSelected) {
                if (isSelected) {
                    card.classList.add('selected');
                } else {
                    card.classList.remove('selected');
                }
            }
        });
    </script>
@endsection
