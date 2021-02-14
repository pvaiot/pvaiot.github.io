<?php

namespace App\Http\Controllers;

use App\BankName;
use App\Lorry;
use App\LorryImage;
use App\TruckOwner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;
use File;

class LorryController extends Controller
{
    public function lorry()
    {
        $lorrys= Lorry::orderBy('id')->get();
        return View::make('lorry.lorry_panel')->with('area_lorry',$lorrys);
    }

    public  function new_lorry_entry(){
        return View::make('lorry.new_lorry_entry');
    }

    public function AjaxGet_truck_no_value($id){
        $count = DB::table("lorry")->where("truck_no",$id)->count();
        if($count>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }

    public function store_lorry_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'truck_no'=>'required|unique:lorry',
        ]);

        $lorrys= new Lorry();
        $lorrys->truck_no = $request->truck_no;
        $lorrys->engin_no = $request->engin_no;
        $lorrys->chassis_no = $request->chassis_no;
        $lorrys->make = $request->make;
        $lorrys->truck_owner_name = $request->truck_owner_name;
        $lorrys->truck_owner_address = $request->truck_owner_address;
        $lorrys->truck_owner_mob_no = $request->truck_owner_mob_no;
        $lorrys->truck_owner_contact_no = $request->truck_owner_contact_no;
        $lorrys->truck_owner_land_line_no = $request->truck_owner_land_line_no;
        $lorrys->truck_owner_pan_no = $request->truck_owner_pan_no;
        $lorrys->truck_owner_gst_no = $request->truck_owner_gst_no;
//        $lorrys->truck_owner_bank_name = $request->truck_owner_bank_name;

        $lorrys->truck_owner_bank_id = $request->truck_owner_bank_name;
        $bankname =BankName::find($request->truck_owner_bank_name);
        if(!empty($bankname)) {
            $lorrys->truck_owner_bank_name = $bankname->bank_name;
        }

        $lorrys->truck_owner_bank_ac_no = $request->truck_owner_bank_ac_no;
        $lorrys->truck_owner_ifsc_code = $request->truck_owner_ifsc_code;
        $lorrys->save();

        $lorry_image = new LorryImage();
        $lorry_image->lorry_id=$lorrys->id;
        $lorry_image->rc_image="rc";
        $lorry_image->permit_image="permit";
        $lorry_image->insurance_image="insurance";
        $lorry_image->fitness_image="fitness";
        $lorry_image->pan_image="pan";
        $lorry_image->save();

        $flight = LorryImage::where('lorry_id', $lorrys->id)->first();
        $milliseconds = round(microtime(true) * 10);
        if($request->hasFile('file')){
                $file = $request->file('file');
                $filename = $request->truck_no . $milliseconds . "_rc." . $file->getClientOriginalExtension();
                $flight->rc_image = $filename;
            $file->move('uploads/lorry', $filename);
            }
        if($request->hasFile('file1')){
                $file1 = $request->file('file1');
                $filename1 = $request->truck_no . $milliseconds . "_permit." . $file1->getClientOriginalExtension();
            $flight->permit_image = $filename1;
            $file1->move('uploads/lorry', $filename1);
            }
        if($request->hasFile('file2')){
            $file2 = $request->file('file2');
            $filename2 = $request->truck_no . $milliseconds . "_insurance." . $file2->getClientOriginalExtension();
            $flight->insurance_image = $filename2;
            $file2->move('uploads/lorry', $filename2);
        }
        if($request->hasFile('file3')){
            $file3 = $request->file('file3');
            $filename3 = $request->truck_no . $milliseconds . "_fitness." . $file3->getClientOriginalExtension();
            $flight->fitness_image = $filename3;
            $file3->move('uploads/lorry', $filename3);
        }
        if($request->hasFile('file4')){
            $file4 = $request->file('file4');
            $filename4 = $request->truck_no . $milliseconds . "_pan." . $file4->getClientOriginalExtension();
            $flight->pan_image = $filename4;
            $file4->move('uploads/lorry', $filename4);
        }
        $flight->save();

