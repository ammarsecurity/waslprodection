<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class GuestOrder extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public const STATUSES = ['pending', 'processing', 'completed', 'cancelled'];

    public function items(): HasMany
    {
        return $this->hasMany(GuestOrderItem::class);
    }
}


