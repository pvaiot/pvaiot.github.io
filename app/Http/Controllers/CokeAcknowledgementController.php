<?php

namespace App\Http\Controllers;


use App\Acknowledgement;
use App\acknowledgementChild;
use App\Challan;
use App\CockConsignment;
use App\Coke_acknowledgement;
use App\Coke_acknowledgement_child;
use App\CokeChallan;
use App\Consignment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Session;

class CokeAcknowledgementController extends Controller
{
    public  function new_coke_acknowledgement_entry(){
        return View::make('Coke_Acknowledgement.new_coke_acknowledgement_entry');
    }

    public function cokeacknowledgement()
    {
        $acknowledgements= Coke_acknowledgement::orderBy('id')->get();
        return View::make('Coke_Acknowledgement.coke_acknowledgement_panel')->with('area_acknowledgement',$acknowledgements);
    }
    public function AjaxGet_trip_id($id){

        $data2 = DB::table("cock_consignment")->where("trip_id",$id)->first();
        $data1 = DB::table("coke_challan_child2")->where("consignment_id",$data2->id)->first();
        $data =DB::table("coke_challan")->where("id",$data1->challan_id)->first();
//        print_r($data->date);
//die();
        return json_encode(array('date'=>date('d/m/Y',strtotime($data->date)),
            'origin'=>$data->from,
            'destination'=>$data->to,
            'vehicle_no'=>$data->truck_no,
            'pan_no'=>$data->pan_no,
            'balance_amount'=>$data->balance,
            'challan_no'=>$data->challan_no,));
    }
    public function AjaxGet_trip_id_value($id){
        $count = DB::table("cock_consignment")->where("trip_id",$id)->count();
        if($count>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }
    public function AjaxGet_laod_id($id){

        $data2 = DB::table("cock_consignment")->where("load_id",$id)->first();
        $data1 = DB::table("coke_challan_child2")->where("consignment_id",$data2->id)->first();
         $data =DB::table("coke_challan")->where("id",$data1->challan_id)->first();
  //        print_r($data2);

        return json_encode(array('date'=>date('d/m/Y',strtotime($data->date)),
            'origin'=>$data->from,
            'destination'=>$data->to,
            'vehicle_no'=>$data->truck_no,
            'pan_no'=>$data->pan_no,
            'balance_amount'=>$data->balance,
            'challan_no'=>$data->challan_no,));
    }
    public function AjaxGet_load_id_value($id){
        $count = DB::table("cock_consignment")->where("load_id",$id)->count();
        if($count>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }
    public function AjaxGet_coke_challan_no($id){

        $data = DB::table("coke_challan")->where("challan_no",$id)->first();

        return json_encode(array('date'=>date('d/m/Y',strtotime($data->date)),'origin'=>$data->from,'destination'=>$data->to,'vehicle_no'=>$data->truck_no,'pan_no'=>$data->pan_no,'balance_amount'=>$data->balance));
    }

    public function AjaxGet_challan_no_cokeacknowledge($id){
        $count = DB::table("coke_acknowledgement")->where("challan_number",$id)->count();
        if($count>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }
    public function store_coke_acknowledgement_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();

//        $narayan=Input::all();
//        print_r($narayan);
//        die();
        try {
            DB::beginTransaction();
        $acknowledgementsDate = explode('/', $request->input('date'));
        $acknowledgementsDay = $acknowledgementsDate[0];
        $acknowledgementsMonth = $acknowledgementsDate[1];
        $acknowledgementsYear =  $acknowledgementsDate[2];

        $reportingDate = explode('/', $request->input('reporting_date'));
        $reportingDay = $reportingDate[0];
        $reportingMonth = $reportingDate[1];
        $reportingYear =  $reportingDate[2];

        $unloadingDate = explode('/', $request->input('unloading_date'));
        $unloadingDay = $unloadingDate[0];
        $unloadingMonth = $unloadingDate[1];
        $unloadingYear =  $unloadingDate[2];

        $ackrecDate = explode('/', $request->input('acknowledgement_received_date'));
        $ackrecDay = $ackrecDate[0];
        $ackrecMonth = $ackrecDate[1];
        $ackrecYear =  $ackrecDate[2];

        $paymentDate = explode('/', $request->input('payment_date'));
        $paymentDay = $paymentDate[0];
        $paymentMonth = $paymentDate[1];
        $paymentYear =  $paymentDate[2];


        $input = $request->input('rows');
        $acknowledgements= new Coke_acknowledgement();


        $acknowledgements->trip_id = $request->trip_id;
        $acknowledgements->load_id = $request->load_id;
        $acknowledgements->challan_number = $request->challan_number;
        $chal_no = CokeChallan::where('challan_no',$request->challan_number)->first();
        if(!empty($chal_no)) {
            $acknowledgements->challan_id = $chal_no->id;
        }

        if($request->input('date')!=""){
            $acknowledgements->date = date($acknowledgementsYear . '/' . $acknowledgementsMonth . '/' . $acknowledgementsDay);
        }

        $acknowledgements->origin = $request->origin;
        $acknowledgements->destination = $request->destination;
        $acknowledgements->vehicle_no = $request->vehicle_no;
        $acknowledgements->pan_no = $request->pan_no;

        if($request->input('reporting_date')!=""){
            $acknowledgements->reporting_date = date($reportingYear . '/' . $reportingMonth . '/' . $reportingDay);
        }

        $acknowledgements->reporting_time = $request->reporting_time;

        if($request->input('unloading_date')!=""){
            $acknowledgements->unloading_date = date($unloadingYear . '/' . $unloadingMonth . '/' . $unloadingDay);
        }

        $acknowledgements->unloading_time = $request->unloading_time;
        $acknowledgements->balance_payable_at = $request->balance_payable_at;

        if($request->input('acknowledgement_received_date')!=""){
            $acknowledgements->acknowledgement_received_date = date($ackrecYear . '/' . $ackrecMonth . '/' . $ackrecDay);
        }

        if($request->input('payment_date')!=""){
            $acknowledgements->payment_date = date($paymentYear . '/' . $paymentMonth . '/' . $paymentDay);
        }


        $acknowledgements->balance_amount = $request->balance_amount;
        $acknowledgements->save();


        foreach ($input as $row) {

            $flight = new Coke_acknowledgement_child();
            $flight->acknowledgement_id = $acknowledgements->id;
            $flight->received_qty = $row['received_qty'];
            $flight->received_weight = $row['received_weight'];
            $flight->is_good_condition = $row['is_good_condition'];
            if($row['is_good_condition']=="No"){
                $flight->cause_of_loss = $row['cause_of_loss'];
                $flight->damage_mode = $row['damage_mode'];
                $flight->remarks = $row['remarks'];
                $flight->quantity = $row['quantity'];
                $flight->value = $row['value'];
            }
            $flight->save();

        }
        DB::commit();
        Session::flash('flash_message', 'New Acknowledgement Record  successfully Created!');
        return redirect()->route('new_coke_acknowledgement_entry');

        }
        catch (\Exception $e)
        {
        DB::rollback();
        Session::flash('flash_message_error', 'Network Problem Please try again');
        return redirect()->back();
//echo $e->getMessage();
        }
    }


    public function edit_coke_acknowledgement(Request $request,$id){

        $data = Coke_acknowledgement::find($id);
//        print_r($data);
//        die();
        return View::make('Coke_Acknowledgement.edit_coke_acknowledgement')->with('ack',$data);
    }
    public function update_coke_acknowledgement(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $acknowledgementsDate = explode('/', $request->input('date'));
        $acknowledgementsDay = $acknowledgementsDate[0];
        $acknowledgementsMonth = $acknowledgementsDate[1];
        $acknowledgementsYear =  $acknowledgementsDate[2];

        $reportingDate = explode('/', $request->input('reporting_date'));
        $reportingDay = $reportingDate[0];
        $reportingMonth = $reportingDate[1];
        $reportingYear =  $reportingDate[2];

        $unloadingDate = explode('/', $request->input('unloading_date'));
        $unloadingDay = $unloadingDate[0];
        $unloadingMonth = $unloadingDate[1];
        $unloadingYear =  $unloadingDate[2];

        $ackrecDate = explode('/', $request->input('acknowledgement_received_date'));
        $ackrecDay = $ackrecDate[0];
        $ackrecMonth = $ackrecDate[1];
        $ackrecYear =  $ackrecDate[2];

        $paymentDate = explode('/', $request->input('payment_date'));
        $paymentDay = $paymentDate[0];
        $paymentMonth = $paymentDate[1];
        $paymentYear =  $paymentDate[2];

        $input = $request->input('rows');

        $acknowledgements= Coke_acknowledgement::find($id);

        $acknowledgements->challan_number = $request->challan_number;
        $chal_no = CokeChallan::where('challan_no',$request->challan_number)->first();
        if(!empty($chal_no)) {
            $acknowledgements->challan_id = $chal_no->id;
        }

        if($request->input('date')!=""){
            $acknowledgements->date = date($acknowledgementsYear . '/' . $acknowledgementsMonth . '/' . $acknowledgementsDay);
        }

        $acknowledgements->origin = $request->origin;
        $acknowledgements->destination = $request->destination;
        $acknowledgements->vehicle_no = $request->vehicle_no;
        $acknowledgements->pan_no = $request->pan_no;

        if($request->input('reporting_date')!=""){
            $acknowledgements->reporting_date = date($reportingYear . '/' . $reportingMonth . '/' . $reportingDay);
        }

        $acknowledgements->reporting_time = $request->reporting_time;

        if($request->input('unloading_date')!=""){
            $acknowledgements->unloading_date = date($unloadingYear . '/' . $unloadingMonth . '/' . $unloadingDay);
        }

        $acknowledgements->unloading_time = $request->unloading_time;
        $acknowledgements->balance_payable_at = $request->balance_payable_at;

        if($request->input('acknowledgement_received_date')!=""){
            $acknowledgements->acknowledgement_received_date = date($ackrecYear . '/' . $ackrecMonth . '/' . $ackrecDay);
        }

        if($request->input('payment_date')!=""){
            $acknowledgements->payment_date = date($paymentYear . '/' . $paymentMonth . '/' . $paymentDay);
        }

        $acknowledgements->balance_amount = $request->balance_amount;
        $acknowledgements->save();


        $item= new Coke_acknowledgement_child();
        $item::where('acknowledgement_id',$id)->delete();

        foreach ($input as $row) {

            $flight = new Coke_acknowledgement_child();
            $flight->acknowledgement_id = $acknowledgements->id;
            $flight->received_qty = $row['received_qty'];
            $flight->received_weight = $row['received_weight'];
            $flight->is_good_condition = $row['is_good_condition'];
            $flight->cause_of_loss = $row['cause_of_loss'];
            $flight->damage_mode = $row['damage_mode'];
            $flight->remarks = $row['remarks'];
            $flight->quantity = $row['quantity'];
            $flight->value = $row['value'];
            $flight->save();
        }

        Session::flash('flash_message', 'Acknowledgement Update successfully Updated!');

        return redirect()->route('cokeacknowledgement');

    }
    public function delete_coke_acknowledgement($id)
    {

        try{
            $item= new Coke_acknowledgement();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Acknowledgement successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
