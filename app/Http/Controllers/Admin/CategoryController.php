<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Models\Category;
use App\Repositories\CategoryRepository;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a category listing.
     */
    public function index(Request $request)
    {
        $search = $request->search ?? null;

        // Get all categories with shops relationship
        $categories = Category::with('shops')
            ->when($search, function ($query) use ($search) {
                return $query->where('name', 'like', '%'.$search.'%');
            })
            ->paginate(20);

        // dd($categories);

        return view('admin.category.index', compact('categories'));
    }

    /**
     * create a new category
     */
    public function create()
    {
        $shops = \App\Models\Shop::where('status', 1)->get();
        return view('admin.category.create', compact('shops'));
    }

    /**
     * store a new category
     */
    public function store(CategoryRequest $request)
    {
        $category = CategoryRepository::storeByRequest($request);

        // Attach category to selected shops
        if ($request->has('shop_ids') && is_array($request->shop_ids)) {
            $category->shops()->attach($request->shop_ids);
        }

        return to_route('admin.category.index')->withSuccess(__('Category created successfully'));
    }

    /**
     * edit a category
     */
    public function edit(Category $category)
    {
        $shops = \App\Models\Shop::where('status', 1)->get();
        $selectedShops = $category->shops->pluck('id')->toArray();
        return view('admin.category.edit', compact('category', 'shops', 'selectedShops'));
    }

    /**
     * update a category
     */
    public function update(CategoryRequest $request, Category $category)
    {
        $category = CategoryRepository::updateByRequest($request, $category);

        // Sync category with selected shops
        if ($request->has('shop_ids') && is_array($request->shop_ids)) {
            $category->shops()->sync($request->shop_ids);
        } else {
            $category->shops()->detach();
        }

        return to_route('admin.category.index')->withSuccess(__('Category updated successfully'));
    }

    /**
     * category status toggle
     */
    public function statusToggle(Category $category)
    {
        $category->update(['status' => ! $category->status]);

        return back()->withSuccess(__('Status updated successfully'));
    }
}
