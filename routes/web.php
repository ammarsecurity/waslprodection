<?php

use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\Auth\AuthController;
use App\Http\Controllers\Shop\SubscriptionController;
use App\Http\Controllers\CreateSuperAdmin;
use App\Http\Controllers\Admin\CheckOnlineUserController;
use App\Http\Controllers\AI\ChatBotController;
use App\Http\Controllers\Gateway\PaymentGatewayController;
use App\Http\Controllers\PassportStorageSupportController;
use App\Http\Controllers\Gateway\PayTabs\ProcessController;
use App\Http\Controllers\Gateway\Bkash\ExecutePaymentController;
use App\Http\Controllers\Gateway\PayPal\ProcessController as PayPalProcessController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::controller(CreateSuperAdmin::class)->middleware('guest')->group(function(){
    Route::get('/create-root', 'index')->name('create.root');
    Route::any('/create-superadmin', 'store')->name('create.superadmin');
});

// Change language
Route::get('/change-language', function () {
    if (request()->language) {
        App::setLocale(request()->language);
        session()->put('locale', request()->language);
    }

    return back();
})->name('change.language');

// Debug routes for agent system (temporary - remove in production)
Route::get('/debug/check-agent-data', function() {
    $userId = request()->get('user_id');
    $productId = request()->get('product_id');
    
    if (!$userId) {
        return response()->json(['error' => 'Please provide user_id parameter']);
    }
    
    $user = \App\Models\User::find($userId);
    if (!$user || !$user->customer) {
        return response()->json(['error' => 'User not found or not a customer']);
    }
    
    $customer = $user->customer;
    
    // Get ALL agent records (active and inactive)
    $allAgentRecords = \App\Models\ShopAgent::where('customer_id', $customer->id)
        ->with('shop')
        ->get();
    
    // Get only active agent records
    $activeAgentShops = \App\Models\ShopAgent::where('customer_id', $customer->id)
        ->where('is_active', true)
        ->with('shop')
        ->get();
    
    // Test the relationship directly
    $relationshipTest = $customer->agentShops;
    
    $result = [
        'user_id' => $user->id,
        'customer_id' => $customer->id,
        'user_name' => $user->name,
        'user_email' => $user->email,
        'user_phone' => $user->phone,
        'all_agent_records_count' => $allAgentRecords->count(),
        'all_agent_records' => $allAgentRecords->map(function($agent) {
            return [
                'agent_id' => $agent->id,
                'shop_id' => $agent->shop_id,
                'shop_name' => $agent->shop ? $agent->shop->name : 'No Shop Found',
                'shop_logo' => $agent->shop ? $agent->shop->logo : null,
                'is_active' => $agent->is_active,
                'created_at' => $agent->created_at
            ];
        }),
        'active_agent_shops_count' => $activeAgentShops->count(),
        'active_agent_shops' => $activeAgentShops->map(function($agent) {
            return [
                'agent_id' => $agent->id,
                'shop_id' => $agent->shop_id,
                'shop_name' => $agent->shop ? $agent->shop->name : 'No Shop Found',
                'is_active' => $agent->is_active
            ];
        }),
        'relationship_test_count' => $relationshipTest->count(),
        'relationship_test' => $relationshipTest->map(function($shop) {
            return [
                'shop_id' => $shop->id,
                'shop_name' => $shop->name,
                'shop_logo' => $shop->logo
            ];
        })
    ];
    
    if ($productId) {
        $product = \App\Models\Product::find($productId);
        if ($product) {
            $agentPrice = \App\Models\AgentProductPrice::where('product_id', $productId)
                ->where('shop_id', $product->shop_id)
                ->first();
            
            $isAgent = $customer->isAgentFor($product->shop_id);
            
            $result['product'] = [
                'id' => $product->id,
                'name' => $product->name,
                'shop_id' => $product->shop_id,
                'price' => $product->price,
                'discount_price' => $product->discount_price,
                'agent_price' => $agentPrice ? $agentPrice->agent_price : null,
                'is_user_agent_for_this_shop' => $isAgent
            ];
        }
    }
    
    return response()->json($result);
});

