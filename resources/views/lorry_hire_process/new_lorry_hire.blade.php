@extends('layouts.adminPanel')
@section('title')
    Admin Panel
@endsection
@section('custom_css')

    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        table, tr,td{
            border-top: none!important;
        }
        .btn{
            padding-top: 8px;
            padding-bottom: 8px;

        }
        .table{
            box-shadow: 0 0 20px #ccc
        }
        .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
            background-color:  #eeeff1;
        }
    </style>
@endsection


@section('content')

<div class="container-fluid">
    <div class="well" style="border: 0px;">
        @if(Session::has('flash_message'))
            <div class="alert alert-success">
                {{ Session::get('flash_message') }}
            </div>
        @endif
        <br>

        <h4 class="text-center"><span style="border-bottom: dotted 2px green;padding-bottom: 2px">Balance Lorry Hire Processing</span></h4>

        @if($errors->any())
            <div class="alert alert-danger">
                @foreach($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>
        @endif

        <a href="{{url('home_page')}}" class="btn btn-primary btn-sm">Back</a>
        <hr>
            <div class="panel panel-default" style="border: 0px">
                <?php echo Form::open(array('route' => 'store_new_balance_process','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>

                    <div class="row">
                                    <div class="col-md-4">

                                        <table class="table ">
                                            <tr>
                                                <td style="width: 30%">Branch<span style="color:red">*</span></td>
                                                <td>
                                                    <select name="branch_code" id="branch_code" class="form-control" required tabindex="1" >
                                                        <option value=""> Select Branch</option>
                                                        <?php  $datas = App\Branch::all(); ?>
                                                        @foreach($datas as $data)
                                                            <option value="{{$data->city}}">{{$data->city}}</option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                        <div class="col-md-4">

                            <table class="table">
                                <tr>
                                    <td style="width: 30%">Challan No<span style="color:red">*</span></td>
                                    <td>
                                        <select name="challan_no" id="challan_no" class="form-control" required tabindex="1" >
                                            <option value=""> Select Challan No</option>
                                            <?php  $datas = App\acknowledgement::all();?>

                                            @foreach($datas as $data)
                                            <?php $databalance = App\BalanceProcess::where("challan_no",$data->challan_number)->count();?>
                                            <?php $databalance1 = App\BalanceProcess::where("challan_no",$data->challan_number)->first();?>
                                                {{--<option value="">{{$data12->challan_no}}</option>--}}
                                               {{--<?php $data12 = DB::table("balance_hire_process")->where("challan_no",$data->challan_number)->first();?>--}}

                                                    @if($databalance<=0)
                                                        <option value="{{$data->challan_number}}">{{$data->challan_number}}</option>
                                                    @endif
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        {{--<div class="col-md-2" style="margin-top: 10px;">--}}
                            {{--<button type="submit" class="btn btn-success btn-md">Load</button>--}}
                        {{--</div>--}}
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Challan No</td>
                                    <td>
                                        <input type="text" name="challan_number" id="challan_number" class="form-control" placeholder="Challan No">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">From</td>
                                    <td>
                                        <input type="text" name="from" id="from" class="form-control" placeholder="From">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Total Weight</td>
                                    <td>
                                        <input type="text" name="total_weight" id="total_weight"  class="form-control" placeholder="Total Weight">

                                    </td>
                                </tr>
                            </table>
                        </div>

                        <!-- --------------------2nd row---------------------- -->

                        <div class="col-md-4" >
                            <table class="table table-bordered">
                                <tr>
                                    <td style="width: 30%">Date</td>
                                    <td>

                                        <input type="text" name="date" id="date" class="form-control" placeholder="Date">

                                    </td>
                                </tr>


                                <tr>
                                    <td style="width: 30%">To</td>
                                    <td>

                                        <input type="text" name="to" id="to" class="form-control" placeholder="To">

                                    </td>
                                <tr>
                                    <td style="width: 30%">Total Freight</td>
                                    <td>
                                        <input type="text" name="total_freight" id="total_freight" class="form-control" placeholder="Total Freight">

                                    </td>
                                </tr>


                                </td>
                                </tr>

                            </table>
                        </div>

                        <!-- -----------3rd row------ -->
                        <div class="col-md-4">
                            <table class="table table-bordered">
                                <tr>
                                    <td style="width: 40%">Vehicle No</td>
                                    <td>
                                        <input type="text" name="vehicle_no" id="vehicle_no" class="form-control" placeholder="Vehicle No">

                                    </td>
                                </tr>


                                <tr>
                                    <td style="width: 40%">Total Advance</td>
                                    <td>
                                        <input type="text" name="total_advance" id="total_advance" class="form-control" placeholder="Total Advance">

                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 40%">Balance Amount</td>
                                    <td>
                                        <input type="text" name="balance_amount" id="balance_amount" class="form-control" placeholder="Balance Amount to be Paid">

                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-6" >
                            <table class="table table-bordered" style="background: rgba(0, 151, 19, 0.1);">
                                <tr>
                                    <td style="width: 40%">Detention</td>
                                    <td class="">
                                        <input type="text" name="detenction" id="detenction" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="detenction_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                    {{--<td class=" col-md-2">--}}
                                    {{--<input type="text" name="detenction_cal" id="detenction_cal" class="form-control"/>--}}
                                    {{--</td>--}}
                                </tr>

                                <tr>
                                    <td style="width: 40%">Local Lorry Hire</td>
                                    <td class="">
                                        <input type="text" name="local_lorry" id="local_lorry" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="local_lorry_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                    {{--<td class=" col-md-2">--}}
                                    {{--<input type="text" name="local_lorry_cal" id="local_lorry_cal" class="form-control"/>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%">Labour Charge</td>
                                    <td class="">
                                        <input type="text" name="labour" id="labour" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="labour_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                    {{--<td class=" col-md-2">--}}
                                    {{--<input type="text" name="labour_cal" id="labour_cal" class="form-control"/>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%;">Green Tax</td>
                                    <td class="">
                                        <input type="text" name="green_tax" id="green_tax" class="form-control"/>
                                    </td>
                                </tr>
                                {{--<td class=" col-sm-1"  style="background-color: white;">--}}
                                {{--<select name="green_tax_select">--}}
                                {{--<option value="dr">DR</option>--}}
                                {{--<option value="cr">CR</option>--}}
                                {{--</select>--}}
                                {{--</td>--}}
                                <tr>
                                    <td style="width: 40%;">Toll Tax</td>
                                    <td class=""  style="">
                                        <input type="text" name="toll_tax" id="toll_tax" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1" style="background-color: white;">--}}
                                    {{--<select name="toll_tax_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                </tr>
                            </table>
                        </div>

                        <!-- --------------------2nd row---------------------- -->


                        <!-- -----------3rd row------ -->
                        <div class="col-md-6">
                            <table class="table table-bordered" style="background: rgba(255,0,0, 0.1);">
                                <tr>
                                    <td style="width: 40%">Shortage</td>
                                    <td class="">
                                        <input type="text" name="shortage" id="shortage" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="shortage_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%">Damage</td>
                                    <td class="">
                                        <input type="text" name="damage" id="damage" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="damage_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%">Late Delivery</td>
                                    <td class="">
                                        <input type="text" name="late_delivery" id="late_delivery" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="late_delivery_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%">Fuel Recovery</td>
                                    <td class="">
                                        <input type="text" name="fuel_recovery" id="fuel_recovery" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="fuel_recovery_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%">Driver's Claim</td>
                                    <td class="">
                                        <input type="text" name="driver_claim" id="driver_claim" class="form-control"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <table class="table table-bordered">
                                <tr>
                                    <td style="width: 40%">Incidental</td>
                                    <td class=" ">
                                        <input type="text" name="incidental" id="incidental" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                    {{--<select name="incidental_select">--}}
                                    {{--<option value="dr">DR</option>--}}
                                    {{--<option value="cr">CR</option>--}}
                                    {{--</select>--}}
                                    {{--</td>--}}
                                    {{--<td class=" col-md-2">--}}
                                    {{--<input type="text" name="incidental_cal" id="incidental_cal" class="form-control"/>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%">Mamul</td>
                                    <td class="">
                                        <input type="text" name="mamul" id="mamul" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                        {{--<select name="mamul_select">--}}
                                            {{--<option value="dr">DR</option>--}}
                                            {{--<option value="cr">CR</option>--}}
                                        {{--</select>--}}
                                    {{--</td>--}}
                                    {{--<td class=" col-md-2">--}}
                                        {{--<input type="text" name="mamul_cal" id="mamul_cal" class="form-control"/>--}}
                                    {{--</td>--}}
                                </tr>
                                <tr>
                                    <td style="width: 40%">Lorry Hire Cash Discount</td>
                                    <td class="">
                                        <input type="text" name="lorry_discount" id="lorry_discount" class="form-control"/>
                                    </td>
                                    {{--<td class=" col-sm-1">--}}
                                        {{--<select name="lorry_discount_select">--}}
                                            {{--<option value="dr">DR</option>--}}
                                            {{--<option value="cr">CR</option>--}}
                                        {{--</select>--}}
                                    {{--</td>--}}
                                    {{--<td class=" col-md-2">--}}
                                        {{--<input type="text" name="lorry_discount_cal" id="lorry_discount_cal" class="form-control"/>--}}
                                    {{--</td>--}}
                                </tr>

                            </table>
                        </div>
                        <div class="col-md-4 pull-right">
                            <table class="table table-bordered">
                                <tr>
                                    <td style="width: 40%">Acknowledgement Date</td>
                                    <td>

                                        <input type="text" name="acknowledgement_date" id="acknowledgement_date" class="form-control" placeholder="Acknowledgement Date">

                                    </td>
                                </tr>


                                <tr>
                                    <td style="width: 40%">Reporting Date</td>
                                    <td>

                                        <input type="text" name="reporting_date" id="reporting_date" class="form-control" placeholder="Reporting Date">

                                    </td>
                                <tr>
                                    <td style="width: 40%">Uploading Date</td>
                                    <td>
                                        <input type="text" name="uploading_date" id="uploading_date" class="form-control" placeholder="Uploading Date">

                                    </td>
                                </tr>
                                {{--<tr>--}}
                                    {{--<td style="width: 40%">Time in Transit</td>--}}
                                    {{--<td>--}}
                                        {{--<input type="text" name="time_in_transit" id="time_in_transit" class="form-control" placeholder="Time in Transit">--}}

                                    {{--</td>--}}
                                {{--</tr>--}}
                                {{--<tr>--}}
                                    {{--<td style="width: 40%">Detention Days</td>--}}
                                    {{--<td>--}}
                                        {{--<input type="text" name="detention_days" id="detention_days" class="form-control" placeholder="Detention Days">--}}

                                    {{--</td>--}}
                                {{--</tr>--}}


                            </table>
                            {{--<table class="table table-bordered">--}}
                                {{--<tr>--}}
                                    {{--<td style="width: 40%">Time in Transit</td>--}}
                                    {{--<td>--}}
                                        {{--<input type="text" name="time_in_transit2" id="time_in_transit2" class="form-control" placeholder="Time in Transit">--}}

                                    {{--</td>--}}
                                {{--</tr>--}}
                                {{--<tr>--}}
                                    {{--<td style="width: 40%">Detention Rate</td>--}}
                                    {{--<td>--}}
                                        {{--<input type="text" name="detention_rate" id="detention_rate" class="form-control" placeholder="Detention Rate">--}}

                                    {{--</td>--}}
                                {{--</tr>--}}
                                {{--<tr>--}}
                                    {{--<td style="width: 40%">Late Delivery Rate</td>--}}
                                    {{--<td>--}}
                                        {{--<input type="text" name="late_delivery_rate" id="late_delivery_rate" class="form-control" placeholder="Late Delivery Rate">--}}

                                    {{--</td>--}}
                                {{--</tr>--}}


                                {{--</td>--}}
                                {{--</tr>--}}

                            {{--</table>--}}
                            {{--<table class="table table-bordered">--}}
                                {{--<tr>--}}
                                    {{--<td style="width: 40%">Detention Amount</td>--}}
                                    {{--<td>--}}
                                        {{--<input type="text" name="detention_amount" id="detention_amount" class="form-control" placeholder="Detention Amount">--}}

                                    {{--</td>--}}
                                {{--</tr>--}}
                                {{--<tr>--}}
                                    {{--<td style="width: 40%">Late Delivery</td>--}}
                                    {{--<td>--}}
                                        {{--<input type="text" name="late_delivery" id="late_delivery" class="form-control" placeholder="Late Delivery">--}}

                                    {{--</td>--}}
                                {{--</tr>--}}


                                {{--</td>--}}
                                {{--</tr>--}}

                            {{--</table>--}}
                        </div>



                    </div>
                    <div class="row">
                        <div class="col-md-1 col-md-offset-4">
                            <button type="submit" id="submit" class="btn btn-warning btn-sm" tabindex="18">Save <span class="glyphicon glyphicon-hdd"></span></button>
                        </div>
                        <div class="col-md-1">
                            <button type="reset" class="btn btn-info btn-sm" >Reset <span class="glyphicon glyphicon-refresh"></span></button>
                        </div>

                        <div class="col-md-1"><a  class="btn btn-success btn-sm" href="{{url('home_page')}}">Back</a>
                        </div>
                    </div>


                    {{form::close()}}
            </div>







    </div>
</div>

    <script>

        $('#challan_no').on('change', function() {
            var challn_id = $('#challan_no').val();


            if (challn_id) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_Challan_no/' + challn_id,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {
                        $('input[name="challan_number"]').empty();
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
                        $('input[name="challan_number"]').val(Vals.challan_no);
                        $('input[name="from"]').val(Vals.from);
                        $("input[name='vehicle_no']").val(Vals.truck_no);
                        $("input[name='total_freight']").val(Vals.total_freight);
                        $("input[name='total_advance']").val(Vals.advance);
                        $("input[name='balance_amount']").val(Vals.balance_amount);
                        $("input[name='total_weight']").val(Vals.total_weight);
                        $("input[name='date']").val(Vals.date);
                        $("input[name='to']").val(Vals.to);

                    }

                });

            } else {
//                $("#cndetails").css("display", "none");
//                $('input[name="date"]').empty();
//                $('input[name="from"]').empty();
//                $('input[name="to"]').empty();
//                $('input[name="truck_no"]').empty();

            }

        });
        $(function() {
            $("#date,#acknowledgement_date,#reporting_date,#uploading_date")
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
    </script>
@endsection
