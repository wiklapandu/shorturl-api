<?php

namespace App\Http\Controllers;

use App\Models\Shorturl;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ShorturlController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'url' => 'required|url'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'fail',
                'errors' => $validator->errors()
            ]);
        }

        $url = $request->post('url');

        $slug = Str::slug(Str::random(8));
        $shorturl = new Shorturl;
        $shorturl->url = $url;
        $shorturl->slug = $slug;
        $shorturl->save();

        $theShorturl = DB::table('shorturls')->where(['url' => $url, 'slug' => $slug])->get()->first();
        $theShorturl->slug = url("/api/shorturl/$theShorturl->slug");
        return response()->json([
            'status' => 'success',
            'shorturl' => $theShorturl
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  string  $slug
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        /* find slug and redirect */
        $shorturl = Shorturl::getDataBySlug($slug);
        if (!$shorturl) {
            return response()->json([
                'status' => 'fail',
                'error' => 'undefined url data'
            ], 400);
        }
        return redirect()->to($shorturl->url);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $validator = Validator::make($request->all(), [
            'url' => 'required|url'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'fail',
                'errors' => $validator->errors()
            ], 400);
        }

        $url = $request->post('url');
        $slug = Str::slug(Str::random(8));

        $shorturl = Shorturl::find($id);
        $shorturl->url = $url;
        $shorturl->slug = $slug;
        $shorturl->save();

        $theShorturl = DB::table('shorturls')->where(['url' => $url, 'slug' => $slug])->get()->first();
        $theShorturl->slug = url("/api/shorturl/$theShorturl->slug");

        return response()->json([
            'status' => 'success',
            'shorturl' => $theShorturl
        ], 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $shorturl = Shorturl::find($id);

        if (!$shorturl) {
            return response()->json([
                'status' => 'error',
                'error' => 'shorturl not found'
            ], 400);
        }

        $shorturl->delete();
        return response()->json([
            'status' => 'success',
            'message' => 'shorturl has been deleted'
        ], 201);
    }
}
