<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Caracteristicas;
use App\Models\Manzana;
use App\Models\Propiedades;
use App\Models\PropiedadesCaracteristicas;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Documentation\Propiedades\Get;
use App\Http\Requests\PropiedadesRequest;
use Illuminate\Support\Facades\Log;

class PropiedadesController extends Controller
{
    /**
     * @OA\Info(
     *     version="1.0",
     *     title="Documentación Desafio 1 Idesa",
     *      description="Desafio 1 - CRUD de propiedades ('inmobiliarias') con sus respectivas FK"
     * )
     * @OA\PathItem(path="/api/propiedades")
     *
     * @OAS\SecurityScheme(
     *      securityScheme="bearer_token",
     *      type="http",
     *      scheme="bearer"
     * )
     * @OA\Get(
     *     path="/api/propiedades",
     *     summary="Obtener una colección de propiedades",
     *     description="Obtiene una colección de propiedades que coinciden con los criterios de búsqueda.",
     *     tags={"Propiedades"},
     *  security={{"bearer_token":{}}},
     *     @OA\Parameter(
     *         name="buscar",
     *         in="query",
     *         description="Término de búsqueda",
     *         required=false,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="pageSize",
     *         in="query",
     *         description="Tamaño de página",
     *         required=false,
     *         @OA\Schema(type="integer")
     *     ),
     *
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Pagina",
     *         required=false,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *     response="200",
     *     description="Lista de propiedades",
     *     @OA\JsonContent(
     *         @OA\Property(property="current_page", type="integer"),
     *         @OA\Property(property="data", type="array",
     *             @OA\Items(
     *                 @OA\Property(property="id", type="integer"),
     *                 @OA\Property(property="nombre", type="string"),
     *                 @OA\Property(property="cuota_desde", type="integer"),
     *                 @OA\Property(property="superficie", type="number"),
     *                 @OA\Property(property="longitud", type="string"),
     *                 @OA\Property(property="latitud", type="string"),
     *                 @OA\Property(property="manzana_id", type="integer"),
     *                 @OA\Property(property="propiedad_estado_id", type="integer")
     *             )
     *         ),
     *         @OA\Property(property="first_page_url", type="string"),
     *         @OA\Property(property="from", type="integer"),
     *         @OA\Property(property="last_page", type="integer"),
     *         @OA\Property(property="last_page_url", type="string"),
     *         @OA\Property(property="links", type="array",
     *             @OA\Items(
     *                 @OA\Property(property="url", type="string"),
     *                 @OA\Property(property="label", type="string"),
     *                 @OA\Property(property="active", type="boolean")
     *             )
     *         ),
     *         @OA\Property(property="next_page_url", type="string"),
     *         @OA\Property(property="path", type="string"),
     *         @OA\Property(property="per_page", type="integer"),
     *         @OA\Property(property="prev_page_url", type="string"),
     *         @OA\Property(property="to", type="integer"),
     *         @OA\Property(property="total", type="integer")
     *     )
     *     )
     *     )
     * )
     */

    public function index(Request $request): Collection
    {
        $buscar = $request->get('buscar', '');
        $page_size = $request->get('pageSize', 10);

        $result = Propiedades::latest()
            ->with('caracteristicas:id,caracteristica', 'manzana')
            ->where('nombre', 'LIKE', '%' . trim($buscar) . '%')
            ->paginate($page_size);

        return Collection::make($result);
    }

