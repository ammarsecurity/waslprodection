<?php

namespace App\Http\Controllers\AI;

use App\Http\Controllers\Controller;
use App\Services\AIService;
use App\Models\SentimentAnalysis;
use App\Models\Product;
use Illuminate\Http\Request;

class SentimentController extends Controller
{
    protected $aiService;

    public function __construct(AIService $aiService)
    {
        $this->aiService = $aiService;
    }

    /**
     * تحليل مشاعر النص
     */
    public function analyzeText(Request $request)
    {
        $request->validate([
            'text' => 'required|string|max:1000',
            'product_id' => 'nullable|exists:products,id',
            'review_id' => 'nullable|exists:reviews,id'
        ]);

        $text = $request->text;
        $productId = $request->product_id;
        $reviewId = $request->review_id;

        // تحليل المشاعر باستخدام الذكاء الاصطناعي
        $analysis = $this->aiService->analyzeSentiment($text);

        // حفظ التحليل في قاعدة البيانات
        $sentimentAnalysis = SentimentAnalysis::create([
            'text' => $text,
            'sentiment' => $analysis['sentiment'],
            'confidence' => $analysis['confidence'],
            'reason' => $analysis['reason'],
            'model_type' => 'gpt-3.5-turbo',
            'user_id' => auth()->id(),
            'product_id' => $productId,
            'review_id' => $reviewId
        ]);

        return response()->json([
            'success' => true,
            'data' => [
                'id' => $sentimentAnalysis->id,
                'sentiment' => $analysis['sentiment'],
                'confidence' => $analysis['confidence'],
                'reason' => $analysis['reason'],
                'sentiment_ar' => $this->getSentimentInArabic($analysis['sentiment'])
            ]
        ]);
    }

    /**
     * تحليل مشاعر منتج معين
     */
    public function analyzeProductSentiment($productId)
    {
        $product = Product::findOrFail($productId);
        
        // جلب جميع تحليلات المشاعر للمنتج
        $sentiments = SentimentAnalysis::where('product_id', $productId)
            ->orderBy('created_at', 'desc')
            ->paginate(20);

        // حساب الإحصائيات
        $stats = $this->calculateSentimentStats($productId);

        return response()->json([
            'success' => true,
            'data' => [
                'product' => $product,
                'sentiments' => $sentiments,
                'stats' => $stats
            ]
        ]);
    }

    /**
     * تحليل مشاعر جميع التعليقات
     */
    public function analyzeAllReviews()
    {
        // جلب التعليقات التي لم يتم تحليلها بعد
        $reviews = \App\Models\Review::whereDoesntHave('sentimentAnalysis')
            ->where('is_active', 1)
            ->limit(10)
            ->get();

        $results = [];

        foreach ($reviews as $review) {
            $analysis = $this->aiService->analyveSentiment($review->comment);
            
            $sentimentAnalysis = SentimentAnalysis::create([
                'text' => $review->comment,
                'sentiment' => $analysis['sentiment'],
                'confidence' => $analysis['confidence'],
                'reason' => $analysis['reason'],
                'model_type' => 'gpt-3.5-turbo',
                'user_id' => $review->user_id,
                'product_id' => $review->product_id,
                'review_id' => $review->id
            ]);

            $results[] = $sentimentAnalysis;
        }

        return response()->json([
            'success' => true,
            'message' => 'تم تحليل ' . count($results) . ' تعليق',
            'data' => $results
        ]);
    }

    /**
     * إحصائيات المشاعر
     */
    public function getSentimentStats(Request $request)
    {
        $productId = $request->get('product_id');
        $dateFrom = $request->get('date_from');
        $dateTo = $request->get('date_to');

        $query = SentimentAnalysis::query();

        if ($productId) {
            $query->where('product_id', $productId);
        }

        if ($dateFrom) {
            $query->whereDate('created_at', '>=', $dateFrom);
        }

        if ($dateTo) {
            $query->whereDate('created_at', '<=', $dateTo);
        }

        $stats = $this->calculateSentimentStats($productId, $dateFrom, $dateTo);

        return response()->json([
            'success' => true,
            'data' => $stats
        ]);
    }

    /**
     * حساب إحصائيات المشاعر
     */
    private function calculateSentimentStats($productId = null, $dateFrom = null, $dateTo = null)
    {
        $query = SentimentAnalysis::query();

        if ($productId) {
            $query->where('product_id', $productId);
        }

        if ($dateFrom) {
            $query->whereDate('created_at', '>=', $dateFrom);
        }

        if ($dateTo) {
            $query->whereDate('created_at', '<=', $dateTo);
        }

        $total = $query->count();
        $positive = $query->clone()->where('sentiment', 'positive')->count();
        $negative = $query->clone()->where('sentiment', 'negative')->count();
        $neutral = $query->clone()->where('sentiment', 'neutral')->count();

        $avgConfidence = $query->clone()->avg('confidence');

        return [
            'total' => $total,
            'positive' => $positive,
            'negative' => $negative,
            'neutral' => $neutral,
            'positive_percentage' => $total > 0 ? round(($positive / $total) * 100, 2) : 0,
            'negative_percentage' => $total > 0 ? round(($negative / $total) * 100, 2) : 0,
            'neutral_percentage' => $total > 0 ? round(($neutral / $total) * 100, 2) : 0,
            'average_confidence' => round($avgConfidence, 2)
        ];
    }

    /**
     * تحويل المشاعر للإنجليزية
     */
    private function getSentimentInArabic($sentiment)
    {
        $sentiments = [
            'positive' => 'إيجابي',
            'negative' => 'سلبي',
            'neutral' => 'محايد'
        ];

        return $sentiments[$sentiment] ?? 'غير محدد';
    }
}
