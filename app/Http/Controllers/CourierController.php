<?php

namespace App\Http\Controllers;

use App\Courier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Session;

class CourierController extends Controller
{
  public function courier()
  {
      $get_courier= \App\Courier::all();
      return View::make('Courier_detail.all_courier_details')->with('get_courier',$get_courier);
  }
    public function new_courier_entry()
    {
        return View::make('Courier_detail.new_courier_entry');
    }
    public function store_curier_entry(Request $request)
    {
        $courier= new Courier() ;
        $courier->branch = $request->branch_code;
        if($request->input('date')!="") {
            $courier_date = explode('/', $request->input('date'));
            $courier_day = $courier_date[0];
            $courier_month = $courier_date[1];
            $courier_year = $courier_date[2];

            $courier->date = date($courier_year . '/' . $courier_month . '/' . $courier_day);
        }
        $courier->from = $request->from;
        $courier->to = $request->to;
        $courier->party = $request->party_name;
        $courier->party_address = $request->party_address;
        $courier->docket_no = $request->docket_no;
        $courier->courier_name = $request->courier_name;
        $courier->document_detail = $request->document_details;


        $courier->save();
        Session::flash('flash_message', 'New Courier Record successfully Saved!');
        return redirect()->route('new_courier_entry');
    }
    public function all_courier()
    {
      $get_courier=$con_child = \App\Courier::all();
      // print_r($get_courier);
      return View::make('Courier_detail.all_courier_details')->with('get_courier',$get_courier);


    }
    public function view_courier($id)
    {
      $get_courier=$con_child = \App\Courier::find($id);
      // print_r($get_courier);
      return View::make('Courier_detail.view_courier')->with('get_courier',$get_courier);


    }
    public function edit_courier($id)
    {
      $get_courier=$con_child = \App\Courier::find($id);
      // print_r($get_courier);
      return View::make('Courier_detail.edit_courier')->with('get_courier',$get_courier);


    }
    public function update_courier(Request $request, $id)
    {

          $courier= Courier::find($id);
        $courier->branch = $request->branch_code;
        if($request->input('date')!="") {
            $courier_date = explode('/', $request->input('date'));
            $courier_day = $courier_date[0];
            $courier_month = $courier_date[1];
            $courier_year = $courier_date[2];

            $courier->date = date($courier_year . '/' . $courier_month . '/' . $courier_day);
        }
        $courier->from = $request->from;
        $courier->to = $request->to;
    
        $courier->party = $request->party_name;
        $courier->party_address = $request->party_address;
        $courier->docket_no = $request->docket_no;
        $courier->courier_name = $request->courier_name;
        $courier->document_detail = $request->document_details;


        $courier->save();
        Session::flash('flash_message', 'New Courier Record successfully Saved!');

die();
            return redirect()->route('courier');
    }
    public function delete_courier($id)
    {


            $item= new Courier();
            $item::find($id)->delete();

            Session::flash('flash_message', 'Selected Courier Successfully Deleted!');



        return redirect()->back();
    }


}
