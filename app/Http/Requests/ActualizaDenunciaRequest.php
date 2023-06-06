<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ActualizaDenunciaRequest extends FormRequest
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
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'nombre_denunciante' => ['string', 'max:50'],
            'telefono_denunciante' => ['regex:/^[0-9]{10}$/'],
            'domicilio_denunciante' => ['string', 'max:50'],
            'localidad_denunciante' => ['string', 'max:20'],
            'email_denunciante' => ['email', 'max:60'],
            'nombre_denunciado' => ['string', 'max:60'],
            'cve_dependencia' => ['integer'],
            'cargo_denunciado' => ['string', 'max:20'],
            'hechos' => ['required', 'string', 'max:255'],
            'fecha_hechos' => ['required', 'date'],
            'lugar_hechos' => ['string', 'max:75'],
            'pruebas' => ['string', 'max:150'],
        ];
    }

    public function messages()
    {
        return [
            'max' => 'El campo :attribute no puede tener más de :max caracteres.',
            'telefono_denunciante.regex' => 'El Teléfono debe tener 10 dígitos sin espacios en blanco.',
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
            'pruebas' => 'pruebas',
        ];
    }
}
