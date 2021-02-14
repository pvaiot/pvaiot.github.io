<?php

namespace App\Http\Controllers;

use App\Insurance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class InsuranceController extends Controller
{
    public function insurance()
    {
        $insurances= Insurance::orderBy('id')->get();
        return View::make('insurance.insurance_panel')->with('area_insurance',$insurances);
    }

    public  function new_insurance_entry(){
        return View::make('insurance.new_insurance_entry');
    }

    public function store_insurance_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'insurance_name'=>'required|unique:insurance',
        ]);

        $insurances= new Insurance();
        $insurances->insurance_name = $request->insurance_name;
        $insurances->save();


        Session::flash('flash_message', 'New Insurance Record Successfully Created!');

        return redirect()->route('new_insurance_entry');
    }


    public function edit_insurance(Request $request,$id){

        $data = Insurance::find($id);
//        print_r($data);
//        die();
        return View::make('insurance.edit_insurance')->with('insu',$data);
    }


    public function update_insurance(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $insurances= Insurance::find($id);
        $insurances->insurance_name = $request->insurance_name;
        $insurances->save();

        Session::flash('flash_message', 'New Insurance Successfully Updated!');

        return redirect()->route('insurance');

    }

    public function view_Insurance($id){

        $data = Insurance::find($id);
        return View::make('insurance.view_insurance')->with('insu',$data);
    }

    public function delete_insurance($id)
    {

        try{
            $item= new Insurance();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Insurance Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
