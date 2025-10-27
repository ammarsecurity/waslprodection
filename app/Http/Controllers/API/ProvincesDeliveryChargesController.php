<?php
namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\ProvinceDeliveryCharge;
use Illuminate\Http\Request;

class ProvincesDeliveryChargesController extends Controller
{
	public function getProvincesDeliveryCharges($shopId)
	{
		$charges = ProvinceDeliveryCharge::where('shop_id', $shopId)
			->get()
			->map(function ($charge) {
				return [
					'id' => $charge->id,
					'province_name' => $charge->province_name,
					'delivery_charge' => $charge->delivery_charge
				];
			});
			
		return response()->json([
			'success' => true,
			'data' => $charges
		]);
	}
}
