<?php

namespace App\Http\Controllers;

use App\Consignment;
use App\Lorry;
use App\Party;
use App\Branch;
use App\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Session;
use App\Coke_acknowledgement;
use App\CokeChallan;use App\CokeChallan_child2;use App\CokeFreightBill_child;

class BranchController extends Controller
{
    
public  function wowtest(){
        $consignment_data=Consignment::where('truck_no_id','=',"")->get();
        foreach($consignment_data as $consignment_data){
            $lorry_id=Lorry::where('truck_no','=',$consignment_data->truck_no)->first();
            $consignment_data->truck_no_id=$lorry_id->id;
            print_r($consignment_data->truck_no);
            echo "<br>";
            $consignment_data->save();
        }

    }
// public  function wowtest(){
// //        $datas = \App\Coke_acknowledgement::all();
// //        foreach($datas as $data){

//         $challan_child2 = \App\CokeChallan_child2::all();
//         foreach($challan_child2 as $challan_child2){
//             $challan_data_count= \App\CokeChallan::where('id','=',$challan_child2->challan_id)->count();
//             if($challan_data_count>0) {
//                 $challan_data= \App\CokeChallan::find($challan_child2->challan_id);
//                 echo "challan_child2 ID => ";
//                 print_r($challan_child2->challan_id);
//                 echo "challan_data NO => ";
//                 print_r($challan_data->challan_no);
//                 echo "<br>";
//             }
//             else{
//                 echo "challan_child2 ID => ";
//                 print_r($challan_child2->challan_id);
//                 echo "challan_data NO => ";
//                 print_r(" No data Found");
//                 echo "<br>";
//             }

//         }
// }


    public function branch()
    {
        $branchs= Branch::orderBy('id')->get();
        return View::make('branch.branch_panel')->with('area_branch',$branchs);
    }

    public  function new_branch_entry(){
        return View::make('branch.new_branch_entry');
    }

    public function store_branch_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'city'=>'required|unique:branch',
        ]);

        $branchs= new Branch();
        $branchs->city = $request->city;
        $branchs->dist = $request->dist;
        $branchs->state = $request->state;
        $branchs->branch_code = $request->branch_code;
        $branchs->save();


        Session::flash('flash_message', 'New Branch Record Successfully Created!');

        return redirect()->route('new_branch_entry');
    }


    public function edit_branch(Request $request,$id){

        $data = Branch::find($id);
//        print_r($data);
//        die();
        return View::make('branch.edit_branch')->with('bran',$data);
    }


    public function update_branch(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $branchs= Branch::find($id);
        $branchs->city = $request->city;
        $branchs->dist = $request->dist;
        $branchs->state = $request->state;
        $branchs->branch_code = $request->branch_code;
        $branchs->save();


        Session::flash('flash_message', 'New Branch Successfully Updated!');

        return redirect()->route('branch');

    }

    public function view_branch($id){

        $data = Branch::find($id);
        return View::make('branch.view_branch')->with('bran',$data);
    }

    public function delete_branch($id)
    {

        try{
            $item= new Branch();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Branch Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
