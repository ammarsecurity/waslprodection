<?php

namespace App\Console\Commands;

use App\Models\Shop;
use Illuminate\Console\Command;

class SetTelegramChatId extends Command
{
    protected $signature = 'telegram:set-chat-id {shop_id} {chat_id}';
    protected $description = 'Set Telegram chat ID for a specific shop';

    public function handle()
    {
        $shopId = $this->argument('shop_id');
        $chatId = $this->argument('chat_id');
        
        $shop = Shop::find($shopId);
        
        if (!$shop) {
            $this->error("❌ المتجر غير موجود (ID: {$shopId})");
            return 1;
        }
        
        $shop->update(['chat_id' => $chatId]);
        
        $this->info("✅ تم تحديث chat_id للمتجر: {$shop->name}");
        $this->info("📱 Chat ID: {$chatId}");
        
        // Test the chat ID
        $this->info("\n🧪 اختبار إرسال رسالة...");
        $this->call('telegram:test', ['chat_id' => $chatId]);
        
        return 0;
    }
}