    /**
     * @OA\Post(
     *     path="/api/propiedades",
     *     summary="Crear una nueva propiedad",
     *     description="Crea una nueva propiedad con los datos proporcionados en el JSON.",
     *     tags={"Propiedades"},
     *      security={{"bearer_token":{}}},
     *     @OA\RequestBody(
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="nombre", type="string"),
     *             @OA\Property(property="cuota_desde", type="integer"),
     *             @OA\Property(property="superficie", type="number"),
     *             @OA\Property(property="latitud", type="number"),
     *             @OA\Property(property="longitud", type="number"),
     *             @OA\Property(property="manzana", type="object",
     *                 @OA\Property(property="nombre", type="string"),
     *                 @OA\Property(property="ciudad_id", type="integer"),
     *             ),
     *             @OA\Property(property="caracteristicas", type="array",
     *                 @OA\Items(
     *                     type="object",
     *                     @OA\Property(property="titulo", type="string"),
     *                 ),
     *             ),
     *             @OA\Property(property="propiedad_estado_id", type="integer"),
     *         ),
     *     ),
     *     @OA\Response(response="200", description="Registro exitoso de propiedad", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *         @OA\Property(property="data", type="object"),
     *     )),
     *     @OA\Response(response="422", description="Error en la solicitud", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *         @OA\Property(property="error", type="string"),
     *     )),
     * )
     */
    public function store(PropiedadesRequest $request): JsonResponse
    {
        DB::beginTransaction();
        try {
            $input = $this->formatearManzanaRequest($request);

            if (!$input) {
                return $this->makeResponse([
                    'message' => 'error',
                ], 422);
            }

            $propiedad = Propiedades::create($input);

            $propiedad = $this->establecerCaracteristicas(
                $propiedad,
                $request->get('caracteristicas', [])
            );

            DB::commit();

            return $this->makeResponse([
                'message' => 'Registro exitoso de propiedad',
                'data' => $propiedad
            ], 200);
        } catch (Exception $e) {
            DB::rollBack();
            return $this->makeResponse([
                'message' => 'error',
                'error' => $e->getMessage()
            ], 422);
        }
    }

    /**
     * @OA\Put(
     *     path="/api/propiedades/{propiedad_id}",
     *     summary="Actualizar una propiedad",
     *     description="Actualiza una propiedad existente con los datos proporcionados en el JSON.",
     *     tags={"Propiedades"},
     *     @OA\Parameter(
     *         name="propiedad_id",
     *         in="path",
     *         description="ID de la propiedad a actualizar",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="nombre", type="string"),
     *             @OA\Property(property="cuota_desde", type="integer"),
     *             @OA\Property(property="superficie", type="number"),
     *             @OA\Property(property="latitud", type="number"),
     *             @OA\Property(property="longitud", type="number"),
     *             @OA\Property(property="manzana", type="object",
     *                 @OA\Property(property="nombre", type="string"),
     *                 @OA\Property(property="ciudad_id", type="integer"),
     *             ),
     *             @OA\Property(property="caracteristicas", type="array",
     *                 @OA\Items(
     *                     type="object",
     *                     @OA\Property(property="titulo", type="string"),
     *                 ),
     *             ),
     *             @OA\Property(property="propiedad_estado_id", type="integer"),
     *         ),
     *     ),
     *     @OA\Response(response="200", description="Registro modificado con éxito", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *         @OA\Property(property="data", type="object"),
     *     )),
     *     @OA\Response(response="422", description="Error en la solicitud", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *         @OA\Property(property="error", type="string"),
     *     )),
     *     security={{"bearer_token": {}}}
     * )
     */
    public function update(PropiedadesRequest $request, int $id): JsonResponse
    {

        DB::beginTransaction();
        try {
            $input = $this->formatearManzanaRequest($request);

            if (!$input) {
                return $this->makeResponse([
                    'message' => 'error',
                ], 422);
            }

            $propiedad = Propiedades::find($id);
            $propiedad->fill($input)->save();

            $propiedad = $this->establecerCaracteristicas(
                $propiedad,
                $request->get('caracteristicas', []),
                true
            );

            DB::commit();

            return $this->makeResponse([
                'message' => 'Registro modificado con éxito',
                'data' => $propiedad
            ], 200);
        } catch (Exception $e) {
            DB::rollBack();

            return $this->makeResponse([
                'message' => 'error',
                'error' => $e->getMessage()
            ], 422);
        }
    }

