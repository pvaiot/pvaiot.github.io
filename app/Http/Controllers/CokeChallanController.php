<?php

namespace App\Http\Controllers;

use App\Branch;
use App\Broker;
use App\Challan;
use App\Challan_Child;
use App\Challan_Child2;
use App\Challan_Child3;
use App\CockConsignment;
use App\CokeChallan;
use App\CokeChallan_child2;
use App\CokeChallan_child3;
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
class CokeChallanController extends Controller
{
    public function CokeChallan_entry()
    {

        return View::make('coke_challan.new_coke_challan_entry');
    }

    public function cokechallan()
    {
        $challans = CokeChallan::orderBy('id')->get();
        return View::make('coke_challan.coke_challan_panel')->with('area_challan', $challans);
    }

    public function AjaxGet_coke_consignment_id($id)
    {

        $data = DB::table("cock_consignment")->where("consignment_no", $id)->first();
        $truck_detail = Lorry::where('id', $data->truck_no_id)->first();
//        print_r($data);
//        die();
        return json_encode(array(
            'value_unique' => "OK",
            'id' => $data->id,
            'date' => date('d/m/Y', strtotime($data->con_date)),
            'destination' => $data->to,
            'con_no' => $data->consignment_no,
            'truck' => $data->truck_no,
            'truck_no' => $data->truck_no,
            'engine_no' => $truck_detail->engin_no,
            'chassis_no' => $truck_detail->chassis_no,
            'make' => $truck_detail->make,
            'truck_owner_name' => $truck_detail->truck_owner_name,
            'owners_address' => $truck_detail->truck_owner_address,
            'owners_phone' => $truck_detail->truck_owner_mob_no

        ));
    }

    public function AjaxGet_coke_consignment_child_id($id)
    {
        $data = DB::table("cock_consignment")->where("consignment_no", $id)->first();
        $child['data'] = \App\CockConsignment_child2::where('consignment_id', $data->id)->get();
//        print_r($data);
        return json_encode($child);
    }

    public function AjaxGet_coke_consignment_value($id)
    {
        $count = DB::table("cock_consignment")->where("consignment_no", $id)->count();
        if ($count > 0) {
            echo 'unique';
        } else {
            echo 'not unique';
        }
    }

