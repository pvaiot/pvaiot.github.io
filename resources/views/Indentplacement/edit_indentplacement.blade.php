@extends('layouts.adminPanelTable')
@section('title')
    Update Indent Placement
@endsection
@section('custom_css')

    <style>
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

        .select2-container .select2-selection--single {
            height: 38px !important;
            border-color:#09C6AB!important;

        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-top: 3px!important;
        }

    </style>


@endsection
@section('content')

    <div class="well">
        @if(Session::has('flash_message'))
            <div class="alert alert-success">
                {{ Session::get('flash_message') }}
            </div>
        @endif
        <br>
        <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Update Indent Placement Entry</span></h4>

        <a href="{{url('indentplacement')}}" class="btn btn-primary btn-sm">Back</a>
        <hr> {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="panel panel-default">

            <div class="panel-body">

                <?php echo Form::open(array('url' =>['update_indentplacement', $bata->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");')); ?>

                    <div class="row">
                        <div class="col-md-6" >
                            <br>
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Indent No<span style="color:red">*</span></td>
                                    <td>
                                        <input type="text" name="indent_no" id="indent_no" value="{{$bata->indent_no}}" class="form-control" placeholder="Origin" required tabindex="3">
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Origin<span style="color:red">*</span></td>
                                    <td>
                                        <input type="text" name="origin" id="origin" value="{{$bata->origin}}" class="form-control" placeholder="Origin" required tabindex="3">
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Branch Code<span style="color:red">*</span></td>
                                    <td>

                                        <input type="text" name="branch_code" value="{{$bata->branch_code}}" id="branch_code" class="form-control" placeholder="Branch Code" required tabindex="3">
                                    </td>
                                </tr>


                            </table>
                            <br>
                        </div>

                        <!-- --------------------end here---------------------- -->

                        <div class="col-md-6">
                            <br>
                            <table class="table table-bordered">
                                <tr>
                                    <td style="width: 30%">Party Code</td>
                                    <td>
                                        <?php
                                        $data_party = DB::table("party")->where("party_code",$bata->party_code)->first();
                                        ?>
                                        <input type="text" name="party_code" id="party_code" value="{{$data_party->party_code}}" class="form-control" placeholder="Party Code" required tabindex="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 30%">Indent Placement Date<span style="color:red">*</span></td>
                                    <td>

                                        <input type="text" name="indent_placement_date"  value="{{date('d/m/Y',strtotime($bata->indent_placement_date))}}" id="indent_placement_date" tabindex="2" class="styledate form-control" required>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Consignor Name<span style="color:red">*</span></td>
                                    <td>
                                        <input type="text" name="consignor_name" id="consignor_name" value="{{$bata->consignor_name}}" tabindex="2" class="form-control" placeholder="Consignor Name" required>
                                    </td>
                                </tr>

                            </table>
                            <br>
                        </div>
                        <div class="col-md-12">
                            <table id="saved_data" class="table table-bordered" style="font-size: 13px!important;">
                                <thead>
                                <tr style="background-color: #09C6AB;color: #ffffff">
                                    <th style="text-align: center;vertical-align: middle;">Destination<span style="color: red">*</span></th>
                                    <th style="text-align: center;vertical-align: middle;">Consignee<span style="color: red">*</span></th>
                                    <th style="text-align: center;vertical-align: middle;">Tonnage<span style="color: red">*</span></th>
                                    <th style="text-align: center;vertical-align: middle;">Truck Type<span style="color: red">*</span></th>
                                    <th style="text-align: center;vertical-align: middle;">Vehicle No<span style="color: red">*</span></th>
                                    <th style="text-align: center;vertical-align: middle;">Rate<span style="color: red">*</span></th>
                                    <th style="text-align: center;vertical-align: middle;">Mobile No<span style="color: red">*</span></th>
                                    <th style="text-align: center;vertical-align: middle;">Broker<span style="color: red">*</span></th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $con_child = \App\IndentPlacement_child::where('indentplacement_id',$bata->id)->get();
                                $con_length2 = \App\IndentPlacement_child::where('indentplacement_id',$bata->id)->count();
                                $count2=0;  $i2=1;?>
                                @foreach($con_child as $child)
                                    <tr class="saved_data_row" style="border-bottom: solid 1px black">
                                        <td class="main_td"><input name="rows2[{{$count2}}][destination]" value="{{$child->destination}}" readonly class="destination form-control" ></td>
                                        <td class="main_td"><input name="rows2[{{$count2}}][consignee]" value="{{$child->consignee}}" readonly class="consignee form-control" ></td>
                                        <td class="main_td"><input name="rows2[{{$count2}}][tonnage]" value="{{$child->tonnage}}" readonly class="tonnage form-control" ></td>
                                        <td class="main_td"><input name="rows2[{{$count2}}][truck_type]" value="{{$child->truck_type}}" readonly class="truck_type form-control" ></td>
                                        <td class="main_td"><input name="rows2[{{$count2}}][truck_no]" value="{{$child->truck_no}}"  class="truck_no form-control" ></td>
                                        <td class="main_td"><input name="rows2[{{$count2}}][rate]" value="{{$child->rate}}" class="rate form-control" ></td>
                                        <td class="main_td"><input name="rows2[{{$count2}}][mobile]" value="{{$child->mobile_no}}" class="mobile form-control" ></td>
                                        <td class="main_td"><select name="rows2[{{$count2}}][broker]" style="" class="broker form-control">
                                                @if($child->broker!="")
                                                <option  value="{{$child->broker}}">{{$child->broker}}</option>
                                                @else
                                                    <option  value="">Select Broker</option>
                                                @endif
                                                <?php  $datas = App\Broker::all(); ?>
                                                @foreach($datas as $data)
                                                    <option value="{{$data->name}}">{{$data->name}}</option>
                                                @endforeach
                                            </select></td>
                                        <td>
                                            @if($i2 > $con_length2)
                                                <a class="btn btn-info btn-sm del updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">X Del</a>
                                            @else
                                                <a class=" delete mybtn  btn btn-system" href="javascript:;" title="Remove row" >X</a>
                                            @endif
                                        </td></tr>
                                    <?php $count2+=1 ?>
                                    <input type="hidden" id="count" value="{{$count2}}" />
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>


                <div class="row">
                    <div class="col-md-1 col-md-offset-4">
                        <button type="submit" id="submit" tabindex="10" class="btn btn-warning btn-sm">Save <span class="glyphicon glyphicon-hdd"></span></button>
                    </div>
                    <div class="col-md-1">
                        <button type="reset" class="btn btn-info btn-sm">Reset <span class="glyphicon glyphicon-refresh"></span></button>
                    </div>

                    <div class="col-md-1"><a class="btn btn-success btn-sm" href="{{url('indentplacement')}}">Back</a>
                    </div>
                </div>

                <br> {{form::close()}}
            </div>
            <!-- panel body ends here -->
        </div>
        <!-- invoice details panel ends here -->
    </div>
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>
        var destination =  [/* states array*/];
        $(".broker").select2({
            data: destination
        });
        $(document).on('click', '.delete', function(){
//                        $(".del").on('click',function(){
            $(this).parent().parent().remove();

//                        });
        });
        //    ----------------------Indent No start-----------------

        $('select[name="indent_no"]').on('change', function() {
            var stateID = $(this).val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_indent_no/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="origin"]').empty();
                        $('input[name="destination"]').empty();
                        $('input[name="vehicle_type"]').empty();
                        $('input[name="tonnage"]').empty();
                        $('input[name="rate"]').empty();


                        var Vals = data;

                        $("input[name='origin']").val(Vals.origin);
                        $("input[name='destination']").val(Vals.destination);
                        $("input[name='vehicle_type']").val(Vals.vehicle_type);
                        $("input[name='tonnage']").val(Vals.tonnage);
                        $("input[name='rate']").val(Vals.rate);
                        if(Vals.tone=='per_tone'){
                            $("input:radio[id='tone']").attr('checked', true);
                        }else{
                            $("input:radio[id='amount']").attr('checked', true);
                        }


                    }

                });

            } else {

                $('input[name="origin"]').empty();
                $('input[name="destination"]').empty();
                $('input[name="vehicle_type"]').empty();
                $('input[name="tonnage"]').empty();
                $('input[name="rate"]').empty();
            }

        });
        //    ----------------------Indent No End-----------------


        //    ----------------------brach code json start-----------------

        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });

        $('#clorcn').on('change', function(event) {

            var i = $(this).val();
            if (i == "Challan") {
                $('#challan_number').attr('disabled', false); // hide the first one
                $('#consignment_number').attr('disabled', true); // hide the first one

            }

            if (i == "Consignment") // equal to a selection option
            {
                $('#challan_number').attr('disabled', true); // hide the first one
                $('#consignment_number').attr('disabled', false); // hide the first one

            }
        });


    </script>


    <script>


        var time = new Date();

        var mytime = time.toLocaleString('en-US', {
            hour: 'numeric',
            minute: 'numeric',
            hour12: true
        })
        $('#reporting_time').val("" + mytime);
        //            ------------system time picker end------------


        //            ------------system time picker start------------

        var time = new Date();

        var mytime = time.toLocaleString('en-US', {
            hour: 'numeric',
            minute: 'numeric',
            hour12: true
        })
        $('#unloading_time').val("" + mytime);
        //            ------------system time picker end------------

        //            ------------date picker start------------
        $(function() {
            $(".base").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        });
        //            ------------date picker end------------

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
            document.getElementById("product_cgst").value = text1 / 2;
            document.getElementById("product_sgst").value = text1 / 2;
        }



        $('#btnReset').click(function() {
            $("#brand_name").val(null).trigger("change");
            $("#product_type").val(null).trigger("change");
        });


        var product_type = [ /* states array*/ ];
        $("#product_type").select2({
            data: product_type
        });

        var brand = [ /* states array*/ ];
        $("#brand_name").select2({
            data: brand
        });
        document.getElementById('testform').onsubmit = function(e) {
            e.preventDefault();
        }

        document.getElementById('testform1').onsubmit = function(e) {
            e.preventDefault();
        }

        $('.modal').on('hidden.bs.modal', function() {
            $(this).find('form')[0].reset();
            $("#brand_name").val(null).trigger("change");
            $("#product_type").val(null).trigger("change");
        });



        // ------------------------------------------------------------------------------ add new product --------------------
    </script>

    <!-- customer select style -->
    <script>
        var country = [ /* states array*/ ];
        $("#product_name").select2({
            data: country
        });
        var customer = [ /* states array*/ ];
        $("#customer").select2({
            data: customer
        });
        $('#customer').select2('open').select2('close');
        var payment_type = [ /* states array*/ ];
        $("#payment_type").select2({
            data: payment_type
        });

    </script>


    <script>



        $(document).ready(function() {

            var i = 1;
            var count = 0;
            $('input').click(function() {
                $(this).select();
            });



            $('body').on('focus', ".datepicker_recurring_start", function() {
                $(this).datepicker({
                    dateFormat: 'dd-mm-yy'
                });
            });

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

        var customer =  [/* states array*/];
        $("#indent_no").select2({
            data: customer
        });

    </script>



@endsection