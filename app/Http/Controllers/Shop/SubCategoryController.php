<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use App\Http\Requests\SubCategoryRequest;
use App\Models\SubCategory;
use App\Repositories\SubCategoryRepository;

class SubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = auth()->user();
        $shopId = $user->shop->id ?? null;

        // First, get categories assigned to this shop
        $shopCategories = \App\Models\Category::whereHas('shops', function ($query) use ($shopId) {
            $query->where('shop_id', $shopId);
        })->pluck('id');

        // Then, get subcategories that belong to these categories via many-to-many relationship
        $subCategories = \App\Models\SubCategory::whereHas('categories', function ($query) use ($shopCategories) {
            $query->whereIn('categories.id', $shopCategories);
        })->with('categories')->latest('id')->paginate(10);

        return view('shop.sub-category.index', compact('subCategories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    // public function create()
    // {
    //     $user = auth()->user();
    //     $shopId = $user->shop->id ?? null;

    //     // First, get categories assigned to this shop
    //     $categories = \App\Models\Category::whereHas('shops', function ($query) use ($shopId) {
    //         $query->where('shop_id', $shopId);
    //     })->active()->get();

    //     return view('shop.sub-category.create', compact('categories'));
    // }

    /**
     * Store a newly created resource in storage.
     */
    // public function store(SubCategoryRequest $request)
    // {
    //     $user = auth()->user();
    //     $shopId = $user->shop->id ?? null;
    //     $request->merge(['shop_id' => $shopId]);

    //     SubCategoryRepository::storeByRequest($request);

    //     return to_route('shop.subcategory.index')->with('success', __('Sub Category created successfully'));
    // }

    /**
     * Show the form for editing the specified resource.
     */
   
    /**
     * Update the specified resource in storage.
     */
    // public function update(SubCategoryRequest $request, SubCategory $subCategory)
    // {
    //     $user = auth()->user();
    //     $shopId = $user->shop->id ?? null;
    //     $request->merge(['shop_id' => $shopId]);
    //     SubCategoryRepository::updateByRequest($request, $subCategory);

    //     return to_route('shop.subcategory.index')->with('success', __('Sub Category updated successfully'));
    // }

    /**
     * Remove the specified resource from storage.
     */
    // public function destroy(SubCategory $subCategory)
    // {
    //     $subCategory->delete();

    //     return to_route('shop.subcategory.index')->with('success', __('Deleted successfully'));
    // }

    // /**
    //  * status toggle
    //  */
    // public function statusToggle(SubCategory $subCategory)
    // {
    //     $subCategory->update(['is_active' => ! $subCategory->is_active]);

    //     return back()->with('success', __('Status updated successfully'));
    // }
}
