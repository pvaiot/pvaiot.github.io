<?php

namespace App\Http\Controllers;

use App\CockConsignment;
use App\Coke_acknowledgement;
use App\CokeChallan;
use App\CokeChallan_Child2;
use App\CokeFreightBill_child;
use App\Party;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use Maatwebsite\Excel\Facades\Excel;

class TransactionReportingController extends Controller
{



     public  function normal_consignment_report_panel(){

        return View::make('Reporting.Transaction Reporting.consignment_reporting');
    }
    public  function normal_bill_report_panel(){

        return View::make('Reporting.Transaction Reporting.Normal Bill.normal_bill_view');
    }
    public function AjaxGet_normal_bill_no_data2($id){
        $count2 = DB::table("freight_bill")->where("bill_no",$id)->count();
        if($count2>0){
            echo 'unique';
        }else {
            echo 'not unique';
        }
    }
    public  function normal_bill_view_report_panel(Request $request){

        $coke_bill_no=$request->coke_bill_no;
        return View::make('Reporting.Transaction Reporting.Normal Bill.normal_bill_report')->with('coke_bill_no',$coke_bill_no);
    }
    public function date_wise_normal_consignment_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('date_wise_date_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('date_wise_date_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);


        return View::make('Reporting.Transaction Reporting.date_wise_normal_consignment_report')->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function unbilled_normal_consignment_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('unbilled_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('unbilled_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);


        return View::make('Reporting.Transaction Reporting.unbilled_normal_consignment_report')->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function party_wise_normal_consignment_report(Request $request)
    {
        $party_wise_party_code = $request->party_name;
        $party_data = Party::where('party_code','=',$party_wise_party_code)->first();
        $party_name = $party_data->name;
      

        return View::make('Reporting.Transaction Reporting.party_wise_normal_consignment_report')->with('party_code',$party_wise_party_code)->with('party_name',$party_name);
    }
    public function party_date_wise_normal_consignment_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('party_date_wise_date_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('party_date_wise_date_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);

        $party_wise_party_code = $request->party_name2;
        $party_data = Party::where('party_code','=',$party_wise_party_code)->first();
        $party_name = $party_data->name;

        return View::make('Reporting.Transaction Reporting.party_date_wise_normal_consignment_report')->with('party_code',$party_wise_party_code)->with('party_name',$party_name)->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function truck_date_wise_normal_consignment_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('truck_date_wise_date_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('truck_date_wise_date_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);

        $truck_no = $request->truck_no;


        return View::make('Reporting.Transaction Reporting.truck_date_wise_normal_consignment_report')->with('truck_no',$truck_no)->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function location_date_wise_normal_consignment_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('location_date_wise_date_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('location_date_wise_date_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);

        $location = $request->location;

