@extends('layouts.ai')

@section('header-title', 'دردشة الذكاء الاصطناعي')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4 class="card-title mb-0">
                        <i class="fa fa-robot me-2"></i>دردشة الذكاء الاصطناعي
                    </h4>
                    <div class="chat-controls">
                        <button class="btn btn-sm btn-outline-secondary me-2" onclick="clearHistory()">
                            <i class="fa fa-trash"></i> مسح المحادثة
                        </button>
                        <button class="btn btn-sm btn-outline-info me-2" onclick="exportHistory()">
                            <i class="fa fa-download"></i> تصدير
                        </button>
                        <button class="btn btn-sm btn-outline-primary" onclick="showStats()">
                            <i class="fa fa-chart-bar"></i> إحصائيات
                        </button>
                    </div>
                </div>
                <div class="card-body p-0">
                    
                    <!-- Chat Container -->
                    <div class="chat-container">
                        <div id="chat-messages" class="chat-messages">
                            @if($chatHistory->count() > 0)
                                @foreach($chatHistory as $message)
                                    <div class="message {{ $message->sender === 'user' ? 'user-message' : 'ai-message' }}">
                                        <div class="message-content">
                                            <div class="message-header">
                                                <span class="sender-name">{{ $message->sender_name }}</span>
                                                <span class="message-time">{{ $message->formatted_time }}</span>
                                            </div>
                                            <div class="message-text">{{ $message->message }}</div>
                                        </div>
                                    </div>
                                @endforeach
                            @else
                                <div class="welcome-message">
                                    <div class="text-center">
                                        <i class="fa fa-robot fa-3x text-primary mb-3"></i>
                                        <h5>مرحباً! أنا مساعدك الذكي</h5>
                                        <p>كيف يمكنني مساعدتك اليوم؟</p>
                                        @guest
                                            <div class="alert alert-info mt-3">
                                                <i class="fa fa-info-circle me-2"></i>
                                                <strong>ملاحظة:</strong> للاستفادة من حفظ تاريخ المحادثة، يرجى 
                                                <a href="/login" class="text-decoration-none">تسجيل الدخول</a>
                                            </div>
                                        @endguest
                                    </div>
                                </div>
                            @endif
                        </div>

                        <!-- Typing Indicator -->
                        <div id="typing-indicator" class="typing-indicator" style="display: none;">
                            <div class="ai-message">
                                <div class="message-content">
                                    <div class="typing-dots">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Chat Input -->
                    <div class="chat-input-container">
                        <div class="input-group">
                            <select id="chat-context" class="form-select" style="max-width: 150px;">
                                <option value="general">عام</option>
                                <option value="support">دعم فني</option>
                                <option value="sales">مبيعات</option>
                                <option value="product">منتجات</option>
                                <option value="order">طلبات</option>
                            </select>
                            <input type="text" id="chat-input" class="form-control" placeholder="اكتب رسالتك هنا..." maxlength="1000">
                            <button class="btn btn-primary" id="send-button" onclick="sendMessage()">
                                <i class="fa fa-paper-plane"></i>
                            </button>
                        </div>
                        <div class="input-help">
                            <small class="text-muted">اضغط Enter للإرسال أو Shift+Enter لسطر جديد</small>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Stats Modal -->
<div class="modal fade" id="statsModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">إحصائيات المحادثة</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body" id="stats-content">
                <div class="text-center">
                    <i class="fa fa-spinner fa-spin"></i> جاري التحميل...
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.chat-container {
    height: 500px;
    display: flex;
    flex-direction: column;
}

.chat-messages {
    flex: 1;
    overflow-y: auto;
    padding: 20px;
    background: #f8f9fa;
}

.message {
    margin-bottom: 15px;
    display: flex;
}

.user-message {
    justify-content: flex-end;
}

.ai-message {
    justify-content: flex-start;
}

.message-content {
    max-width: 70%;
    padding: 12px 16px;
    border-radius: 18px;
    position: relative;
}

.user-message .message-content {
    background: #007bff;
    color: white;
    border-bottom-right-radius: 4px;
}

