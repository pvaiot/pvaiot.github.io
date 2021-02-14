<?php

namespace App\Http\Controllers;

use App\Branch;
use App\Challan;
use App\Party;
use App\Consignment;
use App\Consignment_child;
use App\Consignment_child2;
use App\Lorry;
use App\Materialcategory;
use App\Trucktype;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use App\Location;
use Session;use \PDF;

class ConsignmentController extends Controller
{
    public function AjaxNewLocation(Request $request)
    {
        //
//        $data= Input::all();
//        echo("hello World");
//        die();


        $newLocation = new Location();
        $newLocation->city = $request->city;
        $newLocation->dist = $request->district;
        $newLocation->state = $request->state;


        $newLocation->save();
        $location = Location::find($newLocation->id);

        return json_encode(array("location_id" => $location->id, "city" => $location->city));

    }

    public function consignment()
    {
         $consignments= Consignment::orderBy('id')->get();
        return View::make('consignment.consignment_panel')->with('area_consignment',$consignments);
    }

    public  function new_consignment_entry(){
        return View::make('consignment.new_consignment_entry');
    }

    public function AjaxGet_party_data($id){

        $data = DB::table("party")->where("party_code",$id)->first();

        return json_encode(array('name'=>$data->name,'address'=>$data->address));
    }
    public function AjaxGet_party_name($id){

        $data = DB::table("party")->where("id",$id)->first();

        return json_encode(array('party_code'=>$data->party_code));
    }
    public function AjaxGet_truck_id($id){

        $data = DB::table("lorry")->where("truck_no",$id)->first();

        return json_encode(array('id'=>$data->id));
    }
public function AjaxGet_consignment_no_data2($id){
        $count2 = DB::table("cock_consignment")->where("consignment_no",$id)->count();
        if($count2>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }

    public function store_consignment_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();

        $this->validate($request,[
            'consignment_no'=>'required|unique:consignment',
        ]);
        try {
            DB::beginTransaction();
        $input = $request->input('rows');
        $input2 = $request->input('rows2');

        $consignments= new Consignment();
        $consignments->consignment_no = $request->consignment_no;
        $consignments->created_user = $request->user;


        $consignments_date = explode('/', $request->input('con_date'));
        $consignments_day = $consignments_date[0];
        $consignments_month = $consignments_date[1];
        $consignments_year = $consignments_date[2];

        $consignments->con_date =  date($consignments_year . '/' . $consignments_month . '/' . $consignments_day);

        $consignments->consignor_id = $request->consignor_id;
        $consignments->consignor_name = $request->consignor_name;
        $consignments->consignor_address = $request->consignor_address;
        $consignments->party_code = $request->party_code;

        $consignments->billed_at_id = $request->billed_at_id;
        $consignments->billed_at = $request->billed_at;

        $consignments->from_id = $request->from_id;
        $consignments->from = $request->from;

        $consignments->to_id = $request->to_id;
        $consignments->to = $request->to;

        $consignments->consignee_name = $request->consignee_name;
        $consignments->consignee_address = $request->consignee_address;

        $consignments->truck_type_id = $request->truck_type_id;
        $consignments->truck_type = $request->truck_type;


       $lorry_no= Lorry::where('truck_no','=',$request->truck_no)->first();
            $consignments->truck_no_id = $lorry_no->id;
            $consignments->truck_no = $request->truck_no;

        $consignments->cn_value = $request->cn_value;
        $consignments->save();

        foreach ($input as $row) {

            $flight = new Consignment_child();
            $flight->consignment_id = $consignments->id;
            $flight->invoice_no = $row['invoice_no'];

            $invoice_date = explode('/', $row['invoice_date']);
            $invoice_day = $invoice_date[0];
            $invoice_month = $invoice_date[1];
            $invoice_year = $invoice_date[2];
            $flight->invoice_date = date($invoice_year . '/' . $invoice_month . '/' . $invoice_day);
            $flight->invoice_value = $row['invoice_value'];
            $flight->way_bill_no = $row['way_bill_no'];
            if($row['validity']!="") {
                $validity_date = explode('/', $row['validity']);
                $validity_day = $validity_date[0];
                $validity_month = $validity_date[1];
                $validity_year = $validity_date[2];
                $flight->validity = date($validity_year . '/' . $validity_month . '/' . $validity_day);
            }
            $flight->save();
        }

        foreach ($input2 as $row2) {
            $flight=new Consignment_child2();
            $flight->consignment_id = $consignments->id;

            $flight->category_id = $row2['category'];
            $material_cat = Materialcategory::find($row2['category']);
            if(!empty($material_cat)) {
                $flight->category = $material_cat->category;
            }
            $flight->package = $row2['package'];
            $flight->description = $row2['description'];
            $flight->net_weight = $row2['net_weight'];
            $flight->gross_weight = $row2['gross_weight'];
            $flight->remark = $row2['remark'];

            $flight->save();
        }
        DB::commit();
        Session::flash('flash_message', 'New Consignment Record  successfully Created!');
        return redirect()->route('new_consignment_entry')->with('status', $consignments->id);

        }
        catch (\Exception $e)
        {
        DB::rollback();
        Session::flash('flash_message_error', 'Network Problem Please try again');
        return redirect()->back();
        //echo $e->getMessage();
        }

    }


