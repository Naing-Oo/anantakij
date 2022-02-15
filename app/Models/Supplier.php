<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $fillable =[

        "name", "image", "company_name",
        "credit_term", "bank_account", "agent_name", "id_card", "document",
         "vat_number","email", "phone_number", "address", "city",
        "state", "postal_code", "country", "is_active"
        
    ];

    public function product()
    {
    	return $this->hasMany('App\Models\Product');
    	
    }
}
