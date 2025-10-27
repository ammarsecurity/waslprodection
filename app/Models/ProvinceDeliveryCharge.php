<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProvinceDeliveryCharge extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'shop_id',
        'province_name',
        'delivery_charge'
    ];
    
    protected $casts = [
        'delivery_charge' => 'decimal:2'
    ];

    public function shop()
    {
        return $this->belongsTo(Shop::class);
    }
}
