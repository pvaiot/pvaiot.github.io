<?php

namespace App\Http\Controllers;

use App\Driver;
use App\DriverImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
//use Illuminate\Support\Facades\save;
use Illuminate\Support\Facades\Input;
//use Illuminate\Support\Facades\File;
use Monolog\Handler\NullHandlerTest;
use Session;
use File;
use Illuminate\Support\Facades\DB;

class DriverController extends Controller
{
    public function driver()
    {
        $drivers= Driver::orderBy('id')->get();
        return View::make('driver.driver_panel')->with('area_driver',$drivers);
    }

    public  function new_driver_entry(){
        return View::make('driver.new_driver_entry');
    }

    public function store_driver_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request, [
            'truck_driver_license_no' => 'required|unique:driver',
        ]);
        $this->validate($request, [
            'image_file.*' => 'image|mimes:jpeg,jpg,png|max:2000|dimensions:max_width=1024,max_height=1024',

        ]);
//        $file1 = $request->file('image_file_back');
        $drivers = new Driver();
        $drivers->truck_driver_name = $request->truck_driver_name;
        $drivers->truck_driver_license_no = $request->truck_driver_license_no;
        $drivers->truck_driver_license_palce_of_issue = $request->truck_driver_license_palce_of_issue;
        $drivers->truck_driver_address = $request->truck_driver_address;
        $drivers->truck_driver_mob_no = $request->truck_driver_mob_no;
        $drivers->truck_driver_contact_no = $request->truck_driver_contact_no;
        $drivers->truck_driver_land_line_no = $request->truck_driver_land_line_no;
        $drivers->save();
        $drive_image = new DriverImage();
        $drive_image->licence_front ="front";
        $drive_image->licence_back ="back";
        $drive_image->driver_id = $drivers->id;
        $drive_image->save();