        return View::make('Reporting.Transaction Reporting.location_date_wise_normal_consignment_report')->with('location',$location)->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function detailed_coke_consignment_report (Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('from_date3'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('upto_date3'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);

        $location = $request->location3;
        $party_code = $request->party_name3;

        return View::make('Reporting.Coke Consignment Reports.detailed_coke_consignment_report')->with('location',$location)->with('from_date',$from_date)->with('upto_date',$upto_date)->with('party_code',$party_code);
    }
    public function export_date_wise_normal_consignment_data(Request $request)
    {


        $consignment_data= \App\Consignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;
        $newarray[]=array('SL. No.','Consignment Date','Consignment No','From','To','Party Name','Truck No','Total Package','Total Weight','Contains','Consignment Value');
        $sl_no=1;

        foreach($consignment_data as $consignment_data){
        $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get();
        $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->first();
        $total_package=0;
        $total_weight=0;

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }
            $num_amount=(float)$consignment_data->cn_value;
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
               
                'From'=>$consignment_data->from,
                'To'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Consignment Value'=>$num_amount
            );
            $sl_no+=1;
        }
        $title="Consignment Data from ".date( 'd/m/y', strtotime($request->from_date))." To ".date( 'd/m/y', strtotime($request->upto_date))."";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Date Wise Coke Consignment Data');
            $exel->sheet('Date Wise Coke Consignment Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:M1')->applyFromArray($stylearray);
                $total_column='M'.($sl_no+4);
                $total_print='L'.($sl_no+4);
                $total_sum='=ROUND(SUM(M2:M'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_unbilled_normal_consignment_data(Request $request)
    {


        $consignment_data= \App\Consignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;
        $newarray[]=array('SL. No.','Consignment Date','Consignment No','From','To','Party Name','Truck No','Total Package','Total Weight','Contains','Consignment Value');
        $sl_no=1;

        foreach($consignment_data as $consignment_data){
        $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get();
        $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->first();
        $total_package=0;
        $total_weight=0;

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }
            $num_amount=(float)$consignment_data->cn_value;
            $billing_data_count=\App\FreightBill_child::where('consignment_no','=',$consignment_data->consignment_no)->count();
            if($billing_data_count<=0){
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
            
                'From'=>$consignment_data->from,
                'To'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Consignment Value'=>$num_amount
            );
            $sl_no+=1;
            }
        }
        $title="Consignment Data from ".date( 'd/m/y', strtotime($request->from_date))." To ".date( 'd/m/y', strtotime($request->upto_date))."";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Unbilled Coke Consignment Data');
            $exel->sheet('Unbilled Coke Consignment Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:M1')->applyFromArray($stylearray);
                $total_column='M'.($sl_no+4);
                $total_print='L'.($sl_no+4);
                $total_sum='=ROUND(SUM(M2:M'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_party_wise_normal_consignment_data(Request $request)
    {


        $consignment_data= \App\Consignment::where('party_code','=',$request->party_code)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;
        $newarray[]=array('SL. No.','Consignment Date','Consignment No','From','To','Party Name','Truck No','Total Package','Total Weight','Contains','Consignment Value');
        $sl_no=1;

        foreach($consignment_data as $consignment_data){
        $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get();
        $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->first();
        $total_package=0;
        $total_weight=0;

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }
            if($consignment_data->cn_value==0){
                $num_amount=(int)0;
            }else{
                $num_amount=(float)$consignment_data->cn_value;
            }

            $newarray[]=array(
                'SL. No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
                'From'=>$consignment_data->from,
                'To'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Consignment Value'=>$num_amount
            );
            $sl_no+=1;
        }
            $datas = Party::where('party_code','=',$request->party_code)->first();
        $title="Consignment Data from For ".$datas->name."";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Party Wise Coke Consignment Data');
            $exel->sheet('Party Wise Coke Consignment',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:M1')->applyFromArray($stylearray);
                $total_column='M'.($sl_no+4);
                $total_print='L'.($sl_no+4);
                $total_sum='=ROUND(SUM(M2:M'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_party_wise_consignment_data(Request $request)
    {


        $consignment_data= \App\Consignment::where('party_code','=',$request->party_code)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;
        $newarray[]=array('SL. No.','Consignment Date','Consignment No','From','To','Party Name','Truck No','Total Package','Total Weight','Contains','Consignment Value');
        $sl_no=1;

    
        foreach($consignment_data as $consignment_data){
            $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get();
            $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->first();
        
            $total_package=0;
            $total_weight=0;

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }
            $num_amount=(float)$consignment_data->cn_value;
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
                'From'=>$consignment_data->from,
                'To'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Consignment Value'=>$num_amount
            );
            $sl_no+=1;
        }
        $datas = Party::where('party_code','=',$request->party_code)->first();
            $title="Consignment Data for".$datas->name." from ".date( 'd/m/y', strtotime($request->from_date))." To ".date( 'd/m/y', strtotime($request->upto_date))."";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Date Wise Coke Consignment Data');
            $exel->sheet('Date Wise Coke Consignment Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:M1')->applyFromArray($stylearray);
                $total_column='M'.($sl_no+4);
                $total_print='L'.($sl_no+4);
                $total_sum='=ROUND(SUM(M2:M'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_truck_date_wise_normal_consignment_data(Request $request)
    {


        $consignment_data= \App\Consignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('truck_no','=',$request->truck_no)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;
        $newarray[]=array('SL. No.','Consignment Date','Consignment No','From','To','Party Name','Truck No','Total Package','Total Weight','Contains','Consignment Value');
        $sl_no=1;

        foreach($consignment_data as $consignment_data){
            $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get();
            $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->first();
            $total_package=0;
            $total_weight=0;

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }
            $num_amount=(float)$consignment_data->cn_value;
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
              
                'From'=>$consignment_data->from,
                'To'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Consignment Value'=>$num_amount
            );
            $sl_no+=1;
        }
            $title="Consignment Data for".$request->truck_no." from ".date( 'd/m/y', strtotime($request->from_date))." To ".date( 'd/m/y', strtotime($request->upto_date))."";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Date Wise Coke Consignment Data');
            $exel->sheet('Date Wise Coke Consignment Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:M1')->applyFromArray($stylearray);
                $total_column='M'.($sl_no+4);
                $total_print='L'.($sl_no+4);
                $total_sum='=ROUND(SUM(M2:M'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_location_date_wise_normal_consignment_data(Request $request)
    {


        $consignment_data= \App\Consignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('to','=',$request->location)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;
        $newarray[]=array('SL. No.','Consignment Date','Consignment No','From','To','Party Name','Truck No','Total Package','Total Weight','Contains','Consignment Value');
        $sl_no=1;

        foreach($consignment_data as $consignment_data){
            $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get();
            $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->first();
            $total_package=0;
            $total_weight=0;

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }
            $num_amount=(float)$consignment_data->cn_value;
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
                'From'=>$consignment_data->from,
                'To'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Consignment Value'=>$num_amount
            );
            $sl_no+=1;
        }

        $title="Consignment Data for".$request->location." from ".date( 'd/m/y', strtotime($request->from_date))." To ".date( 'd/m/y', strtotime($request->upto_date))."";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Date Wise Coke Consignment Data');
            $exel->sheet('Date Wise Coke Consignment Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:M1')->applyFromArray($stylearray);
                $total_column='M'.($sl_no+4);
                $total_print='L'.($sl_no+4);
                $total_sum='=ROUND(SUM(M2:M'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }

    //Detailed Coke Report

    public function export_detailed_coke_consignment_data(Request $request)
    {
        $party_code=$request->party_code;
        $location=$request->location;
        $from_date=$request->from_date;
        $upto_date=$request->upto_date;
        if ($party_code == "all" && $location == "all") {
            $consignment_data = \App\CockConsignment::whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->
                get();
            $area_consignment_count = \App\CockConsignment::
            whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->count();
        }
    elseif($party_code != "all" && $location == "all"){
        $consignment_data = \App\CockConsignment::where('party_code', '=', $party_code)
     ->whereBetween('con_date', array($from_date, $upto_date))
     ->orderBy('consignment_no', 'ASC')->get();
$area_consignment_count = \App\CockConsignment::where('party_code', '=', $party_code)
    ->whereBetween('con_date', array($from_date, $upto_date))
    ->orderBy('consignment_no', 'ASC')->count();
}
elseif($party_code == "all" && $location != "all") {
    $consignment_data = \App\CockConsignment::where('to', '=', $location)
        ->whereBetween('con_date', array($from_date, $upto_date))
        ->orderBy('consignment_no', 'ASC')->get();
    $area_consignment_count = \App\CockConsignment::where('to', '=', $location)
        ->whereBetween('con_date', array($from_date, $upto_date))
        ->orderBy('consignment_no', 'ASC')->count();
}
elseif($party_code != "all" && $location != "all"){
    $consignment_data = \App\CockConsignment::where('party_code', '=', $party_code)
     ->where('to', '=', $location)
     ->whereBetween('con_date', array($from_date, $upto_date))
     ->orderBy('consignment_no', 'ASC')->get();
 $area_consignment_count = \App\CockConsignment::where('party_code', '=', $party_code)
     ->where('to', '=', $location)
     ->whereBetween('con_date', array($from_date, $upto_date))
     ->orderBy('consignment_no', 'ASC')->count();
}

//        $consignment_data= \App\CockConsignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('to','=',$request->location)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;


        $newarray[]=array('SL. No.','Consignment Date','Consignment No','Trip ID','Load ID','From',
            'Destination','Party Name','Consignee Name',
            'Truck No','Total Package','Total Weight','Contains',
            'Invoice No','E-way Bill No & Validity','Consignment Value','Challan No','Broker Name',
            'Reporting Date','Unloading Date','No Of Days Detained','Bill No',
            'Total Freight for This CN in Bill','Entry By');
        $sl_no=1;

        foreach($consignment_data as $consignment_data){
            $consignment_child2= \App\CockConsignment_child2::where('consignment_id','=',$consignment_data->id)->get();
            $consignment_child1= \App\CockConsignment_child2::where('consignment_id','=',$consignment_data->id)->first();
            $consignment_child_data= \App\CockConsignment_child::where('consignment_id','=',$consignment_data->id)->get();
            $consignment_child_count= \App\CockConsignment_child::where('consignment_id','=',$consignment_data->id)->count();
            $challan_child2_count= \App\CokeChallan_child2::where('consignment_id','=',$consignment_data->id)->count();
            $total_package=0;
            $total_weight=0;
            $invoice_no="";$eway_bill_no="";
            $challan_no="";$reporting_date="";$unloading_date="";
             $broker_name="";

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }

            $num_amount=(float)$consignment_data->cn_value;
            //invoice and e-way-bill
            if($consignment_child_count>0) {
                if ($consignment_child_count == 1) {
                    foreach ($consignment_child_data as $consignment_child) {
                        $invoice_no = $consignment_child->invoice_no;
                        $eway_bill_no=$consignment_child->way_bill_no." ".date( 'd/m/Y', strtotime($consignment_child->validity));
                    }
                } else {
                    foreach ($consignment_child_data as $consignment_child) {
                        $invoice_no .= $consignment_child->invoice_no." / ";
                        $eway_bill_no .=$consignment_child->way_bill_no." ".date( 'd/m/Y', strtotime($consignment_child->validity))." , ";
                    }
                }
            }else{
                $invoice_no;
                $eway_bill_no;
            }
            //challan
            if($challan_child2_count>0) {
                $challan_child2= \App\CokeChallan_child2::where('consignment_id','=',$consignment_data->id)->first();
                $challan_data= \App\CokeChallan::find($challan_child2->challan_id);
                $challan_no=$challan_data->challan_no;
                $broker_name=$challan_data->broker_name;
            }else{
                $challan_no;
                $broker_name;
            }
            //acknowledgement
if($challan_child2_count>0){
    $acknowledgement_data= \App\Coke_acknowledgement::where('challan_id','=',$challan_child2->challan_id)->first();
    $acknowledgement_count_data= \App\Coke_acknowledgement::where('challan_id','=',$challan_child2->challan_id)->count();
    if($acknowledgement_count_data>0) {
        $reporting_date = date('d/m/Y', strtotime($acknowledgement_data->reporting_date));
        $unloading_date = date('d/m/Y', strtotime($acknowledgement_data->unloading_date));
        $fdate = $acknowledgement_data->reporting_date;
        $tdate = $acknowledgement_data->unloading_date;
        $datetime1 = new DateTime($fdate);
        $datetime2 = new DateTime($tdate);
        $interval = $datetime1->diff($datetime2);
        $days = $interval->format('%a');
    }
    else{
        $reporting_date;
        $unloading_date;
        $days="";
        }}
else{
    $reporting_date;
    $unloading_date;
    $days="";
}
            $bill_freight_child_count= \App\CokeFreightBill_child::where('consignment_id','=',$consignment_data->id)->count();
            if($bill_freight_child_count>0) {
                $bill_freight_child= \App\CokeFreightBill_child::where('consignment_id','=',$consignment_data->id)->first();
                $bill_freight= \App\CokeFreightBill::find($bill_freight_child->freight_bill_id);
                $bill_no = $bill_freight->bill_no;
                $total_freight_for_this_cn = (float)$bill_freight_child->total_freight;
            }
            else {
                $bill_no = "";
                $total_freight_for_this_cn = 0;
            }

            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
                'Trip ID'=>$consignment_data->trip_id,
                'Load ID'=>$consignment_data->load_id,
                'From'=>$consignment_data->from,
                'Destination'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Consignee Name'=>$consignment_data->consignee_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Invoice No'=>$invoice_no,
                'E-way Bill No & Validity'=>$eway_bill_no,
                'Consignment Value'=>$num_amount,
                'Challan No'=>$challan_no,
                'Broker Name'=>$broker_name,
                'Reporting Date'=>$reporting_date,
                'Unloading Date'=>$unloading_date,
                'No Of Days Detained'=>$days,
                'Bill No'=>$bill_no,
                'Total Freight for This CN in Bill'=>$total_freight_for_this_cn,
                'Entry By'=>$consignment_data->created_user
            );
            $sl_no+=1;
        }

        $title="Detailed Consignment Data";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Detailed Consignment Data');
            $exel->sheet('Detailed Consignment Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:W1')->applyFromArray($stylearray);
                $total_column='P'.($sl_no+4);
                $total_print='O'.($sl_no+4);
                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }

