<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Caracteristicas;
use Illuminate\Http\JsonResponse;

class CaracteristicasController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/caracteristicas/{caracteristica_id}",
     *     summary="Obtener detalles de una caracteristica",
     *     tags={"Caracteristicas"},
     *     security={{"bearer_token":{}}},
     *     @OA\Parameter(
     *         name="caracteristica_id",
     *         in="path",
     *         required=true,
     *         description="ID de la caracteristica",
     *         @OA\Schema(
     *             type="integer",
     *             format="int64",
     *             example=1
     *         ),
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="Detalles de las caracteristica",
     *         @OA\JsonContent(
     *             @OA\Property(property="data", type="object"),
     *         ),
     *     ),
     *     @OA\Response(
     *         response="404",
     *         description="caracteristica no encontrada",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string"),
     *         ),
     *     ),
     * )
     */
    public function show(int $id): JsonResponse
    {
        $result = Caracteristicas::where('id', $id)->first();
        if (!$result) {
            return $this->makeResponse([
                'message' => 'Caracteristica no encontrada'
            ], 404);
        }
        return $this->makeResponse([
            'data' => $result
        ]);
    }
}
