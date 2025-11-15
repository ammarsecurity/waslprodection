<?php

use App\Models\Shop;
use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('shops', function (Blueprint $table) {
            $table->string('slug')->nullable()->unique()->after('name');
            $table->string('subdomain')->nullable()->unique()->after('slug');
            $table->string('custom_domain')->nullable()->unique()->after('subdomain');
            $table->boolean('is_root_shop')->default(false)->after('custom_domain');
        });

        // Set root shop
        $rootShop = User::role('root')->whereHas('shop')->first()?->shop;
        if ($rootShop) {
            $rootShop->update([
                'is_root_shop' => true,
            ]);
        }

        // Generate slugs for existing shops
        Shop::whereNull('slug')->chunk(100, function ($shops) {
            foreach ($shops as $shop) {
                $slug = Str::slug($shop->name);
                $originalSlug = $slug;
                $counter = 1;
                
                while (Shop::where('slug', $slug)->where('id', '!=', $shop->id)->exists()) {
                    $slug = $originalSlug . '-' . $counter;
                    $counter++;
                }
                
                $shop->update(['slug' => $slug]);
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('shops', function (Blueprint $table) {
            $table->dropColumn(['slug', 'subdomain', 'custom_domain', 'is_root_shop']);
        });
    }
};
