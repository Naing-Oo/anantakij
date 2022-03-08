<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Warehouse extends Model
{
    protected $fillable =[

        "name", "warehouse_type", "phone", "email", "address", "is_active"
    ];

    public function product()
    {
    	return $this->hasMany('App\Models\Product');
    	
    }
}
