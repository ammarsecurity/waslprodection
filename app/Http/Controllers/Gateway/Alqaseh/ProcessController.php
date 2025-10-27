<?php

namespace App\Http\Controllers\Gateway\Alqaseh;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use App\Models\Course;
use App\Models\UserCourse;
use App\Models\Coupon;
use App\Models\Transaction;

class ProcessController extends Controller
{
	// شراء كورس عبر بوابة دفع خارجية
	public function directPurchaseCourse(Request $request)
	{
		$userId = $request->user_id;
		$courseId = $request->course_id;
		$couponCode = $request->coupon_code;

		$randomOrderID = rand(10000000, 99999999);

		$course = Course::find($courseId);
		if (!$course) {
			return response()->json(['message' => 'Course not found.'], 404);
		}

		$coursePurchase = UserCourse::where('user_id', $userId)->where('course_id', $courseId)->first();
		if ($coursePurchase) {
			return response()->json(['message' => 'You already purchased this course.'], 400);
		}

		$amount = $course->point;
		$coupon = null;

		if ($couponCode) {
			$coupon = Coupon::where('code', $couponCode)
				->where('valid_from', '<=', now())
				->where('valid_to', '>=', now())
				->first();

			if ($coupon && $coupon->discount_percentage > 0) {
				$amount -= $coupon->discount_percentage;
			} else {
				$coupon = null;
			}
		}

		if ($amount <= 0) {
			UserCourse::create([
				'user_id' => $userId,
				'course_id' => $courseId,
				'purchase_date' => now(),
				'coupon_id' => $coupon ? $coupon->id : null,
			]);
			return response()->json(['message' => 'Course added successfully for free.']);
		}

		DB::beginTransaction();
		try {
			$response = Http::withHeaders([
				'Authorization' => config('payment.auth'),
				'Cookie' => 'cookiesession1=678ADA6AA7434A897DD1D53A163B3698',
			])->post(config('payment.url') . '/egw/payments/create', [
				'amount' => $amount,
				'country' => 'IQ',
				'currency' => 'IQD',
				'description' => 'شراء كورس',
				'order_id' => $randomOrderID,
				'redirect_url' => config('payment.redirectUrl'),
				'transaction_type' => 'Retail',
			]);

			if (!$response->successful()) {
				throw new \Exception('Payment request failed');
			}

			$responseObject = $response->json();

			Transaction::create([
				'amount' => $amount,
				'is_complete' => false,
				'created_at' => now(),
				'order_id' => $randomOrderID,
				'user_id' => $userId,
				'transaction_type' => 'CoursePurchase',
				'course_id' => $courseId,
			]);

			DB::commit();
			return response()->json(['data' => $responseObject, 'message' => 'Successfully.']);
		} catch (\Exception $ex) {
			DB::rollBack();
			return response()->json(['message' => 'Error: ' . $ex->getMessage()], 500);
		}
	}

	// التحقق من حالة الدفع
	public function checkDirectPurchasePayment(Request $request)
	{
		$userId = $request->user_id;
		$token = $request->token;
		$orderId = $request->order_id;

		$response = Http::withHeaders([
			'Authorization' => config('payment.auth'),
		])->get(config('payment.url') . '/egw/payments/info/' . $token);

		if (!$response->successful()) {
			return response()->json(['message' => 'Payment status request failed'], 500);
		}

		$responseObject = $response->json();

		if (isset($responseObject['payment_status']) && strtolower($responseObject['payment_status']) === 'succeeded') {
			$tran = Transaction::where('order_id', $orderId)->first();
			if ($tran) {
				if ($tran->is_complete) {
					return response()->json(['message' => 'This check is already complete.'], 400);
				}
				$tran->is_complete = true;
				$tran->modified_at = now();
				$tran->save();

				UserCourse::create([
					'user_id' => $userId,
					'course_id' => $tran->course_id,
					'purchase_date' => now(),
					'coupon_id' => null,
				]);
				return response()->json(['data' => $responseObject, 'message' => 'Successfully.']);
			}
		}
		return response()->json(['message' => 'Failed to add points.'], 400);
	}
}
