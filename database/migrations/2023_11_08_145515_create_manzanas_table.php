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
        Schema::create('manzanas', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');

            $table->foreignId('ciudad_id')
                ->constrained('ciudades')
                ->onDelete('cascade');

            $table->boolean('estado')->default(false);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('manzanas');
    }
};
