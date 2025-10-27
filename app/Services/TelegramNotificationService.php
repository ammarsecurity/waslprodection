<?php

namespace App\Services;

use GuzzleHttp\Client;
use Illuminate\Support\Facades\Log;

class TelegramNotificationService
{
    private $client;
    private $botToken;

    public function __construct()
    {
        $this->botToken = env('TELEGRAM_BOT_TOKEN');
        $this->client = new Client([
            'base_uri' => 'https://api.telegram.org',
            'verify' => false, // Disable SSL verification for development
            'timeout' => 10,
            'http_errors' => false, // Don't throw exceptions on HTTP errors
        ]);
    }

    /**
     * Send order notification to shop's Telegram chat
     */
    public function sendOrderNotification($order, $type = 'new')
    {
        if (!$this->botToken) {
            Log::error('Telegram bot token not configured');
            return false;
        }

        if (!$order->shop->chat_id) {
            Log::error('Shop chat_id not configured for shop: ' . $order->shop->name);
            return false;
        }

        try {
            $message = $this->formatOrderMessage($order, $type);
            
            Log::info('Sending Telegram notification', [
                'shop_id' => $order->shop->id,
                'shop_name' => $order->shop->name,
                'chat_id' => $order->shop->chat_id,
                'order_id' => $order->id,
                'type' => $type
            ]);
            
            $response = $this->client->post('/bot' . $this->botToken . '/sendMessage', [
                'form_params' => [
                    'chat_id' => $order->shop->chat_id,
                    'text' => $message,
                    'parse_mode' => 'HTML',
                ],
            ]);

            $statusCode = $response->getStatusCode();
            $responseBody = $response->getBody()->getContents();
            
            Log::info('Telegram API response', [
                'status_code' => $statusCode,
                'response' => $responseBody
            ]);

            if ($statusCode === 200) {
                Log::info('Telegram notification sent successfully');
                return true;
            } else {
                Log::error('Telegram API error: ' . $responseBody);
                return false;
            }
        } catch (\Exception $e) {
            Log::error('Telegram notification failed: ' . $e->getMessage(), [
                'shop_id' => $order->shop->id,
                'chat_id' => $order->shop->chat_id,
                'order_id' => $order->id
            ]);
            return false;
        }
    }

