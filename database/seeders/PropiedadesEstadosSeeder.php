<?php

namespace Database\Seeders;

use App\Models\PropiedadesEstados;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PropiedadesEstadosSeeder extends Seeder
{
    private $data = [
        'Disponible',
        'Reserva Vendedor',
        'Reservado',
        'Vendido'
    ];

    public function run(): void
    {
        foreach ($this->data as $k => $estado) {
            PropiedadesEstados::updateOrCreate([
                'id' => $k + 1
            ], [
                'titulo' => $estado,
                'orden' => $k + 1
            ]);
        }
    }
}
