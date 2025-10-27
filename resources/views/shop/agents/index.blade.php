@extends('layouts.app')
@section('header-title', __('Agents'))
@section('content')
    <div class="d-flex align-items-center flex-wrap gap-3 justify-content-between px-3">
        <h4>
            {{ __('Agents') }}
        </h4>
        <a href="{{ route('shop.agents.create') }}" class="btn btn-primary">
            <i class="fa fa-plus"></i> {{ __('Add Agent') }}
        </a>
    </div>

    <div class="container-fluid mt-3">

        <div class="mb-3 card">
            <div class="card-body">
                <div class="cardTitleBox">
                    <h5 class="card-title chartTitle">
                        {{ __('Agent List') }}
                    </h5>
                </div>
                <div class="table-responsive">
                    <table class="table border-left-right table-responsive-md">
                        <thead>
                            <tr>
                                <th class="text-center">{{ __('SL') }}</th>
                                <th>{{ __('Name') }}</th>
                                <th>{{ __('Email') }}</th>
                                <th>{{ __('Phone') }}</th>
                                <th>{{ __('Status') }}</th>
                                <th class="text-center">{{ __('Actions') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                        @forelse($agents as $key => $agent)
                            @php
                                $serial = $agents->firstItem() + $key;
                            @endphp
                            <tr>
                                <td class="text-center">{{ $serial }}</td>
                                <td>{{ $agent->customer->user->name ?? __('N/A') }}</td>
                                <td>{{ $agent->customer->user->email ?? __('N/A') }}</td>
                                <td>{{ $agent->customer->user->phone ?? __('N/A') }}</td>
                                <td>
                                    <form action="{{ route('shop.agents.toggle-status', $agent->id) }}" method="POST" style="display:inline;">
                                        @csrf
                                        <label class="switch mb-0">
                                            <a href="javascript:void(0)" onclick="this.parentElement.parentElement.submit()">
                                                <input type="checkbox" {{ $agent->is_active ? 'checked' : '' }}>
                                                <span class="slider round"></span>
                                            </a>
                                        </label>
                                    </form>
                                </td>
                                <td class="text-center">
                                    <form action="{{ route('shop.agents.destroy', $agent->id) }}" method="POST" style="display:inline;" onsubmit="return confirm('{{ __('Are you sure you want to delete this agent?') }}');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td class="text-center" colspan="6">{{ __('No agents found') }}</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="my-3">
            {{ $agents->withQueryString()->links() }}
        </div>

    </div>
@endsection

