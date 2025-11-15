<?php

namespace App\Repositories;

use Abedin\Maker\Repositories\Repository;
use App\Http\Requests\ShopCreateRequest;
use App\Models\Shop;
use Carbon\Carbon;

class ShopRepository extends Repository
{
    /**
     * base method
     *
     * @method model()
     */
    public static function model()
    {
        return Shop::class;
    }

    /**
     * new shop creation by request.
     */
    public static function storeByRequest(ShopCreateRequest $request): Shop
    {
        // create new user
        $user = UserRepository::registerNewUser($request);

        // assign role
        $user->assignRole('shop');

        // create wallet
        WalletRepository::storeByRequest($user);

        // shop logo
        $thumbnail = MediaRepository::storeByRequest($request->shop_logo, 'shops/logo', 'image');

        // shop banner
        $banner = null;
        if ($request->hasFile('shop_banner')) {
            $banner = MediaRepository::storeByRequest($request->shop_banner, 'shops/banner', 'image');
        }

        // Generate slug if not provided
        $slug = $request->slug ?? Shop::generateSlug($request->shop_name);

        $isRoot = $request->boolean('is_root_shop');
        if ($isRoot) {
            Shop::where('is_root_shop', true)->update(['is_root_shop' => false]);
        }
        
        // create new shop and return
        $data = [
            'user_id' => $user->id,
            'name' => $request->shop_name,
            'logo_id' => $thumbnail ? $thumbnail->id : null,
            'banner_id' => $banner ? $banner->id : null,
            'delivery_charge' => $request->delivery_charge ?? 0,
            'address' => $request->address,
            'description' => $request->description,
            'status' => true,
            'slug' => $slug,
            'is_root_shop' => $isRoot,
        ];

        if ($isRoot) {
            $data['subdomain'] = null;
            $data['custom_domain'] = null;
        } else {
            $data['subdomain'] = $request->subdomain;
            $data['custom_domain'] = $request->custom_domain;
        }

        return self::create($data);
    }

    /**
     * update shop by request.
     */
    public static function updateByRequest($shop, $request): Shop
    {
        // تحديث معلومات المستخدم فقط
        UserRepository::updateByRequest($request, $shop->user);

        // تحديث شعار المتجر
        $thumbnail = self::updateLogo($shop, $request);

        // تحديث بانر المتجر
        $banner = self::updateBanner($shop, $request);


        // Generate slug if not provided and shop name changed
        $slug = $request->slug;
        if (!$slug && $request->shop_name !== $shop->name) {
            $slug = Shop::generateSlug($request->shop_name);
        } elseif (!$slug) {
            $slug = $shop->slug;
        }
        
        $updateData = [
            'name' => $request->shop_name,
            'logo_id' => $thumbnail ? $thumbnail->id : $shop->logo_id,
            'banner_id' => $banner ? $banner->id : $shop->banner_id,
            'delivery_charge' => $request->delivery_charge ?? $shop->delivery_charge,
            'address' => $request->address ?? $shop->address,
            'description' => $request->description ?? $shop->description,
            'min_order_amount' => $request->min_order_amount ?? $shop->min_order_amount,
            'prefix' => $request->prefix ?? $shop->prefix,
            'opening_time' => $request->opening_time ?? $shop->opening_time,
            'closing_time' => $request->closing_time ?? $shop->closing_time,
            'estimated_delivery_time' => $request->estimated_delivery_time ?? $shop->estimated_delivery_time,
            'chat_id' => $request->chat_id ?? $shop->chat_id,
            'slug' => $slug,
        ];
        
        $isRoot = $request->boolean('is_root_shop', $shop->is_root_shop);
        if ($isRoot) {
            Shop::where('is_root_shop', true)
                ->where('id', '!=', $shop->id)
                ->update(['is_root_shop' => false]);
            $shop->is_root_shop = true;
        } else {
            $shop->is_root_shop = false;
        }
        $updateData['is_root_shop'] = $shop->is_root_shop;

        // Only update subdomain and custom_domain if resulting shop is not root
        if (!$updateData['is_root_shop']) {
            $updateData['subdomain'] = $request->subdomain ?? $shop->subdomain;
            $updateData['custom_domain'] = $request->custom_domain ?? $shop->custom_domain;
        } else {
            $updateData['subdomain'] = null;
            $updateData['custom_domain'] = null;
        }
        
        $shop->update($updateData);
        $user = UserRepository::updateByRequest($request, $shop->user);
        return $shop;
    }

  

