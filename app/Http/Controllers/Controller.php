<?php

namespace App\Http\Controllers;

use Faker\Core\Number;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function makeResponse(array $result, int $code = 200): JsonResponse
    {
        return response()->json($result, $code);
    }
}
