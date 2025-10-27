<?php

namespace App\Services;

use OpenAI\Client;
use OpenAI\ValueObjects\ApiKey;
use GuzzleHttp\Client as GuzzleClient;
use Illuminate\Support\Facades\Log;

class AIService
{
    /**
     * إنشاء OpenAI Client
     */
    private function getOpenAIClient(): Client
    {
        $apiKey = ApiKey::from(config('openai.api_key'));
        $httpClient = new GuzzleClient();
        
        return new Client($apiKey, $httpClient);
    }

    /**
     * تحليل المشاعر للتعليقات
     */
    public function analyzeSentiment(string $text): array
    {
        try {
            $response = $this->getOpenAIClient()->chat()->create([
                'model' => 'gpt-3.5-turbo',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => 'أنت محلل مشاعر متخصص. حلل النص التالي وحدد المشاعر (positive, negative, neutral) مع درجة الثقة (0-100) وسبب التحليل.'
                    ],
                    [
                        'role' => 'user',
                        'content' => $text
                    ]
                ],
                'max_tokens' => 150,
                'temperature' => 0.3
            ]);

            $result = $response->choices[0]->message->content;
            
            // تحليل النتيجة
            return $this->parseSentimentResult($result);
            
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error('AI Sentiment Analysis Error: ' . $e->getMessage());
            return [
                'sentiment' => 'neutral',
                'confidence' => 50,
                'reason' => 'تحليل غير متاح حالياً'
            ];
        }
    }

    /**
     * تحسين البحث الذكي
     */
    public function improveSearchQuery(string $query): array
    {
        try {
            $response = $this->getOpenAIClient()->chat()->create([
                'model' => 'gpt-3.5-turbo',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => 'أنت مساعد بحث ذكي لمتجر إلكتروني. حسّن استعلام البحث التالي واقترح كلمات مفتاحية بديلة ومرادفات. أجب باللغة العربية.'
                    ],
                    [
                        'role' => 'user',
                        'content' => $query
                    ]
                ],
                'max_tokens' => 200,
                'temperature' => 0.5
            ]);

            $result = $response->choices[0]->message->content;
            
            return $this->parseSearchResult($result, $query);
            
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error('AI Search Improvement Error: ' . $e->getMessage());
            return [
                'original_query' => $query,
                'improved_query' => $query,
                'suggestions' => [],
                'keywords' => explode(' ', $query)
            ];
        }
    }

    /**
     * تحليل نتائج البحث وتقديم اقتراحات
     */
    public function analyzeSearchResults(array $products, string $query): array
    {
        try {
            $productNames = collect($products)->pluck('name')->implode(', ');
            
            $response = $this->getOpenAIClient()->chat()->create([
                'model' => 'gpt-3.5-turbo',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => 'أنت محلل نتائج بحث ذكي. حلل المنتجات التالية واقترح تحسينات للبحث أو منتجات مشابهة.'
                    ],
                    [
                        'role' => 'user',
                        'content' => "البحث عن: {$query}\nالمنتجات الموجودة: {$productNames}"
                    ]
                ],
                'max_tokens' => 300,
                'temperature' => 0.4
            ]);

            $result = $response->choices[0]->message->content;
            
            return [
                'analysis' => $result,
                'suggestions' => $this->extractSuggestions($result),
                'related_products' => $this->extractRelatedProducts($result)
            ];
            
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error('AI Search Analysis Error: ' . $e->getMessage());
            return [
                'analysis' => 'تحليل غير متاح حالياً',
                'suggestions' => [],
                'related_products' => []
            ];
        }
    }

    /**
     * تحليل نص نتيجة المشاعر
     */
    private function parseSentimentResult(string $result): array
    {
        $sentiment = 'neutral';
        $confidence = 50;
        $reason = $result;

        // البحث عن المشاعر في النتيجة
        if (preg_match('/positive|إيجابي|ممتاز|رائع|جيد/', strtolower($result))) {
            $sentiment = 'positive';
            $confidence = 80;
        } elseif (preg_match('/negative|سلبي|سيء|مشكلة|خطأ/', strtolower($result))) {
            $sentiment = 'negative';
            $confidence = 80;
        }

        // استخراج درجة الثقة
        if (preg_match('/(\d+)%/', $result, $matches)) {
            $confidence = (int) $matches[1];
        }

        return [
            'sentiment' => $sentiment,
            'confidence' => $confidence,
            'reason' => $reason
        ];
    }

    /**
     * تحليل نتيجة البحث المحسّن
     */
    private function parseSearchResult(string $result, string $originalQuery): array
    {
        $suggestions = [];
        $keywords = explode(' ', $originalQuery);

        // استخراج الاقتراحات
        if (preg_match_all('/- (.+)/', $result, $matches)) {
            $suggestions = $matches[1];
        }

        // استخراج الكلمات المفتاحية
        if (preg_match('/الكلمات المفتاحية: (.+)/', $result, $matches)) {
            $keywords = array_merge($keywords, explode(',', $matches[1]));
        }

        return [
            'original_query' => $originalQuery,
            'improved_query' => $result,
            'suggestions' => $suggestions,
            'keywords' => array_unique(array_filter($keywords))
        ];
    }

    /**
     * استخراج الاقتراحات من النتيجة
     */
    private function extractSuggestions(string $result): array
    {
        $suggestions = [];
        
        if (preg_match_all('/- (.+)/', $result, $matches)) {
            $suggestions = $matches[1];
        }

        return $suggestions;
    }

    /**
     * استخراج المنتجات ذات الصلة
     */
    private function extractRelatedProducts(string $result): array
    {
        $products = [];
        
        if (preg_match_all('/منتج: (.+)/', $result, $matches)) {
            $products = $matches[1];
        }

        return $products;
    }

    /**
     * الدردشة مع الذكاء الاصطناعي
     */
    public function chatWithAI(array $messages): string
    {
        try {
            // \Illuminate\Support\Facades\Log::info('AIService: Starting chatWithAI');
            // \Illuminate\Support\Facades\Log::info('AIService: Messages count: ' . count($messages));
            // \Illuminate\Support\Facades\Log::info('AIService: OpenAI API Key exists: ' . (config('openai.api_key') ? 'Yes' : 'No'));
            
            $response = $this->getOpenAIClient()->chat()->create([
                'model' => 'gpt-3.5-turbo',
                'messages' => $messages,
                'max_tokens' => 500,
                'temperature' => 0.7
            ]);

            // \Illuminate\Support\Facades\Log::info('AIService: OpenAI response received');
            // \Illuminate\Support\Facades\Log::info('AIService: Response content: ' . $response->choices[0]->message->content);

            return $response->choices[0]->message->content;

        } catch (\Exception $e) {
            // \Illuminate\Support\Facades\Log::error('AIService: AI Chat Error: ' . $e->getMessage());
            // \Illuminate\Support\Facades\Log::error('AIService: Error File: ' . $e->getFile());
            // \Illuminate\Support\Facades\Log::error('AIService: Error Line: ' . $e->getLine());
            // \Illuminate\Support\Facades\Log::error('AIService: Error Trace: ' . $e->getTraceAsString());
            return 'عذراً، لا أستطيع الرد حالياً. يرجى المحاولة لاحقاً.';
        }
    }
}
