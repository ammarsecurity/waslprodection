<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // Eager load customer relationship
        $this->loadMissing('customer.agentShops');
        
        $accountVerified = false;
        if ($this->phone_verified_at || $this->email_verified_at) {
            $accountVerified = true;
        }

        $lastOnline = $this->last_online >= now() ? true : false;

        // Get agent shop data if customer exists
        $agentShops = [];
        if ($this->customer) {
            $agentShops = $this->customer->agentShops->map(function($shop) {
                return [
                    'id' => $shop->id,
                    'name' => $shop->name,
                    'logo' => $shop->logo
                ];
            })->toArray();
        }

        return [
            'id' => $this->id,
            'name' => $this->name,
            'phone' => $this->phone,
            'phone_verified' => (bool) $this->phone_verified_at ? true : false,
            'email' => $this->email,
            'email_verified' => (bool) $this->email_verified_at ? true : false,
            'is_active' => (bool) $this->is_active,
            'profile_photo' => $this->thumbnail,
            'gender' => $this->gender,
            'date_of_birth' => $this->date_of_birth,
            'country' => $this->country,
            'phone_code' => $this->phone_code,
            'account_verified' => (bool) $accountVerified,
            'last_online' => $lastOnline,
            'agent_shops' => $agentShops
        ];
    }
}
