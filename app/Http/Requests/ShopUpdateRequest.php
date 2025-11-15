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
        $shop = $this->route('shop');
        $shopId = $shop ? $shop->id : null;
        
        // validation rules
        return [
            'address' => ['nullable', 'string'],
            'shop_name' => ['required', 'string', 'max:100'],
            'shop_logo' => ['nullable', 'image', 'mimes:jpg,png,jpeg,gif', 'max:2048'],
            'shop_banner' => ['nullable', 'image', 'mimes:jpg,png,jpeg,gif', 'max:2048'],
            'description' => ['nullable', 'string', 'max:200'],
            'chat_id' => ['nullable', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255', 'regex:/^[a-z0-9-]+$/', 'unique:shops,slug,' . $shopId],
            'subdomain' => [
                'nullable',
                'string',
                'max:255',
                'regex:/^[a-z0-9-]+$/',
                'unique:shops,subdomain,' . $shopId,
                function ($attribute, $value, $fail) use ($shop) {
                    // If shop is root shop, subdomain should be null
                    if ($shop && $shop->is_root_shop && $value) {
                        $fail(__('Root shop cannot have a subdomain.'));
                    }
                },
            ],
            'custom_domain' => [
                'nullable',
                'string',
                'max:255',
                'regex:/^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$/i',
                'unique:shops,custom_domain,' . $shopId,
                function ($attribute, $value, $fail) use ($shop) {
                    // If shop is root shop, custom_domain should be null
                    if ($shop && $shop->is_root_shop && $value) {
                        $fail(__('Root shop cannot have a custom domain.'));
                    }
                },
            ],
            'is_root_shop' => ['nullable', 'boolean'],
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
