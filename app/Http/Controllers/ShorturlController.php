<?php

namespace App\Http\Controllers;

use App\Models\Shorturl;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ShorturlController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

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
        if (!$validator->validate()) {
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

        return response()->json([
            'status' => 'success',
            'url' => $url,
            'shorturl' => url("/shorturl/$slug")
        ]);
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
            ]);
        }
        return redirect()->to($shorturl->url);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
    }
}
