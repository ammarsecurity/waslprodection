<?php

namespace App\Http\Middleware;

use App\Models\Shop;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class IdentifyShopFromDomainMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $host = $request->getHost();
        $appUrl = config('app.url');
        $appHost = parse_url($appUrl, PHP_URL_HOST) ?? $host;
        
        // Remove www. prefix if exists
        $appHost = preg_replace('/^www\./', '', $appHost);
        $host = preg_replace('/^www\./', '', $host);

        $shop = null;

        // Check if it's a custom domain
        if ($host !== $appHost) {
            $shop = \Illuminate\Support\Facades\Cache::remember("shop_custom_domain_{$host}", 60 * 60, function () use ($host) {
                return Shop::byCustomDomain($host)->first();
            });
            
            if (!$shop) {
                // Check if it's a subdomain
                $subdomain = $this->extractSubdomain($host, $appHost);
                if ($subdomain) {
                    $shop = \Illuminate\Support\Facades\Cache::remember("shop_subdomain_{$subdomain}", 60 * 60, function () use ($subdomain) {
                        return Shop::bySubdomain($subdomain)->first();
                    });
                }
            }
        } else {
            // Main domain - check if there's a root shop
            $shop = \Illuminate\Support\Facades\Cache::remember('shop_root', 60 * 60, function () {
                return Shop::rootShop()->first();
            });
        }

        // If shop not found by domain, check slug from path (fallback)
        if (!$shop && $request->has('shop_slug')) {
            $shop = Shop::bySlug($request->get('shop_slug'))->first();
        }

        // Set shop in request
        $request->merge(['current_shop' => $shop]);
        $request->attributes->set('current_shop', $shop);
        
        // Set in session for later use
        if ($shop) {
            session(['current_shop_id' => $shop->id]);
            session(['is_root_shop' => $shop->isRootShop()]);
        }

        return $next($request);
    }

    /**
     * Extract subdomain from host.
     *
     * @param  string  $host
     * @param  string  $appHost
     * @return string|null
     */
    private function extractSubdomain(string $host, string $appHost): ?string
    {
        // If host is exactly the app host, no subdomain
        if ($host === $appHost) {
            return null;
        }

        // Check if host ends with app host
        if (str_ends_with($host, '.' . $appHost)) {
            $subdomain = str_replace('.' . $appHost, '', $host);
            return $subdomain ?: null;
        }

        return null;
    }
}

