<?php

namespace App\Http\Requests;

use App\Rules\EmailRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {

        return [
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['nullable', 'string', 'max:255'],
            'phone' => ['required', 'string', 'max:20'],
            'email' => ['required', 'email', 'max:255', new EmailRule],
            'gender' => ['nullable', 'in:male,female'],
            'password' => ['nullable', 'string', 'min:6', 'confirmed'],
            'profile_photo' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'],
        ];
    }

    public function messages(): array
    {
        return [
            'first_name.required' => __('حقل الاسم الأول مطلوب'),
            'phone.required' => __('حقل رقم الهاتف مطلوب'),
            'email.required' => __('حقل البريد الإلكتروني مطلوب'),
            'email.email' => __('صيغة البريد الإلكتروني غير صحيحة'),
            'password.confirmed' => __('تأكيد كلمة المرور غير متطابق'),
            'profile_photo.image' => __('يجب أن تكون الصورة من نوع صورة'),
            'profile_photo.mimes' => __('امتداد الصورة غير مدعوم'),
        ];
    }
}