//        if ($request->hasFile('file') && $request->hasFile('file1') && $request->hasFile('file2') && $request->hasFile('file3') && $request->hasFile('file4')) {
//            $milliseconds = round(microtime(true) * 10);
//            if($request->hasFile('file')){
//                $file = $request->file('file');
//                $filename = $request->truck_no . $milliseconds . "_rc." . $file->getClientOriginalExtension();
//                $file->move('uploads/lorry', $filename);
//            }else{
//                $filename = "rcbook";
//            }
//            if($request->hasFile('file1')){
//                $file1 = $request->file('file');
//                $filename1 = $request->truck_no . $milliseconds . "_permit." . $file1->getClientOriginalExtension();
//                $file1->move('uploads/lorry', $filename1);
//            }else{
//                $filename1 = "permit";
//            }
//            if($request->hasFile('file2')){
//                $file2 = $request->file('file');
//                $filename2 = $request->truck_no . $milliseconds . "_insurance." . $file2->getClientOriginalExtension();
//                $file2->move('uploads/lorry', $filename2);
//            }else{
//                $filename2 = "insurance";
//            }
//            if($request->hasFile('file3')){
//                $file3 = $request->file('file3');
//                $filename3 = $request->truck_no . $milliseconds . "_fitness." . $file3->getClientOriginalExtension();
//                $file3->move('uploads/lorry', $filename3);
//            }else{
//                $filename3 = "fitness";
//            }
//            if($request->hasFile('file4')){
//                $file4 = $request->file('file4');
//                $filename4 = $request->truck_no . $milliseconds . "_pan." . $file4->getClientOriginalExtension();
//                $file4->move('uploads/lorry', $filename4);
//            }else{
//                $filename4 = "pan";
//            }
//
//            $flight = LorryImage::where('lorry_id', $lorrys->id)->first();
//            $flight->rc_image = $filename;
//            $flight->permit_image = $filename1;
//            $flight->insurance_image = $filename2;
//            $flight->fitness_image = $filename3;
//            $flight->pan_image = $filename4;
//            $flight->save();
//        }


        Session::flash('flash_message', 'New lorry Record Successfully Created!');

        return redirect()->route('new_lorry_entry');
    }


    public function edit_lorry(Request $request,$id){

        $data = Lorry::find($id);
//        print_r($data);
//        die();
        return View::make('lorry.edit_lorry')->with('lor',$data);
    }


    public function update_lorry(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $lorrys= Lorry::find($id);
        $lorrys->truck_no = $request->truck_no;
        $lorrys->engin_no = $request->engin_no;
        $lorrys->chassis_no = $request->chassis_no;
        $lorrys->make = $request->make;
        $lorrys->truck_owner_name = $request->truck_owner_name;
        $lorrys->truck_owner_address = $request->truck_owner_address;
        $lorrys->truck_owner_mob_no = $request->truck_owner_mob_no;
        $lorrys->truck_owner_contact_no = $request->truck_owner_contact_no;
        $lorrys->truck_owner_land_line_no = $request->truck_owner_land_line_no;
        $lorrys->truck_owner_pan_no = $request->truck_owner_pan_no;
        $lorrys->truck_owner_gst_no = $request->truck_owner_gst_no;

        $lorrys->truck_owner_bank_id = $request->truck_owner_bank_name;
        $bankname =BankName::find($request->truck_owner_bank_name);
        if(!empty($bankname)) {
            $lorrys->truck_owner_bank_name = $bankname->bank_name;
        }

        $lorrys->truck_owner_bank_ac_no = $request->truck_owner_bank_ac_no;
        $lorrys->truck_owner_ifsc_code = $request->truck_owner_ifsc_code;
        $lorrys->save();

        Session::flash('flash_message', 'New lorry Successfully Updated!');

        return redirect()->route('lorry');

    }

    public function view_lorry($id){

        $data = Lorry::find($id);
        return View::make('lorry.view_lorry')->with('lor',$data);
    }

    public function delete_lorry($id)
    {

        try{
            $item= new Lorry();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected lorry Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
