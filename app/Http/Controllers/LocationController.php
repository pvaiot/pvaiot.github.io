<?php

namespace App\Http\Controllers;

use App\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class LocationController extends Controller
{
    public function location()
    {
        $locations= Location::orderBy('id')->get();
        return View::make('location.location_panel')->with('area_location',$locations);
    }

    public  function new_location_entry(){
        return View::make('location.new_location_entry');
    }

    public function store_location_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'city'=>'required|unique:location',
        ]);

        $locations= new Location();
        $locations->city = $request->city;
        $locations->dist = $request->dist;
        $locations->state = $request->state;
        $locations->save();


        Session::flash('flash_message', 'New Location Record Successfully Created!');

        return redirect()->route('new_location_entry');
    }


    public function edit_location(Request $request,$id){

        $data = Location::find($id);
//        print_r($data);
//        die();
        return View::make('location.edit_location')->with('loco',$data);
    }
    public function AjaxGet_new_location_data($id){

        $count = DB::table("location")->where("city","=",$id)->count();
        if($count>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }

    public function update_location(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $locations= Location::find($id);
        $locations->city = $request->city;
        $locations->dist = $request->dist;
        $locations->state = $request->state;
        $locations->save();


        Session::flash('flash_message', 'New Location Successfully Updated!');

        return redirect()->route('location');

    }

    public function view_location($id){

        $data = Location::find($id);
        return View::make('location.view_location')->with('loco',$data);
    }

    public function delete_location($id)
    {

        try{
            $item= new Location();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Location Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }

}
