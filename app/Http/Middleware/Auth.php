<?php

namespace App\Http\Middleware;

use Carbon\Carbon;
use Closure;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Illuminate\Http\Request;

class Auth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $token = $request->header('Authorization');
        if (!$token) {
            return response()->json([
                'status' => 'error',
                'error' => 'token is required'
            ], 401);
        }

        try {
            $data = JWT::decode(
                $token,
                new Key(
                    env('JWT_SECRET', 'test'),
                    env('JWT_ALGO', 'HS256')
                )
            );
            if ($data->expired_at < Carbon::now()->getTimestamp()) {
                return response()->json([
                    'status' => 'error',
                    'errors' => 'expired token',
                ], 401);
            }
            $request->user = $data->user;
            return $next($request);
        } catch (\Throwable $e) {
            return response()->json([
                'status' => 'error',
                'errors' => 'invalid Token',
            ], 401);
        }
    }
}
