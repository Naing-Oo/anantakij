<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable =[

        "reference_no", "user_id", "warehouse_id", "supplier_id", "item", "total_qty", "total_discount",
        "total_tax", "total_cost", "order_tax_rate", "order_tax", "", "order_discount", "shipping_cost",
        "grand_total", "total_actual_qty", "total_round_qty", "paid_amount", "status", "agent_id", "catcher_id", 
        "agent_commission_rate", "catcher_commission_rate", "agent_commission", "catcher_commission", "diff_qty", "purchase_date", "queue_date",
        "recieved_date", "due_date", "payment_status", "document", "note"
    ];

    public function supplier()
    {
    	return $this->belongsTo('App\Models\Supplier');
    }

    public function warehouse()
    {
    	return $this->belongsTo('App\Models\Warehouse');
    }
}
