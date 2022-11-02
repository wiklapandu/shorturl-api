<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Firebase\JWT\JWT;
use Firebase\JWT\KEY;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    //
    public function register(Request $request)
    {
    }
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'fail',
                'errors' => $validator->errors()
            ], 400);
        }

        $user = DB::table('users')->where(['email' => $request->post('email')]);
        if (!$user->exists()) {
            return response()->json([
                'status' => 'fail',
                'message' => 'email not found'
            ], 400);
        }

        $theUser = $user->get()->first();
        if (!Hash::check($request->post('password'), $theUser->password)) {
            return response()->json([
                'status' => 'fail',
                'message' => 'email and password not matches'
            ], 400);
        }
        $token = JWT::encode([
            'user' => $theUser,
            'expired_at' => Carbon::now()->setSecond(15)
        ], 'test', 'HS256');

        return response()->json([
            'status' => 'success',
            'token' => $token,
        ], 201);
    }
}
