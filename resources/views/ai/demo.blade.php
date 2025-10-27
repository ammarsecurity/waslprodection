@extends('layouts.ai')

@section('header-title', 'تجربة الذكاء الاصطناعي')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">🤖 تجربة الذكاء الاصطناعي</h4>
                </div>
                <div class="card-body">
                    
                    <!-- Smart Search Section -->
                    <div class="ai-section mb-5">
                        <h5>🔍 البحث الذكي</h5>
                        <div class="ai-search-container">
                            <input type="text" id="ai-search-input" class="form-control" placeholder="ابحث عن منتج باستخدام الذكاء الاصطناعي...">
                            <div id="ai-suggestions" class="suggestions-dropdown"></div>
                        </div>
                        <div id="ai-loading" class="loading-indicator">
                            <i class="fa fa-spinner fa-spin"></i> جاري البحث...
                        </div>
                        <div id="ai-search-results" class="search-results"></div>
                    </div>

                    <!-- Sentiment Analysis Section -->
                    <div class="ai-section mb-5">
                        <h5>😊 تحليل المشاعر</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="sentiment-text">النص للتحليل:</label>
                                    <textarea id="sentiment-text" class="form-control" rows="4" placeholder="أدخل النص لتحليل مشاعره..."></textarea>
                                </div>
                                <button id="analyze-sentiment-btn" class="btn btn-primary">
                                    <i class="fa fa-brain"></i> تحليل المشاعر
                                </button>
                            </div>
                            <div class="col-md-6">
                                <div id="sentiment-result" class="sentiment-result"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Sentiment Analysis -->
                    <div class="ai-section mb-5">
                        <h5>📊 تحليل مشاعر المنتجات</h5>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="product-select">اختر منتج:</label>
                                    <select id="product-select" class="form-control">
                                        <option value="">اختر منتج...</option>
                                    </select>
                                </div>
                                <button id="analyze-product-sentiment-btn" class="btn btn-info">
                                    <i class="fa fa-chart-bar"></i> تحليل مشاعر المنتج
                                </button>
                            </div>
                            <div class="col-md-8">
                                <div id="product-sentiment-result" class="product-sentiment-result"></div>
                            </div>
                        </div>
                    </div>

                    <!-- AI Statistics -->
                    <div class="ai-section">
                        <h5>📈 إحصائيات الذكاء الاصطناعي</h5>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="stat-card">
                                    <div class="stat-icon">🔍</div>
                                    <div class="stat-number" id="total-searches">0</div>
                                    <div class="stat-label">عمليات البحث</div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card">
                                    <div class="stat-icon">😊</div>
                                    <div class="stat-number" id="positive-sentiments">0</div>
                                    <div class="stat-label">مشاعر إيجابية</div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card">
                                    <div class="stat-icon">😞</div>
                                    <div class="stat-number" id="negative-sentiments">0</div>
                                    <div class="stat-label">مشاعر سلبية</div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card">
                                    <div class="stat-icon">📊</div>
                                    <div class="stat-number" id="total-analyses">0</div>
                                    <div class="stat-label">إجمالي التحليلات</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<style>
.ai-section {
    padding: 20px;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    margin-bottom: 20px;
    background: #f8f9fa;
}

.suggestions-dropdown {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    z-index: 1000;
    max-height: 200px;
    overflow-y: auto;
    display: none;
}

.suggestion-item {
    padding: 10px 15px;
    cursor: pointer;
    border-bottom: 1px solid #eee;
}

.suggestion-item:hover {
    background-color: #f0f0f0;
}

.sentiment-result {
    padding: 15px;
    border-radius: 8px;
    margin-top: 10px;
}

.sentiment-positive {
    background-color: #d4edda;
    border: 1px solid #c3e6cb;
    color: #155724;
}

.sentiment-negative {
    background-color: #f8d7da;
    border: 1px solid #f5c6cb;
    color: #721c24;
}

.sentiment-neutral {
    background-color: #d1ecf1;
    border: 1px solid #bee5eb;
    color: #0c5460;
}

.product-sentiment-result {
    padding: 15px;
    background: white;
    border-radius: 8px;
    border: 1px solid #ddd;
}

.stat-card {
    text-align: center;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.stat-icon {
    font-size: 2rem;
    margin-bottom: 10px;
}

.stat-number {
    font-size: 2rem;
    font-weight: bold;
    color: #007bff;
}

.stat-label {
    color: #666;
    font-size: 0.9rem;
}

.loading-indicator {
    text-align: center;
    padding: 20px;
    color: #007bff;
}

.search-results {
    margin-top: 20px;
}

.product-card {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    background: white;
}

.product-card h6 {
    color: #333;
    margin-bottom: 10px;
}

.product-card p {
    color: #666;
    margin-bottom: 5px;
}
</style>

<script src="{{ asset('js/ai-search.js') }}"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Initialize AI Demo
    const aiDemo = new AIDemo();
    aiDemo.init();
});

