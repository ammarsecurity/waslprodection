<?php

namespace App\Console\Commands;

use App\Services\TelegramNotificationService;
use Illuminate\Console\Command;
use GuzzleHttp\Client;

class TestTelegramCommand extends Command
{
    protected $signature = 'telegram:test {chat_id}';
    protected $description = 'Test Telegram notification with given chat_id';

    public function handle()
    {
        $chatId = $this->argument('chat_id');
        $botToken = env('TELEGRAM_BOT_TOKEN');

        if (!$botToken) {
            $this->error('❌ Telegram bot token not found in .env file');
            return 1;
        }

        $this->info('🔄 Testing Telegram notification...');
        $this->info("📱 Chat ID: {$chatId}");
        $this->info("🤖 Bot Token: " . substr($botToken, 0, 10) . "...");

        $client = new Client([
            'base_uri' => 'https://api.telegram.org',
            'verify' => false,
            'timeout' => 10,
            'http_errors' => false,
        ]);

        $message = "🧪 <b>اختبار إشعارات التليجرام</b>\n\n";
        $message .= "✅ تم إرسال هذا الإشعار بنجاح!\n";
        $message .= "📅 التاريخ: " . now()->format('Y-m-d H:i:s') . "\n";
        $message .= "🔧 هذا اختبار للتأكد من عمل إشعارات التليجرام";

        try {
            $response = $client->post('/bot' . $botToken . '/sendMessage', [
                'form_params' => [
                    'chat_id' => $chatId,
                    'text' => $message,
                    'parse_mode' => 'HTML',
                ],
            ]);

            $statusCode = $response->getStatusCode();
            $responseBody = $response->getBody()->getContents();
            
            $this->info("📊 Status Code: {$statusCode}");
            $this->info("📄 Response: {$responseBody}");
            
            if ($statusCode === 200) {
                $responseData = json_decode($responseBody, true);
                if ($responseData['ok']) {
                    $this->info('✅ تم إرسال الرسالة بنجاح!');
                    $this->info("📨 Message ID: " . $responseData['result']['message_id']);
                    return 0;
                } else {
                    $this->error('❌ فشل في إرسال الرسالة: ' . $responseData['description']);
                    return 1;
                }
            } else {
                $this->error("❌ خطأ HTTP: {$statusCode}");
                return 1;
            }
            
        } catch (\Exception $e) {
            $this->error('❌ خطأ في الإرسال: ' . $e->getMessage());
            return 1;
        }
    }
}