.ai-message .message-content {
    background: white;
    color: #333;
    border: 1px solid #e0e0e0;
    border-bottom-left-radius: 4px;
}

.message-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5px;
    font-size: 0.8rem;
    opacity: 0.8;
}

.message-text {
    line-height: 1.4;
    word-wrap: break-word;
}

.typing-indicator {
    padding: 0 20px 20px;
}

.typing-dots {
    display: flex;
    gap: 4px;
}

.typing-dots span {
    width: 8px;
    height: 8px;
    background: #6c757d;
    border-radius: 50%;
    animation: typing 1.4s infinite ease-in-out;
}

.typing-dots span:nth-child(1) { animation-delay: -0.32s; }
.typing-dots span:nth-child(2) { animation-delay: -0.16s; }

@keyframes typing {
    0%, 80%, 100% { transform: scale(0); }
    40% { transform: scale(1); }
}

.chat-input-container {
    padding: 20px;
    background: white;
    border-top: 1px solid #e0e0e0;
}

.input-help {
    margin-top: 8px;
    text-align: center;
}

.welcome-message {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    color: #6c757d;
}

.chat-controls .btn {
    font-size: 0.875rem;
}

/* Scrollbar Styling */
.chat-messages::-webkit-scrollbar {
    width: 6px;
}

.chat-messages::-webkit-scrollbar-track {
    background: #f1f1f1;
}

.chat-messages::-webkit-scrollbar-thumb {
    background: #c1c1c1;
    border-radius: 3px;
}

.chat-messages::-webkit-scrollbar-thumb:hover {
    background: #a8a8a8;
}

/* Responsive */
@media (max-width: 768px) {
    .message-content {
        max-width: 85%;
    }
    
    .chat-controls {
        flex-direction: column;
        gap: 5px;
    }
    
    .chat-controls .btn {
        font-size: 0.75rem;
        padding: 0.25rem 0.5rem;
    }
}
</style>

<script>
let isTyping = false;

document.addEventListener('DOMContentLoaded', function() {
    const chatInput = document.getElementById('chat-input');
    const sendButton = document.getElementById('send-button');
    
    // إرسال الرسالة عند الضغط على Enter
    chatInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            sendMessage();
        }
    });
    
    // تحديث حالة الزر
    chatInput.addEventListener('input', function() {
        sendButton.disabled = this.value.trim() === '';
    });
    
    // التمرير لأسفل عند تحميل الصفحة
    scrollToBottom();
});

function sendMessage() {
    const input = document.getElementById('chat-input');
    const message = input.value.trim();
    const context = document.getElementById('chat-context').value;
    
    if (!message || isTyping) return;
    
    // إضافة رسالة المستخدم للواجهة
    addMessageToChat(message, 'user');
    
    // مسح حقل الإدخال
    input.value = '';
    input.focus();
    
    // إظهار مؤشر الكتابة
    showTypingIndicator();
    
    // إرسال للخادم
    fetch('/api/ai/chat/send', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({
            message: message,
            context: context
        })
    })
    .then(response => {
        console.log('Response Status:', response.status);
        console.log('Response Headers:', response.headers);
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        return response.text().then(text => {
            console.log('Raw Response:', text);
            try {
                return JSON.parse(text);
            } catch (e) {
                console.error('JSON Parse Error:', e);
                console.error('Response was not JSON:', text);
                throw new Error('Response is not valid JSON');
            }
        });
    })
    .then(data => {
        hideTypingIndicator();
        
        console.log('AI Response:', data); // Debug log
        
        if (data.success) {
            addMessageToChat(data.data.ai_message.message, 'ai');
        } else {
            console.error('AI Error:', data); // Debug log
            addMessageToChat('عذراً، حدث خطأ في معالجة رسالتك: ' + (data.message || 'خطأ غير معروف'), 'ai');
        }
    })
    .catch(error => {
        hideTypingIndicator();
        addMessageToChat('عذراً، لا أستطيع الرد حالياً. يرجى المحاولة لاحقاً.', 'ai');
        console.log('Error:', error);
    });
}

