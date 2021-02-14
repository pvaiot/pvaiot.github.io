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
        <h2>Edit Indent Placement Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Edit Indent Placement Entry</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif
    <div class="well">

        <?php echo Form::open(array('url' =>['edit_indentplacement_2', $bata1->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Indent No</label>
                    <input type="text" name="indent_no" id="indent_no" value="{{$bata->indent_no}}" class="form-control" placeholder="Origin" required >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Party Code</label>
                    <?php
                    $data_party = DB::table("party")->where("id",$bata->party_code)->first();
                    ?>
                    <input type="text" name="party_code" id="party_code" value="{{$data_party->party_code}}" class="form-control" placeholder="Party Code" required >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Origin</label>
                    <input type="text" name="origin" id="origin" value="{{$bata->origin}}" class="form-control" placeholder="Origin" required >
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Indent Placement Date</label>
                    <input type="text" name="indent_placement_date"  value="{{date('d/m/Y',strtotime($bata->placement_ideal_date))}}" id="indent_placement_date" class="styledate form-control" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Branch Code</label>
                    <input type="text" name="branch_code" value="{{$bata->branch_code}}" id="branch_code" class="form-control" placeholder="Branch Code" required >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Consignor Name</label>
                    <input type="text" name="consignor_name" id="consignor_name" value="{{$bata->consignor_name}}" class="form-control" placeholder="Consignor Name" required>
                </div>
            </div>
        </div>
        <br>
            <div class="table-responsive">
                <table id="saved_data" class="table table-no-more table-bordered mb-none" style="font-size: 13px!important;">
                    <thead>
                    <tr style="background-color: #09C6AB;color: #ffffff">
                        <th style="text-align: center;vertical-align: middle;width: 10px;">SL NO.<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;">Destination<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;">Consignee<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;width: 5%;">Tonnage<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;width: 8%;">Truck Type<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;">Vehicle No<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;">Indent Placement Date<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;width: 10%;">Rate<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;">Mobile No<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;width: 10%;">Broker<span style="color: red">*</span></th>
                        <th style="text-align: center;vertical-align: middle;">Remark<span style="color: red">*</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $con_child = \App\Indent_Child::where('indent_id',$bata->id)->get();
                    $con_child_placement = \App\IndentPlacement_child::where('indentplacement_id',$bata1->id)->get();
                    $count2=0; $index=1;?>
                    <?php $sl_no=1; ?>
                    @foreach($con_child as $child)
                        <?php $indentplace_child_data_count= \App\IndentPlacement_child::where('indent_child_id',$child->id)->count();
                        $indentplace_child_data= \App\IndentPlacement_child::where('indent_child_id',$child->id)->first();
                        ?>
                        <tr class="saved_data_row" style="border-bottom: solid 1px black">
                            <td data-title="SL.NO" class="main_td text-center">{{$sl_no}}</td>
                            <td data-title="Destination" class="main_td"><input name="rows2[{{$count2}}][destination]" value="{{$child->destination}}" readonly class="destination form-control" ></td>
                            <td data-title="Consignee" class="main_td"><input name="rows2[{{$count2}}][consignee]" value="{{$child->consignee}}" readonly class="consignee form-control" ></td>
                            <td data-title="Tonnage" class="main_td"><input name="rows2[{{$count2}}][tonnage]" value="{{$child->tonnage}}" readonly class="tonnage form-control" ></td>
                            <td data-title="Truck Type" class="main_td"><input name="rows2[{{$count2}}][truck_type]" value="{{$child->truck_type}}" readonly class="truck_type form-control" ></td>
                            @if($indentplace_child_data_count>0)
                                <td data-title="Truck No" class="main_td"><input name="rows2[{{$count2}}][truck_no]" value="{{$indentplace_child_data->truck_no}}" class="truck_no form-control" tabindex="{{$index}}"></td>
                                @if($indentplace_child_data->indent_placement_date_child!="")
                                    <td data-title="Indent Placement Date" class="main_td"><input name="rows2[{{$count2}}][indent_placement_date_child]" placeholder="__/__/____" value="{{date('d/m/Y',strtotime($indentplace_child_data->indent_placement_date_child))}}" class="styledate indent_placement_date_child form-control" tabindex="{{$index}}"></td>
                                @else
                                    <td data-title="Indent Placement Date" data-title="Tonnage" class="main_td"><input name="rows2[{{$count2}}][indent_placement_date_child]" value="" placeholder="__/__/____" class="styledate indent_placement_date_child form-control" placeholder="__/__/____" tabindex="{{$index}}"></td>
                                @endif
                                <td data-title="Rate" class="main_td"><input name="rows2[{{$count2}}][rate]" value="{{$indentplace_child_data->rate}}" class="rate form-control" tabindex="{{$index}}"></td>
                                <td data-title="Mobile" class="main_td"><input name="rows2[{{$count2}}][mobile]" value="{{$indentplace_child_data->mobile_no}}" class="mobile form-control" tabindex="{{$index}}"></td>
                                <td data-title="Broker" class="main_td"><select name="rows2[{{$count2}}][broker]" id="broker_row" style="width:100%;" class="broker form-control" tabindex="{{$index}}">
                                        @if($indentplace_child_data->broker!="")
                                            <option  value="{{$indentplace_child_data->broker}}">{{$indentplace_child_data->broker}}</option>
                                        @else
                                            <option  value="">Select Broker</option>
                                        @endif
                                        <?php  $datas = App\Broker::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->name}}">{{$data->name}}</option>
                                        @endforeach
                                    </select></td>
                                <td data-title="Remark" class="main_td"><input name="rows2[{{$count2}}][remark]" value="{{$indentplace_child_data->remarks}}"class="remark form-control" tabindex="{{$index}}"></td>
                            @else
                                <td data-title="Truck No" class="main_td"><input name="rows2[{{$count2}}][truck_no]"  class="truck_no form-control" tabindex="{{$index}}"></td>
                                <td data-title="Indent Placement Date" class="main_td"><input name="rows2[{{$count2}}][indent_placement_date_child]" class="styledate indent_placement_date_child form-control" placeholder="__/__/____" tabindex="{{$index}}"></td>
                                <td data-title="Rate" class="main_td"><input name="rows2[{{$count2}}][rate]"  class="rate form-control" tabindex="{{$index}}"></td>
                                <td data-title="Mobile" class="main_td"><input name="rows2[{{$count2}}][mobile]"  class="mobile form-control" tabindex="{{$index}}"></td>
                                <td data-title="Broker" class="main_td"><select name="rows2[{{$count2}}][broker]"  style="width:100%;" class="broker form-control" tabindex="{{$index}}">
                                        <option value=""> Select Broker</option>
                                        <?php  $datas = App\Broker::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->name}}">{{$data->name}}</option>
                                        @endforeach
                                    </select></td>
                                <td data-title="Remark" class="main_td"><input name="rows2[{{$count2}}][remark]" class="remark form-control" tabindex="{{$index}}"></td>
                            @endif
                            <input type="hidden" name="rows2[{{$count2}}][indent_child_id]" value="{{$child->id}}" class="indent_child_id form-control" tabindex="{{$index}}">
                        </tr>
                        <?php $count2+=1 ;
                        $index+=1;
                        ?>
                        <input type="hidden" id="count" value="{{$count2}}" />
                        <?php $sl_no +=1; ?>
                    @endforeach
                    </tbody>
                </table>
            </div>
                            

                <br>
            <div class="row">
                <footer class="col-md-8">
                    <button type="submit" class="btn btn-success" id="submit">Submit</button>
                    <button type="reset" class="btn btn-danger">Reset</button>
                    <a class="btn btn-info btn-md" href="{{url('indent')}}">Back</a>
                </footer>
            </div>

                <br> {{form::close()}}
            </div>
            <!-- panel body ends here -->

    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>
        var destination =  [/* states array*/];
        $(".broker").select2({
            data: destination
        });
        $('#saved_data input').focus(function()
        {
            /*to make this flexible, I'm storing the current width in an attribute*/
            $(this).attr('data-default', $(this).width());
            $(this).animate({ width: 150 }, 'slow');
        }).blur(function()
        {
            /* lookup the original width */
            $(this).animate({ width: '100%' }, 'fast');
        });
        //    ----------------------Indent No start-----------------

        {{--$('select[name="indent_no"]').on('change', function() {--}}
        {{--var stateID = $(this).val();--}}

        {{--if (stateID) {--}}

        {{--$.ajax({--}}

        {{--url: '{{ url('/') }}/AjaxGet_indent_no/' + stateID,--}}

        {{--type: "GET",--}}

        {{--dataType: "json",--}}

        {{--success: function(data) {--}}

        {{--$('input[name="origin"]').empty();--}}
        {{--$('input[name="destination"]').empty();--}}
        {{--$('input[name="vehicle_type"]').empty();--}}
        {{--$('input[name="tonnage"]').empty();--}}
        {{--$('input[name="rate"]').empty();--}}


        {{--var Vals = data;--}}

        {{--$("input[name='origin']").val(Vals.origin);--}}
        {{--$("input[name='branch_code']").val(Vals.branch_code);--}}
        {{--$("input[name='indent_placement_date']").val(Vals.placement_ideal_date);--}}
        {{--$("input[name='party_code']").val(Vals.party_code);--}}
        {{--$("input[name='consignor_name']").val(Vals.consignor_name);--}}



        {{--}--}}

        {{--});--}}

        {{--} else {--}}

        {{--$('input[name="origin"]').empty();--}}
        {{--$('input[name="destination"]').empty();--}}
        {{--$('input[name="vehicle_type"]').empty();--}}
        {{--$('input[name="tonnage"]').empty();--}}
        {{--$('input[name="rate"]').empty();--}}
        {{--}--}}

        {{--});--}}

        //    ----------------------Indent No End-----------------


        //    ----------------------brach code json start-----------------

        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
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

        //        var customer =  [/* states array*/];
        //        $("#vehicle_no").select2({
        //            data: customer
        //        });

    </script>



@endsection