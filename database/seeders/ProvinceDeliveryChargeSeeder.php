<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProvinceDeliveryChargeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all shops
        $shops = \App\Models\Shop::all();
        $provinces = \App\Models\Province::all();
        
        // Create delivery charges for each shop and province combination
        foreach ($shops as $shop) {
            foreach ($provinces as $province) {
                \App\Models\ProvinceDeliveryCharge::create([
                    'shop_id' => $shop->id,
                    'province_name' => $province->province_name,
                    'delivery_charge' => rand(5000, 15000), // Random delivery charge between 5000-15000
                ]);
            }
        }
    }
}
