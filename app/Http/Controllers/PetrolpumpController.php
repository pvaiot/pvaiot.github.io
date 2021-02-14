<?php

namespace App\Http\Controllers;

use App\Petrol_Pump;
use App\Petrol_Pump_Record;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class PetrolpumpController extends Controller
{
    public function petrol_pump()
    {
        $petrol_pump= Petrol_Pump::orderBy('id')->get();
        return View::make('petrol.petrol_pump_panel')->with('area_location',$petrol_pump);
    }
    public  function new_petrol_pump_entry(){
        return View::make('petrol.new_petrol_pump_entry');
    }
    public  function view_petrol_pump_report($id){
        $data =Petrol_Pump_Record::where('petrol_pump_id',$id)->get();
        return View::make('petrol.petrol_pump_record')->with('area_location',$data)->with('id',$id);

    }
    public function petrol_pump_recordbydate(Request $request){
        $from_date = explode('/', $request->input('from_date'));
        $from_day = $from_date[0];
        $from_month = $from_date[1];
        $from_year = $from_date[2];
        $from_date_value =  date($from_year . '/' . $from_month . '/' . $from_day);

        $to_date = explode('/', $request->input('to_date'));
        $to_day = $to_date[0];
        $to_month = $to_date[1];
        $to_year = $to_date[2];
        $to_date_value =  date($to_year . '/' . $to_month . '/' . $to_day);

        $final_record= \App\Petrol_Pump_Record::whereBetween('challan_date', array($from_date_value, $to_date_value))->where('petrol_pump_id',$request->id)->get();
//print_r($final_record);
        return View::make('petrol.petrol_pump_date_record')->with('final_record',$final_record)->with('id',$request->id)->with('from_date',date($from_day . '/' . $from_month . '/' . $from_year))->with('to_date',date($to_day . '/' . $to_month . '/' . $to_year));
    }

    public function store_petrol_pump_entry(Request $request)
    {

        $petrol_pump= new Petrol_Pump();
        $petrol_pump->name = $request->petrol_pump_name;
        $petrol_pump->address = $request->address;
        $petrol_pump->city = $request->city;
        $petrol_pump->state = $request->state;
        $petrol_pump->contact_no = $request->contact_no;
        $petrol_pump->contact_person = $request->contact_person;
        $petrol_pump->save();

        Session::flash('flash_message', 'New Perol Pump Record Successfully Created!');

        return redirect()->route('new_petrol_pump_entry');
    }
    public function view_petrol_pump($id){

        $data =Petrol_Pump::find($id);
        return View::make('petrol.view_petrol_pump')->with('loco',$data);
    }
    public function edit_petrol_pump(Request $request,$id){

        $data = Petrol_Pump::find($id);
//        print_r($data);
//        die();
        return View::make('petrol.edit_petrol_pump')->with('loco',$data);
    }
    public function update_petrol_pump(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $petrol_pump= Petrol_Pump::find($id);
        $petrol_pump->name = $request->petrol_pump_name;
        $petrol_pump->address = $request->address;
        $petrol_pump->city = $request->city;
        $petrol_pump->state = $request->state;
        $petrol_pump->contact_no = $request->contact_no;
        $petrol_pump->contact_person = $request->contact_person;
        $petrol_pump->save();


        Session::flash('flash_message', 'New Petrol Pump Successfully Updated!');

        return redirect()->route('petrol_pump');

    }
    public function delete_petrol_pump($id)
    {

        try{
            $item= new Petrol_Pump();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Petrol Pump Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }

}
