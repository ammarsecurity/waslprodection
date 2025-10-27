<?php

namespace App\Http\Controllers\AI;

use App\Http\Controllers\Controller;
use App\Services\AIService;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\SubCategory;

class SmartSearchController extends Controller
{
    protected $aiService;

    public function __construct(AIService $aiService)
    {
        $this->aiService = $aiService;
    }

    /**
     * البحث الذكي المحسّن
     */
    public function smartSearch(Request $request)
    {
        $query = $request->get('q', '');
        $category = $request->get('category');
        $shopId = auth()->user()->shop->id ?? null;

        if (empty($query)) {
            return response()->json([
                'success' => false,
                'message' => 'يرجى إدخال كلمة البحث'
            ]);
        }

        // تحسين استعلام البحث باستخدام الذكاء الاصطناعي
        $aiAnalysis = $this->aiService->improveSearchQuery($query);
        
        // البحث في المنتجات
        $products = $this->searchProducts($aiAnalysis['keywords'], $category, $shopId);
        
        // تحليل النتائج
        $searchAnalysis = $this->aiService->analyzeSearchResults($products->toArray(), $query);

        return response()->json([
            'success' => true,
            'data' => [
                'original_query' => $query,
                'improved_query' => $aiAnalysis['improved_query'],
                'suggestions' => $aiAnalysis['suggestions'],
                'keywords' => $aiAnalysis['keywords'],
                'products' => $products,
                'analysis' => $searchAnalysis,
                'total_results' => $products->count()
            ]
        ]);
    }

    /**
     * البحث في المنتجات
     */
    private function searchProducts(array $keywords, $category = null, $shopId = null)
    {
        $query = Product::query();

        // فلترة حسب المتجر
        if ($shopId) {
            $query->where('shop_id', $shopId);
        }

        // فلترة حسب الفئة
        if ($category) {
            $query->whereHas('categories', function ($q) use ($category) {
                $q->where('category_id', $category);
            });
        }

        // البحث في الكلمات المفتاحية
        foreach ($keywords as $keyword) {
            $query->where(function ($q) use ($keyword) {
                $q->where('name', 'like', "%{$keyword}%")
                  ->orWhere('description', 'like', "%{$keyword}%")
                  ->orWhere('meta_keywords', 'like', "%{$keyword}%");
            });
        }

        return $query->with(['categories', 'subCategories', 'medias'])
                    ->where('is_active', 1)
                    ->where('is_approve', 1)
                    ->paginate(20);
    }

    /**
     * اقتراحات البحث التلقائية
     */
    public function searchSuggestions(Request $request)
    {
        $query = $request->get('q', '');
        
        if (strlen($query) < 2) {
            return response()->json([
                'success' => true,
                'suggestions' => []
            ]);
        }

        // البحث في أسماء المنتجات
        $productSuggestions = Product::where('name', 'like', "%{$query}%")
            ->where('is_active', 1)
            ->where('is_approve', 1)
            ->limit(5)
            ->pluck('name')
            ->toArray();

        // البحث في الفئات
        $categorySuggestions = Category::where('name', 'like', "%{$query}%")
            ->active()
            ->limit(3)
            ->pluck('name')
            ->toArray();

        // البحث في الأقسام الفرعية
        $subCategorySuggestions = SubCategory::where('name', 'like', "%{$query}%")
            ->isActive()
            ->limit(3)
            ->pluck('name')
            ->toArray();

        $suggestions = array_merge(
            $productSuggestions,
            $categorySuggestions,
            $subCategorySuggestions
        );

        return response()->json([
            'success' => true,
            'suggestions' => array_unique($suggestions)
        ]);
    }

    /**
     * تحليل نتائج البحث
     */
    public function analyzeSearchResults(Request $request)
    {
        $query = $request->get('q', '');
        $productIds = $request->get('product_ids', []);

        if (empty($productIds)) {
            return response()->json([
                'success' => false,
                'message' => 'لم يتم العثور على منتجات للتحليل'
            ]);
        }

        $products = Product::whereIn('id', $productIds)->get();
        $analysis = $this->aiService->analyzeSearchResults($products->toArray(), $query);

        return response()->json([
            'success' => true,
            'analysis' => $analysis
        ]);
    }
}
