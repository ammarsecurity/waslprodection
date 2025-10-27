<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\GuestOrder;

class GuestOrderController extends Controller
{
    public function index()
    {
        $guestOrders = GuestOrder::latest()->paginate(20);
        return view('admin.guest-orders.index', compact('guestOrders'));
    }
}


