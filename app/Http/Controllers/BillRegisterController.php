<?php

namespace App\Http\Controllers;

use App\BillRegister;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use Maatwebsite\Excel\Facades\Excel;

class BillRegisterController extends Controller
{
    public function new_bill_register_entry()
    {
        return View::make('Reporting.Coke Bill Report.coke_bill_register');
    }
    public function view_bill_register_entry()
    {
        return View::make('Reporting.Coke Bill Report.coke_bill_register_view');
    }
    public function store_bill_register(Request $request)
    {
        try{
            DB::beginTransaction();
            $input = $request->input('rows2');

            BillRegister::truncate();
            foreach ($input as $row) {
                $flight = new BillRegister();
                $flight->bill_no = $row['bill_no'];
                $bill_date = explode('/', $row['bill_date']);
                $bill_day = $bill_date[0];
                $bill_month = $bill_date[1];
                $bill_year = $bill_date[2];
                $flight->bill_date = date($bill_year . '/' . $bill_month . '/' . $bill_day);
                $flight->party_name = $row['party_name'];
                $flight->bill_amount = $row['bill_amount'];
                if($row['payment_receive_date']!="") {
                    $payment_receive_date = explode('/', $row['payment_receive_date']);
                    $payment_receive_day = $payment_receive_date[0];
                    $payment_receive_month = $payment_receive_date[1];
                    $payment_receive_year = $payment_receive_date[2];
                    $flight->payment_receive_date = date($payment_receive_year . '/' . $payment_receive_month . '/' . $payment_receive_day);
                }
                $flight->payment_receive_amount = $row['payment_receive_amount'];
                $flight->tds = $row['tds'];
                $flight->deduction = $row['deduction'];
                $flight->after_deduction_payment = $row['after_deduction_payment'];
                $flight->payment_receive_from = $row['payment_receive_from'];
                $flight->transaction_reference = $row['transaction_ref'];
                $flight->payment_credit = $row['payment_credit'];
                $flight->save();
            }
            DB::commit();
            Session::flash('flash_message', 'Bill Register Record Successfully Saved!');
            return redirect()->route('view_bill_register_entry');



        } catch(\Exception $e){
            DB::rollback();
            Session::flash('flash_message_error', 'Network Problem Please try again');
            return redirect()->back();
//echo $e->getMessage();
        }
    }

