<?php

namespace App\Http\Controllers;

use App\BalanceProcess;
use App\Branch;
use App\Broker;
use App\Challan;
use App\Challan_Child;
use App\Challan_Child2;
use App\Challan_Child3;
use App\Consignment;
use App\Consignment_child2;
use App\Driver;
use App\Lorry;
use App\Petrol_Pump_Record;
use App\TruckOwner;
use App\Location;
use function GuzzleHttp\Promise\all;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Session;use \PDF;


class BalanceProcessController extends Controller
{
    public function new_balance_process(){

        return view('lorry_hire_process.new_lorry_hire');
    }
    public function AjaxGet_Challan_no($id){

        $data = DB::table("challan")->where("challan_no",$id)->first();
        $data2 = DB::table("challan_child3")->where("challan_id",$data->id)->first();
        return json_encode(array(
            'value_unique' => "OK",
            'challan_no' => $data->challan_no,
            'id' => $data->id,
            'date' => date('d/m/Y', strtotime($data->date)),
            'truck_no' => $data->truck_no,
            'from' => $data->from,
            'to' => $data->to,
            'advance' => $data->cash_advance,
            'total_weight'=>$data2->total_gross_weight,
            'total_freight'=>$data->freight,
            'balance_amount'=>$data->balance,
            ));
    }



public function store_new_balance_process(Request $request){


    $balance_process_date = explode('/', $request->input('date'));
    $balance_process_day = $balance_process_date[0];
    $balance_process_month = $balance_process_date[1];
    $balance_process_year =  $balance_process_date[2];


    $balance_process= new BalanceProcess();


    $balance_process->challan_no = $request->challan_no;
    if($request->input('date')!=""){
        $balance_process->date = date($balance_process_year . '/' . $balance_process_month . '/' . $balance_process_day);
    }
    $balance_process->vehicle_no = $request->vehicle_no;
    $balance_process->from = $request->from;
    $balance_process->to = $request->to;
    $balance_process->total_advance = $request->total_advance;
    $balance_process->total_weight = $request->total_weight;
    $balance_process->total_freight = $request->total_freight;
    $balance_process->balance_amount = $request->balance_amount;
    $balance_process->detention = $request->detenction;
    $balance_process->local_lorry_hire = $request->local_lorry;
    $balance_process->labour_charge = $request->labour;
    $balance_process->green_tax = $request->green_tax;
    $balance_process->toll_tax = $request->toll_tax;
    $balance_process->shortage = $request->shortage;
    $balance_process->damage = $request->damage;
    $balance_process->late_delivery = $request->late_delivery;
    $balance_process->fuel_recovery = $request->fuel_recovery;
    $balance_process->driver_claim = $request->driver_claim;
    $balance_process->incidental = $request->incidental;
    $balance_process->mamul = $request->mamul;
    $balance_process->lorry_hire_cash_discount = $request->lorry_discount;
    $balance_process->branch = $request->branch_code;

    $balance_process->save();




    Session::flash('flash_message', 'New Balance Process Record  successfully Created!');

    return redirect()->route('new_balance_process');
}



}