    /**
     * @OA\Delete(
     *     path="/api/propiedades/{propiedad_id}",
     *     summary="Eliminar una propiedad",
     *     description="Elimina una propiedad por su ID.",
     *     tags={"Propiedades"},
     *     @OA\Parameter(
     *         name="propiedad_id",
     *         in="path",
     *         description="ID de la propiedad a eliminar",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(response="204", description="La propiedad fue eliminada exitosamente."),
     *     @OA\Response(response="404", description="Propiedad no encontrada", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *     )),
     *     @OA\Response(response="409", description="No se puede completar la operación de eliminación debido a dependencias", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *     )),
     *     @OA\Response(response="500", description="Error interno del servidor", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *     )),
     *     security={{"bearer_token": {}}}
     * )
     */
    public function destroy(int $id): JsonResponse|Response
    {
        try {
            $result = Propiedades::find($id);

            if (!$result) {
                return $this->makeResponse([
                    'message' => 'Propiedad no encontrada'
                ], 404);
            }

            $result->delete();
            return response()->noContent();
        } catch (QueryException $e) {
            if ($e->errorInfo[1] === 1451) {
                return $this->makeResponse([
                    'message' => 'No se puede completar la operación de eliminación. Existen registros relacionados en otras tablas que dependen de este elemento. Por favor, elimine las dependencias antes de intentar nuevamente.'
                ], 409);
            } else {
                return $this->makeResponse([
                    'message' => 'Tuvimos inconvenientes en completar la operación.'
                ], 500);
            }
        }
    }

    /**
     * @OA\Get(
     *     path="/api/propiedades/{propiedad_id}",
     *     summary="Obtener detalles de una propiedad",
     *     description="Obtiene los detalles de una propiedad por su ID.",
     *     tags={"Propiedades"},
     *     @OA\Parameter(
     *         name="propiedad_id",
     *         in="path",
     *         description="ID de la propiedad a obtener",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(response="200", description="Detalles de la propiedad", @OA\JsonContent(
     *         @OA\Property(property="data", type="object"),
     *     )),
     *     @OA\Response(response="404", description="Propiedad no encontrada", @OA\JsonContent(
     *         @OA\Property(property="message", type="string"),
     *     )),
     *     security={{"bearer_token": {}}}
     * )
     */
    public function show(int $id): JsonResponse
    {
        $result = Propiedades::where('id', $id)
            ->with('caracteristicas:id,caracteristica', 'manzana')
            ->first();

        if (!$result) {
            return $this->makeResponse([
                'message' => 'Propiedad no encontrada'
            ], 404);
        }

        return $this->makeResponse([
            'data' => $result

        ]);
    }

    private function formatearManzanaRequest(Request $request): ?array
    {
        //Formatear manzana "registrar si es necesario, si no solo devolvera el valor"
        $input = $request->all();

        if (array_key_exists('manzana_id', $input)) {
            return $input;
        }

        //sino
        $manzana =  $request->get('manzana', []);

        if (array_key_exists('id', $manzana)) {
            return array_merge($input, [
                'manzana_id' => $manzana['id']
            ]);
        } else if (
            array_key_exists('nombre', $manzana) &&
            array_key_exists('ciudad_id', $manzana)
        ) {
            return array_merge($input, [
                'manzana_id' => Manzana::updateOrCreate(
                    $manzana,
                    $manzana
                )->id
            ]);
        }

        return null;
    }

    private function establecerCaracteristicas(Object $propiedad, array $caracteristicas, ?bool $update = false): array
    {
        if (!sizeof($caracteristicas) && !$update) return $propiedad->toArray();

        $ids = [];
        $orden = 1;

        foreach ($caracteristicas as $caracteristica) {
            if (array_key_exists('id', $caracteristica)) {
                $ids[] = $caracteristica['id'];
                continue;
            }

            if (array_key_exists('titulo', $caracteristica))
                $ids[] = Caracteristicas::updateOrCreate([
                    'caracteristica' => $caracteristica['titulo']
                ], [
                    'caracteristica' => $caracteristica['titulo']
                ])->id;
        }

        //Usar este metodo por que es más practico para el tema de orden
        foreach ($ids as $orden => $id) {
            PropiedadesCaracteristicas::updateOrCreate([
                'propiedad_id' => $propiedad->id,
                'caracteristica_id' => $id
            ], [
                'orden' => $orden + 1,
                'propiedad_id' => $propiedad->id,
                'caracteristica_id' => $id
            ]);
        }

        if ($update)
            PropiedadesCaracteristicas::where('propiedad_id', $propiedad->id)
                ->whereNotIn(
                    'caracteristica_id',
                    $ids
                )->delete();

        return array_merge($propiedad->toArray(), [
            'caracteristicas' => $ids
        ]);
    }
}
