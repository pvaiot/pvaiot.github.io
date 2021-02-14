<?php

namespace App\Http\Controllers;

use App\ConsignmentCancellation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Session;

class CancellationController extends Controller
{
    public  function new_consignment_cancel(){

        return View::make('cancellation.consignment_cancellation_entry');
    }
    public function store_consignment_cancel(Request $request)
    {
        $consignments_date = explode('/', $request->input('cancellation_date'));
        $consignments_day = $consignments_date[0];
        $consignments_month = $consignments_date[1];
        $consignments_year = $consignments_date[2];


        $cncancel= new ConsignmentCancellation();
        $cncancel->consignment_no = $request->consignment_no;
        $cncancel->cancellation_date = date($consignments_year . '/' . $consignments_month . '/' . $consignments_day);
        $cncancel->remarks = $request->remarks;
        $cncancel->save();


        Session::flash('flash_message', 'Record Successfully Cancelled !');

        return redirect()->route('new_consignment_cancel');
    }
}