function addMessageToChat(message, sender) {
    const chatMessages = document.getElementById('chat-messages');
    const messageDiv = document.createElement('div');
    
    const now = new Date();
    const time = now.toLocaleTimeString('ar-SA', { 
        hour: '2-digit', 
        minute: '2-digit' 
    });
    
    const senderName = sender === 'user' ? 'المستخدم' : 'الذكاء الاصطناعي';
    
    messageDiv.className = `message ${sender}-message`;
    messageDiv.innerHTML = `
        <div class="message-content">
            <div class="message-header">
                <span class="sender-name">${senderName}</span>
                <span class="message-time">${time}</span>
            </div>
            <div class="message-text">${message}</div>
        </div>
    `;
    
    chatMessages.appendChild(messageDiv);
    scrollToBottom();
}

function showTypingIndicator() {
    isTyping = true;
    document.getElementById('typing-indicator').style.display = 'block';
    scrollToBottom();
}

function hideTypingIndicator() {
    isTyping = false;
    document.getElementById('typing-indicator').style.display = 'none';
}

function scrollToBottom() {
    const chatMessages = document.getElementById('chat-messages');
    chatMessages.scrollTop = chatMessages.scrollHeight;
}

function clearHistory() {
    if (confirm('هل أنت متأكد من مسح تاريخ المحادثة؟')) {
        fetch('/api/ai/chat/clear', {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('chat-messages').innerHTML = `
                    <div class="welcome-message">
                        <div class="text-center">
                            <i class="fa fa-robot fa-3x text-primary mb-3"></i>
                            <h5>مرحباً! أنا مساعدك الذكي</h5>
                            <p>كيف يمكنني مساعدتك اليوم؟</p>
                        </div>
                    </div>
                `;
            } else if (data.message && data.message.includes('تسجيل الدخول')) {
                alert('يجب تسجيل الدخول أولاً لاستخدام هذه الميزة');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('حدث خطأ في مسح المحادثة');
        });
    }
}

function exportHistory() {
    fetch('/api/ai/chat/export')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const blob = new Blob([JSON.stringify(data.data, null, 2)], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `chat-history-${new Date().toISOString().split('T')[0]}.json`;
            a.click();
            URL.revokeObjectURL(url);
        } else if (data.message && data.message.includes('تسجيل الدخول')) {
            alert('يجب تسجيل الدخول أولاً لاستخدام هذه الميزة');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('حدث خطأ في تصدير المحادثة');
    });
}

function showStats() {
    const modal = new bootstrap.Modal(document.getElementById('statsModal'));
    modal.show();
    
    fetch('/api/ai/chat/stats')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const stats = data.data;
            document.getElementById('stats-content').innerHTML = `
                <div class="row">
                    <div class="col-md-6">
                        <div class="stat-item">
                            <strong>إجمالي الرسائل:</strong> ${stats.total_messages}
                        </div>
                        <div class="stat-item">
                            <strong>رسائل المستخدم:</strong> ${stats.user_messages}
                        </div>
                        <div class="stat-item">
                            <strong>ردود الذكاء الاصطناعي:</strong> ${stats.ai_messages}
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="stat-item">
                            <strong>السياقات المستخدمة:</strong>
                            <ul>
                                ${stats.contexts_used.map(ctx => `<li>${ctx}</li>`).join('')}
                            </ul>
                        </div>
                        <div class="stat-item">
                            <strong>آخر نشاط:</strong> ${stats.last_activity ? new Date(stats.last_activity).toLocaleString('ar-SA') : 'لا يوجد'}
                        </div>
                    </div>
                </div>
            `;
        } else if (data.message && data.message.includes('تسجيل الدخول')) {
            document.getElementById('stats-content').innerHTML = `
                <div class="alert alert-warning text-center">
                    <i class="fa fa-exclamation-triangle me-2"></i>
                    <strong>يجب تسجيل الدخول أولاً لرؤية الإحصائيات</strong>
                </div>
            `;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('stats-content').innerHTML = `
            <div class="alert alert-danger text-center">
                <i class="fa fa-exclamation-circle me-2"></i>
                <strong>حدث خطأ في تحميل الإحصائيات</strong>
            </div>
        `;
    });
}
</script>
@endsection
