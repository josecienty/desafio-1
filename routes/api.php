<?php

use App\Http\Controllers\Api\CaracteristicasController;
use App\Http\Controllers\Api\CiudadController;
use App\Http\Controllers\Api\DepartamentoController;
use App\Http\Controllers\Api\HomeController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\ManzanaController;
use App\Http\Controllers\Api\PropiedadesController;
use App\Models\Ciudades;
use Illuminate\Http\Request;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index']);

Route::post('/login', [LoginController::class, 'login']);

Route::middleware('auth:sanctum')->group(function (Router $router) {

    $router->resource('/propiedades', PropiedadesController::class)
        ->only('index', 'store', 'update', 'destroy', 'show');


    $router->get('/user', function (Request $request) {
        return $request->user();
    });

    $router->get('/ciudades/{id}', [CiudadController::class, 'show']);
    $router->get('/departamentos/{id}', [DepartamentoController::class, 'show']);
    $router->get('/caracteristicas/{id}', [CaracteristicasController::class, 'show']);
    $router->get('/manzanas/{id}', [ManzanaController::class, 'show']);
});
