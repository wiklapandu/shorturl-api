<?php

use App\Models\Shorturl;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('/shorturl')->group(function () {
    Route::get('/shorturl/{slug}',function ($slug,Request $request){

    });
    Route::post('/', function (Request $request) {
        $url = $request->post('url');
        $slug = url('/' . Str::slug(Str::random(8)));
        Shorturl::updateOrCreate(
            [
                'url' => $url
            ],
            [
                'slug' => $slug,
            ]
        );
        return response()->json([
            'url' => $url,
            'shorturl' => $slug
        ]);
    });
});
