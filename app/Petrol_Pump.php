<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Petrol_Pump extends Model
{
    protected $table = 'petrol_pump';

    public function belongsToPetrol_Pump_Record(){
        return $this->belongsTo('App\Petrol_Pump_Record','petrol_pump_id');
    }
}
