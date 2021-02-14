<?php

namespace App\Http\Controllers;

use App\Branch;
use App\Challan;
use App\CockConsignment;
use App\CockConsignment_child;
use App\CockConsignment_child2;
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
use Maatwebsite\Excel\Facades\Excel;

class CockConsignmentController extends Controller
{
    public  function new_coke_consignment_entry(){
    return View::make('Cock_consignment.new_cockconsignment_entry');
    }
    public function cokeconsignment()
    {
        $consignments= CockConsignment::orderBy('con_date', 'DESC')->get();
        return View::make('Cock_consignment.coke_consignment_panel')->with('area_consignment',$consignments);
    }

    public function store_coke_consignment_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();

        $this->validate($request,[
            'consignment_no'=>'required|unique:consignment',
        ]);
        try{
            DB::beginTransaction();
        $input = $request->input('rows');
        $input2 = $request->input('rows2');

        $consignments= new CockConsignment();
        $consignments->consignment_no = $request->consignment_no;
        $consignments->trip_id = $request->trip_id;
        $consignments->load_id = $request->load_id;
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

            $flight = new CockConsignment_child();
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
            $flight=new CockConsignment_child2();
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
            return redirect()->route('new_coke_consignment_entry')->with('status', $consignments->id);



        } catch(\Exception $e){
            DB::rollback();
            Session::flash('flash_message_error', 'Network Problem Please try again');
            return redirect()->back();
//echo $e->getMessage();
        }

    }

    public function edit_coke_consignment(Request $request,$id){

        $data = CockConsignment::find($id);
//        print_r($data);
//        die();
        return View::make('Cock_consignment.edit_cokeconsignment')->with('bata',$data);
    }
    public function update_cokeconsignment(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();
        $input = $request->input('rows');
        $input2 = $request->input('rows2');

        $consignments= CockConsignment::find($id);

        $consignments->consignment_no = $request->consignment_no;
        $consignments->trip_id = $request->trip_id;
        $consignments->load_id = $request->load_id;
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


        $consignments->truck_no = $request->truck_no;
        $lorry_no= Lorry::where('truck_no','=',$request->truck_no)->first();
        $consignments->truck_no_id = $lorry_no->id;

        $consignments->cn_value = $request->cn_value;
        $consignments->save();


        $item= new CockConsignment_child();
        $item::where('consignment_id',$id)->delete();
            $input = $request->input('rows');
        foreach ($input as $row) {

            $flight = new CockConsignment_child();
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

        $item2= new CockConsignment_child2();
        $item2::where('consignment_id',$id)->delete();

        foreach ($input2 as $row2) {
            $flight=new CockConsignment_child2();
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
            Session::flash('flash_message', 'Consignment successfully Updated!');
            return redirect()->route('cokeconsignment');


    }

    public  function print_cokeconsignment($id){
//        $consignment= Consignment::find($id);
//        $pdf=PDF::loadView('pdf.pdf')->setPaper('a4','landscape');
//        $filename="Hello";
//        return $pdf->stream($filename.'.pdf');
        $consignment= CockConsignment::find($id);
        // $pdf=PDF::loadView('pdf.coke_consignment_report', ['consignment'=>$consignment])->setPaper('a4','landscape');
        // $filename=$consignment->consignment_no;
        // return $pdf->stream($filename.'.pdf');
        // return View::make('pdf.coke_consignment_report')->with('consignment',$consignment);
          return View::make('pdf.coke_consignment_report')->with('consignment',$consignment);
    }
    public function delete_cokeconsignment($id)
    {

        try{
            $item= new CockConsignment();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Consignment successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
    public function alter_my_consignment_data(){
        $datas=CockConsignment::where('truck_no_id','')->get();
        foreach($datas as $data){
            $lorry_no= Lorry::where('truck_no','=',$data->truck_no)->first();
            $consignments= CockConsignment::find($data->id);
            $consignments->truck_no_id=$lorry_no->id;
            $consignments->save();
        }
    }
    public function export_all_coke_consignment_data()
    {
        $consignment_data= CockConsignment::all();
//        echo $doctor_bills;
        $newarray[]=array('SL. No.','Consignment No','Consignment Date','Trip ID','Load ID','From','To','Consignor Name','Consignee Name','Consignment Value');
        $sl_no=1;
        foreach($consignment_data as $consignment_data){
            $num_amount=(float)$consignment_data->cn_value;
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment No'=>$consignment_data->consignment_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Trip ID'=>$consignment_data->trip_id,
                'Load ID'=>$consignment_data->load_id,
                'From'=>$consignment_data->from,
                'To'=>$consignment_data->to,
                'Consignor Name'=>$consignment_data->consignor_name,
                'Consignee Name'=>$consignment_data->consignee_name,
                'Consignment Value'=>$num_amount
            );
            $sl_no+=1;
        }
        Excel::Create('Coke Consignment Data',function($exel) use ($newarray){
            $exel->setTitle('Coke Consignment Data');
            $exel->sheet('Coke Consignment Data',function($sheet) use ($newarray){
                $sheet->fromArray($newarray,null,null,false,false);
            });
        })->export('xlsx');
    }

}
