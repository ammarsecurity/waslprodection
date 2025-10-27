<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use App\Models\GuestOrder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class GuestOrderController extends Controller
{
    public function index(Request $request)
    {
        $shop = Auth::user()->shop ?? Auth::user()->myShop;
        $guestOrders = GuestOrder::whereHas('items', function ($q) use ($shop) {
            $q->where('shop_id', $shop->id ?? null);
        })
        ->when($request->filled('code'), function ($q) use ($request) {
            $q->where('order_code', 'like', '%'.$request->code.'%');
        })
        ->when($request->filled('name'), function ($q) use ($request) {
            $q->where('name', 'like', '%'.$request->name.'%');
        })
        ->when($request->filled('phone'), function ($q) use ($request) {
            $q->where('phone', 'like', '%'.$request->phone.'%');
        })
        ->when($request->filled('status'), function ($q) use ($request) {
            $q->where('status', $request->status);
        })
        ->when($request->filled('from') && $request->filled('to'), function ($q) use ($request) {
            $q->whereBetween('created_at', [
                $request->date('from')->startOfDay(),
                $request->date('to')->endOfDay(),
            ]);
        })
        ->latest()->paginate(20)->appends($request->query());

        return view('shop.guest-orders.index', compact('guestOrders'));
    }

    public function show(GuestOrder $guestOrder)
    {
        $shop = Auth::user()->shop ?? Auth::user()->myShop;
        // authorize belongs to this shop
        $belongs = $guestOrder->items()->where('shop_id', $shop->id ?? null)->exists();
        abort_unless($belongs, 403);

        $guestOrder->load('items');
        return view('shop.guest-orders.show', compact('guestOrder'));
    }

    public function invoice(GuestOrder $guestOrder)
    {
        $shop = Auth::user()->shop ?? Auth::user()->myShop;
        // authorize belongs to this shop
        $belongs = $guestOrder->items()->where('shop_id', $shop->id ?? null)->exists();
        abort_unless($belongs, 403);

        $guestOrder->load(['items' => function ($q) use ($shop) {
            $q->where('shop_id', $shop->id ?? null);
        }]);
        
        return view('shop.guest-orders.invoice', compact('guestOrder', 'shop'));
    }

    public function updateStatus(GuestOrder $guestOrder, Request $request)
    {
        $shop = Auth::user()->shop ?? Auth::user()->myShop;
        $belongs = $guestOrder->items()->where('shop_id', $shop->id ?? null)->exists();
        abort_unless($belongs, 403);

        $request->validate([
            'status' => 'required|in:pending,processing,completed,cancelled',
        ]);

        $guestOrder->update(['status' => $request->status]);

        return redirect()->route('shop.guest-orders.show', $guestOrder->id)->with('success', __('Status updated.'));
    }
}


