<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('province_name')->nullable()->after('address_id');
            $table->string('province_area')->nullable()->after('province_name');
            $table->text('nearest_landmark')->nullable()->after('province_area');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn(['province_name', 'province_area', 'nearest_landmark']);
        });
    }
};
