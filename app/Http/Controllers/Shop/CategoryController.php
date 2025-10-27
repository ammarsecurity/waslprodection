<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Show the form for creating a new category.
     */
    public function create()
    {
        return view('shop.category.create');
    }

    /**
     * Store a newly created category in storage.
     */
    public function store(\App\Http\Requests\CategoryRequest $request)
    {
        $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        if ($shopId) {
            $request->merge(['shop_id' => $shopId]);
        }

       // dd($request->all());    
        $category = \App\Repositories\CategoryRepository::storeByRequest($request);
        return to_route('shop.category.index')->withSuccess(__('Category created successfully'));
    }

    /**
     * Show the form for editing the specified category.
     */
    public function edit(\App\Models\Category $category)
    {
        $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        if ($category->shop_id != $shopId) {
            abort(403);
        }
        return view('shop.category.edit', compact('category'));
    }

    /**
     * Update the specified category in storage.
     */
    public function update(\App\Http\Requests\CategoryRequest $request, \App\Models\Category $category)
    {
        $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        if ($shopId) {
            $request->merge(['shop_id' => $shopId]);
        }

        $category = \App\Repositories\CategoryRepository::updateByRequest($request, $category);
        return to_route('shop.category.index')->withSuccess(__('Category updated successfully'));
    }

    /**
     * Toggle the status of the specified category.
     */
    public function statusToggle(\App\Models\Category $category)
    {
        $user = auth()->user();
        $shopId = $user->shop->id ?? null;
        if ($category->shop_id != $shopId) {
            abort(403);
        }
        $category->update(['status' => ! $category->status]);
        return back()->withSuccess(__('Status updated successfully'));
    }

    /**
     * Display a category listing.
     */
    public function index(Request $request)
    {
        $search = $request->search ?? null;
        $user = auth()->user();
        $shopId = $user->shop->id ?? null;

        // Get categories that belong to the current shop using pivot table
        $categories = \App\Models\Category::whereHas('shops', function ($query) use ($shopId) {
            if ($shopId) {
                $query->where('shops.id', $shopId);
            }
        })
        ->when($search, function ($query) use ($search) {
            return $query->where('name', 'like', '%'.$search.'%');
        })
        ->with('shops')
        ->paginate(20);

        return view('shop.category.index', compact('categories'));
    }
}
