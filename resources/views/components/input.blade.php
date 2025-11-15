@props([
    'name',
    'label' => null,
    'type' => 'text',
    'placeholder' => '',
    'value' => null,
    'required' => false,
    'readonly' => false,
    'onlyNumber' => false,
    'id' => null,
    'autocomplete' => null,
    'notAllowLetter' => false,
])

@php
    $inputId = $id ?? $name;
    $inputValue = old($name, $value);
    $baseClasses = 'form-control';
    if ($errors->has($name)) {
        $baseClasses .= ' is-invalid';
    }
    $inputClasses = trim($baseClasses . ' ' . ($attributes->get('class') ?? ''));
@endphp

<div>
    @if ($label)
        <label for="{{ $inputId }}" class="form-label">
            {{ __($label) }}
            @if ($required)
                <span class="text-danger">*</span>
            @endif
        </label>
    @endif
    <input
        type="{{ $type }}"
        name="{{ $name }}"
        id="{{ $inputId }}"
        value="{{ $inputValue }}"
        placeholder="{{ __($placeholder) }}"
        maxlength="255"
        {{ $attributes->merge(['class' => $inputClasses]) }}
        @if($onlyNumber) oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" @endif
        @if ($required) required @endif
        @if ($readonly) readonly @endif
        @if ($autocomplete) autocomplete="{{ $autocomplete }}" @endif
        @if($notAllowLetter) onkeypress="return [43, 46, 32].includes(event.charCode) || (event.charCode >= 48 && event.charCode <= 57);" @endif
    >
    @error($name)
        <p class="text text-danger m-0">{{ $message }}</p>
    @enderror
</div>
