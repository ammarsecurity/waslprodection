<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\ShopAgent;
use App\Models\User;
use Illuminate\Http\Request;

class AgentController extends Controller
{
    /**
     * Display a listing of agents for the shop.
     */
    public function index()
    {
        $shop = generaleSetting('shop');
        
        $agents = ShopAgent::where('shop_id', $shop->id)
            ->with(['customer.user'])
            ->latest()
            ->paginate(20);

        return view('shop.agents.index', compact('agents'));
    }

    /**
     * Show the form for creating a new agent.
     */
    public function create()
    {
        return view('shop.agents.create');
    }

    /**
     * Store a newly created agent in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'identifier' => 'required|string', // email or phone
        ]);

        $shop = generaleSetting('shop');
        
        // Search for user by email or phone
        $user = User::where(function($query) use ($request) {
            $query->where('email', $request->identifier)
                  ->orWhere('phone', $request->identifier);
        })->first();

        if (!$user) {
            return redirect()->back()
                ->with('error', __('User not found with this email or phone'));
        }

        // Check if user has a customer record
        $customer = Customer::where('user_id', $user->id)->first();
        
        if (!$customer) {
            return redirect()->back()
                ->with('error', __('This user is not a customer'));
        }

        // Check if already an agent
        $existingAgent = ShopAgent::where('shop_id', $shop->id)
            ->where('customer_id', $customer->id)
            ->first();

        if ($existingAgent) {
            return redirect()->back()
                ->with('error', __('This customer is already an agent for your shop'));
        }

        // Create agent
        ShopAgent::create([
            'shop_id' => $shop->id,
            'customer_id' => $customer->id,
            'is_active' => true,
        ]);

        return redirect()->route('shop.agents.index')
            ->with('success', __('Agent added successfully'));
    }

    /**
     * Toggle the status of an agent.
     */
    public function toggleStatus($id)
    {
        $shop = generaleSetting('shop');
        
        $agent = ShopAgent::where('shop_id', $shop->id)
            ->findOrFail($id);

        $agent->update([
            'is_active' => !$agent->is_active,
        ]);

        $status = $agent->is_active ? __('activated') : __('deactivated');
        
        return redirect()->back()
            ->with('success', __('Agent') . ' ' . $status . ' ' . __('successfully'));
    }

    /**
     * Remove the specified agent from storage.
     */
    public function destroy($id)
    {
        $shop = generaleSetting('shop');
        
        $agent = ShopAgent::where('shop_id', $shop->id)
            ->findOrFail($id);

        $agent->delete();

        return redirect()->back()
            ->with('success', __('Agent deleted successfully'));
    }
}
