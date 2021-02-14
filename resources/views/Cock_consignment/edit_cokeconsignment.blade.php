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
        #consignment_no_error{
            display: none;
            margin-bottom: -10px;
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
    @if(Session::has('flash_message_error'))
        <div class="alert alert-danger">
            {{ Session::get('flash_message_error') }}
        </div>
    @endif
    <header class="page-header">
        <h2>New Consignment Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Consignment Entry</span></li>
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
    {{-- ----------------------------------------inner content here --------------------------------------------------------}}
    <div class="well">

        <div class="row">


            <?php echo Form::open(array('url' =>['update_cokeconsignment', $bata->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");')); ?>

            {{--____________________________________________________________________________________________________________________________________________________________--}}

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Consignment No</label>
                        <input type="text" name="consignment_no" id="consignment_no" class="form-control" value="{{$bata->consignment_no}}"  maxlength="6" placeholder="Consignment No" required tabindex="1" autofocus>
                        <input class="form-control" type='hidden' id='user' name='user' value="{{$bata->created_user}}">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Consignment Date</label>
                        <input type="text" name="con_date" id="con_date" value="{{date('d/m/Y',strtotime($bata->con_date))}}" class="styledate form-control" placeholder="__/__/____" tabindex="2"  placeholder=" Consignment Date" required />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Load ID</label>
                        <input type="text" name="load_id" id="load_id" class="form-control" value="{{$bata->load_id}}" placeholder="Load ID"  tabindex="4">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Trip ID</label>
                        <input type="text" name="trip_id" id="trip_id" class="form-control" value="{{$bata->trip_id}}" placeholder="Trip ID" tabindex="3">
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Party Code</label>
                        <select id='party_code' name='party_code' class="form-control" tabindex="3">
                            <?php  $party_name = App\Party::where('party_code',$bata->party_code)->first(); ?>
                            <option value="{{$bata->party_code}}">{{$bata->party_code}}-{{$party_name->name}}</option>
                            <?php  $datas = App\Party::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->party_code}}">{{$data->party_code}} - {{$data->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Billed At</label>
                        <input class="form-control" value="{{$bata->billed_at}}" type='text' data-type="billed_at" id='billed_at' name='billed_at' placeholder="Billed At" tabindex="4" required>

                        <input class="form-control autocomplete_txt_billed_at" value="{{$bata->billed_at_id}}" type='hidden' data-type="billed_at_id" id='billed_at_id' name='billed_at_id'>

                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Consignor Name</label>
                        <input class="form-control" type='text' data-type="consignor_name" value="{{$bata->consignor_name}}" id='consignor_name' name='consignor_name'  placeholder="Consignor Name" tabindex="5" required>

                        <input class="form-control autocomplete_txt" type='hidden' value="{{$bata->consignor_id}}" data-type="consignor_id" id='consignor_id' name='consignor_id'>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Consignor Address</label>
                        <input type="text" name="consignor_address" id="consignor_address"  value="{{$bata->consignor_address}}" data-type="consignor_address" class="form-control" placeholder="Consignor Address" tabindex="6" required>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Consignee Name</label>
                        <input type="text" name="consignee_name" id="consignee_name" value="{{$bata->consignee_name}}" data-type="consignee_name" class="form-control" placeholder="Consignee Name" tabindex="6" required>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Consignee Address</label>
                        <input type="text" name="consignee_address" id="consignee_address" value="{{$bata->consignee_address}}" data-type="consignee_address" class="form-control" placeholder="Consignee Address" tabindex="6" required>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">From<a href="" data-toggle="modal" data-target="#myModal2" style="text-decoration: none;"> +New Location</a></label>
                        <select name="from" id="from" class="form-control" style="width: 100%" required>
                            <option value="{{$bata->from}}">{{$bata->from}}</option>
                            <?php  $datas = App\Location::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->city}}">{{$data->city}}</option>
                            @endforeach
                        </select>

                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">To<a href="" data-toggle="modal" data-target="#myModal2" style="text-decoration: none;"> +New Location</a></label>
                        <select name="to" id="to" class="form-control" style="width: 100%" required>
                            <option value="{{$bata->to}}">{{$bata->to}}</option>
                            <?php  $datas = App\Location::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->city}}">{{$data->city}}</option>
                            @endforeach
                        </select>


                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Truck Type</label>
                        <select name="truck_type" id="truck_type" class="form-control" style="width: 100%" required>
                            <option value="{{$bata->truck_type}}"> {{$bata->truck_type}}</option>
                            <?php  $datas = \App\Trucktype::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->trucktype}}">{{$data->trucktype}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Truck No</label>
                        <select id='truck_no' name='truck_no' class="form-control" style="width: 100%;" tabindex="10">
                            <option value="{{$bata->truck_no}}"> {{$bata->truck_no}}</option>
                            <?php  $datas = App\Lorry::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->truck_no}}">{{$data->truck_no}}</option>
                            @endforeach
                        </select>
                        <input class="form-control autocomplete_txt_truck_no" type='hidden' data-type="truck_no_id" value="{{$bata->truck_no_id}}" id='truck_no_id' name='truck_no_id'>

                    </div>
                </div>
            </div><br>




            {{--____________________________________________________________________________________________________________________________________________________________--}}





            <!-- --------------------end here---------------------- -->


            {{-------------------------------------- retail customer ends here ---------------------  --}}

            {{--First Append Start--}}

            <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Invoice Information</span></h4>
            <div class="table-responsive">
                <table id="items" class="table table-no-more table-bordered mb-none billing_table" style="font-size: 13px!important;">
                    <thead>
                    <tr style="background-color: #09C6AB;color: #ffffff">
                        <th>Invoice No.<span style="color: red">*</span></th>
                        <th>Invoice Date<span style="color: red">*</span></th>
                        <th>Invoice Value<span style="color: red">*</span></th>
                        <th>Way Bill No</th>
                        <th>Validity <span style="color: red">*</span></th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <?php $con_child = \App\CockConsignment_child::where('consignment_id',$bata->id)->get(); ?>
                    <?php $con_length = \App\CockConsignment_child::where('consignment_id',$bata->id)->count(); ?>
                    <?php
                    $count=0;
                    $i = 1;
                    ?>
                    @foreach($con_child as $child)
                        <tr class="item-row" style="border-bottom: solid 1px black">

                            <td data-title="Invoice No." class="main_td">
                                <input name="rows[{{$count}}][invoice_no]" class="invoice_no form-control" value="{{$child->invoice_no}}" required tabindex="10">
                            </td>
                            <?php $newDate = date("d/m/Y", strtotime($child->invoice_date)); ?>
                            <td data-title="Invoice Date" class="main_td">
                                <input name="rows[{{$count}}][invoice_date]" tabindex="11" class="invoice_date styledate form-control" required value="{{$newDate}}" />
                            </td>
                            <td data-title="Invoice Value" class="main_td">
                                <input name="rows[{{$count}}][invoice_value]" class="invoice_value form-control" value="{{$child->invoice_value}}"  tabindex="12">
                            </td>
                            <td data-title="Way Bill No" class="main_td">
                                <input name="rows[{{$count}}][way_bill_no]" class="way_bill_no form-control" value="{{$child->way_bill_no}}"   tabindex="13">
                            </td>
                            @if($child->validity!="")
                                <?php $validityDate = date("d/m/Y", strtotime($child->validity)); ?>
                                <td data-title="Validity" class="main_td">
                                    <input name="rows[{{$count}}][validity]" class="validity styledate form-control" value="{{$validityDate}}" tabindex="14">
                                </td>
                            @else
                                <td data-title="Validity" class="main_td">
                                    <input name="rows[{{$count}}][validity]" class="validity styledate form-control" value="" tabindex="14">
                                </td>

                            @endif
                            <input type="hidden" name="rows[{{$count}}][myflag]" value="1">
                            <input type="hidden" name="rows[{{$count}}][child_id]" value="{{$child->id}}">
                            <td data-title="Action">
                                @if($i < $con_length)
                                    <a class="btn btn-info btn-sm del updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">X Del</a>
                                @else
                                    <a class="btn btn-danger btn-sm addrow updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">ADD</a>
                                    <a class=" delete mybtn  btn btn-system" href="javascript:;" title="Remove row">X</a>
                                @endif
                            </td>
                        </tr>

                        <?php $count+=1 ?>
                        <?php $i+=1 ?>

                    @endforeach
                    <input type="hidden" id="counted" name="counted" value="{{$count}}">
                </table>
            </div>
            {{--First Append End--}}
            <br>
            {{--Second Append Start--}}

            <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Consignment Details</span></h4>
            <div class="table-responsive">
                <table id="items" class="table table-no-more table-bordered mb-none billing_table" style="font-size: 13px!important;">
                    <thead>
                    <tr style="background-color: #09C6AB;color: #ffffff">
                        <th>Category<span style="color: red">*</span></th>
                        <th>Package<span style="color: red">*</span></th>
                        <th>Description</th>
                        <th>Net Weight</th>
                        <th>Gross Weight</th>
                        <th>Remarks</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <?php $con_child = \App\CockConsignment_child2::where('consignment_id',$bata->id)->get(); ?>
                    <?php $con_length2 = \App\CockConsignment_child2::where('consignment_id',$bata->id)->count(); ?>
                    <?php $count2=0 ?>
                    <?php $i2=1 ?>
                    @foreach($con_child as $child)
                        <tr class="item-row2" style="border-bottom: solid 1px black">

                            <td data-title="Category" class="main_td">
                                <select name="rows2[{{$count2}}][category]" id="category" class="category form-control" style="width: 100%;" required tabindex="15">
                                    <option value="{{$child->category_id}}">{{$child->category}}</option>
                                    <?php $material_cat = \App\Materialcategory::all(); ?>
                                    @foreach($material_cat as $mat)
                                        <option value="{{$mat->id}}">{{$mat->category}}</option>
                                    @endforeach
                                </select>
                            </td>
                            <td data-title="Package" class="main_td"><input name="rows2[{{$count2}}][package]" value="{{$child->package}}" class="package form-control" tabindex="16" required></td>
                            <td data-title="Description" class="main_td"><input name="rows2[{{$count2}}][description]" value="{{$child->description}}" class="description form-control" tabindex="17"></td>
                            <td data-title="Net Weight" class="main_td"><input name="rows2[{{$count2}}][net_weight]" value="{{$child->net_weight}}"  class="description form-control" tabindex="18"></td>
                            <td data-title="Gross Weight" class="main_td"><input name="rows2[{{$count2}}][gross_weight]" value="{{$child->gross_weight}}"  class="description form-control" tabindex="19"></td>
                            <td data-title="Remarks" class="main_td"><input name="rows2[{{$count2}}][remark]" value="{{$child->remark}}" class="description form-control" tabindex="20">
                                <input type="hidden" name="rows2[{{$count2}}][myflag]" value="1">
                                <input type="hidden" name="rows2[{{$count2}}][child_id]" value="{{$child->id}}">
                            </td>
                            <td>
                                @if($i2 < $con_length2)
                                    <a class="btn btn-info btn-sm del updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">X Del</a>
                                @else
                                    <a class="btn btn-danger btn-sm addrow2 updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">ADD</a>
                                    <a class=" delete mybtn  btn btn-system" href="javascript:;" title="Remove row">X</a>
                                @endif
                            </td>
                        </tr>
                        <?php $count2+=1 ?>
                        <?php $i2+=1 ?>
                    @endforeach
                    <input type="hidden" id="counted2" name="counted2" value="{{$count2}}">
                </table>
            </div>
            {{--Second Append End--}}


            <br>
            <br>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Consignment Value : </label>
                        <div class="col-sm-8">
                            <input type="number" value="{{$bata->cn_value}}" name="cn_value" id="cn_value" class="form-control"readonly>
                        </div>
                    </div>
                </div>
            </div>
            <br>
        </div>
        <div class="row">
            <footer class="col-md-8">
                <button type="submit" class="btn btn-success" id="submit">Submit</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </footer>
        </div>
        <br>

        {{form::close()}}
    </div> <!-- panel body ends here -->
    </div> <!-- invoice details panel ends here -->
    </div>
    {{--<div class="modal fade" id="modalRegisterForm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--}}
    {{--<form id="testform125">--}}
    {{--<div class="modal-dialog" role="document">--}}
    {{--<div class="modal-content">--}}
    {{--<div class="row">--}}
    {{--<div class="col-md-8 col-md-offset-2" style="">--}}
    {{--<br>--}}
    {{--<table class="table">--}}

    {{--<tr>--}}
    {{--<td style="width: 30%">City<span style="font-size: 13px;color: red">*</span></td>--}}
    {{--<td>--}}
    {{--<input type="text" name="city" id="city" class="form-control" placeholder="City" required autofocus>--}}

    {{--</td>--}}
    {{--</tr>--}}

    {{--<tr>--}}
    {{--<td style="width: 30%">District</td>--}}
    {{--<td>--}}
    {{--<input type="text" name="dist" id="dist" class="form-control" placeholder="Dist">--}}
    {{--</td>--}}
    {{--</tr>--}}

    {{--<tr>--}}
    {{--<td style="width: 30%">State</td>--}}
    {{--<td>--}}
    {{--<input type="text" name="state" id="state" class="form-control" placeholder="State">--}}
    {{--</td>--}}
    {{--</tr>--}}
    {{--</table>--}}
    {{--<br>--}}
    {{--<div class="row text-center">--}}
    {{--<button type="submit" id="submitloc" class="btn btn-success btn-sm">Save</button>--}}
    {{--<button type="reset" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>--}}
    {{--</div>--}}
    {{--<br>--}}
    {{--</div>--}}

    {{--<br>--}}
    {{--</div>--}}
    {{--</div>--}}
    {{--</div>--}}
    {{--</form>--}}
    {{--</div>--}}
    <div class="modal fade" id="myModal2"  role="dialog" aria-labelledby="myModalLabel">
        <form id="testform125">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Create New Location <span style="font-size: 12px;color:#EB3E28;">* You Can Fill Full Details Later In Location Master</span></h4>
                    </div>
                    <div class="modal-body">

                        {{---------try-------------}}
                        <tr>


                            <td>
                                <input type="hidden" name="doctor_code"  id="doctor_code" class="form-control"  readonly>
                            </td>
                        </tr>
                        {{---------try-------------}}



                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-sm-6">
                                <div class="form-group has-success has-feedback">
                                    <label for="inputSuccess2">City<span style="color:#EB3E28;">*</span></label>
                                    <input  type="text" name="city-area" class="form-control" id="inputSuccess2" placeholder="City's Name" required>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-6">
                                <div class="form-group has-success has-feedback">District</label>
                                    <input  type="text" name="district-area" class="form-control" id="inputSuccess2" placeholder="District">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-sm-6">
                                <div class="form-group has-success has-feedback">
                                    <label for="inputSuccess2">State</label>

                                    <input  type="text" name="state-area" class="form-control" id="inputSuccess2" placeholder="State">
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
                                <button type="submit" id="addnewlocation"  class="btn btn-primary"> Save</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
    {{--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>--}}
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}
    <script>
        $('#consignment_no').on('blur', function() {
            var stateID = $('#consignment_no').val();
            if (stateID) {

                $.ajax({
                    url: '{{ url('/') }}/AjaxGet_consignment_no_data/' + stateID,
                    type: "GET",
                    success: function(response) {
                        if(response == 'unique'){

                            $('#consignment_no').css( 'border-bottom-color','red');
                            $('#consignment_no_error').css('display','block');
                        }else{
                            $('#consignment_no_error').css('display','none');
                            $('#consignment_no').css( 'border-bottom-color','silver');
                        }
                    }
                });

            } else {

            }

        });
        $('.invoice_value').on('blur', function() {
            var invoice_value =$('.invoice_value').val();
            if(invoice_value==""){
                $('.invoice_value').val('0');
            }
        });
        $('#party_code').on('change', function() {
            var stateID = $('#party_code').val();
            if (stateID) {

                $.ajax({
                    url: '{{ url('/') }}/AjaxGet_party_data/' + stateID,
                    type: "GET",

                    dataType: "json",
                    success: function (data) {
                        $("input[name='consignor_name']").empty();
                        $("input[name='consignor_address']").empty();

                        var Vals = data;
                        $("input[name='consignor_name']").val(Vals.name);
                        $("input[name='consignor_address']").val(Vals.address);
                    }
                });

            } else {

            }

        });
        $("#testform125").submit(function(e){
            e.preventDefault();
        });
        $('#addnewlocation').click(function() {
//            alert("Hi")
            $.ajax({

                url: '{{url('')}}/AjaxNewLocation',

                type: "post",
                dataType: "json",
                data: {
                    '_token':$('input[name=_token]').val(),
                    'city':$('input[name=city-area]').val(),
                    'district':$('input[name=district-area]').val(),
                    'state':$('input[name=state-area]').val(),
                },

                success:function(data) {
//                $(data, function(key, value) {
                    var Vals    =  data;
                    $('select[name="from"]').append('<option value="'+ Vals.city+'">'+ Vals.city +'</option>');
                    $('select[name="to"]').append('<option value="'+ Vals.city+'">'+ Vals.city +'</option>');
//                });


                    $('#myModal2').modal('hide')
                }

            });

        });

        $('#truck_no').on('change', function() {
            var stateID = $('#truck_no').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_truck_id/' + stateID,

                    type: "GET",

                    dataType: "json",
                    success: function(data) {
                        $("input[name='truck_no_id']").empty();

                        var Vals = data;
                        $("input[name='truck_no_id']").val(Vals.id);
                    }

                });

            } else {
                $("input[name='truck_no_id']").empty();
            }

        });

        {{--$('#submitloc').click(function() {--}}
        {{--//            alert("Hi");--}}
        {{--$.ajax({--}}

        {{--url: '{{ url('/') }}/AjaxNewlocation',--}}

        {{--type: "post",--}}
        {{--dataType: "json",--}}
        {{--data: {--}}
        {{--'city':$('#city').val(),--}}
        {{--'dist':$('#dist').val(),--}}
        {{--'state':$('#state').val()--}}
        {{--},--}}

        {{--success:function(data) {--}}
        {{--$('#modalRegisterForm').modal('hide')--}}
        {{--}--}}

        {{--});--}}

        {{--});--}}
//        $(".alert").fadeTo(2000, 500).slideUp(1500, function(){
//            $(".alert").slideUp(1500);
//        });

        window.setTimeout(function () {
            $(".alert").slideUp(500, function () {
                $(".alert").hide();
            });
        }, 5000);

        $(function() {
            $(".base").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        } );

        function myFunction() {
            var option_value = document.getElementById("brand_name").value;
            if (option_value == "create") {
//            document.getElementById('new_brand_name').readonly=false;
                $("#new_brand_name").removeAttr('disabled');
            }
        }

        function myFunction1() {
            var option_value = document.getElementById("product_type").value;
            if (option_value == "create") {
//            document.getElementById('new_brand_name').readonly=false;
                $("#new_product_type").removeAttr('disabled');
            }

        }

        function copyTextValue() {
            var text1 = document.getElementById("product_igst").value;
            document.getElementById("product_cgst").value = text1/2;
            document.getElementById("product_sgst").value = text1/2;
        }



        $('#btnReset').click(function() {
            $("#brand_name").val(null).trigger("change");
            $("#product_type").val(null).trigger("change");
        });


        var product_type =  [/* states array*/];
        $("#product_type").select({
            data: product_type
        });

        var brand =  [/* states array*/];
        $("#brand_name").select({
            data: brand
        });


        $('.modal').on('hidden.bs.modal', function(){
            $(this).find('form')[0].reset();
            $("#brand_name").val(null).trigger("change");
            $("#product_type").val(null).trigger("change");
        });



        // ------------------------------------------------------------------------------ add new product --------------------

    </script>

    <!-- customer select style -->
    <script>

        var destination =  [/* states array*/];
        $("#truck_no").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $(".category").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#truck_type").select2({
            data: destination
        });
        var product_type =  [/* states array*/];
        $("#from").select2({
            data: product_type
        });
        var product_type =  [/* states array*/];
        $("#to").select2({
            data: product_type
        });


        var country =  [/* states array*/];
        $("#product_name").select({
            data: country
        });
        var customer =  [/* states array*/];
        $("#customer").select({
            data: customer
        });
        $('#customer').select('open').select('close');
        var payment_type =  [/* states array*/];
        $("#payment_type").select({
            data: payment_type
        });


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
        // if i will select city then it will give you the deails of district and state


        $('select[name="consignor_name"]').on('change', function() {

            var stateID = $(this).val();

            if(stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_party_name/'+stateID,

                    type: "GET",

                    dataType: "json",

                    success:function(data) {

                        $('input[name="party_code"]').empty();


                        var Vals    =  data;

                        $("input[name='party_code']").val(Vals.party_code);


                    }

                });

            }else{

                $('input[name="party_code"]').empty();



            }

        });

        //        ----------------------------------------------- get party name by party code-------------------------------
        //            First Append Start
        $(document).ready(function() {

            var i=1;
            var count= $("#counted").val();
            var count2= $("#counted2").val();
            $('input').click(function(){
                $(this).select();
            });

            $("#paid").blur(update_balance);


            $(document).on('click', '.addrow', function(){
                $(this).text('x Del');
                $(this).attr('class','btn btn-info btn-sm del');
                $(".item-row:last").find('.mybtn').hide();
                i++;


                var id=count;


                $(".item-row:last").after('<tr class="item-row" style="border-bottom: solid 1px black">' +
                        '<td data-title="Invoice No." class="main_td"><input name="rows[' + id + '][invoice_no]" class="form-control"required></td>'+
                        '<td data-title="Invoice Date" class="main_td"><input name="rows[' + id + '][invoice_date]" id=\"invoice_date' + id + '\"  class="styledate invoice_date form-control" required value="<?php echo date('d/m/Y');?>"/></td>'+

                        '<td data-title="Invoice Value" class="main_td"><input name="rows[' + id + '][invoice_value]" id=\"invoice_value' + id + '\" class="invoice_value form-control" ></td>'+
                        '<td data-title="Way Bill No" class="main_td"><input name="rows[' + id + '][way_bill_no]" class="way_bill_no form-control"></td>'+
                        '<td data-title="Validity" class="main_td"><input name="rows[' + id + '][validity]" id=\"validity' + id + '\"  class="styledate form-control" ></td>'+
                        '<td data-title="Action" class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>');
                bind();
                count++;
                dateChange();
                $('#invoice_value'+id).on('blur', function() {
                    var invoice_value =$('#invoice_value'+id).val();
                    if(invoice_value==""){
                        $('#invoice_value'+id).val('0');
                    }
                });
                //------------- con_date=invoice date----------
                var  mycon_date2 = $('#con_date').val();

                $('#invoice_date'+id).val(mycon_date2);
                //------------- con_date=invoice date----------

                $(function() {
                    $(".styledate")
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


            });

//          Second Append End
            $(document).on('click', '.addrow2', function(){

                $(this).text('x Del');
                $(this).attr('class','btn btn-info btn-sm del');
                $(".item-row2:last").find('.mybtn').hide();
                i++;


                var id=count2;

                $(".item-row2:last").after('<tr class="item-row2" style="border-bottom: solid 1px black">' +

                        '<td data-title="Category." class="main_td">' +
                        ' <select name="rows2[' + id + '][category]" id=\"category' + id + '\" style="width: 100%;" class="category form-control">'+
                        '<option value="">select one category</option>'+
                        <?php $material_cat = \App\Materialcategory::all(); ?>
                                @foreach($material_cat as $mat)
                            '<option value="{{$mat->id}}">{{$mat->category}}</option>'+
                        @endforeach
                            '</select>' +
                        '</td>'+

                        '<td data-title="Package" class="main_td"><input name="rows2[' + id + '][package]" class="package form-control"></td>'+
                        '<td data-title="Description" class="main_td"><input name="rows2[' + id + '][description]" class="description form-control"></td>'+
                        '<td data-title="Net Weight" class="main_td"><input name="rows2[' + id + '][net_weight]" class="net_weight form-control"></td>'+
                        '<td data-title="Gross Weight" class="main_td"><input name="rows2[' + id + '][gross_weight]" class="net_weight form-control"></td>'+
                        '<td data-title="Remark" class="main_td"><input name="rows2[' + id + '][remark]" class="net_weight form-control"></td>'+
                        '<td data-title="Action" class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow2" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system2" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>');
                count2++;
                $("#category"+id).select2({
                    source: country
                });


            });


//            Second append end

            $('body').on('focus',".datepicker_recurring_start", function(){
                $(this).datepicker({
                    dateFormat: 'dd-mm-yy'
                });
            });

            bind();
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



        var product_type =  [/* states array*/];
        $("#category").select({
            data: product_type
        });

        //   ----------------date validation--------------------
        $(function() {
            $(".styledate")
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
        //   ----------------date change con_date=invoice_date--------------------
        function dateChange(){
            var  mycon_date = $('#con_date').val();

            $('.item-row').find('.invoice_date').val(mycon_date);
        }

        $('#con_date').blur(dateChange);
        //   ----------------date change con_date=invoice_date--------------------

        //        --------------------auto complete of consignor name-----------
        $(document).on('focus','.autocomplete_txt',function(){
            type = $(this).data('type');

            if(type =='consignor_name' )autoType='name';
            if(type =='party_code' )autoType='party_code';


            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax') }}",
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
                    $('#consignor_name'+elementId).val(data.name);
                    $('#party_code').val(data.party_code);
                    $('#consignor_id').val(data.id);
                }
            });
        });
        //        --------------------auto complete of consignor name-----------

        //        --------------------auto complete of Billed at-----------
        $(document).on('focus','.autocomplete_txt_billed_at',function(){
            type = $(this).data('type');

            if(type =='billed_at' )autoType='city';

            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax_billed_at') }}",
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
                    $('#billed_at'+elementId).val(data.city);
                    $('#billed_at_id').val(data.id);
                }
            });
        });
        //        --------------------auto complete of billed at-----------

        //        --------------------auto complete of from-----------
        $(document).on('focus','.autocomplete_txt_from',function(){
            type = $(this).data('type');

            if(type =='from' )autoType='city';

            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax_from') }}",
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
                        url: "{{ route('searchajax_to') }}",
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

        //        --------------------auto complete of truck type-----------
        $(document).on('focus','.autocomplete_txt_truck_type',function(){
            type = $(this).data('type');

            if(type =='truck_type' )autoType='trucktype';

            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax_truck_type') }}",
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
                    $('#truck_type'+elementId).val(data.trucktype);
                    $('#truck_type_id').val(data.id);
                }
            });
        });
        //        --------------------auto complete of truck type-----------

        //        --------------------auto complete of truck no-----------
        $(document).on('focus','.autocomplete_txt_truck_no',function(){
            type = $(this).data('type');

            if(type =='truck_no' )autoType='truck_no';

            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax_truck_no') }}",
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
                    $('#truck_no'+elementId).val(data.truck_no);
                    $('#truck_no_id').val(data.id);
                }
            });
        });
        //        --------------------auto complete of truck no-----------

    </script>



@endsection






