<?php

namespace App\Http\Controllers;

use App\Branch;
use App\Party;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class PartyController extends Controller
{
    public function party()
    {
        $partys= Party::orderBy('id')->get();
        return View::make('party.party_panel')->with('area_party',$partys);
    }

    public  function new_party_entry(){
        return View::make('party.new_party_entry');
    }

    public function store_party_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();


        $partys= new Party();
        $partys->name = $request->name;
        $partys->party_code = $request->party_code;
        $partys->pan_no = $request->pan_no;
        $partys->gst_no = $request->gst_no;
        $partys->address = $request->address;
        $partys->mobile_no = $request->mobile_no;
        $partys->contact_no = $request->contact_no;
        $partys->land_line_no = $request->land_line_no;
        $partys->email_id = $request->email_id;
        $partys->save();

        Session::flash('flash_message', 'New Party Record Successfully Created!');

        return redirect()->route('new_party_entry');
    }

    public function edit_party(Request $request,$id){

        $data = Party::find($id);
//        print_r($data);
//        die();
        return View::make('party.edit_party')->with('part',$data);
    }

    public function update_party(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $partys= Party::find($id);
        $partys->name = $request->name;
        $partys->party_code = $request->party_code;
        $partys->pan_no = $request->pan_no;
        $partys->gst_no = $request->gst_no;
        $partys->address = $request->address;
        $partys->mobile_no = $request->mobile_no;
        $partys->contact_no = $request->contact_no;
        $partys->land_line_no = $request->land_line_no;
        $partys->email_id = $request->email_id;
        $partys->save();


        Session::flash('flash_message', 'New Party Successfully Updated!');

        return redirect()->route('party');

    }

    public function view_party($id){

        $data = Party::find($id);
        return View::make('party.view_party')->with('part',$data);
    }

    public function delete_party($id)
    {

        try{
            $item= new Party();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Party Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
