<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Telegram Bot Configuration
    |--------------------------------------------------------------------------
    |
    | This file contains the configuration for Telegram bot notifications.
    | You can set your bot token and other settings here.
    |
    */

    'bot_token' => env('TELEGRAM_BOT_TOKEN'),
    
    'timeout' => env('TELEGRAM_TIMEOUT', 10),
    
    'verify_ssl' => env('TELEGRAM_VERIFY_SSL', true),
    
    /*
    |--------------------------------------------------------------------------
    | Default Chat Settings
    |--------------------------------------------------------------------------
    |
    | Default settings for Telegram messages
    |
    */
    
    'parse_mode' => env('TELEGRAM_PARSE_MODE', 'HTML'),
    
    'disable_web_page_preview' => env('TELEGRAM_DISABLE_WEB_PAGE_PREVIEW', true),
    
    'disable_notification' => env('TELEGRAM_DISABLE_NOTIFICATION', false),
];
