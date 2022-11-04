<?php

namespace App\Http\Middleware;

use Carbon\Carbon;
use Closure;
use Exception;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Firebase\JWT\SignatureInvalidException;
use Illuminate\Http\Request;
use InvalidArgumentException;

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
                'error' => 'Token is required'
            ], 401);
        }

        try {
            $data = JWT::decode($token, new Key('test', 'HS256'));
            if($data->expired_at < Carbon::now()->getTimestamp()){
                return response()->json([
                    'status' => 'error',
                    'errors' => 'Expired token',
                ], 401);
            }
            $request->user = $data->user;
            return $next($request);
        } catch (\Throwable $e) {
            return response()->json([
                'status' => 'error',
                'errors' => 'Invalid Token',
            ], 401);
        }
    }
}
