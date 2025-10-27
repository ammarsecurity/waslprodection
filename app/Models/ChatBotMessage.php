<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ChatBotMessage extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'message',
        'sender',
        'context',
        'ip_address',
        'user_agent',
        'metadata'
    ];

    protected $casts = [
        'metadata' => 'array',
        'created_at' => 'datetime',
        'updated_at' => 'datetime'
    ];

    /**
     * العلاقة مع المستخدم
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * نطاق للرسائل من المستخدم
     */
    public function scopeFromUser($query)
    {
        return $query->where('sender', 'user');
    }

    /**
     * نطاق للرسائل من الذكاء الاصطناعي
     */
    public function scopeFromAI($query)
    {
        return $query->where('sender', 'ai');
    }

    /**
     * نطاق حسب السياق
     */
    public function scopeByContext($query, $context)
    {
        return $query->where('context', $context);
    }

    /**
     * نطاق للرسائل الحديثة
     */
    public function scopeRecent($query, $days = 7)
    {
        return $query->where('created_at', '>=', now()->subDays($days));
    }

    /**
     * الحصول على اسم المرسل بالعربية
     */
    public function getSenderNameAttribute()
    {
        return $this->sender === 'user' ? 'المستخدم' : 'الذكاء الاصطناعي';
    }

    /**
     * الحصول على لون المرسل
     */
    public function getSenderColorAttribute()
    {
        return $this->sender === 'user' ? 'primary' : 'success';
    }

    /**
     * الحصول على أيقونة المرسل
     */
    public function getSenderIconAttribute()
    {
        return $this->sender === 'user' ? 'user' : 'robot';
    }

    /**
     * تنسيق الوقت
     */
    public function getFormattedTimeAttribute()
    {
        return $this->created_at->format('H:i');
    }

    /**
     * تنسيق التاريخ
     */
    public function getFormattedDateAttribute()
    {
        return $this->created_at->format('Y-m-d');
    }

    /**
     * التحقق من أن الرسالة من المستخدم
     */
    public function isFromUser()
    {
        return $this->sender === 'user';
    }

    /**
     * التحقق من أن الرسالة من الذكاء الاصطناعي
     */
    public function isFromAI()
    {
        return $this->sender === 'ai';
    }
}