    public function edit_consignment(Request $request,$id){

        $data = Consignment::find($id);
//        print_r($data);
//        die();
        return View::make('consignment.edit_consignment')->with('bata',$data);
    }
    public function AjaxGet_consignment_no_data($id){
        $count = DB::table("consignment")->where("consignment_no",$id)->count();
        $count2 = DB::table("cock_consignment")->where("consignment_no",$id)->count();
        if($count>0||$count2>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }
    public  function print_consignment($id){
//        $consignment= Consignment::find($id);
//        $pdf=PDF::loadView('pdf.pdf')->setPaper('a4','landscape');
//        $filename="Hello";
//        return $pdf->stream($filename.'.pdf');
        $consignment= Consignment::find($id);
        $pdf=PDF::loadView('pdf.consignment_report', ['consignment'=>$consignment])->setPaper('a4','landscape');
        $filename=$consignment->consignment_no;
        return $pdf->stream($filename.'.pdf');
    }
    public function update_consignment(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $input = $request->input('rows');
        $input2 = $request->input('rows2');

        $consignments= Consignment::find($id);

        $consignments->consignment_no = $request->consignment_no;
        $consignments->created_user = $request->user;
        $consignments_date = explode('/', $request->input('con_date'));
        $consignments_day = $consignments_date[0];
        $consignments_month = $consignments_date[1];
        $consignments_year = $consignments_date[2];
        $consignments->con_date =  date($consignments_year . '/' . $consignments_month . '/' . $consignments_day);

        $consignments->consignor_id = $request->consignor_id;
        $consignments->consignor_name = $request->consignor_name;
        $consignments->party_code = $request->party_code;


        $consignments->consignee_address = $request->consignee_address;
        $consignments->consignor_address = $request->consignor_address;

        $consignments->billed_at_id = $request->billed_at_id;
        $consignments->billed_at = $request->billed_at;

        $consignments->from_id = $request->from_id;
        $consignments->from = $request->from;

        $consignments->to_id = $request->to_id;
        $consignments->to = $request->to;

        $consignments->consignee_name = $request->consignee_name;

        $consignments->truck_type_id = $request->truck_type_id;
        $consignments->truck_type = $request->truck_type;

        $lorry_no= Lorry::where('truck_no','=',$request->truck_no)->first();
            $consignments->truck_no_id = $lorry_no->id;
            $consignments->truck_no = $request->truck_no;


        $consignments->cn_value = $request->cn_value;
        $consignments->save();


        $item= new Consignment_child();
        $item::where('consignment_id',$id)->delete();

        foreach ($input as $row) {

            $flight = new Consignment_child();
            $flight->consignment_id = $consignments->id;
            $flight->invoice_no = $row['invoice_no'];

            $invoice_date = explode('/', $row['invoice_date']);
            $invoice_day = $invoice_date[0];
            $invoice_month = $invoice_date[1];
            $invoice_year = $invoice_date[2];
            $flight->invoice_date = date($invoice_year . '/' . $invoice_month . '/' . $invoice_day);
            $flight->invoice_value = $row['invoice_value'];
            $flight->way_bill_no = $row['way_bill_no'];
            if($row['validity']!="") {
                $validity_date = explode('/', $row['validity']);
                $validity_day = $validity_date[0];
                $validity_month = $validity_date[1];
                $validity_year = $validity_date[2];
                $flight->validity = date($validity_year . '/' . $validity_month . '/' . $validity_day);
            }
            $flight->save();
        }

        $item2= new Consignment_child2();
        $item2::where('consignment_id',$id)->delete();

        foreach ($input2 as $row2) {
            $flight=new Consignment_child2();
            $flight->consignment_id = $consignments->id;

            $flight->category_id = $row2['category'];
            $material_cat = Materialcategory::find($row2['category']);
            if(!empty($material_cat)) {
                $flight->category = $material_cat->category;
            }

            $flight->package = $row2['package'];
            $flight->description = $row2['description'];
            $flight->net_weight = $row2['net_weight'];
            $flight->gross_weight = $row2['gross_weight'];
            $flight->remark = $row2['remark'];

            $flight->save();
        }

        Session::flash('flash_message', 'New Consignment successfully Updated!');

        return redirect()->route('consignment');

    }

    public function view_consignment($id){

        $data = Consignment::find($id);
        return View::make('consignment.view_consignment')->with('bata',$data);
    }


    public function delete_consignment($id)
    {

        try{
            $item= new Consignment();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Consignment successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }

    //-------------auto complete function--------------

    public function searchResponse(Request $request){
        $query = $request->get('term','');
        $countries=\DB::table('party');
        if($request->type=='consignor_name'){
            $countries->where('name','LIKE','%'.$query.'%');
        }
        if($request->type=='party_code'){
            $countries->where('party_code','LIKE','%'.$query.'%');
        }

        $countries=$countries->get();
        $data=array();
        foreach ($countries as $country) {
            $data[]=array('name'=>$country->name,'party_code'=>$country->party_code, 'id'=>$country->id);
        }
        if(count($data))
            return $data;
        else
            return ['name'=>'','party_code'=>'','id'=>''];
    }

//-------------auto complete function--------------

//-------------auto complete function billedat--------------

    public function searchResponse_billed_at(Request $request){
        $query = $request->get('term','');
        $countries=\DB::table('branch');
        if($request->type=='billed_at'){
            $countries->where('city','LIKE','%'.$query.'%');
        }

        $countries=$countries->get();
        $data=array();
        foreach ($countries as $country) {
            $data[]=array('city'=>$country->city,'id'=>$country->id);
        }
        if(count($data))
            return $data;
        else

            return ['city'=>'','id'=>''];
    }

//-------------auto complete function--------------

//-------------auto complete function From--------------

    public function searchResponse_from(Request $request){
        $query = $request->get('term','');
        $countries=\DB::table('location');
        if($request->type=='from'){
            $countries->where('city','LIKE','%'.$query.'%');
        }

        $countries=$countries->get();
        $data=array();
        foreach ($countries as $country) {
            $data[]=array('city'=>$country->city,'id'=>$country->id);
        }
        if(count($data))
            return $data;
        else
            return ['city'=>'','id'=>''];
    }

//-------------auto complete function--------------

//-------------auto complete function From--------------

    public function searchResponse_to(Request $request){
        $query = $request->get('term','');
        $countries=\DB::table('location');
        if($request->type=='to'){
            $countries->where('city','LIKE','%'.$query.'%');
        }

        $countries=$countries->get();
        $data=array();
        foreach ($countries as $country) {
            $data[]=array('city'=>$country->city,'id'=>$country->id);
        }
        if(count($data))
            return $data;
        else
            return ['city'=>'','id'=>''];
    }

//-------------auto complete function--------------

//-------------auto complete function From--------------

    public function searchResponse_truck_type(Request $request){
        $query = $request->get('term','');
        $countries=\DB::table('trucktype');
        if($request->type=='truck_type'){
            $countries->where('trucktype','LIKE','%'.$query.'%');
        }

        $countries=$countries->get();
        $data=array();
        foreach ($countries as $country) {
            $data[]=array('trucktype'=>$country->trucktype,'id'=>$country->id);
        }
        if(count($data))
            return $data;
        else
            return ['trucktype'=>'','id'=>''];
    }

//-------------auto complete function--------------

//-------------auto complete function truck no--------------

    public function searchResponse_truck_no(Request $request){
        $query = $request->get('term','');
        $countries=\DB::table('lorry');
        if($request->type=='truck_no'){
            $countries->where('truck_no','LIKE','%'.$query.'%');
        }

        $countries=$countries->get();
        $data=array();
        foreach ($countries as $country) {
            $data[]=array('truck_no'=>$country->truck_no,'id'=>$country->id);
        }
        if(count($data))
            return $data;
        else
            return ['truck_no'=>'','id'=>''];
    }

//-------------auto complete function truck no--------------


}
