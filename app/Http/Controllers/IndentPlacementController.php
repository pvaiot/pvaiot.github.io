<?php

namespace App\Http\Controllers;

use App\Broker;
use App\Indent;
use App\IndentChildConnection;
use App\IndentPlacement;
use App\IndentPlacement_child;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Session;

class IndentPlacementController extends Controller
{



    public function indentplacement()
    {
        $indentplacements= IndentPlacement::orderBy('id')->get();
        return View::make('Indentplacement.indentplacement_panel')->with('area_indentplacement',$indentplacements);
    }
    public function indentplacement_lorry()
    {
        $indentplacements_lorry= IndentPlacement_child::orderBy('id')->get();
        return View::make('Indentplacement.indentplacement_lorry_panel')->with('area_indentplacement',$indentplacements_lorry);
    }

    public  function new_indentplacement_entry(){
        return View::make('Indentplacement.new_indentplacement_entry');
    }
    public function placement_indent($id){
        $count = IndentPlacement::where('indent_id',$id)->count();

        if($count<=0){
            $data = Indent::find($id);
            $data_placement = IndentPlacement::where('indent_id',$id)->first();
//        print_r($data);
//        die();
            return View::make('Indentplacement.new_indentplacement_entry')->with('bata',$data)->with('bata1',$data_placement)->with('count',$count);
        }else{
        $data = Indent::find($id);
            $data_placement = IndentPlacement::where('indent_id',$id)->first();
            return View::make('Indentplacement.edit_indentplacement_2')->with('bata',$data)->with('bata1',$data_placement)->with('count',$count);
        }
    }
    public function lorry_entry_indent($id){

        $data = IndentPlacement_child::where('id',$id)->first();
        return View::make('Indentplacement.lorry_entry_indent')->with('bata',$data);
    }

    public function AjaxGet_indent_no($id){

        $data = DB::table("indent")->where("id",$id)->first();
        $data_party = DB::table("party")->where("id",$data->party_code)->first();
        return json_encode(array('id'=>$data->id,'origin'=>$data->origin,'placement_ideal_date'=>date('d/m/Y', strtotime($data->placement_ideal_date)),'party_code'=>$data_party->party_code,'branch_code'=>$data->branch_code,'consignor_name'=>$data->consignor_name));
    }
    public function AjaxGet_indent_no_value($id){

        $data = DB::table("indent")->where("id",$id)->first();
        $child = DB::table("indent_child")->where("indent_id",$id)->get();

        return json_encode($child);
    }
    public function store_indentplacement_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();


        $indentplacements= new IndentPlacement();

        $indent = Indent::where('indent_no',$request->indent_no)->first();
        $indentplacements->indent_id = $indent->id;
        $indentplacements->indent_no = $request->indent_no;

        $indentplacements_date = explode('/', $request->input('indent_placement_date'));
        $indentplacements_day = $indentplacements_date[0];
        $indentplacements_month = $indentplacements_date[1];
        $indentplacements_year = $indentplacements_date[2];
        $indentplacements->indent_placement_date =  date($indentplacements_year . '/' . $indentplacements_month . '/' . $indentplacements_day);
        $indentplacements->origin = $request->origin;
        $indentplacements->branch_code = $request->branch_code;
        $indentplacements->party_code = $request->party_code;
        $indentplacements->consignor_name = $request->consignor_name;
        $indentplacements->save();

        $input = $request->input('rows2');
//        print_r($input);
//        die();
        foreach ($input as $row) {

            $flight = new IndentPlacement_child();
            $flight->indentplacement_id = $indentplacements->id;
            $flight->destination = $row['destination'];
            $flight->consignee = $row['consignee'];
            $flight->tonnage = $row['tonnage'];
            $flight->truck_type = $row['truck_type'];
            $flight->truck_no = $row['truck_no'];
            if($row['indent_placement_date_child']!="") {
                $indentplacements_date1 = explode('/', $row['indent_placement_date_child']);
                $indentplacements_day1 = $indentplacements_date1[0];
                $indentplacements_month1 = $indentplacements_date1[1];
                $indentplacements_year1 = $indentplacements_date1[2];
                $flight->indent_placement_date_child = date($indentplacements_year1 . '/' . $indentplacements_month1 . '/' . $indentplacements_day1);
            }
            $flight->rate = $row['rate'];
            $flight->mobile_no = $row['mobile'];
            $flight->broker = $row['broker'];
            $flight->indent_child_id = $row['indent_child_id'];
            $flight->remarks = $row['remark'];
            $flight->save();
        }

//            $myindent = Indent::find($request->indent_no);
//            $myindent->status=1;
//            $myindent->save();
//
        Session::flash('flash_message', 'New Indentplacement Record  successfully Created!');

