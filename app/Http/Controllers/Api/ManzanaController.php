<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Manzana;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ManzanaController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/manzanas/{manzana_id}",
     *     summary="Obtener detalles de una manzana",
     *     tags={"Manzanas"},
     *     security={{"bearer_token":{}}},
     *     @OA\Parameter(
     *         name="manzana_id",
     *         in="path",
     *         required=true,
     *         description="ID de la manzana",
     *         @OA\Schema(
     *             type="integer",
     *             format="int64",
     *             example=1
     *         ),
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="Detalles de la manzana",
     *         @OA\JsonContent(
     *             @OA\Property(property="data", type="object"),
     *         ),
     *     ),
     *     @OA\Response(
     *         response="404",
     *         description="manzana no encontrada",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string"),
     *         ),
     *     ),
     * )
     */
    public function show(int $id): JsonResponse
    {
        $result = Manzana::where('id', $id)->first();
        if (!$result) {
            return $this->makeResponse([
                'message' => 'Manzana no encontrada'
            ], 404);
        }
        return $this->makeResponse([
            'data' => $result
        ]);
    }
}
