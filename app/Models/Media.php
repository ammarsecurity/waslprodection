<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Media extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

   public function srcUrl(): Attribute
{
    $path = $this->src;
    $default = asset('default/default.jpg');

    return Attribute::make(
        get: fn () => ($path && file_exists(public_path('storage/' . $path)))
            ? asset('storage/' . $path)
            : $default
    );
}
}
