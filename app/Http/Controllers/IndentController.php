<?php

namespace App\Http\Controllers;

use App\Branch;
use App\Indent;
use App\Challan;
use App\Consignment;
use App\Indent_Child;
use App\IndentChildConnection;
use App\Location;
use App\Materialcategory;
use App\Party;
use App\Trucktype;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Session;

class IndentController extends Controller
{
    public function indent()
    {
        $indents= Indent::orderBy('id')->get();
        return View::make('Indent.indent_panel')->with('area_indent',$indents);
    }

    public function AjaxGet_party_data_indent($id){

        $data = DB::table("party")->find($id);

        return json_encode(array('name'=>$data->name));
    }
    public  function new_indent_entry(){
        return View::make('Indent.new_indent_entry');
    }
    public  function Ajax_delete_data($id){

            $item = new Indent_Child();
            $item::find($id)->delete();

    }

    public function AjaxGet_branch_code($id){

        $data = DB::table("branch")->where("id",$id)->first();

        return json_encode(array('destination'=>$data->city));
    }

    public function AjaxGet_consignor_name($id){

        $data = DB::table("party")->where("id",$id)->first();

        return json_encode(array('party_code'=>$data->party_code));
    }

    public function store_indent_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();


        $indents= new Indent();
        $indents->indent_no = $request->indent_no;


        $indents_date = explode('/', $request->input('indent_date'));
        $indents_day = $indents_date[0];
        $indents_month = $indents_date[1];
        $indents_year = $indents_date[2];
        $indents->indent_date =  date($indents_year . '/' . $indents_month . '/' . $indents_day);

        $branch_code = Branch::find($request->branch_code);
        $indents->branch_id = $request->branch_code;
        $indents->branch_code = $branch_code->branch_code;

        $branch_code = Location::find($request->origin);
        $indents->origin_id = $request->origin;
        $indents->origin = $branch_code->city;


        $party_name = Party::find($request->party_code);
        $indents->party_code = $request->party_code;
        $indents->consignor_id = $party_name->id;
        $indents->consignor_name =  $party_name->name;

        $placement_date = explode('/', $request->input('placement_ideal_date'));
        $placement_day = $placement_date[0];
        $placement_month = $placement_date[1];
        $placement_year = $placement_date[2];
        $indents->placement_ideal_date =  date($placement_year . '/' . $placement_month . '/' . $placement_day);





        $party_name = Materialcategory::find($request->material);
        $indents->material_id = $request->material;
        $indents->material = $party_name->category;

//
        $indents->save();
        $input = $request->input('rows');
        foreach ($input as $row) {
            $flight = new Indent_Child();
            $flight->indent_id = $indents->id;
            $flight->destination = $row['destination'];
            $flight->consignee = $row['consignee'];

            $truck_name = Trucktype::find($row['truck_type']);
            $flight->truck_type_id = $row['truck_type'];
            $flight->truck_type = $truck_name->trucktype;

            $flight->tonnage = $row['tonnage'];


            $flight->save();
        }


        Session::flash('flash_message', 'New Indent Record  successfully Created!');

        return redirect()->route('new_indent_entry');
    }


    public function edit_indent(Request $request,$id){

        $data = Indent::find($id);
//        print_r($data);
//        die();
        return View::make('Indent.edit_indent')->with('bata',$data);
    }


    public function update_indent(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();


        $indents= Indent::find($id);
        $indents->indent_no = $request->indent_no;


        $indents_date = explode('/', $request->input('indent_date'));
        $indents_day = $indents_date[0];
        $indents_month = $indents_date[1];
        $indents_year = $indents_date[2];
        $indents->indent_date =  date($indents_year . '/' . $indents_month . '/' . $indents_day);

        $branch_code = Branch::find($request->branch_code);
        $indents->branch_id = $request->branch_code;
        $indents->branch_code = $branch_code->branch_code;

        $branch_code = Location::find($request->origin);
        $indents->origin_id = $request->origin;
        $indents->origin = $branch_code->city;


        $party_name = Party::find($request->party_code);
        $indents->party_code = $request->party_code;
        $indents->consignor_id = $party_name->id;
        $indents->consignor_name =  $party_name->name;

        $placement_date = explode('/', $request->input('placement_ideal_date'));
        $placement_day = $placement_date[0];
        $placement_month = $placement_date[1];
        $placement_year = $placement_date[2];
        $indents->placement_ideal_date =  date($placement_year . '/' . $placement_month . '/' . $placement_day);



        $party_name = Materialcategory::find($request->material);
        $indents->material_id = $request->material;
        $indents->material = $party_name->category;
        $indents->save();



        $input = $request->input('rows');
        foreach ($input as $row) {
            if ($row['ids']==0) {
                $flight = new Indent_Child();
                $flight->indent_id = $indents->id;
                $flight->destination = $row['destination'];
                $flight->consignee = $row['consignee'];
                $truck_name = Trucktype::find($row['truck_type']);
                $flight->truck_type_id = $row['truck_type'];
                $flight->truck_type = $truck_name->trucktype;
                $flight->tonnage = $row['tonnage'];
                $flight->save();
            }else{
                $flight = Indent_Child::where('id', '=', $row['ids'])->first();
                $flight->indent_id = $indents->id;
                $flight->destination = $row['destination'];
                $flight->consignee = $row['consignee'];
                $truck_name = Trucktype::find($row['truck_type']);
                $flight->truck_type_id = $row['truck_type'];
                $flight->truck_type = $truck_name->trucktype;
                $flight->tonnage = $row['tonnage'];
                $flight->save();

                $flight->save();
            }
        }
        Session::flash('flash_message', 'New Indent successfully Updated!');

        return redirect()->route('indent');

    }



    public function view_indent($id){

        $data = Indent::find($id);
        return View::make('Indent.view_indent')->with('bata',$data);
    }


    public function delete_indent($id)
    {

        try{
            $item= new Indent();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Indent successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