// Install Passport and storage routes
Route::controller(PassportStorageSupportController::class)->group(function () {
    Route::get('/install-passport', 'index')->name('passport.install.index');
    Route::get('/seeder-run', 'seederRun')->name('seeder.run.index');
    Route::get('/storage-install', 'storageInstall')->name('storage.install.index');
});

Route::controller(AuthController::class)->group(function () {
    Route::get('/auth/{provider}/callback', 'callback');
    Route::post('/auth/{provider}/callback', 'callback');
});



// Payment gateway routes
Route::controller(PaymentGatewayController::class)->group(function () {
    // payment routes
    Route::get('/order/{payment}/payment', 'payment')->name('order.payment');

    // success and cancel routes for payment
    Route::get('/order/{payment}/payment/success', 'paymentSuccess')->name('order.payment.success');
    Route::get('/order/{payment}/payment/cancel', 'paymentCancel')->name('order.payment.cancel');

    // success and cancel routes for callback
    Route::get('/payment/{payment}/callback-success', 'success')->name('payment.success');
    Route::get('/payment/{payment}/callback-cancel', 'cancel')->name('payment.cancel');

    // success and cancel routes for callback
    Route::post('/payment/{payment}/callback-success', 'success')->name('payment.success');
    Route::post('/payment/{payment}/callback-cancel', 'cancel')->name('payment.cancel');
});

//Paypal Payment success
Route::get('/paypal/{paypalPayment}/success', [PayPalProcessController::class, 'success'])->name('paypal.payment.success');

// Bkash Payment execute
Route::get('/bkash-payment/{payment}/execute', [ExecutePaymentController::class, 'index'])->name('bkash.payment.execute');

// Paytabs payment execute
Route::match(['get', 'post'], '/paytabs/{payment}/callback', [ProcessController::class, 'callback'])->name('paytabs.payment.callback');
Route::match(['get', 'post'], '/subscription/payment/{payment}/success', [SubscriptionController::class, 'paymentSuccess'])->name('subscription.payment.success');
Route::match(['get', 'post'], '/subscription/payment/{payment}/cancel', [SubscriptionController::class, 'paymentCancel'])->name('subscription.payment.cancel');


// check user is online or not
Route::post('/update/last/seen', [CheckOnlineUserController::class, 'checkOnlineStatus']);

// AI Demo Route
Route::get('/ai-demo', function () {
    return view('ai.demo');
})->name('ai.demo');

// AI Chat Route
Route::get('/ai-chat', [ChatBotController::class, 'index'])->name('ai.chat');

// AI Debug Route
Route::get('/ai-debug', function () {
    return response()->json([
        'openai_api_key_exists' => config('openai.api_key') ? 'Yes' : 'No',
        'openai_api_key_length' => config('openai.api_key') ? strlen(config('openai.api_key')) : 0,
        'openai_api_key_first_10' => config('openai.api_key') ? substr(config('openai.api_key'), 0, 10) : 'None',
        'openai_organization' => config('openai.organization') ?: 'None',
        'env_openai_api_key' => env('OPENAI_API_KEY') ? 'Set' : 'Not Set',
        'env_openai_organization' => env('OPENAI_ORGANIZATION') ? 'Set' : 'Not Set',
        'app_env' => env('APP_ENV'),
        'app_debug' => env('APP_DEBUG'),
    ]);
})->name('ai.debug');

// AI Test Route
Route::post('/ai-test', function () {
    return response()->json([
        'success' => true,
        'message' => 'AI API is working!',
        'timestamp' => now()->format('Y-m-d H:i:s')
    ]);
})->name('ai.test');

// handle frontend page load
Route::get('/{any}', function () {

    // manage admin and shop routes
    if (request()->is('admin/*', 'shop/*')) {
        return abort(404);
    }

    return view('app');
})->where('any', '.*');



