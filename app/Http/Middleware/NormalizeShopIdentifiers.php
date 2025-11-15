<?php

namespace App\Http\Middleware;

use App\Models\Shop;
use Closure;
use Illuminate\Http\Request;

class NormalizeShopIdentifiers
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->has('shop_id')) {
            $resolved = $this->resolveShopId($request->input('shop_id'));
            if ($resolved) {
                $request->merge(['shop_id' => $resolved]);
            }
        }

        if ($request->has('shop_ids') && is_array($request->shop_ids)) {
            $request->merge([
                'shop_ids' => collect($request->shop_ids)
                    ->map(fn ($value) => $this->resolveShopId($value) ?? $value)
                    ->all(),
            ]);
        }

        if ($request->has('products') && is_array($request->products)) {
            $products = collect($request->products)->map(function ($product) {
                if (is_array($product) && array_key_exists('shop_id', $product)) {
                    $resolved = $this->resolveShopId($product['shop_id']);
                    if ($resolved) {
                        $product['shop_id'] = $resolved;
                    }
                }

                return $product;
            })->all();

            $request->merge(['products' => $products]);
        }

        return $next($request);
    }

    private function resolveShopId($value): ?int
    {
        if (blank($value)) {
            return null;
        }

        if (is_numeric($value) && Shop::whereKey($value)->exists()) {
            return (int) $value;
        }

        return Shop::where('slug', $value)->value('id');
    }
}

