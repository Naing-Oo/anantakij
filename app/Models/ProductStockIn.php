<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductStockIn extends Model
{
    protected $table = 'product_stock_in';
    protected $fillable =[
        "stockin_id", "product_id", "product_batch_id", "qty", "unit_id", "total"
    ];
}
