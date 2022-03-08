<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Agent extends Model
{
    protected $fillable =[

        "name", "description", "commission_rate", "percentage", "is_active"
    ];
}
