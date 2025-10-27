@extends('layouts.app')

@section('header-title', __('Categories'))

@section('content')
    <div class="d-flex align-items-center flex-wrap gap-3 justify-content-between px-3">

        <h4>
            {{ __('Category List') }}
        </h4>

        <button type="button" class="btn py-2 btn-primary" data-bs-toggle="modal" data-bs-target="#requestCategoryModal">
            <i class="fa fa-plus-circle"></i>
            {{__('Request New Category')}}
        </button>
    </div>

    <div class="container-fluid mt-3">

        <div class="mb-3 card">
            <div class="card-body">
                <div class="cardTitleBox">
                    <h5 class="card-title chartTitle">
                        {{__('Categories')}}
                    </h5>
                </div>
                <div class="table-responsive">
                    <table class="table border-left-right table-responsive-md">
                        <thead>
                            <tr>
                                <th class="text-center">{{ __('SL') }}</th>
                                <th>{{ __('Thumbnail') }}</th>
                                <th>{{ __('Name') }}</th>
                               
                            </tr>
                        </thead>
                        @forelse($categories as $key => $category)
                            @php
                                $serial = $categories->firstItem() + $key;
                                $canManage = $category->shop_id == (auth()->user()->shop?->id ?? null);
                            @endphp
                            <tr>
                                <td class="text-center">{{ $serial }}</td>

                                <td>
                                    <img src="{{ $category->thumbnail }}" width="50">
                                </td>

                                <td>{{ $category->name }}</td>

                                {{-- Toggle status --}}
                             
                                    <!-- <td>
                                        @if($canManage)
                                            <label class="switch mb-0">
                                                <a href="{{ route('shop.category.toggle', $category->id) }}">
                                                    <input type="checkbox" {{ $category->status ? 'checked' : '' }}>
                                                    <span class="slider round"></span>
                                                </a>
                                            </label>
                                        @endif
                                    </td>
                            

                                {{-- Edit action --}}
                              
                                    <td class="text-center">
                                        @if($canManage)
                                            <div class="d-flex gap-3 justify-content-center">
                                                <a href="{{ route('shop.category.edit', $category->id) }}" class="btn btn-outline-primary circleIcon">
                                                    <img src="{{ asset('assets/icons-admin/edit.svg') }}" alt="edit" loading="lazy" />
                                                </a>
                                            </div>
                                        @endif
                                    </td> -->
                         
                            </tr>
                        @empty
                            <tr>
                                <td class="text-center" colspan="100%">{{ __('No Data Found') }}</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="my-3">
            {{ $categories->withQueryString()->links() }}
        </div>

    </div>

    <!-- Request Category Modal -->
    <div class="modal fade" id="requestCategoryModal" tabindex="-1" aria-labelledby="requestCategoryModalLabel" aria-hidden="true" dir="rtl">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="requestCategoryModalLabel">{{ __('Request New Category') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <div class="mb-4">
                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="text-primary mb-3">
                            <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2"/>
                            <path d="M12 16v-4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                            <path d="M12 8h.01" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                        <h4>{{ __('Category Request') }}</h4>
                        <p class="text-muted">{{ __('To add a new category, please contact the administration team.') }}</p>
                    </div>
                    
                    <div class="alert alert-info text-right">
                        <h6>{{ __('Contact Information') }}:</h6>
                        <p class="mb-1"><strong>{{ __('WhatsApp') }}:</strong> +964 783 020 0030</p>
                        <p class="mb-1"><strong>{{ __('Phone') }}:</strong> +964 783 020 0030</p>
                        <p class="mb-0"><strong>{{ __('Support') }}:</strong> {{ __('Available 24/7') }}</p>
                    </div>
                    
                    <div class="mt-3 text-right">
                        <p class="text-muted">{{ __('Please provide the following information when contacting us:') }}</p>
                        <ul class="list-unstyled">
                            <li class="d-flex align-items-center mb-2">
                                <span class="me-2">{{ __('Category name') }}</span>
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="text-success">
                                    <path d="M20 6L9 17L4 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </li>
                            <li class="d-flex align-items-center mb-2">
                                <span class="me-2">{{ __('Category description') }}</span>
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="text-success">
                                    <path d="M20 6L9 17L4 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </li>
                            <li class="d-flex align-items-center">
                                <span class="me-2">{{ __('Category image (optional)') }}</span>
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="text-success">
                                    <path d="M20 6L9 17L4 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('Close') }}</button>
                    <a href="https://wa.me/9647830200030?text={{ urlencode(__('Hello, I would like to request a new category for my shop. Please provide the following information:') . ' ' . __('Category name') . ', ' . __('Category description') . ', ' . __('Category image (optional)')) }}" 
                       class="btn btn-success" target="_blank">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg" class="me-2">
                            <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893A11.821 11.821 0 0020.885 3.488"/>
                        </svg>{{ __('Send WhatsApp Message') }}
                    </a>
                </div>
            </div>
        </div>
    </div>

    <style>
        .align-items-center {
            align-items: center !important;
            text-align: right;
            justify-content: start;
            padding-right: 0;
        }
    </style>
@endsection
