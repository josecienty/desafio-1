<?php

namespace Database\Seeders;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    private $data;

    public function __construct()
    {
        $this->data = [
            [
                'name' => 'Administrador',
                'email' => 'admin@idesa.com.py',
                'password' => '$2y$12$7x2.Vdo9TQ7CEYzT7HzDA.azT1rbknZr/W0USS0hMOPblm.VMsgRC',
                'email_verified_at' => Carbon::now(),
            ],
        ];
    }

    public function run(): void
    {
        foreach ($this->data as $id => $user) {
            User::updateOrCreate(
                [
                    'id' => $id + 1
                ],
                $user
            );
        }
    }
}
