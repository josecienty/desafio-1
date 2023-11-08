<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Manzana extends Model
{
    use HasFactory;

    protected $table = 'manzanas';

    protected $fillable = [
        'nombre',
        'ciudad_id',
        'estado'
    ];

    protected $with = [
        'ciudad'
    ];

    public function ciudad()
    {
        return $this->belongsTo(Ciudades::class);
    }
}
