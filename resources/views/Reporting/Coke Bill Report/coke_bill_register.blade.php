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
    @if(Session::has('flash_message_error'))
        <div class="alert alert-danger">
            {{ Session::get('flash_message_error') }}
        </div>
    @endif
    <header class="page-header">
        <h2>Bill Register Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Bill Register Entry</span></li>
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
        <a href="{{url('export_bill_register')}}" class="btn btn-md btn-success"> Send to Exel</a>

<br>
<br>
        <?php echo Form::open(array('url' =>['store_bill_register'],'onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>
        <div class="table-responsive">
            <table id="saved_data" class="table table-no-more table-bordered mb-none" style="font-size: 13px!important;">
                <thead>
                <tr style="background-color: #09C6AB;color: #ffffff">
                    <th style="text-align: center;vertical-align: middle;width: 10px;">SL NO.<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;width: 130px;">Bill No<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;">Bill Date<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;">Party Name<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;width: 120px;">Bill Amount<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;width: 8%;">Payment Receive Date<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;">Payment Receive Amount<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;">TDS<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;width: 10%;">Deduction<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;">After Deduction Payment<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;width: 10%;">Payment Rec From<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;">Transaction Reference<span style="color: red">*</span></th>
                    <th style="text-align: center;vertical-align: middle;">Payment Credit<span style="color: red">*</span></th>
                </tr>
                </thead>
                <tbody>
                <?php
                $con_child = \App\CokeFreightBill::select('bill_no','bill_date','party_name','total_amount')->orderBy('bill_no', 'ASC')->get();
                  $new1=\GuzzleHttp\json_decode($con_child,true);
                $con_child2 = \App\FreightBill::select('bill_no','bill_date','party_name','total_amount')->orderBy('bill_no', 'ASC')->get();
                $new2=\GuzzleHttp\json_decode($con_child2,true);
                $con_child3=array_merge($new1,$new2);
                asort($con_child3);
                $count2=0; $index=1;?>
                <?php $sl_no=1; ?>
                @foreach($con_child3 as $child)
                    <?php $bill_register_data=\App\BillRegister::where('bill_no','=',$child['bill_no'])->first(); ?>
                    @if(!empty($bill_register_data))
                    <tr class="saved_data_row" style="border-bottom: solid 1px black">
                        <td data-title="SL.NO" class="main_td text-center">{{$sl_no}}</td>
                        <td data-title="Bill No" class="main_td"><input name="rows2[{{$count2}}][bill_no]" value="{{$child['bill_no']}}" readonly class="bill_no form-control" ></td>
                        <td data-title="Bill Date" class="main_td"><input name="rows2[{{$count2}}][bill_date]" value="{{date( 'd-m-Y', strtotime($child['bill_date']))}}" readonly class="styledate bill_date form-control" placeholder="__/__/____" ></td>
                        <td data-title="Party Name" class="main_td"><input name="rows2[{{$count2}}][party_name]" value="{{$child['party_name']}}" readonly class="bill_no form-control" ></td>
                        <td data-title="Bill Amount" class="main_td"><input name="rows2[{{$count2}}][bill_amount]" value="{{$child['total_amount']}}" readonly class="bill_amount form-control" ></td>
                        @if($bill_register_data->payment_receive_date!="")
                        <td data-title="Payment Receive Date" class="main_td"><input name="rows2[{{$count2}}][payment_receive_date]" value="{{date( 'd-m-Y', strtotime($bill_register_data->payment_receive_date))}}" class="styledate payment_receive_date form-control" placeholder="__/__/____"></td>
                        @else
                        <td data-title="Payment Receive Date" class="main_td"><input name="rows2[{{$count2}}][payment_receive_date]" class="styledate payment_receive_date form-control" placeholder="__/__/____"></td>
                        @endif
                        <td data-title="Payment Receive Amount" class="main_td"><input name="rows2[{{$count2}}][payment_receive_amount]" value="{{$bill_register_data->payment_receive_amount}}" class="payment_receive_amount form-control" ></td>
                        <td data-title="TDS" class="main_td"><input name="rows2[{{$count2}}][tds]" value="{{$bill_register_data->tds}}" class="tds form-control" ></td>
                        <td data-title="Deduction" class="main_td"><input name="rows2[{{$count2}}][deduction]" value="{{$bill_register_data->deduction}}" class="deduction form-control"></td>
                        <td data-title="After Deduction Payment" class="main_td"><input name="rows2[{{$count2}}][after_deduction_payment]" value="{{$bill_register_data->after_deduction_payment}}" class="after_deduction_payment form-control" ></td>
                        <td data-title="Payment Rec From" class="main_td"><input name="rows2[{{$count2}}][payment_receive_from]" value="{{$bill_register_data->payment_receive_from}}" class="payment_receive_from form-control" ></td>
                        <td data-title="Transaction Reference" class="main_td"><input name="rows2[{{$count2}}][transaction_ref]" value="{{$bill_register_data->transaction_reference}}" class="transaction_ref form-control" ></td>
                        <td data-title="Payment Credit" class="main_td"><input name="rows2[{{$count2}}][payment_credit]" value="{{$bill_register_data->payment_credit}}" class="payment_credit form-control" ></td>
                    </tr>
                    @else
                        <tr class="saved_data_row" style="border-bottom: solid 1px black">
                            <td data-title="SL.NO" class="main_td text-center">{{$sl_no}}</td>
                            <td data-title="Bill No" class="main_td"><input name="rows2[{{$count2}}][bill_no]" value="{{$child['bill_no']}}" readonly class="bill_no form-control" ></td>
                            <td data-title="Bill Date" class="main_td"><input name="rows2[{{$count2}}][bill_date]" value="{{date( 'd-m-Y', strtotime($child['bill_date']))}}" readonly class="styledate bill_date form-control" placeholder="__/__/____" ></td>
                            <td data-title="Party Name" class="main_td"><input name="rows2[{{$count2}}][party_name]" value="{{$child['party_name']}}" readonly class="bill_no form-control" ></td>
                            <td data-title="Bill Amount" class="main_td"><input name="rows2[{{$count2}}][bill_amount]" value="{{$child['total_amount']}}" readonly class="bill_amount form-control" ></td>
                            <td data-title="Payment Receive Date" class="main_td"><input name="rows2[{{$count2}}][payment_receive_date]" class="styledate payment_receive_date form-control" placeholder="__/__/____"></td>
                            <td data-title="Payment Receive Amount" class="main_td"><input name="rows2[{{$count2}}][payment_receive_amount]"  class="payment_receive_amount form-control" ></td>
                            <td data-title="TDS" class="main_td"><input name="rows2[{{$count2}}][tds]" class="tds form-control" ></td>
                            <td data-title="Deduction" class="main_td"><input name="rows2[{{$count2}}][deduction]" class="deduction form-control"></td>
                            <td data-title="After Deduction Payment" class="main_td"><input name="rows2[{{$count2}}][after_deduction_payment]"  class="after_deduction_payment form-control" ></td>
                            <td data-title="Payment Rec From" class="main_td"><input name="rows2[{{$count2}}][payment_receive_from]" class="payment_receive_from form-control" ></td>
                            <td data-title="Transaction Reference" class="main_td"><input name="rows2[{{$count2}}][transaction_ref]"  class="transaction_ref form-control" ></td>
                            <td data-title="Payment Credit" class="main_td"><input name="rows2[{{$count2}}][payment_credit]" class="payment_credit form-control" ></td>
                        </tr>
                    @endif
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
                <a class="btn btn-info btn-md" href="{{url('view_bill_register_entry')}}">Back</a>
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