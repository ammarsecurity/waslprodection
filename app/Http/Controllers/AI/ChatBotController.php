<?php

namespace App\Http\Controllers\AI;

use App\Http\Controllers\Controller;
use App\Services\AIService;
use App\Models\ChatBot;
use App\Models\ChatBotMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatBotController extends Controller
{
    protected $aiService;

    public function __construct(AIService $aiService)
    {
        $this->aiService = $aiService;
        $this->middleware('auth')->except(['index']);
    }

    /**
     * عرض صفحة الدردشة
     */
    public function index()
    {
        $user = Auth::user();
        $chatHistory = collect([]); // Empty collection for guests
        
        if ($user) {
            $chatHistory = $this->getChatHistory($user->id);
        }
        
        return view('ai.chat', compact('chatHistory'));
    }

    /**
     * إرسال رسالة للذكاء الاصطناعي
     */
    public function sendMessage(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:1000',
            'context' => 'nullable|string'
        ]);

        $user = Auth::user();
        $message = $request->message;
        $context = $request->context ?? 'general';

        // Debug for message
        \Log::info('=== AI Chat Debug Start ===');
        \Log::info('User ID: ' . ($user ? $user->id : 'Guest'));
        \Log::info('Message: ' . $message);
        \Log::info('Context: ' . $context);
        \Log::info('OpenAI API Key exists: ' . (config('openai.api_key') ? 'Yes' : 'No'));
        \Log::info('OpenAI API Key length: ' . (config('openai.api_key') ? strlen(config('openai.api_key')) : 0));
        \Log::info('OpenAI API Key first 10 chars: ' . (config('openai.api_key') ? substr(config('openai.api_key'), 0, 10) : 'None'));
        \Log::info('OpenAI Organization: ' . (config('openai.organization') ?: 'None'));
        \Log::info('Environment OPENAI_API_KEY: ' . (env('OPENAI_API_KEY') ? 'Set' : 'Not Set'));

        try {
            $userMessage = null;
            $aiMessage = null;
            $chatHistory = collect([]);

            // إذا كان المستخدم مسجل دخول، احفظ الرسائل
            if ($user) {
                // حفظ رسالة المستخدم
                $userMessage = $this->saveMessage($user->id, $message, 'user', $context);

                // الحصول على تاريخ المحادثة
                $chatHistory = $this->getChatHistory($user->id, 10);
            }

            // إرسال للذكاء الاصطناعي
            \Log::info('Calling getAIResponse...');
            $aiResponse = $this->getAIResponse($message, $chatHistory, $context);
            \Log::info('AI Response received: ' . $aiResponse);

            // إذا كان المستخدم مسجل دخول، احفظ رد الذكاء الاصطناعي
            if ($user) {
                $aiMessage = $this->saveMessage($user->id, $aiResponse, 'ai', $context);
            }

            return response()->json([
                'success' => true,
                'data' => [
                    'user_message' => $userMessage ? [
                        'message' => $userMessage->message,
                        'sender' => $userMessage->sender,
                        'created_at' => $userMessage->created_at
                    ] : [
                        'message' => $message,
                        'sender' => 'user',
                        'created_at' => now()
                    ],
                    'ai_message' => $aiMessage ? [
                        'message' => $aiMessage->message,
                        'sender' => $aiMessage->sender,
                        'created_at' => $aiMessage->created_at
                    ] : [
                        'message' => $aiResponse,
                        'sender' => 'ai',
                        'created_at' => now()
                    ],
                    'timestamp' => now()->format('Y-m-d H:i:s')
                ]
            ]);

        } catch (\Exception $e) {
            \Log::error('AI Chat Error: ' . $e->getMessage());
            \Log::error('Error File: ' . $e->getFile());
            \Log::error('Error Line: ' . $e->getLine());
            \Log::error('Error Trace: ' . $e->getTraceAsString());
            \Log::info('=== AI Chat Debug End ===');
          
            return response()->json([
                'success' => false,
                'message' => 'حدث خطأ في معالجة الرسالة: ' . $e->getMessage(),
                'debug' => [
                    'error' => $e->getMessage(),
                    'file' => $e->getFile(),
                    'line' => $e->getLine()
                ]
            ], 500);
        }
    }

    /**
     * الحصول على رد من الذكاء الاصطناعي
     */
    private function getAIResponse($message, $chatHistory, $context)
    {
        $systemPrompt = $this->getSystemPrompt($context);
        
        $messages = [
            ['role' => 'system', 'content' => $systemPrompt]
        ];

        // إضافة تاريخ المحادثة
        foreach ($chatHistory as $msg) {
            $messages[] = [
                'role' => $msg->sender === 'user' ? 'user' : 'assistant',
                'content' => $msg->message
            ];
        }

        // إضافة الرسالة الحالية
        $messages[] = ['role' => 'user', 'content' => $message];

        try {
            // استخدام AIService للدردشة
            $aiResponse = $this->aiService->chatWithAI($messages);
            return $aiResponse;

        } catch (\Exception $e) {
            return 'عذراً، لا أستطيع الرد حالياً. يرجى المحاولة لاحقاً.';
        }
    }

    /**
     * الحصول على نظام المحادثة حسب السياق
     */
    private function getSystemPrompt($context)
    {
        $prompts = [
            'general' => 'أنت مساعد ذكي لمتجر إلكتروني. ساعد العملاء في العثور على المنتجات والإجابة على أسئلتهم بطريقة مفيدة ومهذبة. استخدم اللغة العربية.',
            
            'support' => 'أنت مساعد دعم فني متخصص. ساعد العملاء في حل مشاكلهم التقنية والإجابة على استفساراتهم. استخدم اللغة العربية.',
            
            'sales' => 'أنت مساعد مبيعات ذكي. ساعد العملاء في العثور على المنتجات المناسبة وتقديم توصيات مخصصة. استخدم اللغة العربية.',
            
            'product' => 'أنت خبير منتجات. ساعد العملاء في فهم مواصفات المنتجات ومقارنتها. استخدم اللغة العربية.',
            
            'order' => 'أنت مساعد الطلبات. ساعد العملاء في تتبع طلباتهم وحل مشاكل الشحن. استخدم اللغة العربية.'
        ];

        return $prompts[$context] ?? $prompts['general'];
    }

    /**
     * حفظ رسالة في قاعدة البيانات
     */
    private function saveMessage($userId, $message, $sender, $context)
    {
        return ChatBotMessage::create([
            'user_id' => $userId,
            'message' => $message,
            'sender' => $sender, // 'user' or 'ai'
            'context' => $context,
            'ip_address' => request()->ip(),
            'user_agent' => request()->userAgent()
        ]);
    }

    /**
     * الحصول على تاريخ المحادثة
     */
    private function getChatHistory($userId, $limit = 20)
    {
        return ChatBotMessage::where('user_id', $userId)
            ->orderBy('created_at', 'desc')
            ->limit($limit)
            ->get()
            ->reverse()
            ->values();
    }

    /**
     * مسح تاريخ المحادثة
     */
    public function clearHistory()
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'يجب تسجيل الدخول أولاً'
            ], 401);
        }
        
        ChatBotMessage::where('user_id', $user->id)->delete();

        return response()->json([
            'success' => true,
            'message' => 'تم مسح تاريخ المحادثة بنجاح'
        ]);
    }

    /**
     * تصدير تاريخ المحادثة
     */
    public function exportHistory()
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'يجب تسجيل الدخول أولاً'
            ], 401);
        }
        
        $messages = $this->getChatHistory($user->id, 100);

        $exportData = $messages->map(function ($msg) {
            return [
                'التاريخ' => $msg->created_at->format('Y-m-d H:i:s'),
                'المرسل' => $msg->sender === 'user' ? 'المستخدم' : 'الذكاء الاصطناعي',
                'الرسالة' => $msg->message,
                'السياق' => $msg->context
            ];
        });

        return response()->json([
            'success' => true,
            'data' => $exportData
        ]);
    }

    /**
     * الحصول على إحصائيات المحادثة
     */
    public function getStats()
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'يجب تسجيل الدخول أولاً'
            ], 401);
        }
        
        $stats = [
            'total_messages' => ChatBotMessage::where('user_id', $user->id)->count(),
            'user_messages' => ChatBotMessage::where('user_id', $user->id)->where('sender', 'user')->count(),
            'ai_messages' => ChatBotMessage::where('user_id', $user->id)->where('sender', 'ai')->count(),
            'contexts_used' => ChatBotMessage::where('user_id', $user->id)
                ->distinct('context')
                ->pluck('context')
                ->toArray(),
            'last_activity' => ChatBotMessage::where('user_id', $user->id)
                ->latest()
                ->first()
                ?->created_at
        ];

        return response()->json([
            'success' => true,
            'data' => $stats
        ]);
    }

    /**
     * البحث في تاريخ المحادثة
     */
    public function searchHistory(Request $request)
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'يجب تسجيل الدخول أولاً'
            ], 401);
        }
        
        $query = $request->get('q', '');

        if (empty($query)) {
            return response()->json([
                'success' => false,
                'message' => 'يرجى إدخال كلمة البحث'
            ]);
        }

        $messages = ChatBotMessage::where('user_id', $user->id)
            ->where('message', 'like', "%{$query}%")
            ->orderBy('created_at', 'desc')
            ->limit(20)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $messages
        ]);
    }
}
