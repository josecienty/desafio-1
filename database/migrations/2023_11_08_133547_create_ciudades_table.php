<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ciudades', function (Blueprint $table) {
            $table->id();

            $table->string('nombre', 64);
            $table->string('slug', 80);
            $table->double('lat', 13, 8);
            $table->double('lng', 13, 8);
            $table->foreignId('departamento_id')
                ->constrained('departamentos')
                ->onDelete('cascade');

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ciudades');
    }
};
