<?php

namespace App\Http\Controllers;

use App\Materialcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Database\QueryException;
use Session;

class MaterialcategoryController extends Controller
{
    public function materialcategory()
    {
        $materialcategorys= Materialcategory::orderBy('id')->get();
        return View::make('materialcategory.materialcategory_panel')->with('area_materialcategory',$materialcategorys);
    }

    public  function new_materialcategory_entry(){
        return View::make('materialcategory.new_materialcategory_entry');
    }

    public function store_materialcategory_entry(Request $request)
    {

//        $data = Input::all();
//        print_r($data);
//        die();
        $this->validate($request,[
            'category'=>'required|unique:materialcategory',
        ]);

        $materialcategorys= new Materialcategory();
        $materialcategorys->category = $request->category;
        $materialcategorys->save();


        Session::flash('flash_message', 'New Materialcategory Record Successfully Created!');

        return redirect()->route('new_materialcategory_entry');
    }


    public function edit_materialcategory(Request $request,$id){

        $data = Materialcategory::find($id);
//        print_r($data);
//        die();
        return View::make('materialcategory.edit_materialcategory')->with('mater',$data);
    }


    public function update_materialcategory(Request $request, $id)
    {
//     $data=Input::all();
//        print_r($data);
//        die();

        $materialcategorys= Materialcategory::find($id);
        $materialcategorys->category = $request->category;
        $materialcategorys->save();

        Session::flash('flash_message', 'New Materialcategory Successfully Updated!');

        return redirect()->route('materialcategory');

    }

    public function view_materialcategory($id){

        $data = Materialcategory::find($id);
        return View::make('materialcategory.view_materialcategory')->with('mater',$data);
    }

    public function delete_materialcategory($id)
    {

        try{
            $item= new Materialcategory();
            $item::find($id)->delete();

            \Session::flash('flash_message', 'Selected Materialcategory Successfully Deleted!');
        }
        catch (QueryException $e){
            if($e->getCode() == "23000"){
                \Session::flash('flash_message1', "You can't delete this Data ! Plz delete all  related Data before delete this user!");
            }}

        return redirect()->back();
    }
}