        return redirect()->route('indent');
    }


    public function edit_indentplacement(Request $request,$id){

        $data = IndentPlacement::find($id);
//        print_r($data);
//        die();
        return View::make('Indentplacement.edit_indentplacement')->with('bata',$data);
    }


    public function update_indentplacement(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();




        $indentplacements= IndentPlacement::find($id);

        $indent = Indent::where('indent_no',$request->indent_no)->first();
        $indentplacements->indent_id = $indent->id;
        $indentplacements->indent_no = $request->indent_no;

        $indentplacements_date = explode('/', $request->input('indent_placement_date'));
        $indentplacements_day = $indentplacements_date[0];
        $indentplacements_month = $indentplacements_date[1];
        $indentplacements_year = $indentplacements_date[2];
        $indentplacements->indent_placement_date =  date($indentplacements_year . '/' . $indentplacements_month . '/' . $indentplacements_day);
        $indentplacements->origin = $request->origin;
        $indentplacements->branch_code = $request->branch_code;
        $indentplacements->party_code = $request->party_code;
        $indentplacements->consignor_name = $request->consignor_name;
        $indentplacements->save();



        $item2= new IndentPlacement_child();
        $item2::where('indentplacement_id',$id)->delete();

        $input = $request->input('rows2');
        foreach ($input as $row) {

            $flight = new IndentPlacement_child();
            $flight->indentplacement_id = $indentplacements->id;
            $flight->destination = $row['destination'];
            $flight->consignee = $row['consignee'];
            $flight->tonnage = $row['tonnage'];
            $flight->truck_type = $row['truck_type'];
            $flight->truck_no = $row['truck_no'];
            $flight->rate = $row['rate'];
            $flight->mobile_no = $row['mobile'];
            $flight->broker = $row['broker'];
            $flight->indent_child_id = $row['indent_child_id'];

            $flight->save();
        }
        Session::flash('flash_message', 'New Indentplacement successfully Updated!');

        return redirect()->route('indent');

    }

    public function edit_indentplacement_2(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();




        $indentplacements= IndentPlacement::find($id);
        $indent = Indent::where('indent_no','=',$request->indent_no)->first();
        $indentplacements->indent_id = $indent->id;
        $indentplacements->indent_no = $request->indent_no;


        $indentplacements_date = explode('/', $request->input('indent_placement_date'));
        $indentplacements_day = $indentplacements_date[0];
        $indentplacements_month = $indentplacements_date[1];
        $indentplacements_year = $indentplacements_date[2];
        $indentplacements->indent_placement_date =  date($indentplacements_year . '/' . $indentplacements_month . '/' . $indentplacements_day);
        $indentplacements->origin = $request->origin;
        $indentplacements->branch_code = $request->branch_code;
        $indentplacements->party_code = $request->party_code;
        $indentplacements->consignor_name = $request->consignor_name;
        $indentplacements->save();



        $item2= new IndentPlacement_child();
        $item2::where('indentplacement_id',$id)->delete();

        $input = $request->input('rows2');
        foreach ($input as $row) {

            $flight = new IndentPlacement_child();
            $flight->indentplacement_id = $indentplacements->id;
            $flight->destination = $row['destination'];
            $flight->consignee = $row['consignee'];
            $flight->tonnage = $row['tonnage'];
            $flight->truck_type = $row['truck_type'];
            $flight->truck_no = $row['truck_no'];
            if($row['indent_placement_date_child']!="") {
                $indentplacements_date1 = explode('/', $row['indent_placement_date_child']);
                $indentplacements_day1 = $indentplacements_date1[0];
                $indentplacements_month1 = $indentplacements_date1[1];
                $indentplacements_year1 = $indentplacements_date1[2];
                $flight->indent_placement_date_child = date($indentplacements_year1 . '/' . $indentplacements_month1 . '/' . $indentplacements_day1);
            }
            $flight->rate = $row['rate'];
            $flight->mobile_no = $row['mobile'];
            $flight->broker = $row['broker'];
            $flight->indent_child_id = $row['indent_child_id'];
            $flight->remarks = $row['remark'];
            $flight->save();
        }
        Session::flash('flash_message', 'New Indentplacement successfully Updated!');

        return redirect()->route('indent');

    }

    public function view_indentplacement($id){
        $data = IndentPlacement::find($id);
        return View::make('Indentplacement.view_indentplacement')->with('bata',$data);
    }


    public function delete_indentplacement($id)
    {
        try{
            $item= new IndentPlacement();
            $item::find($id)->delete();
            \Session::flash('flash_message', 'Selected Indentplacement successfully Deleted!');
        }

        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
