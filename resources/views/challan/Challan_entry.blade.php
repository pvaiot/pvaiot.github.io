@extends('layouts.newAdminPanal_select')
@section('custom_css')
    <style>
        table, tr,td{
            border-top: none!important;
        }
        .btn{
            padding-top: 8px;
            padding-bottom: 8px;

        }
        .select2-container .select2-selection--single {
            height: 35px !important;
            border-color:#555555!important;

        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-top: 3px!important;
        }
        select{
            width: 100%;
        }
        #challan_no_error{
            display: none;
            margin-bottom: -10px;
        }
        #consignment_no_error{
            display: none;
            margin-bottom: -10px;
        }
        #value_change{
            display: none;
        }
        .btn:focus{
            background-color: #0088cc !important;
            font-size: 15px;
        }
    </style>
@endsection
@section('content')
    <br>
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <header class="page-header">
        <h2>New Challan Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Challan Entry</span></li>
            </ol>

            <a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    @if(Session::has('status'))
        <?php $id =   Session::get('status')  ; ?>
        <div id="myModal" class="modal fade" data-backdrop="static" data-keyboard="false" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Print Challan</h4>
                    </div>
                    <div class="modal-body">
                        <h2>Do You Want To Print The Challan Which You Just Saved?</h2>
                    </div>
                    <div class="modal-footer">
                        <a id="report" class="btn btn-success"  target="_blank" href="{{route('print_lorry_challan',$id)}}">Lorry</a>
                        <a id="report" class="btn btn-success"  target="_blank" href="{{route('print_balance_challan',$id)}}">Balance</a>
                        <a id="report" class="btn btn-success"  target="_blank" href="{{route('print_record_challan',$id)}}">Record</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(function() {

                $('#myModal').modal('show');

            });
        </script>
    @endif

    {{-- ----------------------------------------inner content here --------------------------------------------------------}}
    <div class="well">

        <div class="row">

            {{--<p class="alert alert-danger" id="value_change">--}}
                    {{--* Challan No. and Consignment No. does not match *--}}
                {{--</p>--}}

                <?php echo Form::open(array('route' => 'store_challan_entry','id'=>"data_form",'name'=>"data_form",'onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>

            {{--____________________________________________________________________________________________________________________________________________________________--}}

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Challan No<span style="color: red">*</span></label>
                        <input type="text" name="challan_no" id="challan_no" class="form-control" placeholder="Challan No" required  onBlur="if (this.value == '') { var field = this; setTimeout(function() { field.focus(); }, 0); }" autofocus>
                        <p style="color: red;font-size: 10px;" id="challan_no_error">* Challan No. Already Exist *</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Date</label>
                        <input type="text" name="date" id="date" class="form-control"  placeholder=" Date" required />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">From</label>
                        <select name="from" id="from" class="form-control" style="width: 100%"  required>
                            <option value=""> Select From</option>
                            <?php  $datas = App\Location::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->city}}">{{$data->id}} - {{$data->city}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">To</label>
                        <select name="to" id="to" class="form-control" style="width: 100%"  required>
                            <option value=""> Select To</option>
                            <?php  $datas = App\Location::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->city}}">{{$data->city}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div><br>







            {{--____________________________________________________________________________________________________________________________________________________________--}}


                {{-------------------------------------- retail customer ends here ---------------------  --}}

                <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Add Consignment Details</span></h5>
                <div class="table-responsive">
                        <table class="table table-no-more table-bordered mb-none" style="font-size: 13px!important;">
                            <thead>
                            <tr style="background-color: #09C6AB;color: #ffffff">
                                <th style="text-align: center;vertical-align: middle;">Consignment No<span style="color: red">*</span></th>
                                <th style="text-align: center;vertical-align: middle;">Destination<span style="color: red">*</span></th>
                                <th style="text-align: center;vertical-align: middle;">Consignment Date<span style="color: red">*</span></th>
                                <th>Package</th>
                                <th>Net Wt</th>
                                <th>Gross WT</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr style="border-bottom: solid 1px black">

                                <td data-title="Consignment No.">
                                    <input type="text" name="consignment_id" class="form-control" id="consignment_id" placeholder="Consignment No" >
                                    <input type="hidden" name="consigment_id_value" id="consigment_id_value" class="form-control" >
                                    <p style="color: red;font-size: 10px;" id="consignment_no_error">* No Record Exist for This Consignment No *</p>
                                </td>
                                <td data-title="Destination">
                                    <input type="text" name="destination" id="destination" class="form-control" placeholder="Destination" >
                                </td>
                                <td data-title="Consignment Date">
                                    <input type="text" name="con_date" id="con_date"  class="form-control" placeholder=" Date">
                                </td>
                                <td data-title="Package"><input name="total_package" id="total_package" class="total_package form-control" ></td>
                                <td data-title="Net WT"><input name="total_net_weight" id="total_net_weight" class="total_net_weight form-control" ></td>
                                <td data-title="Gross WT"><input name="total_gross_weight" id="total_gross_weight" class="total_gross_weight form-control"  ></td>
                                <td data-title="Action"><button type="button" class="btn btn-success btn-sm totaladd" id="totaladd" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px" >ADD</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div><br>
                <div class="table-responsive">
                    <table id="saved_data" class="table table-no-more table-bordered mb-none" style="font-size: 13px!important;">
                        <thead>
                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th>Consignment_no</th>
                            <th>Destination</th>
                            <th>Date</th>
                            <th>Total_Package</th>
                            <th>Total_Net Wt</th>
                            <th>Total_Gross WT</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        {{--<tr class="saved_data_row" id="saved_data_row" style="border-bottom: solid 1px black">--}}
                            {{--<td class="main_td"><input name="rows[0][saved_data_consignment_no]" class="package form-control" required></td>--}}
                            {{--<td class="main_td"><input name="rows[0][total_package_add]" class="package form-control"  required></td>--}}
                            {{--<td class="main_td"><input name="rows[0][total_net_weight_add]" class="net_weight form-control"  required></td>--}}
                            {{--<td class="main_td"><input name="rows[0][total_gross_weight_add]" class="gross_weight form-control"  required ><input type="hidden" name="rows[0][category]" class="category form-control"  required ></td>--}}
                        {{--</tr>--}}
                        </tbody>
                    </table>
                </div><br>
                <div class="table-responsive">
                        <table class="table table-no-more table-bordered mb-none" style="font-size: 13px!important;">
                            <thead>
                            <tr style="background-color: #09C6AB;color: #ffffff">
                                <th></th>
                                <th style="vertical-align: middle;text-align: center;">Total Package</th>
                                <th style="vertical-align: middle;text-align: center;">Total Net Wt</th>
                                <th style="vertical-align: middle;text-align: center;">Total Gross WT</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr style="border-bottom: solid 1px black">
                                <td style="vertical-align: middle;text-align: center;"><strong>Total:</strong></td>
                                <td data-title="Total Package" style="vertical-align: middle;text-align: center;"><input name="total_package_for_challn" id="total_package_for_challn" class="total_package_for_challn form-control" value="0" required></td>
                                <td data-title="Total Net Wt" style="vertical-align: middle;text-align: center;"><input name="total_net_weight_for_challn" id="total_net_weight_for_challn" class="total_net_weight_for_challn form-control" value="0"  required></td>
                                <td data-title="Total Gross WT" style="vertical-align: middle;text-align: center;"><input name="total_gross_weight_for_challn" id="total_gross_weight_for_challn" class="total_gross_weight_for_challn form-control" value="0"  required ></td>
                            </tr>
                            </tbody>
                        </table>
                    </div><br>
                    <!-- --------------------end here---------------------- -->
                    {{--<div class="col-md-3">--}}
                        {{--<table class="table table-bordered">--}}
                            {{--<tr>--}}

                            {{--</tr>--}}
                        {{--</table>--}}

                    {{--</div>--}}
                    {{--<div class="col-md-3">--}}
                        {{--<table class="table table-bordered billing_table" style="font-size: 13px!important;">--}}

                                {{--<tr style="width: 40%;font-size: 12px;text-align: center;vertical-align: middle;">Consignment Date<span style="color: red">*</span></tr>--}}
                                {{--<tr>--}}

                            {{--</tr>--}}
                        {{--</table>--}}
                    {{--</div>--}}

                {{-------------------------------------- retail customer ends here ---------------------  --}}

                {{--First Append Start--}}
                {{--<div class="table-responsive">--}}
                    {{--<table id="items" class="table table-bordered billing_table" style="font-size: 13px!important;">--}}
                        {{--<thead>--}}
                        {{--<tr style="background-color: #09C6AB;color: #ffffff">--}}
                            {{--<th>Package</th>--}}
                            {{--<th>Net Wt</th>--}}
                            {{--<th>Gross WT</th>--}}
                            {{--<th>Action</th>--}}
                        {{--</tr>--}}
                        {{--</thead>--}}
                        {{--<tbody>--}}
                        {{--<tr class="item-row" id="items_content" style="border-bottom: solid 1px black">--}}

                            {{--<td class="main_td"><input name="rows[0][package]" class="package form-control"  required></td>--}}
                            {{--<td class="main_td"><input name="rows[0][net_weight]" class="net_weight form-control"  required></td>--}}
                            {{--<td class="main_td"><input name="rows[0][gross_weight]" class="gross_weight form-control"  required ><input type="hidden" name="rows[0][category]" class="category form-control"  required ></td>--}}
                            {{--<td><a class="btn btn-danger btn-sm addrow updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">ADD</a></td>--}}
                        {{--</tr>--}}
                        {{--</tbody>--}}
                    {{--</table>--}}
                {{--</div>--}}
                {{-- ----------------------------------------1st Row --------------------------------}}

                <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Add Truck And Truck Owner's Details</span></h5>

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Truck No</label>
                        <input type="text" name="truck_no" id="truck_no" class="form-control" placeholder="Truck No" required>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Engine No</label>
                        <input type="text" name="engine_no" id="engine_no" class="form-control" placeholder="Engine No">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Chassis No</label>
                        <input type="text" name="chassis_no" id="chassis_no" class="form-control" placeholder="Chassis No">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Make</label>
                        <input type="text" name="make" id="make" class="form-control" placeholder="Make">
                    </div>
                </div>
            </div><br>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Owner's Name</label>
                        <input type="text" name="truck_owner_name" id="truck_owner_name" class="form-control" placeholder="Truck Owner Name">
                        <input type="hidden" name="truck_owner_id"  class="form-control" placeholder="Truck Owner Name">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Owner's Address</label>
                        <input type="text" name="owners_address" id="owners_address"  class="form-control" placeholder="Owner's Address">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Owner's Phone</label>
                        <input type="text" name="owners_phone" id="owners_phone"  class="form-control" placeholder="Owner's Phone">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Pan Applicable	</label>
                        <select style="width: 100%" class="form-control" name="pan_applicable" id="pan_applicable" >
                            <option value="">Select</option>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                </div>
            </div><br>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Pan OF</label>
                        <select style="width: 100%" class="form-control" name="pan_of" id="pan_of" >
                            <option value="">Select Pan Of</option>
                            <option value="Broker">Broker</option>
                            <option value="Driver">Driver</option>
                            <option value="Driver">Truck Owner</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Pan No</label>
                        <input type="text" name="pan_no" id="pan_no" class="form-control" placeholder="Pan No" >
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Pan Name</label>
                        <input type="text" name="pan_name" id="pan_name" class="form-control" placeholder="Pan Name"  disabled>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Declaration Submitted</label>
                        <select style="width: 100%" class="form-control" name="declaration_submitted" id="declaration_submitted" >
                            <option value="">Select</option>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                </div>
            </div><br>
            {{-- ------------------------------------------------------------------------}}
            <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Add Broker's And Truck Driver's Details</span></h5>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Broker</label>
                        <select style="width: 100%" class="form-control" name="broker" id="broker" >
                            <option value="">Select</option>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Broker Name<span><a href="" data-toggle="modal" data-target="#myModal2"> +New Broker</a></span></label>
                        <select name="broker_name" id="broker_name" style="width: 100%" class="form-control" >

                            <option value=""> Select Broker Name</option>
                            <?php  $datas = App\Broker::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->id}}">{{$data->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Broker Phone</label>
                        <input type="text" name="broker_phone" id="broker_phone" class="form-control" placeholder="Broker Phone">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Broker's Slip No</label>
                        <input type="text" name="broker_slip_no" id="broker_slip_no" class="form-control" placeholder="Slip No" >
                    </div>
                </div>
            </div><br>

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Insurance Name</label>
                        <select name="insurance_name" id="insurance_name" style="width: 100%" class="form-control" >
                            <option value=""> Select Insurance Name</option>
                            <?php  $datas = App\Insurance::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->insurance_name}}">{{$data->insurance_name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Policy No</label>
                        <input type="text" name="policy_no" id="policy_no" class="form-control" placeholder="Policy No">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Place Of Issue</label>
                        <input type="text" name="policy_place_issue" id="policy_place_issue" class="form-control" placeholder="Place of Issue for Policy No" >
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Driver's Name<span><a href="" data-toggle="modal" data-target="#myModal3"> +New Driver</a></span></label>
                        <select name="drivers_name" style="width: 100%" id="drivers_name" class="form-control" >

                            <option value=""> Select Driver's Name</option>
                            <?php  $datas = \App\Driver::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->id}}">{{$data->truck_driver_name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div><br>

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Driver's Address</label>
                        <input type="text" name="drivers_address" id="drivers_address" class="form-control" placeholder="Driver's Address">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">License No</label>
                        <input type="text" name="license_no" id="license_no" class="form-control" placeholder="License No">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Place Of Issue</label>
                        <input type="text" name="place_of_issue" id="place_of_issue" class="form-control" placeholder="Place Of Issue">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Driver's Contact No</label>
                        <input type="text" name="drivers_contact_no" id="drivers_contact_no" class="form-control" placeholder="Driver's Contact No">
                    </div>
                </div>
            </div><br><br>
                {{-- ----------------------------------------4th Row --------------------------------}}
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Balance Payable At</label>
                        <select name="balance_payable_at" id="balance_payable_at" style="width: 100%" class="form-control" >
                            <option value=""> Select Balance Payable At</option>
                            <?php  $datas = App\Branch::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->id}}">{{$data->city}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Freight Amount</label>
                        <input type="number" name="freight" id="freight" class="form-control" >
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Diesel Amount</label>
                        <input type="number" name="diesel" id="diesel" class="form-control" >
                    </div>
                </div>
            </div><br>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Cash Advance</label>
                        <input type="number" name="cash_advance" id="cash_advance" class="form-control">
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Petrol Pump</label>
                        <select name="petrol_pump_id" style="width: 100%" id="petrol_pump_id" class="form-control" >
                            <option value="0"> Select Petrol Pump</option>
                            <?php  $datas = App\Petrol_Pump::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->id}}">{{$data->name}}, {{$data->address}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Balance Amount</label>
                        <input type="number" name="balance" id="balance" class="form-control" readonly="">
                    </div>
                </div>
            </div><br>

            <div class="row">
                <footer class="col-md-8">
                    <button type="submit" class="btn btn-success" id="submit">Submit</button>
                    <button type="reset" class="btn btn-danger">Reset</button>
                </footer>
            </div>

                <br>
                {{form::close()}}
            </div>
            <div class="modal fade" id="myModal2"  role="dialog" aria-labelledby="myModalLabel">
                <form id="testform125">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Create New Broker <span style="font-size: 12px;color:#EB3E28;">* You Can Fill Full Details Later In Broker Master</span></h4>
                            </div>
                            <div class="modal-body">

                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Name
                                            <input type="text" name="name" id="name" class="form-control" placeholder="Name" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Address
                                            <input type="text" name="address" id="address" class="form-control" placeholder="Address">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Pan No
                                            <input type="text" name="pan_no" id="pan_no" class="form-control" placeholder="Pan No">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Mobile No
                                            <input type="text" name="mobile_no" id="mobile_no" class="form-control" placeholder="Mobile No">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Contact No
                                            <input type="text" name="contact_no" id="contact_no" class="form-control" placeholder="Contact No">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Land Line No
                                            <input type="text" name="land_line_no" id="land_line_no" class="form-control" placeholder="Land Line No">
                                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        </div>
                                    </div>
                                </div>


                            </div>



                            <div class="modal-footer clearfix">
                                <div class="row">
                                    {{--<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 col-md-offset-3">--}}
                                    {{--<button type="reset" class="btn btn-success" data-dismiss="modal"><i class="fa fa-refresh"></i> Clear</button>--}}
                                    {{--</div>--}}
                                    <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"> Close</button>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                        <button type="submit" id="addnewbroker"  class="btn btn-primary"> Save</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal fade" id="myModal3"  role="dialog" aria-labelledby="myModalLabel">
                <form id="testform126">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Create New Driver <span style="font-size: 12px;color:#EB3E28;">* You Can Fill Full Details Later In Driver Master</span></h4>
                            </div>
                            <div class="modal-body">

                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Name
                                            <input type="text" name="truck_driver_name" id="truck_driver_name" class="form-control" placeholder="Name" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Address
                                            <input type="text" name="truck_driver_address" id="truck_driver_address" class="form-control" placeholder="Address">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Licence No
                                            <input type="text" name="truck_driver_license_no" id="truck_driver_license_no" class="form-control" placeholder="License No"></div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Palce Of Issue
                                            <input type="text" name="truck_driver_license_palce_of_issue" id="truck_driver_license_palce_of_issue" class="form-control" placeholder="Palce Of Issue">
                                        </div>
                                    </div>
                                    </div>
                                <div class="row">
                                    <div class="col-md-4 col-lg-4 col-sm-4">
                                        <div class="form-group has-success has-feedback">Contact No
                                            <input type="text" name="truck_driver_contact_no" id="truck_driver_contact_no" class="form-control" placeholder="Contact No">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-4">
                                        <div class="form-group has-success has-feedback">Land Line No
                                            <input type="text" name="truck_driver_land_line_no" id="truck_driver_land_line_no" class="form-control" placeholder="Land Line No">
                                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-4">
                                        <div class="form-group has-success has-feedback">Mobile No
                                            <input type="text" name="truck_driver_mob_no" id="truck_driver_mob_no" class="form-control" placeholder="Mobile No">
                                        </div>
                                    </div>
                                </div>

                            </div>



                            <div class="modal-footer clearfix">
                                <div class="row">
                                    {{--<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 col-md-offset-3">--}}
                                    {{--<button type="reset" class="btn btn-success" data-dismiss="modal"><i class="fa fa-refresh"></i> Clear</button>--}}
                                    {{--</div>--}}
                                    <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"> Close</button>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                        <button type="submit" id="addnewdriver"  class="btn btn-primary"> Save</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- panel body ends here -->
        </div> <!-- invoice details panel ends here -->
    </div>
    <script>
        $('#totaladd').on('focus',function(){

            if(keyCode == 13){
                $('#totaladd').click();
            }
        });
        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });
        $("#testform125").submit(function(e){
            e.preventDefault();
        });
        $('#addnewbroker').click(function() {
//            alert("Hi")
            $.ajax({

                url: '{{url('')}}/AjaxNewBroker',

                type: "post",
                dataType: "json",
                data: {
                    '_token':$('input[name=_token]').val(),
                    'name':$('input[name=name]').val(),
                    'address':$('input[name=address]').val(),
                    'pan_no':$('input[name=pan_no]').val(),
                    'mobile_no':$('input[name=mobile_no]').val(),
                    'contact_no':$('input[name=contact_no]').val(),
                    'land_line_no':$('input[name=land_line_no]').val()
                },

                success:function(data) {
//                $(data, function(key, value) {
                    var Vals    =  data;
                    $('select[name="broker_name"]').append('<option value="'+ Vals.broker_id+'">'+ Vals.name +'</option>');
//                });


                    $('#myModal2').modal('hide')
                }

            });

        });
        $("#testform126").submit(function(e){
            e.preventDefault();
        });
        $('#addnewdriver').click(function() {
//            alert("Hi")
            $.ajax({

                url: '{{url('')}}/AjaxNewDriver',

                type: "post",
                dataType: "json",
                data: {
                    '_token':$('input[name=_token]').val(),
                    'name':$('input[name=truck_driver_name]').val(),
                    'address':$('input[name=truck_driver_address]').val(),
                    'licence_no':$('input[name=truck_driver_license_no]').val(),
                    'licence_place_of_issue':$('input[name=truck_driver_license_palce_of_issue]').val(),
                    'mobile_no':$('input[name=truck_driver_mob_no]').val(),
                    'contact_no':$('input[name=truck_driver_contact_no]').val(),
                    'land_line_no':$('input[name=truck_driver_land_line_no]').val()
                },

                success:function(data) {
//                $(data, function(key, value) {
                    var Vals    =  data;
                    $('select[name="drivers_name"]').append('<option value="'+ Vals.driver_id+'">'+ Vals.truck_driver_name +'</option>');
//                });


                    $('#myModal3').modal('hide')
                }

            });

        });
        $('#consignment_id').on('blur', function() {
            var stateID = $('#consignment_id').val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_id/' + stateID,

                    type: "GET",

                    dataType: "json",
                    success: function(data) {
                        $('input[name="con_date"]').empty();
                        $('input[name="destination"]').empty();
                        $('input[name="truck_no"]').empty();
                        $('input[name="engine_no"]').empty();
                        $('input[name="chassis_no"]').empty();
                        $('input[name="make"]').empty();
                        $('input[name="truck_owner_name"]').empty();
                        $('input[name="owners_address"]').empty();
                        $('input[name="owners_phone"]').empty();
                        $('input[name="to"]').empty();
                        $('input[name="consigment_id_value"]').empty();

                        var Vals = data;
                            $('input[name="con_date"]').val(Vals.date);
                            $('input[name="destination"]').val(Vals.destination);
                            $("input[name='truck_no']").val(Vals.truck);
                            $("input[name='engine_no']").val(Vals.engine_no);
                            $("input[name='chassis_no']").val(Vals.chassis_no);
                            $("input[name='make']").val(Vals.make);
                            $("input[name='truck_owner_name']").val(Vals.truck_owner_name);
                            $("input[name='owners_address']").val(Vals.owners_address);
                            $("input[name='owners_phone']").val(Vals.owners_phone);
                            $("input[name='to']").val(Vals.to);
                            $('input[name="consigment_id_value"]').val(Vals.id);

                    }
                });

            } else {

                $('input[name="date"]').empty();
                $('input[name="truck_no"]').empty();
                $('input[name="engine_no"]').empty();
                $('input[name="chassis_no"]').empty();
                $('input[name="make"]').empty();
                $('input[name="truck_owner_name"]').empty();
                $('input[name="owners_address"]').empty();
                $('input[name="owners_phone"]').empty();
                $('input[name="to"]').empty();
                $('input[name="consigment_id_value"]').empty();
            }

        });
        $('#consignment_id').on('keyup', function() {
            var stateID = $('#consignment_id').val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_id/' + stateID,

                    type: "GET",

                    dataType: "json",
                    success: function(data) {
                        $('input[name="con_date"]').empty();
                        $('input[name="destination"]').empty();
                        $('input[name="truck_no"]').empty();
                        $('input[name="engine_no"]').empty();
                        $('input[name="chassis_no"]').empty();
                        $('input[name="make"]').empty();
                        $('input[name="truck_owner_name"]').empty();
                        $('input[name="owners_address"]').empty();
                        $('input[name="owners_phone"]').empty();
                        $('input[name="to"]').empty();
                        $('input[name="consigment_id_value"]').empty();

                        var Vals = data;
                            $('input[name="con_date"]').val(Vals.date);
                            $('input[name="destination"]').val(Vals.destination);
                            $("input[name='truck_no']").val(Vals.truck);
                            $("input[name='engine_no']").val(Vals.engine_no);
                            $("input[name='chassis_no']").val(Vals.chassis_no);
                            $("input[name='make']").val(Vals.make);
                            $("input[name='truck_owner_name']").val(Vals.truck_owner_name);
                            $("input[name='owners_address']").val(Vals.owners_address);
                            $("input[name='owners_phone']").val(Vals.owners_phone);
                            $("input[name='to']").val(Vals.to);
                            $('input[name="consigment_id_value"]').val(Vals.id);

                    }
                });

            } else {

                $('input[name="date"]').empty();
                $('input[name="truck_no"]').empty();
                $('input[name="engine_no"]').empty();
                $('input[name="chassis_no"]').empty();
                $('input[name="make"]').empty();
                $('input[name="truck_owner_name"]').empty();
                $('input[name="owners_address"]').empty();
                $('input[name="owners_phone"]').empty();
                $('input[name="to"]').empty();
                $('input[name="consigment_id_value"]').empty();
            }

        });
        $('#consignment_id').on('blur', function() {
            var stateID = $('#consignment_id').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_child_id/' + stateID,

                    type: "GET",

                    dataType: "json",
                    success: function(response) {
                        var len = 0;
                        $('#items tbody').empty();
                        if (response['data'] != null) {
                            len = response['data'].length;
                        }
                        if (len > 0) {
//                            alert(len);
                            var total_package=0;
                            var total_net_weight=0;
                            var total_gross_weight=0;
                            for (var i = 0; i < len; i++) {
                                var package = response['data'][i].package;
                                var net_weight = response['data'][i].net_weight;
                                var gross_weight = response['data'][i].gross_weight;
                                total_package+=Number(package);
                                total_net_weight+=Number(net_weight);
                                total_gross_weight+=Number(gross_weight);
                            }
                            $('input[name="total_package"]').val(total_package);
                            $('input[name="total_net_weight"]').val(total_net_weight);
                            $("input[name='total_gross_weight']").val(total_gross_weight);

                        }
                    }
                });

            } else {

            }

        });
        $('#consignment_id').on('keyup', function() {
            var stateID = $('#consignment_id').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_child_id/' + stateID,

                    type: "GET",

                    dataType: "json",
                    success: function(response) {
                        var len = 0;
                        $('#items tbody').empty();
                        if (response['data'] != null) {
                            len = response['data'].length;
                        }
                        if (len > 0) {
//                            alert(len);
                            var total_package=0;
                            var total_net_weight=0;
                            var total_gross_weight=0;
                            for (var i = 0; i < len; i++) {
                                var package = response['data'][i].package;
                                var net_weight = response['data'][i].net_weight;
                                var gross_weight = response['data'][i].gross_weight;
                                total_package+=Number(package);
                                total_net_weight+=Number(net_weight);
                                total_gross_weight+=Number(gross_weight);
                            }
                            $('input[name="total_package"]').val(total_package);
                            $('input[name="total_net_weight"]').val(total_net_weight);
                            $("input[name='total_gross_weight']").val(total_gross_weight);

                        }
                    }
                });

            } else {

            }

        });
        $('#consignment_id').on('blur', function() {
            var stateID = $('#consignment_id').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_value/' + stateID,
                    type: "GET",
                    success: function(response) {
                        if(response == 'not unique'){

                            $('#consignment_id').css( 'border-bottom-color','red');
                            $('#consignment_no_error').css('display','block');
                           $('#submit').prop('disabled',true);
                        }else{
                            $('#consignment_no_error').css('display','none');
                            $('#consignment_id').css( 'border-bottom-color','silver');
                            $('#submit').prop('disabled',false);
                        }
                    }
                });

            } else {

            }

        });
        $('#challan_no').on('blur', function() {
            var stateID = $('#challan_no').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_challan_no_value/' + stateID,
                    type: "GET",
                    success: function(response) {
                        if(response == 'unique'){
                            $('#challan_no').css( 'border-bottom-color','red');
                            $('#challan_no_error').css('display','block');
                            $('#submit').prop('disabled',true);
                        }else{
                            $('#challan_no_error').css('display','none');
                            $('#challan_no').css( 'border-bottom-color','silver');
                            $('#submit').prop('disabled',false);
                        }
                    }
                });

            } else {

            }

        });
        $('#consignment_id').on('blur', function() {
            if ($('#consignment_id').val() == $('#challan_no').val()) {
//                    alert($('#consignment_id').val());
                $('#value_change').css('display','none');
            }
            else {
                $('#value_change').css('display','block');
            }
        });
        $('#challan_no').on('blur', function() {
            if ($('#consignment_id').val() == $('#challan_no').val()) {
//                    alert($('#consignment_id').val());
                $('#value_change').css('display','none');
            }
            else {
                $('#value_change').css('display','block');
            }
        });
        $("#flesh_message").fadeTo(2000, 500).slideUp(500, function(){
            $("#flesh_message").slideUp(500);
        });

        $(function() {
            $(".base").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        } );



        // ------------------------------------------------------------------------------ add new product --------------------

    </script>

    {{-- ----------------------------------------inner content here --------------------------------------------------------}}

    <script>
        var _round = Math.round;
        Math.round = function(number, decimals /* optional, default 0 */)
        {
            if (arguments.length == 1)
                return _round(number);

            var multiplier = Math.pow(10, decimals);
            return _round(number * multiplier) / multiplier;
        }

        //original function
        // it's also working
        function update_balance() {

        }


        // amount calculation it working without discount without tax value for individual row


        //                percantage calcultioan
        function discount_percentage(){
        }

        //    taxable value  calculation for individual row
        function taxble_value(){
        }



        //    each row tax calculation

        function update_tax() {
        }
        // without disc without tax amount calculation for total
        function update_total() {
        }

        function total_discount(){
        }
        //                taxbl_amount

        function total_taxble_amount(){
        }

        function total_gst() {
        }
        function grandtotal(){
        }

        function update_invoice_value() {

//            var row = $(this).parents('.item-row');
//            var value=row.find('.invoice_value').val();
//           var total_value=Number(value);
//            total_value= Math.round(total_value, 2);
//            $('#cn_value').val(""+total_value);
            var total = 0;
            $('.invoice_value').each(function(i){
                price = $(this).val().replace("$","");
                if (!isNaN(price)) total += Number(price);
            });

            total = Math.round(total,2);

            $('#cn_value').val(""+total);

            update_total();
        }

        function bind(){
            $(".invoice_value").blur(update_invoice_value);

        }

        //        $(".invoice_value").blur(update_invoice_value);
        $('#two').click(function(){
            update_invoice_value();

        });


        //        ----------------------------------------------- get party name by party code-------------------------------

        //    ----------------------Truck owner's Name taken from json link-----------------
        {{--$('select[name="challan_no"]').on('change', function() {--}}
            {{--var stateID = $(this).val();--}}

            {{--if (stateID) {--}}

                {{--$.ajax({--}}

                    {{--url: '{{ url('/') }}/AjaxGet_challan_number/' + stateID,--}}

                    {{--type: "GET",--}}

                    {{--dataType: "json",--}}

                    {{--success: function(data) {--}}

                        {{--$('input[name="date"]').empty();--}}
                        {{--$('input[name="truck_no"]').empty();--}}
                        {{--$('input[name="engine_no"]').empty();--}}
                        {{--$('input[name="chassis_no"]').empty();--}}
                        {{--$('input[name="make"]').empty();--}}
                        {{--$('input[name="truck_owner_name"]').empty();--}}
                        {{--$('input[name="owners_address"]').empty();--}}
                        {{--$('input[name="owners_phone"]').empty();--}}
                        {{--$('input[name="to"]').empty();--}}

                        {{--var Vals = data;--}}

                        {{--$("input[name='date']").val(Vals.date);--}}
                        {{--$("input[name='truck_no']").val(Vals.truck_no);--}}
                        {{--$("input[name='engine_no']").val(Vals.engine_no);--}}
                        {{--$("input[name='chassis_no']").val(Vals.chassis_no);--}}
                        {{--$("input[name='make']").val(Vals.make);--}}
                        {{--$("input[name='truck_owner_name']").val(Vals.truck_owner_name);--}}
                        {{--$("input[name='owners_address']").val(Vals.owners_address);--}}
                        {{--$("input[name='owners_phone']").val(Vals.owners_phone);--}}
                        {{--$("input[name='to']").val(Vals.to);--}}

                    {{--}--}}

                {{--});--}}

            {{--} else {--}}

                {{--$('input[name="date"]').empty();--}}
                {{--$('input[name="truck_no"]').empty();--}}
                {{--$('input[name="engine_no"]').empty();--}}
                {{--$('input[name="chassis_no"]').empty();--}}
                {{--$('input[name="make"]').empty();--}}
                {{--$('input[name="truck_owner_name"]').empty();--}}
                {{--$('input[name="owners_address"]').empty();--}}
                {{--$('input[name="owners_phone"]').empty();--}}
                {{--$('input[name="to"]').empty();--}}

            {{--}--}}

        {{--});--}}

        //    ----------------------Truck owner's Name taken from json link-----------------
        $('select[name="broker_name"]').on('change', function() {
            var stateID = $(this).val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_broker_name/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="broker_phone"]').empty();

                        var Vals = data;

                        $("input[name='broker_phone']").val(Vals.broker_phone);

                    }

                });

            } else {

                $('input[name="broker_phone"]').empty();

            }

        });
        //    ----------------------Truck owner's Name taken from json link end-----------------



        //    ----------------------Truck owner's Name taken from json link-----------------
        $('select[name="drivers_name"]').on('change', function() {
            var stateID = $(this).val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_drivers_name/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="drivers_contact_no"]').empty();
                        $('input[name="drivers_address"]').empty();
                        $('input[name="license_no"]').empty();
                        $('input[name="place_of_issue"]').empty();

                        var Vals = data;

                        $("input[name='drivers_contact_no']").val(Vals.drivers_contact_no);
                        $("input[name='drivers_address']").val(Vals.drivers_address);
                        $("input[name='license_no']").val(Vals.license_no);
                        $("input[name='place_of_issue']").val(Vals.place_of_issue);

                    }

                });

            } else {

                $('input[name="drivers_contact_no"]').empty();
                $('input[name="drivers_address"]').empty();
                $('input[name="license_no"]').empty();
                $('input[name="place_of_issue"]').empty();

            }

        });
        //    ----------------------Truck owner's Name taken from json link end-----------------


        //    ----------------------Truck owner's Name taken from json link-----------------
        $('select[name="consigment_no"]').on('change', function() {
            var stateID = $(this).val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_details/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="package"]').empty();

                        var Vals = data;

                        $("input[name='package']").val(Vals.package);

                    }

                });

            } else {

                $('input[name="package"]').empty();

            }

        });
        //    ----------------------Truck owner's Name taken from json link end-----------------



        //        ----------------------------------------------- get party name by party code-------------------------------
        //            First Append Start
        $(document).ready(function() {

            var i=1;
            var count=0;
            $('input').click(function(){
                $(this).select();
            });

            $("#paid").blur(update_balance);


//            $(document).on('click', '.addrow', function(){
//
//                $(this).text('x Del');
//                $(this).attr('class','btn btn-info btn-sm del');
//                $(".item-row:last").find('.mybtn').hide();
//                i++;
//
//                count++;
//                var id=count;
//
//
//                $(".item-row:last").after('<tr class="item-row" style="border-bottom: solid 1px black">' +
//
//                    '<td class="main_td"><input name="rows[' + id + '][package]" class="package form-control" required></td>'+
//                    '<td class="main_td"><input name="rows[' + id + '][net_weight]" class="package form-control" required></td>'+
//                    '<td class="main_td"><input name="rows[' + id + '][gross_weight]" class="gross_weight form-control" required></td>'+
//                    '<td class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
//                    '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>'+
//                    '</td></tr>')
//                bind();
//                $("#country"+id).select1({
//                    source: country
//                });
//
//            });
            $(document).on('click', '.totaladd', function(){
                if($('#consignment_id').val() !=="") {
                    var save_consignment_no = $('#consignment_id').val();
                    var saved_destination = $('#destination').val();
                    var saved_consignment_date = $('#con_date').val();
                    var save_total_package = $('#total_package').val();
                    var save_total_net_weight = $('#total_net_weight').val();
                    var save_total_gross_weight = $('#total_gross_weight').val();
                    var total_package_for_challn = $('#total_package_for_challn').val();
                    var total_net_weight_for_challn = $('#total_net_weight_for_challn').val();
                    var total_gross_weight_for_challn = $('#total_gross_weight_for_challn').val();

                    i++;

                    count++;
                    var id = count;

                    $("#saved_data").append('<tr class="saved_data_row" style="border-bottom: solid 1px black">' +
                            '<td data-title="Consignment No" class="main_td"><input name="rows2[' + id + '][saved_data_consignment_no]" value="' + save_consignment_no + '" readonly class="saved_data_consignment_no form-control" required></td>' +
                            '<td data-title="Destination" class="main_td"><input name="rows2[' + id + '][saved_data_destination]" value="' + saved_destination + '" readonly class="saved_data_destination form-control" required></td>' +
                            '<td data-title="Date" class="main_td"><input name="rows2[' + id + '][saved_data_consignment_date]" value="' + saved_consignment_date + '" readonly class="saved_data_consignment_date form-control" required></td>' +
                            '<td data-title="Total_Package" class="main_td"><input name="rows2[' + id + '][total_package_add]" value="' + save_total_package + '" readonly class="total_package_add form-control" required></td>' +
                            '<td data-title="Total_Net Wt" class="main_td"><input name="rows2[' + id + '][total_net_weight_add]" value="' + save_total_net_weight + '" readonly class="total_net_weight_add form-control" required></td>' +
                            '<td data-title="Total_Gross WT" class="main_td"><input name="rows2[' + id + '][total_gross_weight_add]" value="' + save_total_gross_weight + '" readonly class="total_gross_weight_add form-control" required></td>' +
                            '<td data-title="Action" class="main_td"><a class=" deletesaved mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a></td>'+
                    '</tr>');
                    bind();
                    $('#consignment_id').val("");
                    $('#destination').val("");
                    $('#con_date').val("");
                    $('#total_package').val("");
                    $('#total_net_weight').val("");
                    $('#total_gross_weight').val("");
                    $('#total_package_for_challn').val(Number(total_package_for_challn)+Number(save_total_package));
                    $('#total_net_weight_for_challn').val(Number(total_net_weight_for_challn)+Number(save_total_net_weight));
                    $('#total_gross_weight_for_challn').val(Number(total_gross_weight_for_challn)+Number(save_total_gross_weight));
//

                }
                else{
                    alert("Please add Consignment No.")
                }
            });

//            function addTotal(){
//                var totalValue=(Number(total_package_for_challn)+Number(save_total_package));
//                $('#total_package_for_challn')
//
//            }

            $('body').on('focus',".datepicker_recurring_start", function(){
                $(this).datepicker({
                    dateFormat: 'dd-mm-yy'
                });
            });

            bind();
            $(document).on('click', '.deletesaved', function(){
                var total_package_for_challn = $('#total_package_for_challn').val();
                var total_net_weight_for_challn = $('#total_net_weight_for_challn').val();
                var total_gross_weight_for_challn = $('#total_gross_weight_for_challn').val();
                var row = $(this).parents('.saved_data_row');
                var package_data=row.find('.total_package_add').val();
                var net_weight_data=row.find('.total_net_weight_add').val();
                var gross_weight_data=row.find('.total_gross_weight_add').val();
                $('#total_package_for_challn').val(Number(total_package_for_challn)-Number(package_data));
                $('#total_net_weight_for_challn').val(Number(total_net_weight_for_challn)-Number(net_weight_data));
                $('#total_gross_weight_for_challn').val(Number(total_gross_weight_for_challn)-Number(gross_weight_data));
                $(this).parent().parent().remove();
            });
            $(document).on('click', '.del', function(){
//                        $(".del").on('click',function(){
                $(this).parent().parent().remove();
                update_total();
                total_discount();
                total_taxble_amount();
                total_gst();
                grandtotal();

//                        });
            });
            $(document).on('click', '.delete', function(){
//                        $(".del").on('click',function(){
                $(this).parent().parent().remove();
                $(".del").eq(-1).text('ADD');
                $('.del').eq(-1).attr('class','btn btn-danger btn-sm addrow');
                update_total();
                total_discount();
                total_taxble_amount();
                total_gst();
                grandtotal();

//                        });
            });

        });



    </script>

    <script type="text/javascript">
        $('#pan_applicable').on('change', function(event) {

            var i = $(this).val();
            if (i == "Yes") {
                $('#pan_no').attr('disabled', false); // hide the first one
                $('#pan_name').attr('disabled', false); // hide the first one
                $('#pan_of').attr('disabled', false);
            }

            if (i == "No") // equal to a selection option
            {
                $('#pan_no').attr('disabled', true); // hide the first one

                $('#pan_name').attr('disabled', true); // hide the first one
                $('#pan_of').attr('disabled', true); // hide the first one

            }

        });

        //    ----------------------Read only end-----------------

        $('#broker').on('change', function(event) {

            var i = $(this).val();
            if (i == "Yes") {
                $('#broker_name').attr('disabled', false); // hide the first one
                $('#broker_phone').attr('disabled', false); // hide the first one
                $('#broker_slip_no').attr('disabled', false);
            }

            if (i == "No") // equal to a selection option
            {
                $('#broker_name').attr('disabled', true); // hide the first one

                $('#broker_phone').attr('disabled', true); // hide the first one (# for id). for name
                $('#broker_slip_no').attr('disabled', true); // hide the first one

            }

        });

        //--------------------Balance Amount calulation function-----------

        function balance_amount() {
            var freight_amount = $('#freight').val();
            var diesel_amount = $('#diesel').val();
            var cash_advance_amount = $('#cash_advance').val();
            var balance_amount = Number(freight_amount) - Number(diesel_amount) - Number(cash_advance_amount);
            $('#balance').val("" + balance_amount);
        }
        //--------------bluer mean focus lana -------
        $('#freight').blur(balance_amount);
        $('#diesel').blur(balance_amount);
        $('#cash_advance').blur(balance_amount);
        //--------------------Balance Amount calulation function end-----------

        var product_type =  [/* states array*/];
        $("#from").select2({
            data: product_type
        });
        var product_type =  [/* states array*/];
        $("#to").select2({
            data: product_type
        });
        var product_type =  [/* states array*/];
        $("#broker_name").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#insurance_name").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#drivers_name").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#balance_payable_at").select2({
            data: product_type
        });

        //        $(document).ready(function($){
        //            $('#date').mask("99/99/9999",{placeholder:"dd/mm/yyyy"});
        //        });

        //   ----------------date validation--------------------
        $(function() {
            $("#date")
                .mask(
                    '99/99/9999',
                    { validate: function (fld,cur) {
                            // 1 == month; 0 == day; 2 == year
                            var mm = parseInt(fld[1]),
                                dd = parseInt(fld[0]),
                                yy = parseInt(fld[2]),
                                vl = true;
                            if (!(mm >= 0 && mm < 13) && cur == 1) {
                                fld[1] = '12';
                                vl = false;
                            }
                            if (!(dd >= 0 && dd <= 31) && cur == 0) {
                                fld[0] = '01';
                                vl = false;
                            }
                            if (!(yy >= 1976 && yy < 2199) && cur == 2 && fld[2].replace('_','').length == 4) {
                                fld[2] = '2012';
                                vl = false;
                            }
                            return vl;
                        }
                    });

        });

        //   ----------------date validation--------------------

        //        --------------------auto complete of from-----------
        $(document).on('focus','.autocomplete_txt_from',function(){
            type = $(this).data('type');

            if(type =='from' )autoType='city';

            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax_from1') }}",
                        dataType: "json",
                        data: {
                            term : request.term,
                            type : type,
                        },
                        success: function(data) {
                            var array = $.map(data, function (item) {
                                return {
                                    label: item[autoType],
                                    value: item[autoType],
                                    data : item
                                }
                            });
                            response(array)
                        }
                    });
                },
                select: function( event, ui ) {
                    var data = ui.item.data;
                    id_arr = $(this).attr('id');
                    id = id_arr.split("_");
                    elementId = id[id.length-1];
                    $('#from'+elementId).val(data.city);
                    $('#from_id').val(data.id);
                }
            });
        });
        //        --------------------auto complete of from-----------

        //        --------------------auto complete of to-----------
        $(document).on('focus','.autocomplete_txt_to',function(){
            type = $(this).data('type');

            if(type =='to' )autoType='city';

            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax_to1') }}",
                        dataType: "json",
                        data: {
                            term : request.term,
                            type : type,
                        },
                        success: function(data) {
                            var array = $.map(data, function (item) {
                                return {
                                    label: item[autoType],
                                    value: item[autoType],
                                    data : item
                                }
                            });
                            response(array)
                        }
                    });
                },
                select: function( event, ui ) {
                    var data = ui.item.data;
                    id_arr = $(this).attr('id');
                    id = id_arr.split("_");
                    elementId = id[id.length-1];
                    $('#to'+elementId).val(data.city);
                    $('#to_id'+elementId).val(data.id);
                }
            });
        });
        //        --------------------auto complete of to-----------

        //        ---------- driver details start begin-------

        $('#addnewDriver').click(function() {
//            alert("Hi");
            $.ajax({

                url: '{{ url('/') }}/AjaxNewDriver',

                type: "post",
                dataType: "json",
                data: {
                    '_token':$('input[name=_token]').val(),
                    'truck_driver_name':$('input[name=truck_driver_name]').val(),
                    'truck_driver_license_no':$('input[name=truck_driver_license_no]').val(),
                    'truck_driver_license_palce_of_issue':$('input[name=truck_driver_license_palce_of_issue]').val(),
                    'truck_driver_address':$('input[name=truck_driver_address]').val(),
                    'truck_driver_mob_no':$('input[name=truck_driver_mob_no]').val(),
                    'truck_driver_contact_no':$('input[name=truck_driver_contact_no]').val(),
                    'truck_driver_land_line_no':$('input[name=truck_driver_land_line_no]').val(),

                },

                success:function(data) {
//                $(data, function(key, value) {
                    var Vals    =  data;
                    $('select[name="drivers_name"]').append('<option value="'+ Vals.driver_id+'">'+ Vals.truck_driver_name +'</option>');
//                });


                    $('#myModal').modal('hide')
                }

            });

        });
        //        ---------- driver details start end-------

        //        ---------- Broker details start begin-------

        $('#addnewBroker').click(function() {
//            alert("Hi");
            $.ajax({

                url: '{{ url('/') }}/AjaxNewBroker',

                type: "post",
                dataType: "json",
                data: {
                    '_token':$('input[name=_token]').val(),
                    'name':$('input[name=name]').val(),
                    'address':$('input[name=address]').val(),
                    'pan_no':$('input[name=pan_no]').val(),
                    'mobile_no':$('input[name=mobile_no]').val(),
                    'contact_no':$('input[name=contact_no]').val(),
                    'land_line_no':$('input[name=land_line_no]').val(),

                },

                success:function(data) {
//                $(data, function(key, value) {
                    var Vals    =  data;
                    $('select[name="broker_name"]').append('<option value="'+ Vals.broker_id+'">'+ Vals.name +'</option>');
//                });


                    $('#myModal2').modal('hide')
                }

            });

        });
        //        ---------- Broker details start end-------


    </script>

@endsection

