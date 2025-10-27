<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'province_name',
        'province_name_ar',
        'is_active'
    ];
    
    protected $casts = [
        'is_active' => 'boolean'
    ];
    
    public function deliveryCharges()
    {
        return $this->hasMany(ProvinceDeliveryCharge::class);
    }
}