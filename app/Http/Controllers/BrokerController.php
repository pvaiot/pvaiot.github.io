<?php

namespace App\Http\Controllers;
use App\Broker;
use App\Broker_child;
use App\BrokerImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;
use App\Driver;
use App\DriverImage;
//use Illuminate\Support\Facades\save;
use Illuminate\Support\Facades\Input;
//use Illuminate\Support\Facades\File;
use Monolog\Handler\NullHandlerTest;
use File;
use Illuminate\Support\Facades\DB;

class BrokerController extends Controller
{
    public function broker()
    {
        $brokers= Broker::orderBy('id')->get();
        return View::make('broker.broker_panel')->with('area_broker',$brokers);
    }

    public  function new_broker_entry(){
        return View::make('broker.new_broker_entry');
    }

    public function store_broker_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();


        $brokers= new Broker();
        $brokers->name = $request->name;
        $brokers->address = $request->address;
        $brokers->pan_no = $request->pan_no;
        $brokers->mobile_no = $request->mobile_no;
        $brokers->contact_no = $request->contact_no;
        $brokers->land_line_no = $request->land_line_no;

        $brokers->save();
        $broker_image = new BrokerImage();
        $broker_image->broker_front ="front";
        $broker_image->broker_back ="back";
        $broker_image->broker_id = $brokers->id;
        $broker_image->save();


        if ($request->hasFile('file') && $request->hasFile('file1')) {
            $file = $request->file('file');
            $file1 = $request->file('file1');
            $milliseconds = round(microtime(true) * 10);
            $filename = $brokers->id . $milliseconds . "_front." . $file->getClientOriginalExtension();
            $filename1 = $brokers->id . $milliseconds . "_back." . $file1->getClientOriginalExtension();
            $file->move('uploads/broker', $filename);
            $file1->move('uploads/broker', $filename1);
            $flight = BrokerImage::where('broker_id', $brokers->id)->first();
            $flight->broker_front = $filename;
            $flight->broker_back = $filename1;
            $flight->save();
        }
        elseif ($request->hasFile('file')) {
            $this->validate($request, [
                'image_file.*' => 'image|mimes:jpeg,jpg,png|max:2000|dimensions:max_width=1024,max_height=1024',

            ]);
            $file = $request->file('file');
            $milliseconds = round(microtime(true) * 10);
            $filename = $brokers->id.$milliseconds."_front.".$file->getClientOriginalExtension();
            $file->move('uploads/broker', $filename);
            $flight = BrokerImage::where('broker_id', $brokers->id)->first();
            $flight->broker_front = $filename;
            $flight->save();
        }
        elseif ($request->hasFile('file1')) {
            $this->validate($request, [
                'image_file.*' => 'image|mimes:jpeg,jpg,png|max:2000|dimensions:max_width=1024,max_height=1024',

            ]);
            $file1 = $request->file('file1');
            $milliseconds = round(microtime(true) * 10);
            $filename1 = $brokers->id.$milliseconds."_back.".$file1->getClientOriginalExtension();
            $file1->move('uploads/broker', $filename1);
            $flight = BrokerImage::where('broker_id', $brokers->id)->first();
            $flight->broker_back = $filename1;
            $flight->save();
        }
        $input2 = $request->input('rows');
        foreach($input2 as $row2) {
            $flight = new Broker_child();
            $flight->broker_id = $brokers->id;
            $flight->contact_no = $row2['contact_no'];
            $flight->contact_person = $row2['contact_person'];
            $flight->save();

        }
        Session::flash('flash_message', 'New Broker Record Successfully Created!');

        return redirect()->route('new_broker_entry');
    }


    public function edit_broker(Request $request,$id){

        $data = Broker::find($id);
//        print_r($data);
//        die();
        return View::make('broker.edit_broker')->with('brok',$data);
    }


    public function update_broker(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $brokers= Broker::find($id);
        $brokers->name = $request->name;
        $brokers->address = $request->address;
        $brokers->pan_no = $request->pan_no;
        $brokers->mobile_no = $request->mobile_no;
        $brokers->contact_no = $request->contact_no;
        $brokers->land_line_no = $request->land_line_no;

        $brokers->save();

        if ($request->hasFile('file') && $request->hasFile('file1')) {
            $oldfile = BrokerImage::where('broker_id',$id)->first();
            $file = $request->file('file');
            $file1 = $request->file('file1');
            $milliseconds = round(microtime(true) * 10);
            $filename = $brokers->id . $milliseconds . "_front." . $file->getClientOriginalExtension();
            $filename1 = $brokers->id . $milliseconds . "_back." . $file1->getClientOriginalExtension();
            $file->move('uploads/broker', $filename);
            $file1->move('uploads/broker', $filename1);
            $flight = BrokerImage::where('broker_id', $id)->first();
            $flight->broker_front = $filename;
            $flight->broker_back = $filename1;

            $file_path = base_path("uploads/broker/{$oldfile->broker_front}");
            if (File::exists($file_path)) File::delete($file_path);
            $file_path1 = base_path("uploads/broker/{$oldfile->broker_back}");
            if (File::exists($file_path1)) File::delete($file_path1);
            $flight->save();
        }

        elseif ($request->hasFile('file')) {
            $oldfile = BrokerImage::where('broker_id',$id)->first();
            $file = $request->file('file');
            $milliseconds = round(microtime(true) * 10);
            $filename = $brokers->id . $milliseconds . "_front." . $file->getClientOriginalExtension();
            $file->move('uploads/broker', $filename);
            $flight = BrokerImage::where('broker_id', $id)->first();
            $flight->broker_front = $filename;
            $file_path = base_path("uploads/broker/{$oldfile->broker_front}");
            if (File::exists($file_path)) File::delete($file_path);
            $flight->save();
        }
        elseif ($request->hasFile('file1')) {
            $oldfile = BrokerImage::where('broker_id', $id)->first();

            $file1 = $request->file('file1');
            $milliseconds = round(microtime(true) * 10);
            $filename1 = $brokers->id . $milliseconds . "_back." . $file1->getClientOriginalExtension();
            $file1->move('uploads/broker', $filename1);
            $flight = BrokerImage::where('broker_id', $id)->first();
            $flight->broker_back = $filename1;
            $file_path1 =base_path("uploads/broker/{$oldfile->broker_front}");
            if (File::exists($file_path1)) File::delete($file_path1);
            $flight->save();
        }

        Session::flash('flash_message', 'New Broker Successfully Updated!');

        return redirect()->route('broker');

    }

    public function view_broker($id){

        $data = Broker::find($id);
        return View::make('broker.view_broker')->with('brok',$data);
    }

    public function delete_broker($id)
    {

        try{
            $item= new Broker();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Broker Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
