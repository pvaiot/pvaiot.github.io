<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;

class SingleViewPanelController extends Controller
{
    public  function single_consignment_view_panel(){

        return View::make('ViewPanel.Coke Consignment View.single_coke_consignment_view_entry');
    }
   public  function coke_consignment_view_report_panel(Request $request){

        $count2 = DB::table("cock_consignment")->where("consignment_no",$request->consignment_no)->count();
        if($count2 > 0) {
            $consignment_no = $request->consignment_no;
            return View::make('ViewPanel.Coke Consignment View.coke_consignment_view_report')->with('consignment_no', $consignment_no);
        }else{
            $consignment_no = $request->consignment_no;
            return View::make('ViewPanel.Coke Consignment View.normal_consignment_view_report')->with('consignment_no', $consignment_no);
        }

//        $consignment_no=$request->consignment_no;
//        return View::make('ViewPanel.Coke Consignment View.coke_consignment_view_report')->with('consignment_no',$consignment_no);
    }
    public  function single_consignment_print_panel(){

        return View::make('SinglePrintPanel.Coke Consignment View.single_coke_consignment_view_entry');
    }
    public function AjaxGet_consignment_no_data_for_single($id){
        $count2 = DB::table("cock_consignment")->where("consignment_no",$id)->count();
        $count3 = DB::table("consignment")->where("consignment_no",$id)->count();
        if($count2>0 || $count3>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }
    public  function coke_consignment_print_report_panel(Request $request){

        $count2 = DB::table("cock_consignment")->where("consignment_no",$request->consignment_no)->count();
        if($count2 > 0) {
            $consignment_no = $request->consignment_no;
            return View::make('SinglePrintPanel.Coke Consignment View.coke_consignment_view_report')->with('consignment_no', $consignment_no);
        }else{
            $consignment_no = $request->consignment_no;
            return View::make('SinglePrintPanel.Coke Consignment View.normal_consignment_view_report')->with('consignment_no', $consignment_no);
        }
    }


}
