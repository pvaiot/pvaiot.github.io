<?php

namespace App\Http\Controllers;

use App\Driver;
use App\Consignment;
use App\Consignment_child2;
use App\Consignment_child;
use App\DriverImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
//use Illuminate\Support\Facades\save;
use Illuminate\Support\Facades\Input;
//use Illuminate\Support\Facades\File;
use Monolog\Handler\NullHandlerTest;
use Session;
use File;
use DateTime;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\DB;
use Intervention\Image\ImageManagerStatic as Image;

class TestController extends Controller
{

       public  function new_driver_entry1(){

        return View::make('testfile.ajax_test');
    }
    public function store_freight_bill_entry_test(Request $request)
    {
//        $date1=$request->date1;
//        $date2=$request->date2;
//           echo $date1;
//        echo $date2;

        $from_date= date($request->input('date1'));
        $upto_date= date($request->input('date2'));
        $final_bills= \App\Consignment::whereBetween('con_date', array($from_date, $upto_date))->get();

        return View::make('testfile.ajax_test_2')->with('final_bill',$final_bills)->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function exel(Request $request){
        $from_date= date($request->input('date1'));
        $upto_date= date($request->input('date2'));
        $final_bills= \App\Consignment::whereBetween('con_date', array($from_date, $upto_date))->get();
        $newarray[]=array('consignment_no','consignment_date','party_code','billed_at');
        foreach($final_bills as $final_bills){
            $newarray[]=array(
                'consignment_no'=>$final_bills->consignment_no,
                'consignment_date'=>$final_bills->con_date,
                'party_code'=>$final_bills->party_code,
                'billed_at'=>$final_bills->billed_at,
            );
        }
        Excel::Create('clients',function($exel) use ($newarray){
            $exel->setTitle('Consignment data');
            $exel->sheet('clients',function($sheet) use ($newarray){
                $sheet->fromArray($newarray,null,A1,false,false);
                $sheet->loadView('report/final_bill_report');
            });
        })->export('xlsx');
    }

    public function imgae_upload_test(Request $request)
    {

// include composer autoload
        require 'vendor/autoload.php';



if(isset($_POST['submit'])) {

    if(isset($_FILES['image']['name']) && !empty($_FILES['image']['name'])) {

        if(!file_exists('images')) {
            mkdir('images', 0755);
        }

        $filename = $_FILES['image']['name'];
        $filepath = 'images/'. $filename;
        move_uploaded_file($_FILES['image']['tmp_name'], $filepath);

        if(!file_exists('images/crop')) {
            mkdir('images/crop', 0755);
        }

        // crop image
        $img = Image::make($filepath);
        $croppath = 'images/crop/'. $filename;
        if($_POST['w']) {
            $img->crop($_POST['w'], $_POST['h'], $_POST['x1'], $_POST['y1']);
        }
        $image = $img->resize(1024,1460);
        $img->save($croppath);

        echo "<img src='". $croppath ."' />";
    }
}
    }
    public function AjaxGet_consignment_no_change($id){
        $data = DB::table("consignment")->where("consignment_no",$id)->first();
        $child['data'] = Consignment_child2::where('consignment_id',$data->id)->get();
        $child2 = Consignment_child::where('consignment_id',$data->id)->first();
//        return json_encode($child);
        return json_encode(array($child, 'id' => $child2->invoice_no));
}
    public function store_driver_entry1(Request $request)
    {
//        if ($request->hasFile('file')) {
//            $file = $request->file('file');
//
//            $milliseconds = round(microtime(true) * 10);
//            $filename = $milliseconds . $file->getClientOriginalName();
////              $file->move('uploads','3'. $file->getClientOriginalName());
//            $file->move('uploads', $filename);
//            $flight = new DriverImage();
//            $flight->licence_front = $filename;
//            $flight->save();
//            echo $filename;
//
//        }echo "no file selected";
        if ($request->hasFile('file')||$request->hasFile('file1')) {
            $file = $request->file('file');
            $file1 = $request->file('file1');
            $filename = $request->truck_driver_license_no."_front.".$file->getClientOriginalExtension();
            $filename1 = $request->truck_driver_license_no."_back.".$file->getClientOriginalExtension();
            $file->move('uploads', $filename, $filename1);
            $flight = new DriverImage();
            $flight->licence_front = $filename;
            $flight->licence_back = $filename1;
            $unique_id = DB::table('driver')->select('id')->latest()->limit(1)->get();
            foreach($unique_id as $uni)
            {
                $flight->driver_id = $uni->id;
            }
            $flight->save();
        }
    }

    public function new_pdf(){
        return View::make('layouts.newAdminPanal');
    }
}

