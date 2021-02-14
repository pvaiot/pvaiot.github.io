<?php

namespace App\Http\Controllers;

use App\CokeFreightBill;
use App\CokeFreightBill_child;
use \PDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;

class CokeFreightBillController extends Controller
{
    public function coke_bill()
    {

        return View::make('Coke_freight_Bill.new_coke_fright_bill');
    }
    public function coke_bill_panel()
    {
        $fright_bill = CokeFreightBill::orderBy('id')->get();
        return View::make('Coke_freight_Bill.coke_freight_bill_panel')->with('area_bill', $fright_bill);
    }

    public function AjaxGet_getConsignment_data_for_bill($id)
    {

        $data = DB::table("cock_consignment")->where("consignment_no", $id)->first();
        $data1 = DB::table("cock_consignment_child")->where("consignment_id",$data->id)->get();
        $data_invoice = DB::table("cock_consignment_child")->where("consignment_id",$data->id)->first();
        $data2 = DB::table("cock_consignment_child2")->where("consignment_id",$data->id)->get();
        if($data->trip_id==""){
            $cock_lr_no=$data->load_id;
        }else{
            $cock_lr_no=$data->trip_id;
        }
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
                'invoice_no'=>$final_invoice_value,
                'cock_lr_no'=>$cock_lr_no
                )
        );
    }
public function AjaxGet_trip_id_check($id)
    {

        $data = DB::table("cock_consignment")->where("trip_id", $id)->first();
        return json_encode(array(
                'consignment_no'=>$data->consignment_no,
            )
        );
    }
    public function AjaxGet_load_id_check($id)
    {

        $data = DB::table("cock_consignment")->where("load_id", $id)->first();
        return json_encode(array(
                'consignment_no'=>$data->consignment_no,
            )
        );
    }


    public function store_coke_freight_bill_entry(Request $request)
    {
        set_time_limit(0);

//        $data = Input::all();
//        print_r($data);
//        die();

        $this->validate($request, [
            'bill_no' => 'required|unique:coke_freight_bill',
        ]);
        try{
            DB::beginTransaction();
        $input2 = $request->input('rows2');



        $freight_bill = new CokeFreightBill();
        $freight_bill_date = explode('/', $request->input('bill_date'));
        $freight_bill_day = $freight_bill_date[0];
        $freight_bill_month = $freight_bill_date[1];
        $freight_bill_year = $freight_bill_date[2];
        $freight_bill->bill_date = date($freight_bill_year . '/' . $freight_bill_month . '/' . $freight_bill_day);
        $freight_bill->bill_no = $request->bill_no;
        $freight_bill->party_code = $request->party_code;
        $freight_bill->party_name = $request->party_name;
        $freight_bill->party_address = $request->party_address;
        $freight_bill->branch_code = $request->branch_code;
        $freight_bill->total_amount = $request->full_amount;
        $freight_bill->words_amount_value = $request->full_amount_word;
        $freight_bill->total_amount_in_words = $this->amount_in_words($request->full_amount_word);
        $freight_bill->save();

        foreach ($input2 as $row) {

            $flight = new CokeFreightBill_child();
            $flight->freight_bill_id = $freight_bill->id;
            $flight->consignment_id = $row['consignment_no_id_added'];
            $flight->consignment_no = $row['consignment_no_added'];
            $flight->cock_lr_no = $row['coke_lr_no'];

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
            $flight->snt_charge = $row['snt_added'];
            $flight->toll_tax = $row['tolltax_added'];
            $flight->total_freight = $row['Totalfreight_added'];

            $flight->save();
            }

            DB::commit();
            Session::flash('flash_message', 'New Bill Record  successfully Created!');
            return redirect()->route('coke_bill')->with('status', $freight_bill->id);


        } catch(\Exception $e){
            DB::rollback();
            Session::flash('flash_message_error', 'Network Problem Please try again');
            return redirect()->back();
//echo $e->getMessage();
        }
    }

    public  function print_coke_bill($id){
        $freight_bill= CokeFreightBill::find($id);
        return View::make('pdf.coke_freight_bill')->with('bill', $freight_bill);
    }
    public function edit_freight_coke_bill($id){

        $data = CokeFreightBill::find($id);
//        print_r($data);
//        die();

        return View::make('Coke_freight_Bill.edit_coke_freight_bill')->with('bata',$data);
    }

    public function update_freight_bill(Request $request, $id)
    {
        set_time_limit(0);
        $input2 = $request->input('rows2');

        $freight_bill = CokeFreightBill::find($id);
        $freight_bill_date = explode('/', $request->input('bill_date'));
        $freight_bill_day = $freight_bill_date[0];
        $freight_bill_month = $freight_bill_date[1];
        $freight_bill_year = $freight_bill_date[2];
        $freight_bill->bill_date = date($freight_bill_year . '/' . $freight_bill_month . '/' . $freight_bill_day);
        $freight_bill->bill_no = $request->bill_no;
        $freight_bill->party_code = $request->party_code;
        $freight_bill->party_name = $request->party_name;
        $freight_bill->party_address = $request->party_address;
        $freight_bill->branch_code = $request->branch_code;
        $freight_bill->total_amount = $request->full_amount;
        $freight_bill->words_amount_value = $request->full_amount_word;
        $freight_bill->total_amount_in_words = $this->amount_in_words($request->full_amount_word);
        $freight_bill->save();


        $item= new CokeFreightBill_child();
        $item::where('freight_bill_id',$id)->delete();

        foreach ($input2 as $row) {

            $flight = new CokeFreightBill_child();
            $flight->freight_bill_id = $freight_bill->id;
            $flight->consignment_id = $row['consignment_no_id_added'];
            $flight->consignment_no = $row['consignment_no_added'];
            $flight->cock_lr_no = $row['coke_lr_no'];

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
            $flight->snt_charge = $row['snt_added'];
            $flight->toll_tax = $row['tolltax_added'];
            $flight->total_freight = $row['Totalfreight_added'];

            $flight->save();
        }
        Session::flash('flash_message', 'New Bill Record  successfully Updated!');
        return redirect()->route('coke_bill_panel');
    }



    public function delete_coke_bill($id)
    {
        try{
            $item= new CokeFreightBill();
            $item::find($id)->delete();
            Session::flash('flash_message', 'Selected Challan successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
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
        return $result . " " . $points . "Only";
    }

}