    public static function updateShopSetting($shop, $request): Shop
    {
        $openTime = $request->opening_time ? Carbon::parse($request->opening_time)->format('H:i:s') : $shop->opening_time;
        $closeTime = $request->closing_time ? Carbon::parse($request->closing_time)->format('H:i:s') : $shop->closing_time;
        // update shop
        $shop->update([
            'delivery_charge' => $request->delivery_charge ?? 0,
            'min_order_amount' => $request->min_order_amount ?? $shop->min_order_amount,
            'prefix' => $request->prefix ?? $shop->prefix,
            'opening_time' => $openTime,
            'closing_time' => $closeTime,
            'estimated_delivery_time' => $request->estimated_delivery_time ?? $shop->estimated_delivery_time,
            'off_day' => $request->off_day ? array_map(function ($value) {
                return strtolower($value);
            }, $request->off_day) : null,

        ]);

        return $shop;
    }

    public static function updateShopInfo($shop, $request): Shop
    {
        // shop logo
        $thumbnail = self::updateLogo($shop, $request);

        // shop banner
        $banner = self::updateBanner($shop, $request);

        // determine slug
        $slug = $request->slug;
        if (!$slug && $request->shop_name !== $shop->name) {
            $slug = Shop::generateSlug($request->shop_name);
        } elseif (!$slug) {
            $slug = $shop->slug;
        }

        // update shop
        $updateData = [
            'name' => $request->shop_name,
            'logo_id' => $thumbnail ? $thumbnail->id : $shop->logo_id,
            'banner_id' => $banner ? $banner->id : $shop->banner_id,
            'address' => $request->address ?? $shop->address,
            'description' => $request->description ?? $shop->description,
            'chat_id' => $request->chat_id ?? $shop->chat_id,
            'slug' => $slug,
        ];
        
        $isRoot = $request->boolean('is_root_shop', $shop->is_root_shop);
        if ($isRoot) {
            Shop::where('is_root_shop', true)
                ->where('id', '!=', $shop->id)
                ->update(['is_root_shop' => false]);
            $shop->is_root_shop = true;
        } else {
            $shop->is_root_shop = false;
        }
        $updateData['is_root_shop'] = $shop->is_root_shop;

        // Only update subdomain and custom_domain if resulting shop is not root
        if (!$updateData['is_root_shop']) {
            $updateData['subdomain'] = $request->subdomain ?? $shop->subdomain;
            $updateData['custom_domain'] = $request->custom_domain ?? $shop->custom_domain;
        } else {
            $updateData['subdomain'] = null;
            $updateData['custom_domain'] = null;
        }
        
        $shop->update($updateData);


        return $shop;
    }

    /**
     * Update or create a logo for the shop.
     */
    private static function updateLogo($shop, $request)
    {
        $thumbnail = $shop?->mediaLogo;
        // if logo and thumbnail is not null
        if ($request->hasFile('shop_logo')) {
            if ($thumbnail) {
                // update existing logo
                $thumbnail = MediaRepository::updateByRequest(
                    $request->shop_logo,
                    'shops/logo',
                    'image',
                    $thumbnail
                );
            } else {
                // create new logo
                $thumbnail = MediaRepository::storeByRequest(
                    $request->shop_logo,
                    'shops/logo',
                    'image'
                );
            }
        }

        return $thumbnail;
    }

    /**
     * Update or create a banner for the shop.
     */
    private static function updateBanner($shop, $request)
    {
        $thumbnail = $shop?->mediaBanner;
        // if banner and thumbnail is not null
        if ($request->hasFile('shop_banner')) {
            if ($thumbnail) {
                // update existing banner
                $thumbnail = MediaRepository::updateByRequest(
                    $request->shop_banner,
                    'shops/banner',
                    'image',
                    $thumbnail
                );
            } else {
                // create new banner
                $thumbnail = MediaRepository::storeByRequest(
                    $request->shop_banner,
                    'shops/banner',
                    'image'
                );
            }
        }

        return $thumbnail;
    }
}
