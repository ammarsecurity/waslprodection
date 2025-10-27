<?php

namespace App\Models;

use App\Enums\OrderStatus;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class GeneraleSetting extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $table = 'generate_settings';

    public function mediaLogo()
    {
        return $this->belongsTo(Media::class, 'logo_id');
    }

    public function mediaAppLogo()
    {
        return $this->belongsTo(Media::class, 'app_logo_id');
    }

    public function mediaFavicon()
    {
        return $this->belongsTo(Media::class, 'favicon_id');
    }

    public function mediaFooterLogo()
    {
        return $this->belongsTo(Media::class, 'footer_logo_id');
    }

    public function mediaFooterQr()
    {
        return $this->belongsTo(Media::class, 'footer_qrcode_id');
    }

   public function logo(): Attribute
{
    $path = $this->mediaLogo?->src;
    $default = asset('assets/logo.png');

    return Attribute::make(
        get: fn () => ($path && file_exists(public_path('storage/' . $path))) 
            ? asset('storage/' . $path) 
            : $default
    );
}

public function appLogo(): Attribute
{
    $path = $this->mediaAppLogo?->src;
    $default = asset('assets/favicon.png');

    return Attribute::make(
        get: fn () => ($path && file_exists(public_path('storage/' . $path))) 
            ? asset('storage/' . $path) 
            : $default
    );
}

public function favicon(): Attribute
{
    $path = $this->mediaFavicon?->src;
    $default = asset('assets/favicon.png');

    return Attribute::make(
        get: fn () => ($path && file_exists(public_path('storage/' . $path))) 
            ? asset('storage/' . $path) 
            : $default
    );
}

public function footerLogo(): Attribute
{
    $path = $this->mediaFooterLogo?->src;
    $default = asset('assets/logoWhite.png');

    return Attribute::make(
        get: fn () => ($path && file_exists(public_path('storage/' . $path))) 
            ? asset('storage/' . $path) 
            : $default
    );
}

public function footerQr(): Attribute
{
    $path = $this->mediaFooterQr?->src;

    return Attribute::make(
        get: fn () => ($path && file_exists(public_path('storage/' . $path))) 
            ? asset('storage/' . $path) 
            : null
    );
}

    protected static function boot()
    {
        parent::boot();

        static::created(function () {
            Cache::forget('generale_setting');
            Cache::forget('default_currency');
            self::clearOrderCache();
        });

        static::updated(function () {
            Cache::forget('generale_setting');
            Cache::forget('default_currency');
            self::clearOrderCache();
        });

        static::deleted(function () {
            Cache::forget('generale_setting');
            Cache::forget('default_currency');
            self::clearOrderCache();
        });
    }

    protected static function clearOrderCache()
    {
        $cacheKeys = [
            'admin_all_orders',
            'shop_all_orders',
        ];

        foreach (OrderStatus::cases() as $status) {
            $cacheKeys[] = 'admin_status_'.Str::camel($status->value);
            $cacheKeys[] = 'shop_status_'.Str::camel($status->value);
        }

        foreach ($cacheKeys as $key) {
            Cache::forget($key);
        }
    }
}
