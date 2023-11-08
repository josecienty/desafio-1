<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Departamentos;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class DepartamentoController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/departamentos/{departamento_id}",
     *     summary="Obtener detalles de un departamento",
     *     tags={"Departamentos"},
     *     security={{"bearer_token":{}}},
     *     @OA\Parameter(
     *         name="departamento_id",
     *         in="path",
     *         required=true,
     *         description="ID del departamento",
     *         @OA\Schema(
     *             type="integer",
     *             format="int64",
     *             example=1
     *         ),
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="Detalles del departamento",
     *         @OA\JsonContent(
     *             @OA\Property(property="data", type="object"),
     *         ),
     *     ),
     *     @OA\Response(
     *         response="404",
     *         description="Departamento no encontrado",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string"),
     *         ),
     *     ),
     * )
     */
    public function show(int $id): JsonResponse
    {
        $result = Departamentos::where('id', $id)->first();
        if (!$result) {
            return $this->makeResponse([
                'message' => 'Departamento no encontrado'
            ], 404);
        }
        return $this->makeResponse([
            'data' => $result
        ]);
    }
}