    public function store_coke_challan_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        try {
            DB::beginTransaction();
            $input = $request->input('rows');

            $challans = new CokeChallan();
            $challans->challan_no = $request->challan_no;
            $challans->created_by = $request->user;
            $challans->from = $request->from;
            $from = Location::where('city', $request->from)->first();
            if (!empty($from)) {
                $challans->from_id = $from->id;
            }

            $challans_date = explode('/', $request->input('date'));
            $challans_day = $challans_date[0];
            $challans_month = $challans_date[1];
            $challans_year = $challans_date[2];
            $challans->date = date($challans_year . '/' . $challans_month . '/' . $challans_day);

            $challans->to = $request->to;
            $to = Location::where('city', $request->to)->first();
            if (!empty($to)) {
                $challans->to_id = $to->id;
            }


//        $challans->consignment_id = $request->consigment_id_value;
//        $challans->consignment_no = $request->consignment_id;
//
//        $challans_date = explode('/', $request->input('con_date'));
//        $challans_day = $challans_date[0];
//        $challans_month = $challans_date[1];
//        $challans_year = $challans_date[2];
//        $challans->con_date =  date($challans_year . '/' . $challans_month . '/' . $challans_day);
//
//        $challans->destination = $request->destination;

            $challans->truck_no = $request->truck_no;
            $challans->engine_no = $request->engine_no;
            $challans->chassis_no = $request->chassis_no;
            $challans->make = $request->make;
            $challans->owners_name = $request->truck_owner_name;
            $challans->owners_address = $request->owners_address;
            $challans->owners_phone = $request->owners_phone;

            $challans->pan_applicable = $request->pan_applicable;
            $challans->pan_no = $request->pan_no;
            $challans->pan_name = $request->pan_name;
            $challans->pan_of = $request->pan_of;
            $challans->declaration_submitted = $request->declaration_submitted;

            $challans->broker = $request->broker;

            $challans->broker_id = $request->broker_name;
            $broker_details = Broker::find($request->broker_name);
            if (!empty($broker_details)) {
                $challans->broker_name = $broker_details->name;
            }
            $challans->broker_phone = $request->broker_phone;
            $challans->broker_slip_no = $request->broker_slip_no;
            $challans->insurance_name = $request->insurance_name;
            $challans->policy_no = $request->policy_no;
            $challans->insurance_place_issue = $request->policy_place_issue;


            $challans->drivers_id = $request->drivers_name;
            $dirversname = Driver::find($request->drivers_name);
            if (!empty($dirversname)) {
                $challans->drivers_name = $dirversname->truck_driver_name;
            }
            $challans->drivers_contact_no = $request->drivers_contact_no;
            $challans->drivers_address = $request->drivers_address;
            $challans->license_no = $request->license_no;
            $challans->place_of_issue = $request->place_of_issue;

            $challans->balance_payable_at_id = $request->balance_payable_at;
            $branchname = Branch::find($request->balance_payable_at);
            if (!empty($branchname)) {
                $challans->balance_payable_at = $branchname->city;
            }

            $challans->freight = $request->freight;
            $challans->diesel = $request->diesel;
            $challans->cash_advance = $request->cash_advance;
            $challans->balance = $request->balance;
            $challans->in_word = $this->amount_in_words($request->balance);
            $challans->petrol_pump_id = $request->petrol_pump_id;

            $challans->save();

//        $myconsingment = Consignment::where('id',$request->consignment_id)->first();
//        $myconsingment->status=1;
//        $myconsingment->save();

            $challan_child3 = new CokeChallan_child3();
            $challan_child3->challan_id = $challans->id;
            $challan_child3->total_package = $request->total_package_for_challn;
            $challan_child3->total_net_weight = $request->total_net_weight_for_challn;
            $challan_child3->total_gross_weight = $request->total_gross_weight_for_challn;
            $challan_child3->save();
            if ($request->petrol_pump_id !== "0") {
                $petrol_pump = new Petrol_Pump_Record();
                $petrol_pump->challan_id = $challans->id;
                $petrol_pump->petrol_pump_id = $request->petrol_pump_id;
                $petrol_pump->amount = $request->diesel;
                $petrol_pump->challan_date = date($challans_year . '/' . $challans_month . '/' . $challans_day);
                $petrol_pump->save();
            }

            $input2 = $request->input('rows2');
            foreach ($input2 as $row2) {
                $flight = new CokeChallan_child2();
                $flight->challan_id = $challans->id;
                $flight->consignment_no = $row2['saved_data_consignment_no'];
                $newconsignment_id = CockConsignment::where('consignment_no', $row2['saved_data_consignment_no'])->get();
                foreach ($newconsignment_id as $newconsignment) {
                    $flight->consignment_id = $newconsignment->id;
                }
                $flight->total_package = $row2['total_package_add'];
                $flight->total_net_weight = $row2['total_net_weight_add'];
                $flight->total_gross_weight = $row2['total_gross_weight_add'];
                $flight->save();

            }
//        foreach($input as $row) {
//
//            $flight = new Challan_Child();
//            $flight->challan_id = $challans->id;
//            $flight->category = $row['category'];
//            $flight->package = $row['package'];
//            $flight->net_weight = $row['net_weight'];
//            $flight->gross_weight = $row['gross_weight'];
//            $flight->save();
//
//        }
            DB::commit();
            Session::flash('flash_message', 'New Challan Record  successfully Created!');
            return redirect()->route('CokeChallan_entry')->with('status', $challans->id);

        } catch (\Exception $e)
        {
            DB::rollback();
            Session::flash('flash_message_error', 'Network Problem Please try again');
            return redirect()->back();
//echo $e->getMessage();
        }
    }

    public function update_coke_challan(Request $request, $id)
    {

        //        $data = Input::all();
        //        print_r($data);
        //        die();
        $input = $request->input('rows');
        $challans= CokeChallan::find($id);
        $challans->challan_no = $request->challan_no;

        $challans->from = $request->from;
        $from =Location::where('city',$request->from)->first();
        if(!empty($from)) {
            $challans->from_id = $from->id;
        }

        $challans_date = explode('/', $request->input('date'));
        $challans_day = $challans_date[0];
        $challans_month = $challans_date[1];
        $challans_year = $challans_date[2];
        $challans->date =  date($challans_year . '/' . $challans_month . '/' . $challans_day);

        $challans->to = $request->to;
        $to =Location::where('city',$request->to)->first();
        if(!empty($to)) {
            $challans->to_id = $to->id;
        }


        //        $challans->consignment_id = $request->consigment_id_value;
        //        $challans->consignment_no = $request->consignment_id;
        //
        //        $challans_date = explode('/', $request->input('con_date'));
        //        $challans_day = $challans_date[0];
        //        $challans_month = $challans_date[1];
        //        $challans_year = $challans_date[2];
        //        $challans->con_date =  date($challans_year . '/' . $challans_month . '/' . $challans_day);
        //
        //        $challans->destination = $request->destination;

        $challans->truck_no = $request->truck_no;
        $challans->engine_no = $request->engine_no;
        $challans->chassis_no = $request->chassis_no;
        $challans->make = $request->make;
        $challans->owners_name = $request->truck_owner_name;
        $challans->owners_address = $request->owners_address;
        $challans->owners_phone = $request->owners_phone;

        $challans->pan_applicable = $request->pan_applicable;
        $challans->pan_no = $request->pan_no;
        $challans->pan_name = $request->pan_name;
        $challans->pan_of = $request->pan_of;
        $challans->declaration_submitted = $request->declaration_submitted;

        $challans->broker = $request->broker;

        $challans->broker_id = $request->broker_name;
        $broker_details = Broker::find($request->broker_name);
        if(!empty($broker_details)) {
            $challans->broker_name = $broker_details->name;
        }
        $challans->broker_phone = $request->broker_phone;
        $challans->broker_slip_no = $request->broker_slip_no;
        $challans->insurance_name = $request->insurance_name;
        $challans->policy_no = $request->policy_no;


        $challans->drivers_id = $request->drivers_name;
        $dirversname =Driver::find($request->drivers_name);
        if(!empty($dirversname)) {
            $challans->drivers_name = $dirversname->truck_driver_name;
        }
        $challans->drivers_contact_no = $request->drivers_contact_no;
        $challans->drivers_address = $request->drivers_address;
        $challans->license_no = $request->license_no;
        $challans->place_of_issue = $request->place_of_issue;

        $challans->balance_payable_at_id = $request->balance_payable_at;
        $branchname =Branch::find($request->balance_payable_at);
        if(!empty($branchname)) {
            $challans->balance_payable_at = $branchname->city;
        }

        $challans->freight = $request->freight;
        $challans->diesel = $request->diesel;
        $challans->cash_advance = $request->cash_advance;
        $challans->balance = $request->balance;
        $challans->in_word=$this->amount_in_words($request->balance);
        $challans->petrol_pump_id = $request->petrol_pump_id;
        $challans->save();

        //        $myconsingment = Consignment::where('id',$request->consignment_id)->first();
        //        $myconsingment->status=1;
        //        $myconsingment->save();
        $item= new CokeChallan_child3();
        $item::where('challan_id',$id)->delete();

        $challan_child3= new CokeChallan_child3();
        $challan_child3->challan_id= $challans->id;
        $challan_child3->total_package=$request->total_package_for_challn;
        $challan_child3->total_net_weight=$request->total_net_weight_for_challn;
        $challan_child3->total_gross_weight=$request->total_gross_weight_for_challn;
        $challan_child3->save();

        $item2= new CokeChallan_child2();
        $item2::where('challan_id',$id)->delete();

        $input2 = $request->input('rows2');
        foreach($input2 as $row2) {
            $flight = new CokeChallan_child2();
            $flight->challan_id = $challans->id;
            $flight->consignment_no = $row2['saved_data_consignment_no'];
            $newconsignment_id =CockConsignment::where('consignment_no',$row2['saved_data_consignment_no'])->get();
            foreach($newconsignment_id as $newconsignment){
                $flight->consignment_id=$newconsignment->id;
            }
            $flight->total_package = $row2['total_package_add'];
            $flight->total_net_weight = $row2['total_net_weight_add'];
            $flight->total_gross_weight = $row2['total_gross_weight_add'];
            $flight->save();

        }
        //        foreach($input as $row) {
        //
        //            $flight = new Challan_Child();
        //            $flight->challan_id = $challans->id;
        //            $flight->category = $row['category'];
        //            $flight->package = $row['package'];
        //            $flight->net_weight = $row['net_weight'];
        //            $flight->gross_weight = $row['gross_weight'];
        //            $flight->save();
        //
        //        }
        Session::flash('flash_message', 'Challan Update successfully Updated!');
        return redirect()->route('cokechallan');

    }

    public function edit_coke_challan($id){

        $data = CokeChallan::find($id);
//        print_r($data);
//        die();

        return View::make('coke_challan.edit_coke_challan')->with('bata',$data);
    }

    public  function print_lorry_coke_challan($id){
        $challan= CokeChallan::find($id);
        $pdf=PDF::loadView('pdf.coke_lorrypdf', ['challan'=>$challan])->setPaper('a4','landscape');
        $filename=$challan->challan_no;
        return $pdf->stream($filename.'.pdf');
    }
    public  function print_balance_coke_challan($id){
        $challan= CokeChallan::find($id);
        $challan_child= Challan_Child::where('challan_id',$id)->get();
        $pdf=PDF::loadView('pdf.coke_balance_pdf', ['challan_child'=>$challan_child, 'challan'=>$challan])->setPaper('a4','landscape');
        $filename=$challan->challan_no;
        return $pdf->stream($filename.'.pdf');
    }
    public  function print_record_coke_challan($id){
        $challan= CokeChallan::find($id);
        $challan_child= Challan_Child::where('challan_id',$id)->get();
        $pdf=PDF::loadView('pdf.coke_record_pdf', ['challan_child'=>$challan_child, 'challan'=>$challan])->setPaper('a4','landscape');
        $filename=$challan->challan_no;
        return $pdf->stream($filename.'.pdf');
    }

    public function delete_coke_challan($id)
    {

        $mychallan = CokeChallan::find($id);

        try{
            $item= new CokeChallan();
            $item::find($id)->delete();
            $item2= new CokeChallan_child2();
           $delete_challan= $item2::where('challan_id',$id)->first();
            $delete_challan->delete();
            \Session::flash('flash_message', 'Selected Challan successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }




//    --------------------------------------------------------------------------------------------------------------
    static function amount_in_words($amount){
        $number = $amount;
        $no = round($number);
        $point = round($number - $no, 2) * 100;
        $hundred = null;
        $digits_1 = strlen($no);
        $i = 0;
        $str = array();
        $words = array('0' => '', '1' => 'One', '2' => 'Two',
            '3' => 'Three', '4' => 'Four', '5' => 'Five', '6' => 'Six',
            '7' => 'Seven', '8' => 'Eight', '9' => 'Nine',
            '10' => 'Ten', '11' => 'Eleven', '12' => 'Twelve',
            '13' => 'Thirteen', '14' => 'Fourteen',
            '15' => 'Fifteen', '16' => 'Sixteen', '17' => 'Seventeen',
            '18' => 'Eighteen', '19' =>'Nineteen', '20' => 'Twenty',
            '30' => 'Thirty', '40' => 'Forty', '50' => 'Fifty',
            '60' => 'Sixty', '70' => 'Seventy',
            '80' => 'Eighty', '90' => 'Ninety');
        $digits = array('', 'Hundred', 'Thousand', 'Lakh', 'Crore');
        while ($i < $digits_1) {
            $divider = ($i == 2) ? 10 : 100;
            $number = floor($no % $divider);
            $no = floor($no / $divider);
            $i += ($divider == 10) ? 1 : 2;
            if ($number) {
                $plural = (($counter = count($str)) && $number > 9) ? 's' : null;
                $hundred = ($counter == 1 && $str[0]) ? ' and ' : null;
                $str [] = ($number < 21) ? $words[$number] .
                    " " . $digits[$counter] . $plural . " " . $hundred
                    :
                    $words[floor($number / 10) * 10]
                    . " " . $words[$number % 10] . " "
                    . $digits[$counter] . $plural . " " . $hundred;
            } else $str[] = null;
        }
        $str = array_reverse($str);
        $result = implode('', $str);
        $points = ($point) ?
            "." . $words[$point / 10] . " " .
            $words[$point = $point % 10] : '';
        return $result . "Rupees  " . $points . "Only";
    }
}
