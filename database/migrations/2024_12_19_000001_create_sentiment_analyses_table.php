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
        Schema::create('sentiment_analyses', function (Blueprint $table) {
            $table->id();
            $table->text('text');
            $table->enum('sentiment', ['positive', 'negative', 'neutral']);
            $table->integer('confidence')->default(0);
            $table->text('reason')->nullable();
            $table->string('model_type')->default('gpt-3.5-turbo');
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('product_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('review_id')->nullable()->constrained()->nullOnDelete();
            $table->timestamps();

            $table->index(['sentiment', 'confidence']);
            $table->index(['product_id', 'sentiment']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sentiment_analyses');
    }
};
