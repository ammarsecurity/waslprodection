<?php

namespace App\Http\Requests;

use App\Models\VerifyManage;
use App\Rules\EmailRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Cache;

class ShopUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $user = null;
        $required = 'required';
        
        // validation rules
        return [
            'address' => ['nullable', 'string'],
            'shop_name' => ['required', 'string', 'max:100'],
            'shop_logo' => ['nullable', 'image', 'mimes:jpg,png,jpeg,gif', 'max:2048'],
            'shop_banner' => ['nullable', 'image', 'mimes:jpg,png,jpeg,gif', 'max:2048'],
            'description' => ['nullable', 'string', 'max:200'],
            'chat_id' => ['nullable', 'string', 'max:255'],
        ];
    }

    public function messages(): array
    {
    

        return [
            
        
            'shop_name.required' => __('The shop name field is required.'),
            'shop_logo.image' => __('The shop logo must be an image.'),
            'shop_logo.max' => __('The shop logo must not be greater than 2 MB.'),
            'shop_banner.image' => __('The shop banner must be an image.'),
            'shop_banner.max' => __('The shop banner must not be greater than 2 MB.'),
            'description.max' => __('The description may not be greater than 200 characters.'),
            'address.max' => __('The address may not be greater than 255 characters.'),
            'chat_id.max' => __('The chat ID may not be greater than 255 characters.'),
        ];
    }
}
