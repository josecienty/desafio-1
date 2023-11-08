<?php

use App\Http\Controllers\Api\HomeController;
use App\Http\Controllers\Api\LoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index']);

Route::post('/login', [LoginController::class, 'login']);

Route::middleware('auth:sanctum')->group(function ($route) {
    $route->get('/user', function (Request $request) {
        return $request->user();
    });
});
