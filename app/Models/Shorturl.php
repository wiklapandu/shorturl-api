<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Shorturl extends Model
{
    use HasFactory;
    protected $table = "shorturls";
    protected $primaryKey = 'id';
    protected $guarded = [];

    public static function getDataBySlug($slug)
    {
        $slug = DB::table('shorturls')->where(['slug' => $slug]);
        return $slug->get()->first();
    }
}
