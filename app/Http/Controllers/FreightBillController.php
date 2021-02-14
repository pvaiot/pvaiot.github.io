<?php

namespace App\Http\Controllers;
use App\Acknowledgement;
use App\acknowledgementChild;
use App\Challan;
use App\Consignment;
use App\Freightbill_child;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;
use Session;
use App\FreightBill;
use Illuminate\Http\Request;
use \PDF;

class FreightBillController extends Controller
{

    public function invoice(){

        return view('invoices.invoice_index');
    }
    public function invoicealter(){

        $freightbill= FreightBill::orderBy('id')->get();
        return View::make('invoices.invoicealter')->with('area_freightbill',$freightbill);
    }
    public function AjaxGet_consignment_no($id){

//        $data = DB::table("acknowledgement")->where("challan_number",$id)->first();
//        $data1 = DB::table("acknowledgement_child")->where("acknowledgement_id",$data->id)->first();

        $data = DB::table("consignment")->where("consignment_no",$id)->first();
        $data1 = DB::table("consignment_child")->where("consignment_id",$data->id)->get();
        $data_invoice = DB::table("consignment_child")->where("consignment_id",$data->id)->first();
        $data2 = DB::table("consignment_child2")->where("consignment_id",$data->id)->get();
        $challan_no_data=DB::table("challan_child2")->where("consignment_no",$id)->first();
        $acknowledgement_data = DB::table("acknowledgement")->where("challan_id",$challan_no_data->challan_id)->first();
        $totalweight=0;
        $totalpackage=0;
        $invoice_second1="";
foreach($data2 as $data2){
    $totalweight +=$data2->gross_weight;
    $totalpackage +=$data2->package;
}
        $invoice_first = substr($data_invoice->invoice_no, 0,-2);
        foreach($data1 as $data1){
            $invoice_second = substr($data1->invoice_no, -2);
            $invoice_second1.=$invoice_second." / ";
        }
        $final_invoice_value=$invoice_first.substr($invoice_second1, 0,-2);
//        print_r($data);
//        die();


//print_r($totalpackage);
//        die();
//        $sub = "1234567890";
//
//        $year = substr($sub, 0,-2);
//        $mon = substr($sub, -2);
//        print_r($year.$mon);
        return json_encode(array(
                'consignment_date'=>date('d/m/Y',strtotime($data->con_date)),
                'confrom'=>$data->from,
                'consignment_no'=>$data->consignment_no,
                'conto'=>$data->to,
                'vehicle_no'=>$data->truck_no,
                'received_qty'=>$totalpackage,
                'weight'=>$totalweight,
                'invoice_no'=>$final_invoice_value
                )
        );
    }
    public function AjaxGet_party_code($id){

        $data = DB::table("party")->where("party_code",$id)->first();

        return json_encode(array(
                'name'=>$data->name,
                'address'=>$data->address
            )
        );
    }
    public function AjaxGet_getConsignment_data_for_normalbill($id)
    {

        $data = DB::table("consignment")->where("consignment_no", $id)->first();
        $data1 = DB::table("consignment_child")->where("consignment_id",$data->id)->get();
        $data_invoice = DB::table("consignment_child")->where("consignment_id",$data->id)->first();
        $data2 = DB::table("consignment_child2")->where("consignment_id",$data->id)->get();
        $totalweight=0;
        $totalpackage=0;
        $invoice_second1="";
        foreach($data2 as $data2){
            $totalweight +=$data2->gross_weight;
            $totalpackage +=$data2->package;
        }
        $invoice_first = substr($data_invoice->invoice_no, 0,-2);
        foreach($data1 as $data1){
            $invoice_second = substr($data1->invoice_no, -2);
            $invoice_second1.=$invoice_second." / ";
        }
        $final_invoice_value=$invoice_first.substr($invoice_second1, 0,-2);
//        print_r($final_invoice_value);
//        die();
        return json_encode(array(
                'consignment_date'=>date('d/m/Y',strtotime($data->con_date)),
                'from'=>$data->from,
                'consignment_no'=>$data->consignment_no,
                'consignment_id'=>$data->id,
                'to'=>$data->to,
                'vehicle_no'=>$data->truck_no,
                'received_qty'=>$totalpackage,
                'weight'=>$totalweight,
                'invoice_no'=>$final_invoice_value
            )
        );
    }
    public function store_freight_bill_entry(Request $request)
    {

        $this->validate($request, [
            'bill_no' => 'required|unique:coke_freight_bill',
        ]);
        try{
            DB::beginTransaction();
            $input2 = $request->input('rows2');



            $freight_bill = new FreightBill();
            $freight_bill_date = explode('/', $request->input('bill_date'));
            $freight_bill_day = $freight_bill_date[0];
            $freight_bill_month = $freight_bill_date[1];
            $freight_bill_year = $freight_bill_date[2];
            $freight_bill->bill_date = date($freight_bill_year . '/' . $freight_bill_month . '/' . $freight_bill_day);
            $freight_bill->bill_no = $request->bill_no;
            $freight_bill->customer_gstin = $request->customer_gstin;
            $freight_bill->party_code = $request->party_code;
            $freight_bill->party_name = $request->party_name;
            $freight_bill->party_address = $request->party_address;
            $freight_bill->branch_code = $request->branch_code;
            $freight_bill->gst_type = $request->with_gst;
            $freight_bill->total_amount = $request->total_amount;
            $freight_bill->sgst_per = $request->gst_per;
            $freight_bill->cgst_per = $request->cgst_per;
            $freight_bill->igst_per = $request->igst_per;
            $freight_bill->sgst_value = $request->total_gst;
            $freight_bill->cgst_value = $request->total_cgst;
            $freight_bill->igst_value = $request->total_igst;
            $freight_bill->total_gst_amount = $request->total_gst_amount;
            $freight_bill->net_amount = $request->net_amount;
            $freight_bill->words_amount_value = $request->full_amount_word;
            $freight_bill->total_amount_in_words = $this->amount_in_words($request->full_amount_word);
            $freight_bill->hide_weight = $request->hide_weight;
            $freight_bill->save();

            foreach ($input2 as $row) {

                $flight = new Freightbill_child();
                $flight->freight_bill_id = $freight_bill->id;
                $flight->consignment_id = $row['consignment_no_id_added'];
                $flight->consignment_no = $row['consignment_no_added'];
                $consignment_date = explode('/', $row['date_added']);
                $invoice_day = $consignment_date[0];
                $invoice_month = $consignment_date[1];
                $invoice_year = $consignment_date[2];
                $flight->consignment_date = date($invoice_year . '/' . $invoice_month . '/' . $invoice_day);

                $flight->invoice_no = $row['invoiceno_added'];
                $flight->consignment_to = $row['to_added'];
                $flight->consignment_vehicle_no = $row['truck_no_added'];
                $flight->weight = $row['weight_added'];
                $flight->consignment_qty = $row['qty_added'];
                $flight->freight = $row['freight_added'];
                $flight->detention = $row['detention_added'];
                $flight->loading_charge = $row['loading_charge_added'];
                $flight->unloading_charge = $row['unloading_charge_added'];
                $flight->total_freight = $row['Totalfreight_added'];

                $flight->save();
            }

            DB::commit();
            Session::flash('flash_message', 'New Bill Record  successfully Created!');
            return redirect()->route('invoice')->with('status', $freight_bill->id);


        } catch(\Exception $e){
            DB::rollback();
            Session::flash('flash_message_error', 'Network Problem Please try again');
            return redirect()->back();
//echo $e->getMessage();
        }
    }

public function view_freight_bill($id){

    $data = FreightBill::find($id);
    return View::make('invoices.view_freight_bill')->with('ack',$data);
}
    public function delete_invoice($id)
    {

        try{
            $item= new FreightBill();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Freight Bill successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }

    public function edit_invoice(Request $request,$id){

        $data = FreightBill::find($id);
        return View::make('invoices.edit_invoice')->with('bata',$data);
    }
    public function update_invoice_freight_bill(Request $request,$id){
                $input2 = $request->input('rows2');
                $freight_bill=FreightBill::find($id);
                $freight_bill_date = explode('/', $request->input('bill_date'));
                $freight_bill_day = $freight_bill_date[0];
                $freight_bill_month = $freight_bill_date[1];
                $freight_bill_year = $freight_bill_date[2];
                $freight_bill->bill_date = date($freight_bill_year . '/' . $freight_bill_month . '/' . $freight_bill_day);
                $freight_bill->bill_no = $request->bill_no;
                $freight_bill->customer_gstin = $request->customer_gstin;
                $freight_bill->party_code = $request->party_code;
                $freight_bill->party_name = $request->party_name;
                $freight_bill->party_address = $request->party_address;
                $freight_bill->branch_code = $request->branch_code;
                $freight_bill->gst_type = $request->with_gst;
                $freight_bill->total_amount = $request->total_amount;
                $freight_bill->sgst_per = $request->gst_per;
                $freight_bill->cgst_per = $request->cgst_per;
                $freight_bill->igst_per = $request->igst_per;
                $freight_bill->sgst_value = $request->total_gst;
                $freight_bill->cgst_value = $request->total_cgst;
                $freight_bill->igst_value = $request->total_igst;
                $freight_bill->total_gst_amount = $request->total_gst_amount;
                $freight_bill->net_amount = $request->net_amount;
                $freight_bill->words_amount_value = $request->full_amount_word;
                $freight_bill->total_amount_in_words = $this->amount_in_words($request->full_amount_word);
                $freight_bill->hide_weight = $request->hide_weight;
                $freight_bill->save();


            $item= new Freightbill_child();
            $item::where('freight_bill_id',$id)->delete();
                foreach ($input2 as $row) {

                    $flight = new Freightbill_child();
                    $flight->freight_bill_id = $freight_bill->id;
                    $flight->consignment_id = $row['consignment_no_id_added'];
                    $flight->consignment_no = $row['consignment_no_added'];
                    $consignment_date = explode('/', $row['date_added']);
                    $invoice_day = $consignment_date[0];
                    $invoice_month = $consignment_date[1];
                    $invoice_year = $consignment_date[2];
                    $flight->consignment_date = date($invoice_year . '/' . $invoice_month . '/' . $invoice_day);

                    $flight->invoice_no = $row['invoiceno_added'];
                    $flight->consignment_to = $row['to_added'];
                    $flight->consignment_vehicle_no = $row['truck_no_added'];
                    $flight->weight = $row['weight_added'];
                    $flight->consignment_qty = $row['qty_added'];
                    $flight->freight = $row['freight_added'];
                    $flight->detention = $row['detention_added'];
                    $flight->loading_charge = $row['loading_charge_added'];
                    $flight->unloading_charge = $row['unloading_charge_added'];
                    $flight->total_freight = $row['Totalfreight_added'];

                    $flight->save();
                }
            Session::flash('flash_message', 'Freight Bill Record  successfully Updated!');

            return redirect()->route('invoicealter');
        }
//        if($request->input('date')!="") {
//            $freightbilldate = explode('/', $request->input('bill_date'));
//            $freightbillDay = $freightbilldate[0];
//            $freightbillMonth = $freightbilldate[1];
//            $freightbillYear = $freightbilldate[2];
//        }
//        $input = $request->input('rows');
//        $freightbill=FreightBill::find($id);
//
//        if($request->input('date')!=""){
//            $freightbill->bill_date = date($freightbillYear . '/' . $freightbillMonth . '/' . $freightbillDay);
//        }
//
//        $freightbill->branch_code = $request->branch_code;
//        $freightbill->bill_no = $request->bill_no;
//        $freightbill->customer_gstin = $request->customer_gstin;
//        $freightbill->party_code = $request->party_code;
//        $freightbill->gst_type = $request->with_gst;
//        $freightbill->consignment_no = $request->consignment_no;
//        $freightbill->qty = $request->qty;
//        $freightbill->freight = $request->freight;
//        $freightbill->detention = $request->detention;
//        $freightbill->labour = $request->labour;
//        $freightbill->cock_lr_no = $request->cocklr;
//        $freightbill->invoice_no = $request->invoiceno;
//        $freightbill->snt_charge = $request->sntcharge;
//        $freightbill->toll_tax = $request->tolltax;
//        $freightbill->weight = $request->weight;
//        $freightbill->total_amount = $request->total_amount;
//        if($request->with_gst == 1){
//            $freightbill->rate_of_gst= $request->gst_per+$request->cgst_per;
//            $freightbill->rate_of_igst= 0;
//        }else{
//            $freightbill->rate_of_gst= 0;
//            $freightbill->rate_of_igst= $request->igst_per;
//        }
//
//
//
//
//        $freightbill->net_amount = $request->net_amount;
//        $freightbill->net_amount_in_word =$this->amount_in_words($request->net_amount);
//        $freightbill->save();
//
//        $item= new Freightbill_child();
//        $item::where('freight_bill_id',$id)->delete();
//        $flight= new Freightbill_child();
//        $flight->freight_bill_id = $freightbill->id;
//        $flight->consignment_no = $request->consignment_no;
//        $flight->rate_of_cgst = $request->gst_per;
//        $flight->cgst_amount = $request->total_gst;
//        $flight->rate_of_sgst = $request->cgst_per;
//        $flight->sgst_amount = $request->total_cgst;
//        $flight->rate_of_igst = $request->igst_per;
//        $flight->igst_amount = $request->total_igst;
//        $flight->save();
//
//
//
//
//
//        Session::flash('flash_message', 'Freight Bill Record  successfully Updated!');
//
//        return redirect()->route('invoicealter');
//
//
//    }
//    public  function print_invoice($id){
//
//        return View::make('pdf.freight_bill')->with('bill', $freight_bill);
//    }
//     public  function print_invoice($id){
// //        $bill_data=FreightBill::find($id);
// ////        $challan= acknowledgement::find($id);
// //        $data = DB::table("consignment")->where("consignment_no",$bill_data->consignment_no)->first();
// //        $challan_no_data=DB::table("challan_child2")->where("consignment_no",$data->consignment_no)->first();
// //        $acknowledgement_data = DB::table("acknowledgement")->where("challan_id",$challan_no_data->challan_id)->first();
//         $freight_bill= FreightBill::find($id);
//         $pdf=PDF::loadView('pdf.freight_bill', ['bill'=>$freight_bill])->setPaper('a4','landscape');
// //        $filename=$challan->challan_no;
//         $filename="Hello";
//         return $pdf->stream($filename.'.pdf');
//     }
public  function print_invoice($id){
        $freight_bill= FreightBill::find($id);
        return View::make('pdf.freight_bill')->with('bill', $freight_bill);
    }

    static function amount_in_words($amount){
        $number = $amount;
        $no = round($number);
        $point = round($number - $no, 2) * 100;
        $hundred = null;
        $digits_1 = strlen($no);
        $i = 0;
        $str = array();
        $words = array('0' => '', '1' => 'One', '2' => 'Two',
            '3' => 'Three', '4' => 'Four', '5' => 'Five', '6' => 'Six',
            '7' => 'Seven', '8' => 'Eight', '9' => 'Nine',
            '10' => 'Ten', '11' => 'Eleven', '12' => 'Twelve',
            '13' => 'Thirteen', '14' => 'Fourteen',
            '15' => 'Fifteen', '16' => 'Sixteen', '17' => 'Seventeen',
            '18' => 'Eighteen', '19' =>'Nineteen', '20' => 'Twenty',
            '30' => 'Thirty', '40' => 'Forty', '50' => 'Fifty',
            '60' => 'Sixty', '70' => 'Seventy',
            '80' => 'Eighty', '90' => 'Ninety');
        $digits = array('', 'Hundred', 'Thousand', 'Lakh', 'Crore');
        while ($i < $digits_1) {
            $divider = ($i == 2) ? 10 : 100;
            $number = floor($no % $divider);
            $no = floor($no / $divider);
            $i += ($divider == 10) ? 1 : 2;
            if ($number) {
                $plural = (($counter = count($str)) && $number > 9) ? 's' : null;
                $hundred = ($counter == 1 && $str[0]) ? ' and ' : null;
                $str [] = ($number < 21) ? $words[$number] .
                    " " . $digits[$counter] . $plural . " " . $hundred
                    :
                    $words[floor($number / 10) * 10]
                    . " " . $words[$number % 10] . " "
                    . $digits[$counter] . $plural . " " . $hundred;
            } else $str[] = null;
        }
        $str = array_reverse($str);
        $result = implode('', $str);
        $points = ($point) ?
            "." . $words[$point / 10] . " " .
            $words[$point = $point % 10] : '';
        return $result . "Rupees  " . $points . "Only";
    }
}
