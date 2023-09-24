<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserSectorRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Name is required!',
            'agree-to-terms.required' => 'You must agree to the terms!',
            'sector.required' => 'You must select at least one sector!',
        ];
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|max:255|min:3|regex:/^[a-zA-Z\s]*$/',
            'agree-to-terms' => 'required|boolean|accepted',
            'sector' => 'required|array|min:1',
            'sector.*' => 'required|integer',
        ];
    }
}
