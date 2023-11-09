<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PropiedadesRequest extends FormRequest
{
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
        $requiere_manzana = !!$this->input('manzana_id');
        return [
            'nombre' => 'required|string|min:1|max:125',
            'cuota_desde' => 'required|numeric',
            'superficie' => 'required|numeric',
            'latitud' => 'required|numeric',
            'longitud' => 'required|numeric',
            //manzana
            'manzana_id' => $requiere_manzana ? 'required|numeric' : 'nullable',
            'manzana' => $requiere_manzana ? 'nullable' : 'required',
            'manzana.nombre' => $requiere_manzana ? 'nullable' : 'required|string|min:1|max:125',
            'manzana.ciudad_id' => $requiere_manzana ? 'nullable' : 'required|numeric',

            'caracteristicas' => 'array',
            'caracteristicas.*.titulo' => 'required_without:caracteristicas.*.id|string|min:3|max:125',
            'caracteristicas.*.id' => 'required_without:caracteristicas.*.titulo|nullable',

            //'caracteristicas.*.titulo' => 'required|string|min:3|max:125',
            'propiedad_estado_id' => 'required|numeric'
        ];
    }
}
