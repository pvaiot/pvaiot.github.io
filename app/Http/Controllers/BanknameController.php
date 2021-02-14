<?php

namespace App\Http\Controllers;

use App\BankName;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class BanknameController extends Controller
{
    public function bank_name()
    {
        $bank_names= BankName::orderBy('id')->get();
        return View::make('bank_name.bank_name_panel')->with('area_bank_name',$bank_names);
    }

    public  function new_bank_name_entry(){
        return View::make('bank_name.new_bank_name_entry');
    }

    public function store_bank_name_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'bank_name'=>'required|unique:bank_name',
        ]);

        $bank_names= new BankName();
        $bank_names->bank_name = $request->bank_name;
        $bank_names->save();


        Session::flash('flash_message', 'New Bank Name Record Successfully Created!');

        return redirect()->route('new_bank_name_entry');
    }


    public function edit_bank_name(Request $request,$id){

        $data = BankName::find($id);
//        print_r($data);
//        die();
        return View::make('bank_name.edit_bank_name')->with('bank',$data);
    }


    public function update_bank_name(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $bank_names= BankName::find($id);
        $bank_names->bank_name = $request->bank_name;
        $bank_names->save();

        Session::flash('flash_message', 'New Bank Name Successfully Updated!');

        return redirect()->route('bank_name');

    }

    public function view_bank_name($id){

        $data = BankName::find($id);
        return View::make('bank_name.view_bank_name')->with('bank',$data);
    }

    public function delete_bank_name($id)
    {

        try{
            $item= new BankName();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Bank Name Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
