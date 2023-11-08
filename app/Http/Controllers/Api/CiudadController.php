<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ciudades;
use Illuminate\Http\JsonResponse;

class CiudadController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/ciudades/{ciudad_id}",
     *     summary="Obtener detalles de una ciudad",
     *     tags={"Ciudades"},
     *     security={{"bearer_token":{}}},
     *     @OA\Parameter(
     *         name="ciudad_id",
     *         in="path",
     *         required=true,
     *         description="ID de la ciudad",
     *         @OA\Schema(
     *             type="integer",
     *             format="int64",
     *             example=1
     *         ),
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="Detalles de la ciudad",
     *         @OA\JsonContent(
     *             @OA\Property(property="data", type="object"),
     *         ),
     *     ),
     *     @OA\Response(
     *         response="404",
     *         description="Ciudad no encontrada",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string"),
     *         ),
     *     ),
     * )
     */
    public function show(int $id): JsonResponse
    {
        return $this->makeResponse([
            'data' => Ciudades::where('id', $id)->first()
        ]);
    }
}
