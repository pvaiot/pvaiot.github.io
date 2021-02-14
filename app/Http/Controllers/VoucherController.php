<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VoucherController extends Controller
{

    public  function advance_voucher(){
        return View('vouchers.Advance_voucher');
    }
}
