<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Customer extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    /**
     * Get all of the orders for the Customer.
     */
    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }

    /**
     * Get the user that owns the Customer.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id')->withTrashed();
    }

    /**
     * Get all of the favorites products for the Customer.
     */
    public function favorites(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'favorites', 'customer_id', 'product_id');
    }

    /**
     * Get the addresses for the user.
     */
    public function addresses(): HasMany
    {
        return $this->hasMany(Address::class);
    }

    /**
     * get all cart products for this customer.
     */
    public function carts(): HasMany
    {
        return $this->hasMany(Cart::class);
    }

    /**
     * Get the shops where this customer is an agent.
     */
    public function agentShops(): BelongsToMany
    {
        return $this->belongsToMany(Shop::class, 'shop_agents', 'customer_id', 'shop_id')
            ->withPivot('is_active')
            ->withTimestamps()
            ->wherePivot('is_active', true);
    }

    /**
     * Check if this customer is an agent for a specific shop.
     *
     * @param int $shopId The shop ID
     * @return bool True if the customer is an agent for the shop
     */
    public function isAgentFor(int $shopId): bool
    {
        return $this->agentShops()->where('shops.id', $shopId)->exists();
    }
}
