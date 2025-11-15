<?php

namespace App\Providers;

use App\Models\Shop;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to your application's "home" route.
     *
     * Typically, users are redirected here after authentication.
     *
     * @var string
     */
    public const HOME = '/home';

    /**
     * Define your route model bindings, pattern filters, and other route configuration.
     */
    public function boot(): void
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(60)->by($request->user()?->id ?: $request->ip());
        });

        Route::bind('shop', function ($value) {
            return Shop::query()
                ->where('id', $value)
                ->orWhere('slug', $value)
                ->firstOrFail();
        });

        $this->routes(function () {
            // API routes with shop identification
            Route::middleware(['api', 'identifyShop'])->prefix('api')->group(base_path('routes/api.php'));

            // Rider routes
            Route::middleware('api')->prefix('api')->group(base_path('routes/rider.php'));

            // Rider routes
            Route::middleware('api')->prefix('api')->group(base_path('routes/seller.php'));

            // Shop routes (admin panel - not affected by domain)
            Route::middleware(['web', 'chack_root_user'])->prefix('shop')->group(base_path('routes/shop.php'));

            // Admin routes (not affected by domain)
            Route::middleware(['web', 'chack_root_user'])->prefix('admin')->group(base_path('routes/admin.php'));

            // Domain-based routes for shops (subdomains and custom domains)
            $this->mapShopDomainRoutes();

            // Main domain routes (root shop marketplace)
            Route::middleware(['web', 'chack_root_user', 'identifyShop'])->group(base_path('routes/web.php'));
        });
    }

    /**
     * Map shop domain routes (subdomains and custom domains).
     */
    protected function mapShopDomainRoutes(): void
    {
        // If migration not yet run (during php artisan migrate), skip.
        if (!\Illuminate\Support\Facades\Schema::hasColumn('shops', 'subdomain')) {
            return;
        }

        // Get all shops with subdomains or custom domains (cached)
        $shops = \Illuminate\Support\Facades\Cache::remember('shop_domains_routes', 60 * 60, function () {
            return \App\Models\Shop::where(function ($query) {
                $query->whereNotNull('subdomain')
                      ->orWhereNotNull('custom_domain');
            })->where('is_root_shop', false)->get();
        });

        foreach ($shops as $shop) {
            // Handle custom domains
            if ($shop->custom_domain) {
                Route::domain($shop->custom_domain)
                    ->middleware(['web', 'chack_root_user', 'identifyShop'])
                    ->group(base_path('routes/web.php'));

                // Also handle www. version
                if (!str_starts_with($shop->custom_domain, 'www.')) {
                    Route::domain('www.' . $shop->custom_domain)
                        ->middleware(['web', 'chack_root_user', 'identifyShop'])
                        ->group(base_path('routes/web.php'));
                }
            }

            // Handle subdomains
            if ($shop->subdomain) {
                $appUrl = config('app.url');
                $appHost = parse_url($appUrl, PHP_URL_HOST);
                if (!$appHost) {
                    // Fallback if URL parsing fails
                    continue;
                }
                $appHost = preg_replace('/^www\./', '', $appHost);
                
                Route::domain($shop->subdomain . '.' . $appHost)
                    ->middleware(['web', 'chack_root_user', 'identifyShop'])
                    ->group(base_path('routes/web.php'));
            }
        }
    }
}
