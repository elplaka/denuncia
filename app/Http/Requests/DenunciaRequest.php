<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Validation\ValidationException;

class DenunciaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */

     protected function failedValidation(Validator $validator)
     {
         $this->session()->flash('denuncia_anonima', $this->input('denuncia_anonima', false));
     
         throw new HttpResponseException(
             redirect()->back()->withErrors($validator)->withInput()
         );
     }

    public function rules()
    {
        return [
            'nombre_denunciante' => ['sometimes','string', 'max:50'],
            'telefono_denunciante' => ['sometimes', 'regex:/^[0-9]{10}$/'],
            'domicilio_denunciante' => ['sometimes', 'string', 'max:50'],
            'localidad_denunciante' => ['sometimes','string', 'max:20'],
            'email_denunciante' => ['sometimes','email', 'max:60'],
            'nombre_denunciado' => ['nullable', 'string', 'max:60'],
            'cve_dependencia' => ['integer'],
            'cargo_denunciado' => ['nullable', 'string', 'max:20'],
            'hechos' => ['required','max:255'],
            'fecha_hechos' => ['required', 'date'],
            'lugar_hechos' => ['max:75'],
            'pruebas' => ['max:150'],
        ];

    }

    public function messages()
    {
        return [
            'max' => 'El campo :attribute no puede tener más de :max caracteres.',
            'telefono_denunciante.regex' => 'El Teléfono debe tener 10 dígitos sin espacios en blanco.',
            'required' => 'El campo :attribute es obligatorio.',
        ];
    }

    public function attributes()
    {
        return [
            'nombre_denunciante' => 'Nombre',
            'domicilio_denunciante' => 'Domicilio',
            'localidad_denunciante' => 'Localidad',
            'email_denunciante' => 'E-mail',
            'nombre_denunciado' => 'Nombre',
            'cargo_denunciado' => 'Cargo',
            'hechos' => 'Hechos',
            'fecha_hechos' => 'Fecha_de_los_hechos',
            'lugar_hechos' => 'Lugar_de_los_hechos',
            'pruebas' => 'Pruebas',
        ];
    }
    
}
