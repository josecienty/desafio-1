<?php

use App\Http\Controllers\Api\HomeController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\PropiedadesController;
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
});
