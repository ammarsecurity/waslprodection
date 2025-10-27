<?php

namespace App\Http\Requests;

use App\Enums\SubscriptionStatus;
use App\Repositories\ShopRepository;
use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
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
        return [
            'shop_ids' => 'required|array',
            'shop_ids.*' => 'required|exists:shops,id',
           // 'address_id' => 'nullable|exists:addresses,id',
            'note' => 'nullable|string',
            'payment_method' => 'required|string',
            'coupon_code' => 'nullable|string|max:50',
            
            // Province and address information
            'province_name' => 'nullable|string|max:255',
            'province_area' => 'nullable|string|max:255',
            'nearest_landmark' => 'nullable|string|max:500',
            'delivery_charge' => 'nullable|numeric|min:0',
        ];
    }

    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $generalSetting = generaleSetting('setting');

            if ($generalSetting?->business_based_on != 'subscription') {
                return;
            }

            $shops = ShopRepository::query()->whereIn('id', $this->shop_ids)->get();

            foreach ($shops as $shop) {
                if ($shop->user->hasRole('root')) {
                    continue;
                }

                $subscription = $shop->currentSubscription;

                if (! $subscription) {
                    $validator->errors()->add('shop_ids', 'Some of the selected shops are not available.');
                    return;
                }
            }
        });
        
        // Validate that province information is provided
        $validator->after(function ($validator) {
            if (!$this->province_name) {
                $validator->errors()->add('province_name', __('Province information must be provided.'));
            }
        });
    }

    public function messages(): array
    {
        $request = request();
        if ($request->is('api/*')) {
            $header = strtolower($request->header('accept-language'));
            $lan = (preg_match('/^[a-z]+$/', $header)) ? $header : 'en';
            app()->setLocale($lan);
        }

        return [
            'shop_ids.required' => __('The shop field is required.'),
            'shop_ids.array' => __('The shop ids must be an array.'),
            'shop_ids.*.required' => __('The shop field is required.'),
            'shop_ids.*.exists' => __('The selected shop id is invalid.'),
            'payment_method.required' => __('The payment method field is required.'),
            'province_name.required' => __('Province name is required.'),
            'province_area.required' => __('Province area is required.'),
        ];
    }
}
