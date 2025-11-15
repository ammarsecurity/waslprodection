<?php

namespace App\Http\Middleware;

use App\Models\Shop;
use Illuminate\Http\Middleware\TrustHosts as Middleware;

class TrustHosts extends Middleware
{
    /**
     * Get the host patterns that should be trusted.
     *
     * @return array<int, string|null>
     */
    public function hosts(): array
    {
        $hosts = [
            $this->allSubdomainsOfApplicationUrl(),
        ];

        // Add custom domains from shops
        $customDomains = Shop::whereNotNull('custom_domain')
            ->pluck('custom_domain')
            ->toArray();

        foreach ($customDomains as $domain) {
            $hosts[] = $domain;
            // Also add www. version
            if (!str_starts_with($domain, 'www.')) {
                $hosts[] = 'www.' . $domain;
            }
        }

        return $hosts;
    }
}
