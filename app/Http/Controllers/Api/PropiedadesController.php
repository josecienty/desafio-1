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

class PropiedadesController extends Controller
{
    public function index(): Collection
    {
        $result = Propiedades::latest()
            ->with('caracteristicas:id,caracteristica', 'manzana')
            ->paginate(10);

        return Collection::make($result);
    }

    public function store(Request $request): JsonResponse
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

    public function update(Request $request, int $id): JsonResponse
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

    public function show(int $id): JsonResponse
    {
        $result = Propiedades::find($id);

        if (!$result) {
            return $this->makeResponse([
                'message' => 'Propiedad no encontrada'
            ], 404);
        }

        return $this->makeResponse([
            'data' => $result
                ->with('caracteristicas:id,caracteristica', 'manzana')
                ->first()
        ]);
    }

    private function formatearManzanaRequest(Request $request): ?array
    {
        //Formatear manzana "registrar si es necesario, si no solo devolvera el valor"
        $input = $request->all();

        if (array_column($input, 'manzana_id')) {
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
