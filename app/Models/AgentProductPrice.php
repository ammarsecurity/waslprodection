<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AgentProductPrice extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'shop_id',
        'agent_price',
    ];

    protected $casts = [
        'agent_price' => 'float',
    ];

    /**
     * Get the product that this price belongs to.
     */
    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * Get the shop that this price belongs to.
     */
    public function shop(): BelongsTo
    {
        return $this->belongsTo(Shop::class);
    }
}