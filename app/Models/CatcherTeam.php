<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CatcherTeam extends Model
{
    protected $fillable =[

        "name", "description", "commission_rate", "percentage", "is_active"
    ];
}
