<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('guest_orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_code')->nullable();
            $table->string('name');
            $table->string('phone');
            $table->string('governorate')->nullable(); // address_line2
            $table->string('area')->nullable();
            $table->string('nearest_landmark')->nullable(); // address_line
            $table->text('note')->nullable();
            $table->string('payment_method')->nullable();
            $table->decimal('subtotal', 12, 2)->default(0);
            $table->decimal('delivery_charge', 12, 2)->default(0);
            $table->decimal('total', 12, 2)->default(0);
            $table->timestamps();
        });

        Schema::create('guest_order_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('guest_order_id')->constrained('guest_orders')->cascadeOnDelete();
            $table->unsignedBigInteger('shop_id')->nullable();
            $table->unsignedBigInteger('product_id');
            $table->string('product_name')->nullable();
            $table->string('product_thumbnail')->nullable();
            $table->unsignedInteger('quantity')->default(1);
            $table->decimal('unit_price', 12, 2)->default(0);
            $table->string('unit')->nullable();
            $table->unsignedBigInteger('size')->nullable();
            $table->unsignedBigInteger('color')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('guest_order_items');
        Schema::dropIfExists('guest_orders');
    }
};


