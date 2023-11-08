<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropiedadesCaracteristicas extends Model
{
    use HasFactory;

    protected $table = 'propiedades_caracteristicas';

    protected $fillable = [
        'propiedad_id',
        'orden',
        'caracteristica_id'
    ];
}
