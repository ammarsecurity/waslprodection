<?php
namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProvinceDeliveryCharge;
use Illuminate\Support\Facades\Auth;

class ProvinceDeliveryChargeController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        $provinceDeliveryCharges = ProvinceDeliveryCharge::where('shop_id', $shopId)->get();
        return view('shop.province_delivery_charges.index', compact('provinceDeliveryCharges'));
    }

    public function create()
    {
        return view('shop.province_delivery_charges.create');
    }

    public function store(Request $request)
    {
      $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        $request->validate([
            'province_name' => 'required|string|max:255',
            'delivery_charge' => 'required|numeric|min:0',
        ]);
        ProvinceDeliveryCharge::create([
            'shop_id' => $shopId,
            'province_name' => $request->province_name,
            'delivery_charge' => $request->delivery_charge,
        ]);
        return redirect()->route('shop.province_delivery_charges.index')->with('success', 'تمت الإضافة بنجاح');
    }

    public function edit($id)
    {
      $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        $charge = ProvinceDeliveryCharge::where('shop_id', $shopId)->findOrFail($id);
        return view('shop.province_delivery_charges.edit', compact('charge'));
    }

    public function update(Request $request, $id)
    {
      $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        $request->validate([
            'province_name' => 'required|string|max:255',
            'delivery_charge' => 'required|numeric|min:0',
        ]);
        $charge = ProvinceDeliveryCharge::where('shop_id', $shopId)->findOrFail($id);
        $charge->update([
            'province_name' => $request->province_name,
            'delivery_charge' => $request->delivery_charge,
        ]);
        return redirect()->route('shop.province_delivery_charges.index')->with('success', 'تم التعديل بنجاح');
    }

    public function destroy($id)
    {
      $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        $charge = ProvinceDeliveryCharge::where('shop_id', $shopId)->findOrFail($id);
        $charge->delete();
        return redirect()->route('shop.province_delivery_charges.index')->with('success', 'تم الحذف بنجاح');
    }
}
