<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Propiedades extends Model
{
    use HasFactory;

    protected $table = 'propiedades';

    protected $fillable = [
        'nombre',
        'cuota_desde',
        'superficie',
        'latitud',
        'longitud',
        'manzana_id',
        'propiedad_estado_id'
    ];

    public function caracteristicas()
    {
        return $this->belongsToMany(
            Caracteristicas::class,
            'propiedades_caracteristicas',
            'propiedad_id',
            'caracteristica_id',
        )->orderBy('orden', 'asc');
    }

    public function manzana()
    {
        return $this->belongsTo(Manzana::class);
    }
}
