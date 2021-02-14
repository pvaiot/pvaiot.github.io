<?php

namespace App\Http\Controllers;

use App\BankName;
use App\location;
use App\Bankaccount;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class BankaccountController extends Controller
{

    public function bank_account()
    {
        $bank_accounts= Bankaccount::orderBy('id')->get();
        return View::make('bank_account.bank_account_panel')->with('area_bank_account',$bank_accounts);
    }

    public  function new_bank_account_entry(){
        return View::make('bank_account.new_bank_account_entry');
    }

    public function store_bank_account_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'bank_account_no'=>'required|unique:bank_account',
        ]);

        $bank_accounts= new Bankaccount();

        $bank_accounts->bank_id = $request->bank_name;
        $bankname =BankName::find($request->bank_name);
        if(!empty($bankname)) {
            $bank_accounts->bank_name = $bankname->bank_name;
        }

        $bank_accounts->account_holder_name = $request->account_holder_name;
        $bank_accounts->bank_account_no = $request->bank_account_no;
        $bank_accounts->ifsc_code = $request->ifsc_code;
        $bank_accounts->bank_address = $request->bank_address;
        $bank_accounts->save();


        Session::flash('flash_message', 'New Bank Account Record Successfully Created!');

        return redirect()->route('new_bank_account_entry');
    }


    public function edit_bank_account(Request $request,$id){

        $data = Bankaccount::find($id);
//        print_r($data);
//        die();
        return View::make('bank_account.edit_bank_account')->with('bankacc',$data);
    }


    public function update_bank_account(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $bank_accounts= Bankaccount::find($id);

        $bank_accounts->bank_id = $request->bank_name;
        $bankname =BankName::find($request->bank_name);
        if(!empty($bankname)) {
            $bank_accounts->bank_name = $bankname->bank_name;
        }
        $bank_accounts->account_holder_name = $request->account_holder_name;
        $bank_accounts->bank_account_no = $request->bank_account_no;
        $bank_accounts->ifsc_code = $request->ifsc_code;
        $bank_accounts->bank_address = $request->bank_address;
        $bank_accounts->save();

        Session::flash('flash_message', 'New Bank Account Successfully Updated!');

        return redirect()->route('bank_account');

    }

    public function view_bank_account($id){

        $data = Bankaccount::find($id);
        return View::make('bank_account.view_bank_account')->with('bankacc',$data);
    }

    public function delete_bank_account($id)
    {

        try{
            $item= new Bankaccount();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Bank Account Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
