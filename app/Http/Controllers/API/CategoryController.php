<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Repositories\CategoryRepository;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Retrieves a paginated list of categories with their associated products.
     *
     * @param  Request  $request  The HTTP request object.
     * @return \Illuminate\Http\JsonResponse The JSON response containing the categories and the total count.
     */
    public function index(Request $request)
    {
        $page = $request->page ?? 1;
        $perPage = $request->per_page ?? 20;
        $skip = ($page - 1) * $perPage;

        // Get all active categories with their shops
        $categoriesQuery = CategoryRepository::query()->active()
            ->with(['subCategories', 'shops']);

        $total = $categoriesQuery->count();

        $categories = $categoriesQuery
            ->skip($skip)
            ->take($perPage)
            ->get();

        return $this->json('categories', [
            'total' => $total,
            'categories' => CategoryResource::collection($categories),
        ]);
    }
    

    


    /**
     * Get categories by shop using shop_categories pivot table
     *
     * @param  Request  $request  The HTTP request object.
     * @return \Illuminate\Http\JsonResponse The JSON response containing the categories for the specified shop.
     */
    public function getCategoriesByShop(Request $request)
    {
        $request->validate([
            'shop_id' => 'required|exists:shops,id',
        ]);

        

        $page = $request->page ?? 1;
        $perPage = $request->per_page ?? 20;
        $skip = ($page - 1) * $perPage;

        // Get categories directly from shop_categories pivot table
        $categoriesQuery = CategoryRepository::query()->active()
            ->whereIn('id', function ($query) use ($request) {
                $query->select('category_id')
                    ->from('shop_categories')
                    ->where('shop_id', $request->shop_id);
            })
            ->with(['subCategories', 'shops'])
            ->latest('id');

        $total = $categoriesQuery->count();

        $categories = $categoriesQuery
            ->skip($skip)
            ->take($perPage)
            ->get();

        return $this->json('categories', [
            'total' => $total,
            'categories' => CategoryResource::collection($categories),
        ]);
    }

}
