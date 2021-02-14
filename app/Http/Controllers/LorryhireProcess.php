<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LorryhireProcess extends Controller
{
    public function new_lorry_hire(){

        return view('lorry_hire_process.new_lorry_hire');
    }
    public function get_new_lorry_hire_process(){

    }
}
