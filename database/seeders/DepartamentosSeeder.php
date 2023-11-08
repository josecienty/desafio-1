<?php

namespace Database\Seeders;

use App\Models\Departamentos;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DepartamentosSeeder extends Seeder
{
    private $data = [
        [
            'id' => 1,
            'nombre' => 'Capital'
        ],
        [
            'id' => 2,
            'nombre' => 'Concepción'
        ],
        [
            'id' => 3,
            'nombre' => 'San Pedro'
        ],
        [
            'id' => 4,
            'nombre' => 'Cordillera'
        ],
        [
            'id' => 5,
            'nombre' => 'Guairá'
        ],
        [
            'id' => 6,
            'nombre' => 'Caaguazú'
        ],
        [
            'id' => 7,
            'nombre' => 'Caazapá'
        ],
        [
            'id' => 8,
            'nombre' => 'Itapúa'
        ],
        [
            'id' => 9,
            'nombre' => 'Misiones'
        ],
        [
            'id' => 10,
            'nombre' => 'Paraguarí'
        ],
        [
            'id' => 11,
            'nombre' => 'Alto Paraná'
        ],
        [
            'id' => 12,
            'nombre' => 'Central'
        ],
        [
            'id' => 13,
            'nombre' => 'Ñeembucú'
        ],
        [
            'id' => 14,
            'nombre' => 'Amambay'
        ],
        [
            'id' => 15,
            'nombre' => 'Canindeyú'
        ],
        [
            'id' => 16,
            'nombre' => 'Presidente Hayes'
        ],
        [
            'id' => 17,
            'nombre' => 'Boquerón'
        ],
        [
            'id' => 18,
            'nombre' => 'Alto Paraguay'
        ],
    ];


    public function run()
    {
        foreach ($this->data as $departmento) {
            $departmento['slug'] = $this->makeSlug($departmento['nombre']);

            Departamentos::query()->updateOrCreate(
                ['id' => $departmento['id']],
                $departmento,
            );
        }
    }
}