    public function export_bill_register()
    {
        $con_child = \App\CokeFreightBill::select('bill_no','bill_date','party_name','total_amount')->orderBy('bill_no', 'ASC')->get();
        $new1=\GuzzleHttp\json_decode($con_child,true);
        $con_child2 = \App\FreightBill::select('bill_no','bill_date','party_name','total_amount')->orderBy('bill_no', 'ASC')->get();
        $new2=\GuzzleHttp\json_decode($con_child2,true);
        $con_child3=array_merge($new1,$new2);
        asort($con_child3);
        $count2=0; $index=1;
        $sl_no=1;


        $newarray[]=array('SL. No.','Bill No','Bill Date','Party Name','Bill Amount','Payment Receive Date',
            'Payment Receive Amount','TDS','Deduction','After Deduction Payment',
            'Payment Rec From','Transaction Reference','Payment Credit'
        );
        $payment_date="";
        foreach($con_child3 as $child123) {
            $bill_register_data_count = BillRegister::where('bill_no', '=', $child123['bill_no'])->count();
            if ($bill_register_data_count <= 0) {
                $bill_register=new BillRegister();
                $bill_register->bill_no=$child123['bill_no'];
                $bill_register->bill_date=$child123['bill_date'];
                $bill_register->party_name=$child123['party_name'];
                $bill_register->bill_amount=$child123['total_amount'];
                $bill_register->save();
            }
        }
        foreach($con_child3 as $child){
            $bill_register_data=BillRegister::where('bill_no','=',$child['bill_no'])->first();
            if($bill_register_data->payment_receive_date!=""){
                $payment_date=date( 'd/m/y', strtotime($bill_register_data->payment_receive_date));
            }else{
                $payment_date="";
            }

            $newarray[]=array(
                'SL No'=>$sl_no,
                'Bill No'=>$child['bill_no'],
                'Bill Date'=>date( 'd/m/y', strtotime($child['bill_date'])),
                'Party Name'=>$child['party_name'],
                'Bill Amount'=>(float)$child['total_amount'],
                'Payment Receive Date'=>$payment_date,
                'Payment Receive Amount'=>(float)$bill_register_data->payment_receive_amount,
                'TDS'=>(float)$bill_register_data->tds,
                'Deduction'=>(float)$bill_register_data->deduction,
                'After Deduction Payment'=>(float)$bill_register_data->after_deduction_payment,
                'Payment Rec From'=>$bill_register_data->payment_receive_from,
                'Transaction Reference'=>$bill_register_data->transaction_reference,
                'Payment Credit'=>$bill_register_data->payment_credit,

            );
            $sl_no+=1;
        }

        $title="Bill Register";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Bill Register');
            $exel->sheet('Bill Register',function($sheet) use ($newarray,$sl_no){
                $stylearray=[
                    'font'=>[
                        'bold'=>true,
                    ]
                ];
                $sheet->fromArray($newarray,null,null,false,false);
                $sheet->getStyle('A1:M1')->applyFromArray($stylearray);
//                $total_column='P'.($sl_no+4);
//                $total_print='O'.($sl_no+4);
//                $total_sum='=ROUND(SUM(P2:P'.$sl_no.'),2)';
//                $sheet->getStyle($total_print.':'.$total_column)->applyFromArray($stylearray);
//                $sheet->setCellValue($total_print,'TOTAL CONSIGNMENT VALUE');
//                $sheet->setCellValue($total_column,$total_sum);
            });
        })->export('xlsx');
    }
    public function export_unpaid_bill()
    {
        $con_child = \App\CokeFreightBill::select('bill_no','bill_date','party_name','total_amount')->orderBy('bill_no', 'ASC')->get();
        $new1=\GuzzleHttp\json_decode($con_child,true);
        $con_child2 = \App\FreightBill::select('bill_no','bill_date','party_name','total_amount')->orderBy('bill_no', 'ASC')->get();
        $new2=\GuzzleHttp\json_decode($con_child2,true);
        $con_child3=array_merge($new1,$new2);
        asort($con_child3);
        $count2=0; $index=1;
        $sl_no=1;


        $newarray[]=array('SL. No.','Bill No','Bill Date','Party Name','Bill Amount');
        $payment_date="";
        foreach($con_child3 as $child){
            $bill_register_data=BillRegister::where('bill_no','=',$child['bill_no'])->first();
//            print_r($bill_register_data);
            if(!empty($bill_register_data)) {
            if($bill_register_data->payment_receive_amount<=0||$bill_register_data->payment_receive_amount=="") {
                $newarray[] = array(
                    'SL No' => $sl_no,
                    'Bill No' => $child['bill_no'],
                    'Bill Date' => date('d/m/y', strtotime($child['bill_date'])),
                    'Party Name' => $child['party_name'],
                    'Bill Amount' => (float)$child['total_amount'],
                );
                $sl_no += 1;
            }
            }else{
                $newarray[] = array(
                    'SL No' => $sl_no,
                    'Bill No' => $child['bill_no'],
                    'Bill Date' => date('d/m/y', strtotime($child['bill_date'])),
                    'Party Name' => $child['party_name'],
                    'Bill Amount' => (float)$child['total_amount'],
                );
                $sl_no += 1;
            }
        }
        $title="Bill Register";
        Excel::Create($title,function($exel) use ($newarray,$sl_no){
            $exel->setTitle('Due Bill');
            $exel->sheet('Due Bill',function($sheet) use ($newarray,$sl_no){
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
}
