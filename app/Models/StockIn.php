<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StockIn extends Model
{
    protected $table = 'stock_in';
    protected $fillable =[

        "reference_no", "purchase_id", "user_id", "status", "from_warehouse_id",
        "to_warehouse_id", "item", "total_qty", "grand_total", "note"
    ];

    public function fromWarehouse()
    {
    	return $this->belongsTo('App\Models\Warehouse', 'from_warehouse_id');
    }

    public function toWarehouse()
    {
    	return $this->belongsTo('App\Models\Warehouse', 'to_warehouse_id');
    }

    public function user()
    {
    	return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function purchase()
    {
    	return $this->belongsTo('App\Models\Purchase', 'purchase_id');
    }

    public function supplier()
    {
    	return $this->belongsTo('App\Models\Supplier', 'supplier_id');
    }
}
