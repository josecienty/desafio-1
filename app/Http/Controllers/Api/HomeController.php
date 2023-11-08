<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;

class HomeController extends Controller
{
    public function index(): JsonResponse
    {
        return $this->makeResponse([
            'title' => config('app.name'),
            'version' => config('app.version'),
            'author' => config('app.author'),
            'date' => Carbon::now()->format('d-m-Y')
        ]);
    }
}
