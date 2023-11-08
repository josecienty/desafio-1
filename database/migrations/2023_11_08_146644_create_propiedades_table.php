<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('propiedades', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');

            $table->integer('cuota_desde');
            $table->integer('superficie');

            $table->decimal('longitud', 10, 7);
            $table->decimal('latitud', 10, 7);

            $table->foreignId('manzana_id')
                ->constrained('manzanas')
                ->onDelete('cascade');

            $table->foreignId('propiedad_estado_id')
                ->constrained('propiedades_estados')
                ->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('propiedades');
    }
};