//___________________________________________________________________________________________________________________

//Coke Consignment Report

    public  function normal_challan_report_panel(){

        return View::make('Reporting.Transaction Reporting.Challan Report.normal_challan_report_panel');
    }

    public function date_wise_normal_challan_report (Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('date_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('date_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);


        return View::make('Reporting.Transaction Reporting.Challan Report.date_wise_normal_challan_report')->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function detailed_normal_challan_report (Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('from_date3'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('upto_date3'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);

        $location = $request->location3;

        return View::make('Reporting.Transaction Reporting.Challan Report.detailed_normal_challan_report')->with('location',$location)->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function truck_date_wise_normal_challan_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('truck_date_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('truck_date_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);

        $truck_no = $request->truck_no;

        return View::make('Reporting.Transaction Reporting.Challan Report.truck_date_wise_normal_challan_report')->with('truck_no',$truck_no)->with('from_date',$from_date)->with('upto_date',$upto_date);
    }

    public function export_detailed_normal_challan_data(Request $request)
    {
        $location=$request->location;
        $from_date=$request->from_date;
        $upto_date=$request->upto_date;
        if ($location == "all") {
            $challan_data= \App\Challan::whereBetween('date', array($from_date, $upto_date))
                ->orderBy('challan_no', 'ASC')->
                get();
            $area_challan_count= \App\Challan::
            whereBetween('date', array($from_date, $upto_date))
                ->orderBy('challan_no', 'ASC')->count();
        }
        elseif($location != "all"){
            $challan_data= \App\Challan::where('to','=',$location)
                ->whereBetween('date', array($from_date, $upto_date))
                ->orderBy('challan_no', 'ASC')->get();
            $area_challan_count= \App\Challan::where('to','=',$location)
                ->whereBetween('date', array($from_date, $upto_date))
                ->orderBy('challan_no', 'ASC')->count();
        }

//        $consignment_data= \App\CockConsignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('to','=',$request->location)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;

        $newarray[]=array('SL. No.','Challan Date','Challan No','CN Numbers','From',
            'Destination','Truck No','Pan No','Pan Name','Total Package','Total Weight','Freight Amount',
            'Advance Amount','Diesel Amount','Balance Amount','Petrol Pump',
            'Payable At','Declaration Submitted','Entry By',
            );
        $sl_no=1;

        foreach($challan_data as $challan_data){
            $challan_child3= \App\Challan_Child3::where('challan_id','=',$challan_data->id)->first();
            $challan_child2_count= \App\Challan_Child2::where('challan_id','=',$challan_data->id)->count();
            $challan_child2= \App\Challan_Child2::where('challan_id','=',$challan_data->id)->get();
            $cn_no="";$petrol_pump_name="";
            if($challan_data->petrol_pump_id>0){
            $petrol_pump_data=\App\Petrol_Pump::find($challan_data->petrol_pump_id);
                $petrol_pump_name=$petrol_pump_data->name;
            }else{
                $petrol_pump_name;
            }

            if($challan_child2_count>0) {
                if ($challan_child2_count == 1) {
                    foreach ($challan_child2 as $challan_child2) {
                        $cn_no = $challan_child2->consignment_no;
                        }
                } else {
                    foreach ($challan_child2 as $challan_child2) {
                        $cn_no .= $challan_child2->consignment_no." / ";
                        }
                }
            }else{
                    $cn_no;
            }
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Challan Date'=>date( 'd/m/y', strtotime($challan_data->date)),
                'Challan No'=>$challan_data->challan_no,
                'CN Numbers'=>$cn_no,
                'From'=>$challan_data->from,
                'Destination'=>$challan_data->to,
                'Truck No'=>$challan_data->truck_no,
                'Pan No'=>$challan_data->pan_no,
                'Pan Name'=>$challan_data->owners_name,
                'Total Package'=>(float)$challan_child3->total_package,
                'Total Weight'=>(float)$challan_child3->total_gross_weight,
                'Freight Amount'=>(float)$challan_data->freight,
                'Advance Amount'=>(float)$challan_data->cash_advance,
                'Diesel Amount'=>(float)$challan_data->diesel,
                'Balance Amount'=>(float)$challan_data->balance,
                'Petrol Pump'=>$petrol_pump_name,
                'Payable At'=>$challan_data->balance_payable_at,
                'Declaration Submitted'=>$challan_data->declaration_submitted,
                'Entry By'=>$challan_data->created_by
            );
            $sl_no+=1;
        }

        $title="Detailed Challan Data";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Detailed Challan Data');
            $exel->sheet('Detailed Challan Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:Q1')->applyFromArray($stylearray);
//                $total_column='P'.($sl_no+4);
//                $total_print='O'.($sl_no+4);
//                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
//                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
//                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
//                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_truck_date_normal_coke_challan_data(Request $request)
    {
        $truck_no=$request->truck_no;
        $from_date=$request->from_date;
        $upto_date=$request->upto_date;

            $challan_data= \App\Challan::where('truck_no','=',$truck_no)
                ->whereBetween('date', array($from_date, $upto_date))
                ->orderBy('challan_no', 'ASC')->get();
            $area_challan_count= \App\Challan::where('truck_no','=',$truck_no)
                ->whereBetween('date', array($from_date, $upto_date))
                ->orderBy('challan_no', 'ASC')->count();


//        $consignment_data= \App\CockConsignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('to','=',$request->location)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;

        $newarray[]=array('SL. No.','Challan Date','Challan No','CN Numbers','From',
            'Destination','Truck No','Total Package','Total Weight','Freight Amount',
            'Advance Amount','Diesel Amount','Balance Amount','Petrol Pump',
            'Payable At','Declaration Submitted','Entry By',
        );
        $sl_no=1;

        foreach($challan_data as $challan_data){
            $challan_child3= \App\Challan_Child3::where('challan_id','=',$challan_data->id)->first();
            $challan_child2_count= \App\Challan_Child2::where('challan_id','=',$challan_data->id)->count();
            $challan_child2= \App\Challan_Child2::where('challan_id','=',$challan_data->id)->get();
            $cn_no="";$petrol_pump_name="";
            if($challan_data->petrol_pump_id!=""){
                $petrol_pump_data=\App\Petrol_Pump::find($challan_data->petrol_pump_id);
                $petrol_pump_name=$petrol_pump_data->name;
            }else{
                $petrol_pump_name;
            }

            if($challan_child2_count>0) {
                if ($challan_child2_count == 1) {
                    foreach ($challan_child2 as $challan_child2) {
                        $cn_no = $challan_child2->consignment_no;
                    }
                } else {
                    foreach ($challan_child2 as $challan_child2) {
                        $cn_no .= $challan_child2->consignment_no." / ";
                    }
                }
            }else{
                $cn_no;
            }
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Challan Date'=>date( 'd/m/y', strtotime($challan_data->date)),
                'Challan No'=>$challan_data->challan_no,
                'CN Numbers'=>$cn_no,
                'From'=>$challan_data->from,
                'Destination'=>$challan_data->to,
                'Truck No'=>$challan_data->truck_no,
                'Total Package'=>(float)$challan_child3->total_package,
                'Total Weight'=>(float)$challan_child3->total_gross_weight,
                'Freight Amount'=>(float)$challan_data->freight,
                'Advance Amount'=>(float)$challan_data->cash_advance,
                'Diesel Amount'=>(float)$challan_data->diesel,
                'Balance Amount'=>(float)$challan_data->balance,
                'Petrol Pump'=>$petrol_pump_name,
                'Payable At'=>$challan_data->balance_payable_at,
                'Declaration Submitted'=>$challan_data->declaration_submitted,
                'Entry By'=>$challan_data->created_user
            );
            $sl_no+=1;
        }

        $title="Truck Date Wise Challan Data";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Truck Date Wise Challan Data');
            $exel->sheet('Truck Date Wise Challan Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:Q1')->applyFromArray($stylearray);
//                $total_column='P'.($sl_no+4);
//                $total_print='O'.($sl_no+4);
//                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
//                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
//                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
//                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_date_wise_normal_challan_data(Request $request)
    {
        $from_date=$request->from_date;
        $upto_date=$request->upto_date;

        $challan_data= \App\Challan::whereBetween('date', array($from_date, $upto_date))
            ->orderBy('challan_no', 'ASC')->get();
        $area_challan_count= \App\Challan::whereBetween('date', array($from_date, $upto_date))
            ->orderBy('challan_no', 'ASC')->count();


//        $consignment_data= \App\CockConsignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('to','=',$request->location)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;

        $newarray[]=array('SL. No.','Challan Date','Challan No','CN Numbers','From',
            'Destination','Truck No','Total Package','Total Weight','Freight Amount',
            'Advance Amount','Diesel Amount','Balance Amount','Petrol Pump',
            'Payable At','Declaration Submitted','Entry By',
        );
        $sl_no=1;

        foreach($challan_data as $challan_data){
            $challan_child3= \App\Challan_Child3::where('challan_id','=',$challan_data->id)->first();
            $challan_child2_count= \App\Challan_Child2::where('challan_id','=',$challan_data->id)->count();
            $challan_child2= \App\Challan_Child2::where('challan_id','=',$challan_data->id)->get();
            $cn_no="";$petrol_pump_name="";
            if($challan_data->petrol_pump_id!=""){
                $petrol_pump_data=\App\Petrol_Pump::find($challan_data->petrol_pump_id);
                $petrol_pump_name=$petrol_pump_data->name;
            }else{
                $petrol_pump_name;
            }

            if($challan_child2_count>0) {
                if ($challan_child2_count == 1) {
                    foreach ($challan_child2 as $challan_child2) {
                        $cn_no = $challan_child2->consignment_no;
                    }
                } else {
                    foreach ($challan_child2 as $challan_child2) {
                        $cn_no .= $challan_child2->consignment_no." / ";
                    }
                }
            }else{
                $cn_no;
            }
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Challan Date'=>date( 'd/m/y', strtotime($challan_data->date)),
                'Challan No'=>$challan_data->challan_no,
                'CN Numbers'=>$cn_no,
                'From'=>$challan_data->from,
                'Destination'=>$challan_data->to,
                'Truck No'=>$challan_data->truck_no,
                'Total Package'=>(float)$challan_child3->total_package,
                'Total Weight'=>(float)$challan_child3->total_gross_weight,
                'Freight Amount'=>(float)$challan_data->freight,
                'Advance Amount'=>(float)$challan_data->cash_advance,
                'Diesel Amount'=>(float)$challan_data->diesel,
                'Balance Amount'=>(float)$challan_data->balance,
                'Petrol Pump'=>$petrol_pump_name,
                'Payable At'=>$challan_data->balance_payable_at,
                'Declaration Submitted'=>$challan_data->declaration_submitted,
                'Entry By'=>$challan_data->created_user
            );
            $sl_no+=1;
        }

        $title="Date Wise Challan Data";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Date Wise Challan Data');
            $exel->sheet('Date Wise Challan Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:Q1')->applyFromArray($stylearray);
//                $total_column='P'.($sl_no+4);
//                $total_print='O'.($sl_no+4);
//                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
//                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
//                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
//                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }

    //Petrol Pump Report
    public function normal_petrol_pump_report (Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('petrol_pump_date_from'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '/' . $from_month . '/' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('petrol_pump_date_upto'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '/' . $upto_month . '/' . $upto_day);

        $petrol_pump_id = $request->petrol_pump;

        return View::make('Reporting.Transaction Reporting.Challan Report.normal_petrol_pump_record')->with('petrol_pump_id',$petrol_pump_id)->with('from_date',$from_date)->with('upto_date',$upto_date);
    }
    public function export_normal_petrol_pump_report(Request $request)
    {
        $from_date=$request->from_date;
        $upto_date=$request->upto_date;
        $petrol_pump_id=$request->petrol_pump_id;

        $challan_data= \App\Challan::whereBetween('date', array($from_date, $upto_date))
            ->where('petrol_pump_id',$petrol_pump_id)
            ->orderBy('challan_no', 'ASC')->
            get();

//        $consignment_data= \App\CockConsignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('to','=',$request->location)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;
//
        $newarray[]=array('SL. No.','Challan Date','Challan No','Petrol Pump Name','Diesel Amount'
        );
        $sl_no=1;

        foreach($challan_data as $challan_data){
            $petrol_pump_name=\App\Petrol_Pump::find($challan_data->petrol_pump_id);
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Challan Date'=>date( 'd/m/y', strtotime($challan_data->date)),
                'Challan No'=>$challan_data->challan_no,
                'Petrol Pump Name'=>$petrol_pump_name->name,
                'Diesel Amount'=>(float)$challan_data->diesel,

            );
            $sl_no+=1;
        }

        $title="Petrol Pump Data";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Petrol Pump Data');
            $exel->sheet('Petrol Pump Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:E1')->applyFromArray($stylearray);
//                $total_column='P'.($sl_no+4);
//                $total_print='O'.($sl_no+4);
//                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
//                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
//                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
//                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }

    public function export_coke_bill_report(Request $request)
    {


        $newarray_indent[]=array('SL. No.','Bill No','Bill Date','Party Name','Party Address','Total Amount'
        );
        $placement_info[]=array('Consignment Information'
        );
        $indent_info[]=array('Bill Information'
        );
        $blanck[]=array(
        );
        $newarray_indentplacement[]=array('SL. No.','Consignment No.','Consignment Date',
            'Destination','Vehicle No.','Weight','Total QTY','Freight','Detention',
            'SNT Charge','Toll Tax','Total Freight');
        $sl_no=1;


        $bill_data=\App\CokeFreightBill::where('bill_no','=',$request->bill_no)->first();


        $newarray_indent[]=array(
            'SL. No.'=>$sl_no,
            'Bill No.'=>$bill_data->bill_no,
            'Bill Date'=>date('d-m-Y', strtotime($bill_data->bill_date)),
            'Party Name'=>$bill_data->party_name,
            'Party Address'=>$bill_data->party_address,
            'Total Amount'=>$bill_data->total_amount,
        );

        $coke_bill_child_count=\App\CokeFreightBill_child::where('freight_bill_id','=',$bill_data->id)->count();
        if($coke_bill_child_count>0){
            $coke_bill_child=\App\CokeFreightBill_child::where('freight_bill_id','=',$bill_data->id)->get();
           $sl_no_1=1;
            foreach($coke_bill_child as $coke_bill_child) {

                $newarray_indentplacement[] = array(
                    'SL. No.' => $sl_no_1,
                    'Consignment No.' => $coke_bill_child->consignment_no,
                    'Consignment Date' =>date('d-m-Y', strtotime($coke_bill_child->consignment_date)),
                    'Destination' => $coke_bill_child->consignment_to,
                    'Vehicle No.' => $coke_bill_child->consignment_vehicle_no,
                    'Weight' => $coke_bill_child->weight,
                    'Total QTY' => $coke_bill_child->consignment_qty,
                    'Freight' => (float)$coke_bill_child->freight,
                    'Detention' => $coke_bill_child->detention,
                    'SNT Charge' => $coke_bill_child->snt_charge,
                    'Toll Tax' => $coke_bill_child->toll_tax,
                    'Total Freight' => $coke_bill_child->total_freight,
                );
                $sl_no_1+=1;
            }}else{
            $newarray_indentplacement[] = array('Consignment Not Added In This Bill Yet!!!');
        }
        $title="Coke Bill of ".$request->bill_no;
        Excel::Create($title,function($exel) use ($newarray_indent,$blanck,$indent_info,$newarray_indentplacement,$placement_info,$sl_no){
            $exel->setTitle('Coke Bill Data');
            $exel->sheet('Coke Bill Data',function($sheet) use ($newarray_indent,$blanck,$indent_info,$placement_info,$newarray_indentplacement,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($indent_info,null,null,true,false);
                $sheet->mergeCells('A1:F1');
                $sheet->getStyle('A1:F1')->applyFromArray($stylearray);
                $sheet->cell('A1:F1', function($cell) {
                    // manipulate the cell
                    $cell->setAlignment('center');
                });


                $sheet->fromArray($newarray_indent,null,null,true,false);
//                $sheet->mergeCells('A1:E1');
                $sheet->cell('A2:F2', function($cell) {
                    // manipulate the cell
                    $cell->setAlignment('center');
                });
                $sheet->getStyle('A2:L2')->applyFromArray($stylearray);

                $sheet->fromArray($blanck,null,null,true,false);
//                $sheet->mergeCells('A1:E1');

                $sheet->fromArray($placement_info,null,null,true,false);
                $sheet->mergeCells('A5:L5');
                $sheet->getStyle('A5:L5')->applyFromArray($stylearray);
                $sheet->cell('A5:L5', function($cell) {
                    // manipulate the cell
                    $cell->setAlignment('center');
                });

                $sheet->fromArray($newarray_indentplacement,null,null,true,false);
                $sheet->getStyle('A6:L6')->applyFromArray($stylearray);
            });
        })->export('xlsx');
    }


    public function unbilled_normal_challan_acknowledgement()
    {
        
    return view('Reporting.Transaction Reporting.Challan Report.unbilled_normal_challan_ackwnoledgement');
    }


    public function export_unbilled_normal_challan_acknowledgement_data(Request $request)
    {

        $newarray[]=array('Challan Number.','Date','From','Destination','Party Name');
        $challan = \App\Challan::all();
        foreach ($challan as $challan) {
        $cock_ack = \App\Acknowledgement::where('challan_number','=',$challan->challan_no)->count();
            $consignee_name="";
        $sl_no=1;
       
        

        if($cock_ack<=0){
            $coke_challan_child2_count=\App\Challan_Child2::where('challan_id','=',$challan->id)->count();
            if($coke_challan_child2_count==1){
                $coke_challan_child2 = \App\Challan_Child2::where('challan_id', '=', $challan->id)->first();
                $coke_consignment = \App\Consignment::find($coke_challan_child2->consignment_id);

                $consignee_name=$coke_consignment->consignee_name;
            }else{
                $coke_challan_child2=\App\Challan_Child2::where('challan_id','=',$challan->id)->get();
                foreach($coke_challan_child2 as $coke_challan_child2) {
                    $coke_consignment = \App\Consignment::find($coke_challan_child2->consignment_id);
                    $consignee_name .= $coke_consignment->consignee_name . " / ";
                }
            }
            $newarray[]=array(
                'Challan Number'=>$challan->challan_no,
                'Date'=>date( 'd/m/y', strtotime($challan->date)),
                'From'=>$challan->from,
                'Destination'=>$challan->to,
                'Party Name'=>$consignee_name

            );
            $sl_no+=1;
            }
        }
        $title="Unacknowledged Challan";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Unacknowledged Challan');
            $exel->sheet('Unacknowledged Challan',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:D1')->applyFromArray($stylearray);
            
            });
        })->export('xlsx');
    }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    public function pan_no_normal_challan_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('from_date3'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('upto_date3'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);


        $challan_data= \App\Challan::whereBetween('date', array($from_date, $upto_date))
            ->distinct()->select('pan_no')->get();

        $newarray[]=array('SL. No.','Pan No','Pan Holder Name','Freight','Advance','Diesel','Balance',
        );
        $sl_no=1;

        foreach($challan_data as $challan_data){
            $challan_freight= \App\Challan::whereBetween('date', array($from_date, $upto_date))
                ->where('pan_no','=',$challan_data->pan_no)->sum('freight');
            $challan_advance= \App\Challan::whereBetween('date', array($from_date, $upto_date))
                ->where('pan_no','=',$challan_data->pan_no)->sum('cash_advance');
            $challan_diesel= \App\Challan::whereBetween('date', array($from_date, $upto_date))
                ->where('pan_no','=',$challan_data->pan_no)->sum('diesel');
            $challan_balance= \App\Challan::whereBetween('date', array($from_date, $upto_date))
                ->where('pan_no','=',$challan_data->pan_no)->sum('balance');
            $challan_owner= \App\Challan::where('pan_no','=',$challan_data->pan_no)->first();
            $newarray[]=array(
                'SL No'=>$sl_no,
                'Pan No'=>$challan_data->pan_no,
                'Pan Holder Name'=>$challan_owner->owners_name,
                'Freight'=>(float)$challan_freight,
                'Advance'=>(float)$challan_advance,
                'Diesel'=>(float)$challan_diesel,
                'Balance'=>(float)$challan_balance,
            );
            $sl_no+=1;
        }

        $title="Pan Challan Data";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Pan Challan Data');
            $exel->sheet('Pan Challan Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:G1')->applyFromArray($stylearray);
//                $total_column='P'.($sl_no+4);
//                $total_print='O'.($sl_no+4);
//                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
//                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
//                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
//                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    
    
     public function detailed_normal_consignment_report(Request $request)
    {
        $date_wise_from_date = explode('/', $request->input('from_date3'));
        $from_day = $date_wise_from_date[0];
        $from_month = $date_wise_from_date[1];
        $from_year = $date_wise_from_date[2];
        $from_date=date($from_year . '-' . $from_month . '-' . $from_day);

        $date_wise_upto_date = explode('/', $request->input('upto_date3'));
        $upto_day = $date_wise_upto_date[0];
        $upto_month = $date_wise_upto_date[1];
        $upto_year = $date_wise_upto_date[2];
        $upto_date=date($upto_year . '-' . $upto_month . '-' . $upto_day);

        $location = $request->location3;
        $party_code = $request->party_name3;

        return View::make('Reporting.Transaction Reporting.detailed_normal_consignment_report')->with('location',$location)->with('from_date',$from_date)->with('upto_date',$upto_date)->with('party_code',$party_code);
    }

    public function export_detailed_normal_consignment_data(Request $request)
    {
        $party_code=$request->party_code;
        $location=$request->location;
        $from_date=$request->from_date;
        $upto_date=$request->upto_date;
        if ($party_code == "all" && $location == "all") {
            $consignment_data = \App\Consignment::whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->
                get();
            $area_consignment_count = \App\Consignment::
            whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->count();
        }
        elseif($party_code != "all" && $location == "all"){
            $consignment_data = \App\Consignment::where('party_code', '=', $party_code)
                ->whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->get();
            $area_consignment_count = \App\Consignment::where('party_code', '=', $party_code)
                ->whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->count();
        }
        elseif($party_code == "all" && $location != "all") {
            $consignment_data = \App\Consignment::where('to', '=', $location)
                ->whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->get();
            $area_consignment_count = \App\Consignment::where('to', '=', $location)
                ->whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->count();
        }
        elseif($party_code != "all" && $location != "all"){
            $consignment_data = \App\Consignment::where('party_code', '=', $party_code)
                ->where('to', '=', $location)
                ->whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->get();
            $area_consignment_count = \App\Consignment::where('party_code', '=', $party_code)
                ->where('to', '=', $location)
                ->whereBetween('con_date', array($from_date, $upto_date))
                ->orderBy('consignment_no', 'ASC')->count();
        }

//        $consignment_data= \App\CockConsignment::whereBetween('con_date', array($request->from_date, $request->upto_date))->where('to','=',$request->location)->orderBy('consignment_no', 'ASC')->get();
//        echo $doctor_bills;


        $newarray[]=array('SL. No.','Consignment Date','Consignment No','Trip ID','Load ID','From',
            'Destination','Party Name','Consignee Name',
            'Truck No','Total Package','Total Weight','Contains',
            'Invoice No','E-way Bill No & Validity','Consignment Value','Challan No','Broker Name',
            'Reporting Date','Unloading Date','No Of Days Detained','Bill No',
            'Total Freight for This CN in Bill','Entry By');
        $sl_no=1;

        foreach($consignment_data as $consignment_data){
            $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get();
            $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->first();
            $consignment_child_data= \App\Consignment_child::where('consignment_id','=',$consignment_data->id)->get();
            $consignment_child_count= \App\Consignment_child::where('consignment_id','=',$consignment_data->id)->count();
            $challan_child2_count= \App\Challan_Child2::where('consignment_id','=',$consignment_data->id)->count();
            $total_package=0;
            $total_weight=0;
            $invoice_no="";$eway_bill_no="";
            $challan_no="";$reporting_date="";$unloading_date="";
            $broker_name="";

            foreach($consignment_child2 as $consignment_child2){
                $total_package+=(float)$consignment_child2->package;
                $total_weight+=(float)$consignment_child2->gross_weight;
            }

            $num_amount=(float)$consignment_data->cn_value;
            //invoice and e-way-bill
            if($consignment_child_count>0) {
                if ($consignment_child_count == 1) {
                    foreach ($consignment_child_data as $consignment_child) {
                        $invoice_no = $consignment_child->invoice_no;
                        $eway_bill_no=$consignment_child->way_bill_no." ".date( 'd/m/Y', strtotime($consignment_child->validity));
                    }
                } else {
                    foreach ($consignment_child_data as $consignment_child) {
                        $invoice_no .= $consignment_child->invoice_no." / ";
                        $eway_bill_no .=$consignment_child->way_bill_no." ".date( 'd/m/Y', strtotime($consignment_child->validity))." , ";
                    }
                }
            }else{
                $invoice_no;
                $eway_bill_no;
            }
            //challan
            if($challan_child2_count>0) {
                $challan_child2= \App\Challan_Child2::where('consignment_id','=',$consignment_data->id)->first();
                $challan_data= \App\Challan::find($challan_child2->challan_id);
                $challan_no=$challan_data->challan_no;
                $broker_name=$challan_data->broker_name;
            }else{
                $challan_no;
                $broker_name;
            }
            //acknowledgement
            if($challan_child2_count>0){
                $acknowledgement_data= \App\Acknowledgement::where('challan_id','=',$challan_child2->challan_id)->first();
                $acknowledgement_count_data= \App\Acknowledgement::where('challan_id','=',$challan_child2->challan_id)->count();
                if($acknowledgement_count_data>0) {
                    $reporting_date = date('d/m/Y', strtotime($acknowledgement_data->reporting_date));
                    $unloading_date = date('d/m/Y', strtotime($acknowledgement_data->unloading_date));
                    $fdate = $acknowledgement_data->reporting_date;
                    $tdate = $acknowledgement_data->unloading_date;
                    $datetime1 = new DateTime($fdate);
                    $datetime2 = new DateTime($tdate);
                    $interval = $datetime1->diff($datetime2);
                    $days = $interval->format('%a');
                }
                else{
                    $reporting_date;
                    $unloading_date;
                    $days="";
                }}
            else{
                $reporting_date;
                $unloading_date;
                $days="";
            }
            $bill_freight_child_count= \App\Freightbill_child::where('consignment_id','=',$consignment_data->id)->count();
            if($bill_freight_child_count>0) {
                $bill_freight_child= \App\Freightbill_child::where('consignment_id','=',$consignment_data->id)->first();
                $bill_freight= \App\FreightBill::find($bill_freight_child->freight_bill_id);
                $bill_no = $bill_freight->bill_no;
                $total_freight_for_this_cn = (float)$bill_freight_child->total_freight;
            }
            else {
                $bill_no = "";
                $total_freight_for_this_cn = 0;
            }

            $newarray[]=array(
                'SL No'=>$sl_no,
                'Consignment Date'=>date( 'd/m/y', strtotime($consignment_data->con_date)),
                'Consignment No'=>$consignment_data->consignment_no,
                'Trip ID'=>$consignment_data->trip_id,
                'Load ID'=>$consignment_data->load_id,
                'From'=>$consignment_data->from,
                'Destination'=>$consignment_data->to,
                'Party Name'=>$consignment_data->consignor_name,
                'Consignee Name'=>$consignment_data->consignee_name,
                'Truck No'=>$consignment_data->truck_no,
                'Total Package'=>$total_package,
                'Total Weight'=>$total_weight,
                'Contains'=>$consignment_child1->category,
                'Invoice No'=>$invoice_no,
                'E-way Bill No & Validity'=>$eway_bill_no,
                'Consignment Value'=>$num_amount,
                'Challan No'=>$challan_no,
                'Broker Name'=>$broker_name,
                'Reporting Date'=>$reporting_date,
                'Unloading Date'=>$unloading_date,
                'No Of Days Detained'=>$days,
                'Bill No'=>$bill_no,
                'Total Freight for This CN in Bill'=>$total_freight_for_this_cn,
                'Entry By'=>$consignment_data->created_user
            );
            $sl_no+=1;
        }

        $title="Detailed Consignment Data";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Detailed Consignment Data');
            $exel->sheet('Detailed Consignment Data',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:W1')->applyFromArray($stylearray);
                $total_column='P'.($sl_no+4);
                $total_print='O'.($sl_no+4);
                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    
}

