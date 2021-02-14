@extends('layouts.adminPanelTable')
@section('title')
    Update Indent
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

        <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Update Indent Request Entry</span></h4>

        <a href="{{url('indent')}}" class="btn btn-primary btn-sm">Back</a>
        <hr> {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="panel panel-default">

            <div class="panel-body">


                <?php echo Form::open(array('url' =>['update_indent', $bata->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");')); ?>

                <div class="row">
                    <div class="col-md-6">
                        <br>
                        <table class="table table-striped">


                            <tr>
                                <td style="width: 30%">Indent No<span style="color:red">*</span></td>
                                <td>
                                    <input type="text" name="indent_no" value="{{$bata->indent_no}}" id="indent_no" class="form-control" placeholder="Indent No" required readonly>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Branch Code<span style="color:red">*</span></td>
                                <td>

                                    <select name="branch_code" id="branch_code" class="form-control" required tabindex="2" disabled>
                                        <option value="{{$bata->branch_id}}">{{$bata->branch_code}}</option>
                                        <?php  $datas = App\Branch::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->branch_code}}</option>
                                        @endforeach
                                    </select>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Destination</td>
                                <td>
                                    <input type="text" name="destination" id="destination" value="{{$bata->destination}}" class="form-control" placeholder="Destination" readonly>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Placement Ideal Date<span style="color:red">*</span></td>
                                <td>

                                    <input type="text" name="placement_ideal_date" id="placement_ideal_date" value="{{date('d/m/Y',strtotime($bata->placement_ideal_date))}}" tabindex="5" class="styledate form-control" readonly>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Vehicle/Truck Type<span style="color:red">*</span></td>
                                <td>


                                    <select name="truck_type" id="truck_type" class="form-control" required tabindex="6" disabled>
                                        <option value="{{$bata->truck_type_id}}">{{$bata->truck_type}}</option>
                                        <?php  $datas = App\Trucktype::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->trucktype}}</option>
                                        @endforeach
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Tonnage</td>
                                <td>
                                    <input type="text" name="tonnage" value="{{$bata->tonnage}}" id="tonnage" class="form-control" placeholder="Tonnage" tabindex="8" readonly>
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
                                <td style="width: 30%">Indent Date<span style="color:red">*</span></td>
                                <td>

                                    <input type="text" name="indent_date" id="indent_date" value="{{date('d/m/Y',strtotime($bata->indent_date))}}" tabindex="1" class="styledate form-control" readonly>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Origin<span style="color:red">*</span></td>
                                <td>

                                    <select name="origin" id="origin" class="form-control" required tabindex="3" disabled>
                                        <option value="{{$bata->origin_id}}">{{$bata->origin}}</option>
                                        <?php  $datas = App\Branch::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->city}}</option>
                                        @endforeach
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Consignor Name<span style="color:red">*</span></td>
                                <td>

                                    <select name="consignor_name" id="consignor_name" class="form-control" required tabindex="4" disabled>
                                        <option value="{{$bata->consignor_id}}">{{$bata->consignor_name}}</option>
                                        <?php  $datas = App\Party::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->name}}</option>
                                        @endforeach
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Party Code</td>
                                <td>
                                    <input type="text" name="party_code" id="party_code" value="{{$bata->party_code}}" class="form-control" placeholder="Party Code" readonly>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Material<span style="color:red">*</span></td>
                                <td>

                                    <select name="material" id="material" class="form-control" required tabindex="7" disabled>
                                        <option value="{{$bata->material_id}}">{{$bata->material}}</option>
                                        <?php  $datas = App\Materialcategory::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->category}}</option>
                                        @endforeach
                                    </select>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Rate<span style="color:red">*</span></td>
                                <td>
                                    <input type="number" style="height: 32px !important;" name="rate" id="rate" value="{{$bata->rate}}" placeholder="0.00" tabindex="9" required readonly> &nbsp;
                                    @if($bata->per_tone_amount=='per_tone')
                                        <input type="radio" name="per_tone_amount" value="per_tone" checked> Per Tone
                                        <input type="radio" name="per_tone_amount" value="amount"> Amount
                                    @else
                                        <input type="radio" name="per_tone_amount" value="per_tone"> Per Tone
                                        <input type="radio" name="per_tone_amount" value="amount"checked> Amount
                                    @endif
                                </td>
                            </tr>


                        </table>
                        <br>
                    </div>
                </div>

                <br>
                <div class="row">

                    <div class="col-md-1"><a class="btn btn-success btn-sm" href="{{url('indent')}}">Back</a>
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
        //    ----------------------brach code json start-----------------


        $('select[name="branch_code"]').on('change', function() {
            var stateID = $(this).val();
            if(stateID) {
                $.ajax({
                    url: '{{ url('/') }}/AjaxGet_branch_code/'+stateID,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {

                        $('input[name="destination"]').empty();
                        var Vals    =  data;
                        $("input[name='destination']").val(Vals.destination);
                    }
                });
            }else{
                $('input[name="destination"]').empty();
            }
        });

        //    ----------------------brach code json end-----------------


        $('select[name="consignor_name"]').on('change', function() {

            var stateID = $(this).val();

            if(stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignor_name/'+stateID,

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

        //    ----------------------ClorCN only end-----------------
    </script>


    <script>
        //            ------------system time picker start------------

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
        $("#branch_code").select2({
            data: customer
        });

        var customer =  [/* states array*/];
        $("#origin").select2({
            data: customer
        });

        var customer =  [/* states array*/];
        $("#consignor_name").select2({
            data: customer
        });

        var customer =  [/* states array*/];
        $("#truck_type").select2({
            data: customer
        });

        var customer =  [/* states array*/];
        $("#material").select2({
            data: customer
        });



    </script>



@endsection