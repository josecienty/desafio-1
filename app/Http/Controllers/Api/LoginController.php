<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
     * @OA\Post(
     *     path="/api/login",
     *     summary="Iniciar sesión",
     *     tags={"Auth"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="email", type="string", format="email", description="Correo electrónico del usuario"),
     *                 @OA\Property(property="password", type="string", description="Contraseña del usuario"),
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response="200",
     *         description="Inicio de sesión exitoso",
     *         @OA\JsonContent(
     *             @OA\Property(property="token", type="string", description="Token de acceso para futuras solicitudes"),
     *         )
     *     ),
     *     @OA\Response(
     *         response="401",
     *         description="Credenciales no válidas",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", description="Mensaje de error"),
     *         )
     *     ),
     * )
     */
    public function login(Request $request): JsonResponse
    {
        //? 1- Validación
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        //? 2- Autenticar al usuario

        if (Auth::attempt($credentials)) {
            //? 2.1- Si la autenticación es exitosa, se crea un token de acceso

            /** @var \App\Models\User $user **/
            $user = Auth::user();
            $token = $user->createToken('login-token')->plainTextToken;

            return $this->makeResponse(['token' => $token]);
        }

        //? 2.2- Si la autenticación falla, devolver un error
        return $this->makeResponse([
            'message' => 'Credenciales no válidas'
        ], 401);
    }
}
