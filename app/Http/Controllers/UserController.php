<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
//use Illuminate\Support\Facades\save;
use Illuminate\Support\Facades\Input;
use App\User;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = User::where('id','!=','1')->get();
        return  View::make( 'admin/index')->withData( $data );
    }

    public function singleUser($id)
    {
        $viewUser=User::find($id);
        return View::make('admin/singleUser')->with('viewUser',$viewUser);
    }

    public function register()
    {
        return  View::make( 'admin/createUser');
    }

    public function AjaxGet_login_email($id){

        $data = DB::table("users")->where("employee_id","=",$id)->first();

        return json_encode(array('name'=>$data->name,'email'=>$data->email));
    }
    public function storeUser(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email'  => 'Required|email|unique:users',
            'role'  => 'Required',
            'password' => 'required|confirmed',
            'password_confirmation' => 'required',
        ]);

        $user = new User();

        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make ($request->password);
        $user->role = $request->role;
        $user->address = $request->address;
        $user->mobile = $request->mobile_no;
        $user->city = $request->city;
        $user->zip = $request->zip;
        $user->state = $request->state;
        $user->aadhar_no = $request->aadhar;
        $user->employee_id = $request->emp_id;

        $user->save();

        Session::flash('flash_message', 'New user has successfully added!');

        return redirect()->route('users');
    }



    public function editUser($id)
    {
        $viewUser=User::find($id);
        return View::make('admin/editUser')->with('viewUser',$viewUser);
    }


    public function updateUser(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'email'  => 'Required|email',
            'role'  => 'Required',
            'password' => 'required',
            'password_confirmation' => 'required',
        ]);

        $user = User::find($id);

        $user->name = $request->name;
        $user->email = $request->email;
        if($request->passwordold!=$request->password){
            $user->password = Hash::make($request->password);
        }
        $user->role = $request->role;
        $user->address = $request->address;
        $user->mobile = $request->mobile_no;
        $user->city = $request->city;
        $user->zip = $request->zip;
        $user->state = $request->state;
        $user->aadhar_no = $request->aadhar;
        $user->employee_id = $request->emp_id;

        $user->save();

        Session::flash('flash_message', 'Customer successfully Updated!');


        return redirect()->route('users');
    }


    public function deleteUser($id)
    {
        $item= new User();
        $item::find($id)->delete();

        Session::flash('flash_message', 'Selected Customer successfully Deleted!');


        return redirect()->route('users');
    }
}