    /**
     * Send order status change notification
     */
    public function sendOrderStatusChangeNotification($order, $oldStatus, $newStatus)
    {
        if (!$this->botToken || !$order->shop->chat_id) {
            return false;
        }

        try {
            $message = $this->formatStatusChangeMessage($order, $oldStatus, $newStatus);
            
            $response = $this->client->post('/bot' . $this->botToken . '/sendMessage', [
                'form_params' => [
                    'chat_id' => $order->shop->chat_id,
                    'text' => $message,
                    'parse_mode' => 'HTML',
                ],
            ]);

            return $response->getStatusCode() === 200;
        } catch (\Exception $e) {
            Log::error('Telegram status change notification failed: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Send payment status change notification
     */
    public function sendPaymentStatusChangeNotification($order, $oldStatus, $newStatus)
    {
        if (!$this->botToken || !$order->shop->chat_id) {
            return false;
        }

        try {
            $message = $this->formatPaymentStatusChangeMessage($order, $oldStatus, $newStatus);
            
            $response = $this->client->post('/bot' . $this->botToken . '/sendMessage', [
                'form_params' => [
                    'chat_id' => $order->shop->chat_id,
                    'text' => $message,
                    'parse_mode' => 'HTML',
                ],
            ]);

            return $response->getStatusCode() === 200;
        } catch (\Exception $e) {
            Log::error('Telegram payment status change notification failed: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Format order message for new orders
     */
    private function formatOrderMessage($order, $type)
    {
        $customer = $order->customer?->user;
        $products = $order->products;
        
        $message = "🛒 <b>طلب جديد</b>\n\n";
        $message .= "📋 <b>رقم الطلب:</b> #{$order->prefix}{$order->order_code}\n";
        $message .= "👤 <b>العميل:</b> {$customer?->name}\n";
        $message .= "📞 <b>الهاتف:</b> {$customer?->phone}\n";
        $message .= "📧 <b>البريد:</b> {$customer?->email}\n\n";
        
        // Address information
        if ($order->province_name || $order->province_area || $order->nearest_landmark) {
            $message .= "🏠 <b>العنوان:</b>\n";
            if ($order->province_name) {
                $message .= "• المحافظة: {$order->province_name}\n";
            }
            if ($order->province_area) {
                $message .= "• المنطقة: {$order->province_area}\n";
            }
            if ($order->nearest_landmark) {
                $message .= "• المعلم الأقرب: {$order->nearest_landmark}\n";
            }
            $message .= "\n";
        }
        
        // Products
        $message .= "🛍 <b>المنتجات:</b>\n";
        foreach ($products as $product) {
            $message .= "• {$product->name} × {$product->pivot->quantity}\n";
            if ($product->pivot->size) {
                $message .= "  الحجم: {$product->pivot->size}\n";
            }
            if ($product->pivot->color) {
                $message .= "  اللون: {$product->pivot->color}\n";
            }
        }
        
        $message .= "\n💰 <b>المبلغ الإجمالي:</b> " . showCurrency($order->payable_amount) . "\n";
        $message .= "🚚 <b>رسوم التوصيل:</b> " . showCurrency($order->delivery_charge) . "\n";
        $message .= "💳 <b>طريقة الدفع:</b> " . __($order->payment_method->value) . "\n";
        $message .= "📊 <b>حالة الطلب:</b> " . __($order->order_status->value) . "\n";
        $message .= "💵 <b>حالة الدفع:</b> " . __($order->payment_status->value) . "\n";
        
        if ($order->instruction) {
            $message .= "\n📝 <b>ملاحظات:</b> {$order->instruction}\n";
        }
        
        $message .= "\n📅 <b>التاريخ:</b> " . $order->created_at->format('Y-m-d H:i:s');
        
        return $message;
    }

    /**
     * Format status change message
     */
    private function formatStatusChangeMessage($order, $oldStatus, $newStatus)
    {
        $message = "🔄 <b>تحديث حالة الطلب</b>\n\n";
        $message .= "📋 <b>رقم الطلب:</b> #{$order->prefix}{$order->order_code}\n";
        $message .= "👤 <b>العميل:</b> {$order->customer?->user?->name}\n";
        $message .= "📞 <b>الهاتف:</b> {$order->customer?->user?->phone}\n\n";
        $message .= "🔄 <b>تغيير الحالة:</b>\n";
        $message .= "من: <b>" . __($oldStatus) . "</b>\n";
        $message .= "إلى: <b>" . __($newStatus) . "</b>\n\n";
        $message .= "📅 <b>التاريخ:</b> " . now()->format('Y-m-d H:i:s');
        
        return $message;
    }

    /**
     * Format payment status change message
     */
    private function formatPaymentStatusChangeMessage($order, $oldStatus, $newStatus)
    {
        $message = "💳 <b>تحديث حالة الدفع</b>\n\n";
        $message .= "📋 <b>رقم الطلب:</b> #{$order->prefix}{$order->order_code}\n";
        $message .= "👤 <b>العميل:</b> {$order->customer?->user?->name}\n";
        $message .= "💰 <b>المبلغ:</b> " . showCurrency($order->payable_amount) . "\n\n";
        $message .= "💳 <b>تغيير حالة الدفع:</b>\n";
        $message .= "من: <b>" . __($oldStatus) . "</b>\n";
        $message .= "إلى: <b>" . __($newStatus) . "</b>\n\n";
        $message .= "📅 <b>التاريخ:</b> " . now()->format('Y-m-d H:i:s');
        
        return $message;
    }
}
