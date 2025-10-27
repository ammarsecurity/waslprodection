<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProvinceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $provinces = [
            ['province_name' => 'Baghdad', 'province_name_ar' => 'بغداد', 'is_active' => true],
            ['province_name' => 'Basra', 'province_name_ar' => 'البصرة', 'is_active' => true],
            ['province_name' => 'Mosul', 'province_name_ar' => 'الموصل', 'is_active' => true],
            ['province_name' => 'Erbil', 'province_name_ar' => 'أربيل', 'is_active' => true],
            ['province_name' => 'Najaf', 'province_name_ar' => 'النجف', 'is_active' => true],
            ['province_name' => 'Karbala', 'province_name_ar' => 'كربلاء', 'is_active' => true],
            ['province_name' => 'Kut', 'province_name_ar' => 'الكوت', 'is_active' => true],
            ['province_name' => 'Ramadi', 'province_name_ar' => 'الرمادي', 'is_active' => true],
            ['province_name' => 'Tikrit', 'province_name_ar' => 'تكريت', 'is_active' => true],
            ['province_name' => 'Kirkuk', 'province_name_ar' => 'كركوك', 'is_active' => true],
            ['province_name' => 'Diyala', 'province_name_ar' => 'ديالى', 'is_active' => true],
            ['province_name' => 'Wasit', 'province_name_ar' => 'واسط', 'is_active' => true],
            ['province_name' => 'Maysan', 'province_name_ar' => 'ميسان', 'is_active' => true],
            ['province_name' => 'Dhi Qar', 'province_name_ar' => 'ذي قار', 'is_active' => true],
            ['province_name' => 'Muthanna', 'province_name_ar' => 'المثنى', 'is_active' => true],
            ['province_name' => 'Qadisiyyah', 'province_name_ar' => 'القادسية', 'is_active' => true],
            ['province_name' => 'Babil', 'province_name_ar' => 'بابل', 'is_active' => true],
            ['province_name' => 'Karbala', 'province_name_ar' => 'كربلاء', 'is_active' => true],
        ];

        foreach ($provinces as $province) {
            \App\Models\Province::create($province);
        }
    }
}
