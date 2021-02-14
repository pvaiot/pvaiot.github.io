<?php

namespace App\Http\Controllers;
use App\CockConsignment;
use App\Consignment;
use App\TruckModel;
use Illuminate\Support\Facades\Session;
use App\TruckModelChild;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class TruckTrackingController extends Controller
{
    public function truck_create_panel(){
        return view('Truck Tracking.truck_create_panel');
    }

    public function ajax_truck($id)
    {

        $data = Consignment::where("consignment_no", $id)->first();
        if(empty($data)){
            $data = CockConsignment::where("consignment_no", $id)->first();
        }
       
        return json_encode(array(
            'consignment_no'=>$data->consignment_no,
            'truck_no'=>$data->truck_no,
            'destination'=>$data->to
        )
        );
    }

    public function store_truck(Request $request){
        $data = new TruckModel();      
                $input = $request->input('rows');
           
                $data->consignment_no = $request->consignment_no;
                $data->truck_no = $request->truck_no;
                $data->destination = $request->destination;
                $data->status = $request->status;
                $data->save();
                
            foreach ($input as $row){
                $child=new TruckModelChild();
                $child->truckmodel_id =$data->id ;
                $child->time = $row['time'];
                if($row['date'] !=""){
                $child_date = explode('/', $row['date']);
                $child_date_day = $child_date[0];
                $child_date_month = $child_date[1];
                $child_date_year = $child_date[2];
                $child->date =  date($child_date_year . '/' . $child_date_month . '/' . $child_date_day);
                }
                $child->area = $row['area'];
                $child->save();
            }
                Session::flash('flash_message', 'New Truck Tracking successfully Created!');
                return redirect()->back();
        
    }
    public function truck_view_panel()
    {
        $data= TruckModel::all();
    
        return View::make('Truck Tracking.truck_view_panel')->with('truck_details',$data);
    }


    public function truck_edit_panel($id){

    
    }
    public function edit_truck(Request $request,$id){

        $data = TruckModel::find($id);
        return View::make('Truck Tracking.edit_truck_panel')->with('bata',$data);
    }


    public function update_truck_tracking(Request $request,$id){
        $data = TruckModel::find($id);      
                
           
                $data->consignment_no = $request->consignment_no;
                $data->truck_no = $request->truck_no;
                $data->destination = $request->destination;
                $data->status = $request->status;
                $data->save();

        $item= new TruckModelChild();
        $item::where('truckmodel_id',$id)->delete();
            $input = $request->input('rows');
            foreach ($input as $row){
                $child=new TruckModelChild();
                $child->truckmodel_id =$data->id ;
                $child->time = $row['time'];
                if($row['date'] !=""){
                $child_date = explode('/', $row['date']);
                $child_date_day = $child_date[0];
                $child_date_month = $child_date[1];
                $child_date_year = $child_date[2];
                $child->date =  date($child_date_year . '/' . $child_date_month . '/' . $child_date_day);
                }
                $child->area = $row['area'];
                $child->save();
            }
        Session::flash('flash_message', 'Truck Tracking successfully Updated!');
        return redirect()->route('truck_view_panel');
    }
    
    public function truck_track(){

            return view('Truck Tracking.truck_track');
    }
   
    public function ajax_truck_track($consignment_no)
    {
  
      
      $data = TruckModel::where('consignment_no','=',$consignment_no)->first();

      $datas = TruckModelChild::where('truckmodel_id','=',$data->id)->orderBy('id','DESC')->get();

    
      return json_encode($datas);
        
    }

}