//        if ($request->hasFile('file') && $request->hasFile('file1')) {
//            $this->validate($request, [
//                'image_file.*' => 'image|mimes:jpeg,jpg,png|max:2000|dimensions:max_width=1024,max_height=1024',
//
//            ]);
//            $file = $request->file('file');
//            $file1 = $request->file('file1');
//            $milliseconds = round(microtime(true) * 10);
//            $filename = $request->truck_driver_license_no.$milliseconds."_front.".$file->getClientOriginalExtension();
//            $filename1 = $request->truck_driver_license_no.$milliseconds."_back.".$file1->getClientOriginalExtension();
//            $file->move('uploads/driver', $filename);
//            $file1->move('uploads/driver', $filename1);
//            $flight = new DriverImage();
//            $flight->licence_front = $filename;
//            $flight->licence_back = $filename1;
//            $flight->save();
//        }
        if ($request->hasFile('file') && $request->hasFile('file1')) {
            $file = $request->file('file');
            $file1 = $request->file('file1');
            $milliseconds = round(microtime(true) * 10);
            $filename = $request->truck_driver_license_no . $milliseconds . "_front." . $file->getClientOriginalExtension();
            $filename1 = $request->truck_driver_license_no . $milliseconds . "_back." . $file1->getClientOriginalExtension();
            $file->move('uploads/driver', $filename);
            $file1->move('uploads/driver', $filename1);
            $flight = DriverImage::where('driver_id', $drivers->id)->first();
            $flight->licence_front = $filename;
            $flight->licence_back = $filename1;
            $flight->save();
        }
        elseif ($request->hasFile('file')) {
            $this->validate($request, [
                'image_file.*' => 'image|mimes:jpeg,jpg,png|max:2000|dimensions:max_width=1024,max_height=1024',

            ]);
            $file = $request->file('file');
            $milliseconds = round(microtime(true) * 10);
            $filename = $request->truck_driver_license_no.$milliseconds."_front.".$file->getClientOriginalExtension();
            $file->move('uploads/driver', $filename);
            $flight = DriverImage::where('driver_id', $drivers->id)->first();
            $flight->licence_front = $filename;
            $flight->save();
        }
       elseif ($request->hasFile('file1')) {
            $this->validate($request, [
                'image_file.*' => 'image|mimes:jpeg,jpg,png|max:2000|dimensions:max_width=1024,max_height=1024',

            ]);
            $file1 = $request->file('file1');
            $milliseconds = round(microtime(true) * 10);
            $filename1 = $request->truck_driver_license_no.$milliseconds."_back.".$file1->getClientOriginalExtension();
            $file1->move('uploads/driver', $filename1);
            $flight = DriverImage::where('driver_id', $drivers->id)->first();
            $flight->licence_back = $filename1;
            $flight->save();
        }


        Session::flash('flash_message', 'New Driver Record Successfully Created!');

        return redirect()->route('new_driver_entry');
    }


    public function edit_driver(Request $request,$id){

        $data = Driver::find($id);
//        print_r($data);
//        die();
        return View::make('driver.edit_driver')->with('drive',$data);
    }


    public function update_driver(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();
//
        $drivers= Driver::find($id);
        $drivers->truck_driver_name = $request->truck_driver_name;
        $drivers->truck_driver_license_no = $request->truck_driver_license_no;
        $drivers->truck_driver_license_palce_of_issue = $request->truck_driver_license_palce_of_issue;
        $drivers->truck_driver_address = $request->truck_driver_address;
        $drivers->truck_driver_mob_no = $request->truck_driver_mob_no;
        $drivers->truck_driver_contact_no = $request->truck_driver_contact_no;
        $drivers->truck_driver_land_line_no = $request->truck_driver_land_line_no;
        $drivers->save();
            if ($request->hasFile('file') && $request->hasFile('file1')) {
            $oldfile = DriverImage::where('driver_id',$id)->first();
                    $file = $request->file('file');
                    $file1 = $request->file('file1');
                    $milliseconds = round(microtime(true) * 10);
                    $filename = $request->truck_driver_license_no . $milliseconds . "_front." . $file->getClientOriginalExtension();
                    $filename1 = $request->truck_driver_license_no . $milliseconds . "_back." . $file1->getClientOriginalExtension();
                    $file->move('uploads/driver', $filename);
                    $file1->move('uploads/driver', $filename1);
                    $flight = DriverImage::where('driver_id', $id)->first();
                    $flight->licence_front = $filename;
                    $flight->licence_back = $filename1;

                    $file_path = base_path("uploads/driver/{$oldfile->licence_front}");
                    if (File::exists($file_path)) File::delete($file_path);
                    $file_path1 = base_path("uploads/driver/{$oldfile->licence_back}");
                    if (File::exists($file_path1)) File::delete($file_path1);
                $flight->save();
            }

            elseif ($request->hasFile('file')) {
            $oldfile = DriverImage::where('driver_id',$id)->first();
                    $file = $request->file('file');
                    $milliseconds = round(microtime(true) * 10);
                    $filename = $request->truck_driver_license_no . $milliseconds . "_front." . $file->getClientOriginalExtension();
                    $file->move('uploads/driver', $filename);
                    $flight = DriverImage::where('driver_id', $id)->first();
                    $flight->licence_front = $filename;
                    $file_path = base_path("uploads/driver/{$oldfile->licence_front}");
                    if (File::exists($file_path)) File::delete($file_path);
                $flight->save();
            }
            elseif ($request->hasFile('file1')) {
            $oldfile = DriverImage::where('driver_id', $id)->first();

                    $file1 = $request->file('file1');
                    $milliseconds = round(microtime(true) * 10);
                    $filename1 = $request->truck_driver_license_no . $milliseconds . "_back." . $file1->getClientOriginalExtension();
                    $file1->move('uploads/driver', $filename1);
                    $flight = DriverImage::where('driver_id', $id)->first();
                    $flight->licence_back = $filename1;
                    $file_path1 =base_path("uploads/driver/{$oldfile->licence_front}");
                    if (File::exists($file_path1)) File::delete($file_path1);
                $flight->save();
        }

        Session::flash('flash_message', 'New Driver Successfully Updated!');

        return redirect()->route('driver');

    }

    public function view_driver($id){

        $data = Driver::find($id);
        return View::make('driver.view_driver')->with('drive',$data);
    }

    public function delete_driver($id)
    {

        try{
            $item= new Driver();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Driver Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
