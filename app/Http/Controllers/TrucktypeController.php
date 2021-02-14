<?php

namespace App\Http\Controllers;

use App\Trucktype;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class TrucktypeController extends Controller
{
    public function trucktype()
    {
        $trucktypes= Trucktype::orderBy('id')->get();
        return View::make('trucktype.trucktype_panel')->with('area_trucktype',$trucktypes);
    }

    public  function new_trucktype_entry(){
        return View::make('trucktype.new_trucktype_entry');
    }

    public function store_trucktype_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'trucktype'=>'required|unique:trucktype',
        ]);

        $trucktypes= new Trucktype();
        $trucktypes->trucktype = $request->trucktype;
        $trucktypes->save();


        Session::flash('flash_message', 'New Truck Type Record Successfully Created!');

        return redirect()->route('new_trucktype_entry');
    }


    public function edit_trucktype(Request $request,$id){

        $data = Trucktype::find($id);
//        print_r($data);
//        die();
        return View::make('trucktype.edit_trucktype')->with('truck',$data);
    }


    public function update_trucktype(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $trucktypes= Trucktype::find($id);
        $trucktypes->trucktype = $request->trucktype;
        $trucktypes->save();

        Session::flash('flash_message', 'New Truck Type Successfully Updated!');

        return redirect()->route('trucktype');

    }

    public function view_trucktype($id){

        $data = Trucktype::find($id);
        return View::make('trucktype.view_trucktype')->with('truck',$data);
    }

    public function delete_trucktype($id)
    {

        try{
            $item= new Trucktype();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Truck Type Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
