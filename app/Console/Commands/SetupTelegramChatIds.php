<?php

namespace App\Console\Commands;

use App\Models\Shop;
use Illuminate\Console\Command;

class SetupTelegramChatIds extends Command
{
    protected $signature = 'telegram:setup-chat-ids';
    protected $description = 'Setup Telegram chat IDs for shops';

    public function handle()
    {
        $this->info('🔍 فحص المتاجر وإعدادات التليجرام...');
        
        $shops = Shop::all();
        
        if ($shops->isEmpty()) {
            $this->warn('❌ لا توجد متاجر في قاعدة البيانات');
            return 1;
        }
        
        $this->info("📊 عدد المتاجر: " . $shops->count());
        
        $shopsWithChatId = $shops->whereNotNull('chat_id');
        $shopsWithoutChatId = $shops->whereNull('chat_id');
        
        $this->info("✅ متاجر لديها chat_id: " . $shopsWithChatId->count());
        $this->info("❌ متاجر بدون chat_id: " . $shopsWithoutChatId->count());
        
        if ($shopsWithChatId->isNotEmpty()) {
            $this->info("\n📋 المتاجر التي لديها chat_id:");
            foreach ($shopsWithChatId as $shop) {
                $this->line("  • {$shop->name} - Chat ID: {$shop->chat_id}");
            }
        }
        
        if ($shopsWithoutChatId->isNotEmpty()) {
            $this->warn("\n⚠️ المتاجر التي تحتاج chat_id:");
            foreach ($shopsWithoutChatId as $shop) {
                $this->line("  • {$shop->name} (ID: {$shop->id})");
            }
            
            $this->info("\n📝 لإضافة chat_id للمتاجر:");
            $this->info("1. أرسل رسالة للبوت في التليجرام");
            $this->info("2. افتح: https://api.telegram.org/bot" . env('TELEGRAM_BOT_TOKEN') . "/getUpdates");
            $this->info("3. ابحث عن chat_id في الاستجابة");
            $this->info("4. استخدم الأمر: php artisan telegram:set-chat-id {shop_id} {chat_id}");
        }
        
        return 0;
    }
}