<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    <title>@yield('title', 'AI Assistant')</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Cairo', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .ai-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .ai-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 1200px;
        }
        
        .ai-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 20px 20px 0 0;
            text-align: center;
        }
        
        .ai-content {
            padding: 30px;
        }
        
        .btn-ai {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            color: white;
            padding: 12px 24px;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        
        .btn-ai:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
            color: white;
        }
        
        .ai-nav {
            background: rgba(102, 126, 234, 0.1);
            padding: 15px;
            border-radius: 15px;
            margin-bottom: 20px;
        }
        
        .ai-nav a {
            color: #667eea;
            text-decoration: none;
            margin: 0 10px;
            padding: 8px 16px;
            border-radius: 20px;
            transition: all 0.3s ease;
        }
        
        .ai-nav a:hover {
            background: #667eea;
            color: white;
        }
        
        .ai-nav a.active {
            background: #667eea;
            color: white;
        }
    </style>
    
    @yield('styles')
</head>
<body>
    <div class="ai-container">
        <div class="ai-card">
            <div class="ai-header">
                <h1 class="mb-0">
                    <i class="fas fa-robot me-2"></i>
                    @yield('header-title', 'AI Assistant')
                </h1>
            </div>
            
            <div class="ai-content">
                <!-- Navigation -->
                <div class="ai-nav text-center">
                    <a href="/ai-demo" class="{{ request()->is('ai-demo') ? 'active' : '' }}">
                        <i class="fas fa-search me-1"></i> AI Demo
                    </a>
                    <a href="/ai-chat" class="{{ request()->is('ai-chat') ? 'active' : '' }}">
                        <i class="fas fa-comments me-1"></i> AI Chat
                    </a>
                </div>
                
                <!-- Content -->
                @yield('content')
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    @yield('scripts')
</body>
</html>
