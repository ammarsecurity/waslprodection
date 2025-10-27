<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SentimentAnalysis extends Model
{
    use HasFactory;

    protected $fillable = [
        'text',
        'sentiment',
        'confidence',
        'reason',
        'model_type',
        'user_id',
        'product_id',
        'review_id'
    ];

    protected $casts = [
        'confidence' => 'integer',
    ];

    /**
     * العلاقة مع المستخدم
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * العلاقة مع المنتج
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * العلاقة مع التعليق
     */
    public function review()
    {
        return $this->belongsTo(Review::class);
    }

    /**
     * نطاق للمشاعر الإيجابية
     */
    public function scopePositive($query)
    {
        return $query->where('sentiment', 'positive');
    }

    /**
     * نطاق للمشاعر السلبية
     */
    public function scopeNegative($query)
    {
        return $query->where('sentiment', 'negative');
    }

    /**
     * نطاق للمشاعر المحايدة
     */
    public function scopeNeutral($query)
    {
        return $query->where('sentiment', 'neutral');
    }

    /**
     * نطاق للثقة العالية
     */
    public function scopeHighConfidence($query, $threshold = 80)
    {
        return $query->where('confidence', '>=', $threshold);
    }
}
