<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ciudades extends Model
{
    use HasFactory;

    protected $table = 'ciudades';

    protected $with = [
        'departamento'
    ];

    public function departamento()
    {
        return $this->belongsTo(Departamentos::class);
    }
}
