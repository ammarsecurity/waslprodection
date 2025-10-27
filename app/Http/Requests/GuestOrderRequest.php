<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GuestOrderRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'shop_ids' => 'required|array|min:1',
            'shop_ids.*' => 'required|exists:shops,id',

            'products' => 'required|array|min:1',
            'products.*.product_id' => 'required|exists:products,id',
            'products.*.quantity' => 'required|integer|min:1',
            'products.*.shop_id' => 'required|exists:shops,id',
            'products.*.unit' => 'nullable|string|max:50',
            'products.*.size' => 'nullable|integer',
            'products.*.color' => 'nullable|integer',

            'address.name' => 'required|string|max:190',
            'address.phone' => 'required|string|max:50',
            // Nearest landmark
            'address.address_line' => 'required|string|max:255',
            // Governorate
            //  'address.address_line2' => 'required|string|max:255',
            // Area
            'address.area' => 'required|string|max:190',
            'address.road_no' => 'nullable|string|max:190',
            'address.flat_no' => 'nullable|string|max:190',
            'address.house_no' => 'nullable|string|max:190',
            'address.post_code' => 'nullable|string|max:50',
            'address.latitude' => 'nullable|string|max:100',
            'address.longitude' => 'nullable|string|max:100',
            'address.nearest_landmark' => 'nullable|string|max:255',

            'note' => 'nullable|string',
            'payment_method' => 'required|string',
            'coupon_code' => 'nullable|string|max:50',

            'name' => 'required|string|max:190',
            'phone' => 'required|string|max:50',
            
            // Financial fields
            'subtotal' => 'nullable|numeric|min:0',
            'delivery_charge' => 'nullable|numeric|min:0',
            'total' => 'nullable|numeric|min:0',
        ];
    }
}


