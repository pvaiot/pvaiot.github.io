@extends('layouts.adminPanel')

{{--Page title --}}
@section('title')
    Add New User
@endsection

{{--New css link here --}}
@section('custom_css')
    <link rel="stylesheet" href="{{ asset('css/jquery-ui.css')}}">
    <script src="{{ asset('js/jquery.min.js')}}"></script>
    <script src="{{ asset('js/jquery-ui.js')}}"></script>
@endsection

{{--inline css code--}}
@section('manual_style_code')
    <style>
        .glyphicon{
            color: #FFFFFF;!important;
        }


        input,select,textarea{
            border:solid 1px darkseagreen!important;
            font-size: 13px!important;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            $( ".datepicker " ).datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
@endsection

@section('content')

    @if(Auth::user()->role != 'admin')

        <script type="text/javascript">
            window.location = "{{url('/')}}";//here double curly bracket
        </script>
    @endif
    <h3 class="text-center">Update User</h3>
    <a href="{{url('users')}}" class="btn btn-primary">Back</a>
    <hr>
    <?php echo Form::open(array('url' =>['updateUser',$viewUser->id])); ?>
    <div class="row">
        @if($errors->any())
            <div class="alert alert-danger" style="width: 1014px">
                @foreach($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>
        @endif
        <div class="col-md-6 form-group">
            <label>Name<span style="color: red; font-size: 15px">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control" readonly value="{{$viewUser->name}}" name="name" placeholder="Name"required>
            </div>

        </div>
        <div class="col-md-6 form-group">
            <label>Designation<span style="color: red">*</span></label>
            <div class="input-group">
                <select  class="form-control" style="width:100%" name="role"required>
                    <option  value="{{$viewUser->role}}">{{$viewUser->role}}</option>

                </select>
            </div>

        </div>
    </div> <!-- row end here -->

    <div class="row">

        <div class="col-md-4 form-group">
            <label>Employee Code<span style="color: red; font-size: 11px">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control" readonly value="{{$viewUser->employee_code}}" name="employee_code" placeholder="Employee code"required>
            </div>

        </div>
        <div class="col-md-4 form-group">
            <label>Date of Joining<span style="color: red; font-size: 11px">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control datepicker" readonly value="{{$viewUser->doj}}"  name="doj" placeholder="Date of Joining"required>
            </div>
        </div>
        <div class="col-md-4 form-group">
            <label>Aadhar Card<span style="color: red; font-size: 15px">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control" readonly value="{{$viewUser->adhar_no}}" name="adhar_no" placeholder="Adhar card">
            </div>

        </div>
    </div>

    <div class="row">


        <div class="col-md-6 form-group">
            <div class=" has-success has-feedback">
                <label>Address Line-1 <span style="color: red">*</span></label>
                <div class="input-group">
                    <input  type="text" class="form-control" readonly value="{{$viewUser->add1}}" name="add1" placeholder="Address Line-1"required>

                </div>
            </div>
        </div>
        <div class="col-md-6 form-group">
            <div class=" has-success has-feedback">
                <label>Address Line-2</label>
                <div class="input-group">
                    <input  type="text" class="form-control" readonly value="{{$viewUser->add2}}" name="add2" placeholder="Address Line-1">
                </div>
            </div>
        </div>
    </div> <!-- end row here -->

    <div class="row">

        <div class="col-md-4 form-group">
            <label>City<span style="color: red; font-size: 11px">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control" readonly value="{{$viewUser->city}}" name="city" placeholder="City"required>
            </div>

        </div>
        <div class="col-md-4 form-group">
            <label>State<span style="color: red; font-size: 11px">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control" readonly value="{{$viewUser->state}}" name="state" placeholder="State"required>
            </div>
        </div>
        <div class="col-md-4 form-group">
            <label>Zip<span style="color: red; font-size: 15px">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control" readonly value="{{$viewUser->zip}}" name="zip" placeholder="Zip"required>
            </div>

        </div>
    </div>


    <div class="row">
        <div class="col-md-4 form-group">
            <div class=" has-success has-feedback">
                <label>Phone</label>
                <div class="input-group">
                    <input  type="text" class="form-control"readonly value="{{$viewUser->phone}}" name="phone" placeholder="Phone">
                </div>
            </div>
        </div>
        <div class="col-md-4 form-group">
            <div class=" has-success has-feedback">
                <label>Mobile-1 <span style="color: red">*</span></label>
                <div class="input-group">
                    <input  type="text" class="form-control"readonly value="{{$viewUser->mobile_1}}" name="mobile_1" placeholder="mobile-1"required>
                </div>
            </div>
        </div>
        <div class="col-md-4 form-group">
            <div class=" has-success has-feedback">
                <label>Mobile-2</label>
                <div class="input-group">
                    <input  type="text" class="form-control" readonly value="{{$viewUser->mobile_2}}" name="mobile_2" placeholder="Mobile-2">
                </div>
                <input type="hidden" name="_token" readonly value="{{ csrf_token() }}">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 form-group">
            <div class=" has-success has-feedback">
                <label>PAN Card</label>
                <div class="input-group">
                    <input  type="text" class="form-control" readonly value="{{$viewUser->pan_no}}" name="pan_no" placeholder="PAN card">
                </div>
            </div>
        </div>
        <div class="col-md-4 form-group">
            <div class=" has-success has-feedback">
                <label>Email <span style="color: red">*</span></label>
                <div class="input-group">
                    <input  type="email" class="form-control"readonly value="{{$viewUser->email}}" name="email" placeholder="Email"required>
                </div>
            </div>
        </div>
        <div class="col-md-4 form-group">
            <div class=" has-success has-feedback">
                <label>Date of Birth <span style="color: red">*</span></label>
                <div class="input-group">
                    <input  type="text" class="form-control datepicker" readonly value="{{$viewUser->dob}}" name="dob" placeholder="DOB" required>
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-6 form-group">
            <label>Bank Account No.</label>
            <div class="input-group">
                <input style="" type="text" class="form-control" readonly value="{{$viewUser->account_no}}" name="account_no" placeholder="Account No.">
            </div>

        </div>
        <div class="col-md-6 form-group">
            <label>Bank Name<span style="color: red; font-size: 11px;">*</span></label>
            <div class="input-group">
                <input  type="text" class="form-control" name="bank_name" readonly value="{{$viewUser->bank_name}}" placeholder="Bank Name">
            </div>

        </div>

    </div>

    <div class="row">

        <div class="col-md-6 form-group">
            <label>Branch Name<span style="color: red; font-size: 11px;">*</span></label>
            <div class="input-group">
                <input style="" type="text" class="form-control" readonly value="{{$viewUser->branch_name}}" name="branch_name" placeholder="Branch name">
            </div>

        </div>
        <div class="col-md-6 form-group">
            <label>IFSC Code</label>
            <div class="input-group">
                <input  type="text" class="form-control" readonly value="{{$viewUser->ifsc_code}}" name="ifsc_code" placeholder="IFSC code">
            </div>

        </div>

    </div>

    <div class="row">

        <div class="col-md-6 form-group">
            <label>Account Password<span style="color: red; font-size: 11px;">*</span></label>
            <div class="input-group">
                <input style="" type="password" readonly value="{{$viewUser->password}}" class="form-control" name="password" placeholder="Enter Password"required>
            </div>

        </div>
        <div class="col-md-6 form-group">
            <label>Confirm Password<span style="color: red; font-size: 11px;">*</span></label>
            <div class="input-group">
                <input  type="password" class="form-control" readonly value="{{$viewUser->password}}" name="password_confirmation" placeholder="Enter Password"required>
                <input  type="hidden" class="form-control" name="passwordold"  readonly value="{{$viewUser->password}}">
            </div>

        </div>

    </div>
    <div class="row">

        <div class="col-md-4 col-md-offset-4">
            <a class="btn btn-success" href="{{url('users')}}">Back</a>
        </div>
    </div>

    {{form::close()}}
            <!-- form row end here -->
    {{---------------------------------------------------------------------------------}}

    <br>
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <br><br>
@endsection