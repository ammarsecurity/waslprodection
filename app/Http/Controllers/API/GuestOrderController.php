<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\GuestOrderRequest;
use App\Models\GuestOrder;
use App\Models\GuestOrderItem;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use GuzzleHttp\Client;

class GuestOrderController extends Controller
{
    public function place(GuestOrderRequest $request)
    {
        return DB::transaction(function () use ($request) {
            $addr = $request->address;
            $subtotal = 0;
            $totalQty = 0;

            // generate unique random order code
            do {
                $randomCode = 'G' . strtoupper(Str::random(8));
            } while (GuestOrder::where('order_code', $randomCode)->exists());

            $guestOrder = GuestOrder::create([
                'order_code' => $randomCode,
                'name' => $request->name,
                'phone' => $request->phone,
                'governorate' => $addr['address_line'] ?? null,
                'area' => $addr['address_line2'] ?? null,
                'nearest_landmark' => $addr['nearest_landmark'] ?? null,
                'note' => $request->note,
                'payment_method' => $request->payment_method,
                'subtotal' => 0,
                'delivery_charge' => $request->delivery_charge ?? 5000,
                'total' => 0,
            ]);

            $orderItems = [];
            foreach ($request->products as $item) {
                $product = Product::find($item['product_id']);
                if (! $product) continue;

                $unitPrice = $product->discount_price > 0 ? $product->discount_price : $product->price;
                $qty = (int) ($item['quantity'] ?? 1);
                $subtotal += ($unitPrice * $qty);
                $totalQty += $qty;

                GuestOrderItem::create([
                    'guest_order_id' => $guestOrder->id,
                    'shop_id' => $product->shop_id,
                    'product_id' => $product->id,
                    'product_name' => $product->name,
                    'product_thumbnail' => $product->thumbnail,
                    'quantity' => $qty,
                    'unit_price' => $unitPrice,
                    'unit' => $item['unit'] ?? null,
                    'size' => $item['size'] ?? null,
                    'color' => $item['color'] ?? null,
                ]);

                $orderItems[] = "{$product->name} × {$qty}";
            }

            // حساب الدليفري
            $deliveryCharge = $request->delivery_charge ?? 0;
            if (!$deliveryCharge) {
                $uniqueShops = collect($request->products)->pluck('shop_id')->unique()->count();
                $deliveryCharge = $uniqueShops * config('app.default_delivery_charge_per_shop', 5);
            }

            $guestOrder->update([
                'subtotal' => $subtotal,
                'delivery_charge' => $deliveryCharge,
                'total' => $subtotal + $deliveryCharge,
            ]);

          $shop = $product->shop ?? null;
            if ($shop && $shop->chat_id) {
                $message = "📦 طلب جديد\n"
                    . "اسم الزبون: {$guestOrder->name}\n"
                    . "📞 الهاتف: {$guestOrder->phone}\n"
                    . "🏠 العنوان: {$guestOrder->governorate}, {$guestOrder->area}\n"
                    . "🛍 المنتجات:\n- " . implode("\n- ", $orderItems) . "\n"
                    . "💵 المجموع: {$guestOrder->total}\n"
                    . "📅 التاريخ: " . now()->format('Y-m-d H:i:s');

                $client = new Client([
                    'base_uri' => 'https://api.telegram.org',
                    'verify'   => app()->environment('production'), 
                ]);

                $client->post('/bot' . env('TELEGRAM_BOT_TOKEN') . '/sendMessage', [
                    'form_params' => [
                        'chat_id' => $shop->chat_id,
                        'text'    => $message,
                    ],
                ]);
            }

            return $this->json('Guest order received successfully', [
                'guest_order_id' => $guestOrder->id,
            ]);
        });
    }
}
