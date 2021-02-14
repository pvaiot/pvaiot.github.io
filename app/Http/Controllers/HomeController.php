<?php

namespace App\Http\Controllers;

use App\Cn_serial_no;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return redirect()->route('home_page');
    }
    public function Ajaxcnserialno(Request $request)
    {

//
//        $data= Input::all();
//        print_r($data);
//        die();

        $newDriver= Cn_serial_no::find(1);

        $newDriver->consignment_serial_no = $request->serial_no;


        $newDriver->save();


        return json_encode(array("done" =>"done" ));

    }


}