class AIDemo {
    constructor() {
        this.sentimentText = document.getElementById('sentiment-text');
        this.analyzeSentimentBtn = document.getElementById('analyze-sentiment-btn');
        this.sentimentResult = document.getElementById('sentiment-result');
        this.productSelect = document.getElementById('product-select');
        this.analyzeProductSentimentBtn = document.getElementById('analyze-product-sentiment-btn');
        this.productSentimentResult = document.getElementById('product-sentiment-result');
    }

    init() {
        this.loadProducts();
        this.bindEvents();
        this.loadStatistics();
    }

    loadProducts() {
        // Load products for sentiment analysis
        fetch('/api/products')
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    data.data.forEach(product => {
                        const option = document.createElement('option');
                        option.value = product.id;
                        option.textContent = product.name;
                        this.productSelect.appendChild(option);
                    });
                }
            })
            .catch(error => console.error('Error loading products:', error));
    }

    bindEvents() {
        this.analyzeSentimentBtn.addEventListener('click', () => {
            this.analyzeSentiment();
        });

        this.analyzeProductSentimentBtn.addEventListener('click', () => {
            this.analyzeProductSentiment();
        });
    }

    async analyzeSentiment() {
        const text = this.sentimentText.value.trim();
        if (!text) {
            alert('يرجى إدخال نص للتحليل');
            return;
        }

        this.analyzeSentimentBtn.disabled = true;
        this.analyzeSentimentBtn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> جاري التحليل...';

        try {
            const response = await fetch('/api/ai/analyze-sentiment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify({ text: text })
            });

            const data = await response.json();

            if (data.success) {
                this.displaySentimentResult(data.data);
            } else {
                alert('حدث خطأ في التحليل: ' + data.message);
            }
        } catch (error) {
            console.error('Error analyzing sentiment:', error);
            alert('حدث خطأ في الاتصال');
        } finally {
            this.analyzeSentimentBtn.disabled = false;
            this.analyzeSentimentBtn.innerHTML = '<i class="fa fa-brain"></i> تحليل المشاعر';
        }
    }

    displaySentimentResult(data) {
        const sentimentClass = `sentiment-${data.sentiment}`;
        const sentimentAr = data.sentiment_ar;
        
        this.sentimentResult.innerHTML = `
            <div class="${sentimentClass}">
                <h6>المشاعر: ${sentimentAr}</h6>
                <p><strong>درجة الثقة:</strong> ${data.confidence}%</p>
                <p><strong>السبب:</strong> ${data.reason}</p>
            </div>
        `;
    }

    async analyzeProductSentiment() {
        const productId = this.productSelect.value;
        if (!productId) {
            alert('يرجى اختيار منتج');
            return;
        }

        this.analyzeProductSentimentBtn.disabled = true;
        this.analyzeProductSentimentBtn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> جاري التحليل...';

        try {
            const response = await fetch(`/api/ai/product/${productId}/sentiment`);
            const data = await response.json();

            if (data.success) {
                this.displayProductSentimentResult(data.data);
            } else {
                alert('حدث خطأ في تحليل المنتج: ' + data.message);
            }
        } catch (error) {
            console.error('Error analyzing product sentiment:', error);
            alert('حدث خطأ في الاتصال');
        } finally {
            this.analyzeProductSentimentBtn.disabled = false;
            this.analyzeProductSentimentBtn.innerHTML = '<i class="fa fa-chart-bar"></i> تحليل مشاعر المنتج';
        }
    }

    displayProductSentimentResult(data) {
        const stats = data.stats;
        
        this.productSentimentResult.innerHTML = `
            <h6>تحليل مشاعر المنتج: ${data.product.name}</h6>
            <div class="row">
                <div class="col-md-3">
                    <div class="stat-item">
                        <strong>إجمالي التحليلات:</strong> ${stats.total}
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-item">
                        <strong>إيجابي:</strong> ${stats.positive} (${stats.positive_percentage}%)
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-item">
                        <strong>سلبي:</strong> ${stats.negative} (${stats.negative_percentage}%)
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-item">
                        <strong>محايد:</strong> ${stats.neutral} (${stats.neutral_percentage}%)
                    </div>
                </div>
            </div>
            <div class="mt-3">
                <strong>متوسط الثقة:</strong> ${stats.average_confidence}%
            </div>
        `;
    }

    async loadStatistics() {
        try {
            const response = await fetch('/api/ai/sentiment-stats');
            const data = await response.json();

            if (data.success) {
                document.getElementById('total-searches').textContent = '0'; // Placeholder
                document.getElementById('positive-sentiments').textContent = data.data.positive;
                document.getElementById('negative-sentiments').textContent = data.data.negative;
                document.getElementById('total-analyses').textContent = data.data.total;
            }
        } catch (error) {
            console.error('Error loading statistics:', error);
        }
    }
}
</script>
@endsection
