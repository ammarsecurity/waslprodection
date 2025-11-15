<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ShopDetailsResource;
use App\Http\Resources\ShopResource;
use App\Models\Shop;
use App\Repositories\ProductRepository;
use App\Repositories\ShopRepository;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    /**
     * Get all shops with pagination and filtering options.
     *
     * @param  Request  $request  The request object
     * @return Some_Return_Value The JSON response
     */
    public function index(Request $request)
    {
        $currentShop = $request->get('current_shop');
        
        // If it's a sub shop, return only that shop
        if ($currentShop && !$currentShop->isRootShop()) {
            return $this->json('shop', [
                'total' => 1,
                'shops' => [ShopResource::make($currentShop)],
            ]);
        }

        // Root shop: return all shops
        $page = $request->page;
        $perPage = $request->per_page;
        $skip = ($page * $perPage) - $perPage;

        $shops = ShopRepository::query()->isActive();
        $shops = $shops->whereHas('products', function ($query) {
            return $query->isActive();
        });

        $total = $shops->count();

        $shops = $shops->when($perPage && $page, function ($query) use ($perPage, $skip) {
            return $query->skip($skip)->take($perPage);
        })->get();

        return $this->json('shops', [
            'total' => $total,
            'shops' => ShopResource::collection($shops),
        ]);
    }

    /**
     * Display the shop details.
     *
     * @param  Shop  $shop  The shop instance
     * @return mixed
     */
    public function show(Request $request, Shop $shop = null)
    {
        $currentShop = $request->get('current_shop');
        
        // If it's a sub shop, return only that shop
        if ($currentShop && !$currentShop->isRootShop()) {
            return $this->json('shop details', [
                'shop' => ShopDetailsResource::make($currentShop),
            ]);
        }

        // Root shop: return requested shop or current shop
        $shop = $shop ?? $currentShop;
        
        if (!$shop) {
            return $this->json('shop not found', [], 404);
        }

        return $this->json('shop details', [
            'shop' => ShopDetailsResource::make($shop),
        ]);
    }

    /**
     * Get all categories of a shop with pagination .
     */
    public function shopCategory(Request $request)
    {
        if ($request->filled('shop_id')) {
            $resolvedId = $this->resolveShopId($request->shop_id);
            if ($resolvedId) {
                $request->merge(['shop_id' => $resolvedId]);
            }
        }

        $request->validate([
            'shop_id' => 'required|exists:shops,id',
        ]);

        $page = $request->page;
        $perPage = $request->per_page;
        $skip = ($page * $perPage) - $perPage;

        $shop = ShopRepository::find($request->shop_id);

        $categories = $shop->categories()->active()->where(function ($query) use ($perPage, $page, $skip) {
            $query->when($perPage && $page, function ($query) use ($perPage, $skip) {
                return $query->skip($skip)->take($perPage);
            });
        })->get();

        $total = $shop->categories->count();

        return $this->json('Shop categories', [
            'total' => $total,
            'categories' => CategoryResource::collection($categories),
        ]);
    }

    /**
     * Resolve shop identifier (id or slug) to numeric id.
     */
    private function resolveShopId($identifier): ?int
    {
        if (blank($identifier)) {
            return null;
        }

        if (is_numeric($identifier) && Shop::whereKey($identifier)->exists()) {
            return (int) $identifier;
        }

        return Shop::where('slug', $identifier)->value('id');
    }

    /**
     * Get top 10 shops.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function topShops()
    {
        $shops = ShopRepository::query()->isActive()
            ->withCount('orders')
            ->withAvg('reviews as average_rating', 'rating')
            ->orderByDesc('average_rating')
            ->orderByDesc('orders_count')
            ->take(10)->get();

        return $this->json('top shops', [
            'shops' => ShopResource::collection($shops),
        ]);
    }

    /**
     * Get popular products of a shop.
     *
     * @param  Request  $request  The request object
     */
    public function popularProducts(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
        ]);

        $product = ProductRepository::find($request->product_id);
        $shop = $product->shop;

        $products = $shop->products()->where('id', '!=', $product->id)->isActive()
            ->withCount('orders')
            ->withAvg('reviews as average_rating', 'rating')
            ->orderByDesc('orders_count')->orderByDesc('average_rating')->take(6)->get();

        return $this->json('popular products', [
            'products' => ProductResource::collection($products),
        ]);
    }
}
