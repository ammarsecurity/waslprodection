<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProvinceDeliveryCharge;
use Illuminate\Http\Request;

class ProvinceDeliveryChargeController extends Controller
{
    public function index()
    {
    $shopId = auth()->user()->shop_id ?? null;
    $charges = ProvinceDeliveryCharge::where('shop_id', $shopId)->get();
    return view('admin.province_delivery_charges.index', compact('charges'));
    }

    public function create()
    {
        return view('admin.province_delivery_charges.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'province_name' => 'required|string|max:255',
            'delivery_charge' => 'required|numeric|min:0',
        ]);
        $shopId = auth()->user()->shop_id ?? null;
        ProvinceDeliveryCharge::create([
            'shop_id' => $shopId,
            'province_name' => $request->province_name,
            'delivery_charge' => $request->delivery_charge,
        ]);
        return redirect()->route('admin.province_delivery_charges.index')->with('success', 'تمت إضافة المحافظة بنجاح');
    }

    public function edit($id)
    {
        $charge = ProvinceDeliveryCharge::findOrFail($id);
        return view('admin.province_delivery_charges.edit', compact('charge'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'province_name' => 'required|string|max:255',
            'delivery_charge' => 'required|numeric|min:0',
        ]);
        $charge = ProvinceDeliveryCharge::findOrFail($id);
        $charge->update([
            'province_name' => $request->province_name,
            'delivery_charge' => $request->delivery_charge,
        ]);
        return redirect()->route('admin.province_delivery_charges.index')->with('success', 'تم تعديل المحافظة بنجاح');
    }

    public function destroy($id)
    {
        $charge = ProvinceDeliveryCharge::findOrFail($id);
        $charge->delete();
        return redirect()->route('admin.province_delivery_charges.index')->with('success', 'تم حذف المحافظة بنجاح');
    }
}
