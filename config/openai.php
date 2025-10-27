<?php

return [
    'api_key' => env('OPENAI_API_KEY'),
    'organization' => env('OPENAI_ORGANIZATION'),
    'timeout' => env('OPENAI_TIMEOUT', 30),
    'max_tokens' => env('OPENAI_MAX_TOKENS', 1000),
    'temperature' => env('OPENAI_TEMPERATURE', 0.7),
];
