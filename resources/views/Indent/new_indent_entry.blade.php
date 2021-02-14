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
            width: 100% !important;
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
        <h2>New Indent Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Indent Entry</span></li>
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
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="well">

            <div class="row">

                @if(\App\Indent::count())

                    <?php $mydata =\App\Indent::latest()->select('id')->first();
                    $indent_code = $mydata->id+1;
                    $new_indent_code= sprintf("%'04d", $indent_code);
                    ?>

                @else
                    <?php $indent_code=1;
                    $new_indent_code= sprintf("%'04d", $indent_code);
                    ?>
                @endif


                <?php echo Form::open(array('route' => 'store_indent_entry','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>


                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Indent No</label>
                                <input type="text" name="indent_no" value="IN{{$new_indent_code}}" id="indent_no" class="form-control" placeholder="Indent No" required readonly>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Indent Date</label>
                                <input type="text" name="indent_date" id="indent_date" placeholder="__/__/____"  class="styledate form-control" autofocus>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Branch Code</label>
                                <select name="branch_code" id="branch_code" style="width: 100%;" class="form-control" required >
                                    <option value=""> Select Branch Code</option>
                                    <?php  $datas = App\Branch::all(); ?>
                                    @foreach($datas as $data)
                                        <option value="{{$data->id}}">{{$data->branch_code}}-{{$data->city}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Party Code</label>
                                <select name="party_code" id="party_code" style="width: 100%;" class="form-control" required >
                                    <option value=""> Select Party Code</option>
                                    <?php  $datas = App\Party::all(); ?>
                                    @foreach($datas as $data)
                                        <option value="{{$data->id}}">{{$data->party_code}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Origin</label>
                                <select name="origin" id="origin" style="width: 100%;" class="form-control" required >
                                    <option value=""> Select Origin</option>
                                    <?php  $datas = App\Location::all(); ?>
                                    @foreach($datas as $data)
                                        <option value="{{$data->id}}">{{$data->city}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Consignor Name</label>
                                <input type="text" name="consignor_name" id="consignor_name" class="form-control" required  disabled>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Placement Date</label>
                                <input type="text" name="placement_ideal_date" id="placement_ideal_date" placeholder="__/__/____"  class="styledate form-control"/>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Material</label>
                                <select name="material" id="material" style="width: 100%;" class="form-control" required >
                                    <option value=""> Select Material</option>
                                    <?php  $datas = App\Materialcategory::all(); ?>
                                    @foreach($datas as $data)
                                        <option value="{{$data->id}}">{{$data->category}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <br>
                <div class="table-responsive">
                    <table id="items" class="table table-no-more table-bordered mb-none billing_table" id="datatable-default">
                        <thead>
                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th class="text-center">Destination<span style="color: red">*</span></th>
                            <th class="text-center">Consignee<span style="color: red">*</span></th>
                            <th class="text-center">Tonnage<span style="color: red">*</span></th>
                            <th class="text-center">Truck Type<span style="color: red">*</span></th>
                            <th class="text-center">Action</th>
                        </tr>
                        </thead>
                        <tr class="item-row" style="border-bottom: solid 1px black">

                            <td data-title="Destination" class="main_td">
                                <select name="rows[0][destination]" style="width: 100%!important;" class="destination form-control"required >
                                    <option value=""> Select Destination</option>
                                    <?php  $datas = App\Location::all(); ?>
                                    @foreach($datas as $data)
                                        <option value="{{$data->city}}">{{$data->city}}</option>
                                    @endforeach
                                </select></td>
                            <td data-title="Consignee" class="main_td"><input name="rows[0][consignee]" class="consignee form-control"required /></td>
                            <td data-title="Tonnage" class="main_td"><input name="rows[0][tonnage]" class="tonnage form-control"required /></td>
                            <td data-title="Truck Type" class="main_td"><select name="rows[0][truck_type]" id="truck_type" class="truck_type form-control" required >
                                    <option value=""> Select Truck Type</option>
                                    <?php  $datas = App\Trucktype::all(); ?>
                                    @foreach($datas as $data)
                                        <option value="{{$data->id}}">{{$data->trucktype}}</option>
                                    @endforeach
                                </select></td>
                            <td data-title="ACTION"><a class="btn btn-danger btn-sm addrow updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px" >ADD</a></td>
                        </tr>

                    </table>
                </div>
                <br>
                    <div class="row">
                        <footer class="col-md-8">
                            <button type="submit" class="btn btn-success" id="submit">Submit</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </footer>
                    </div>

                <br> {{form::close()}}
            </div>
            <!-- panel body ends here -->
        </div>
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>
        var destination =  [/* states array*/];
        $(".destination").select2({
            data: destination
        });
        //    ----------------------brach code json start-----------------
        $('#party_code').on('change', function() {
            var stateID = $('#party_code').val();
            if (stateID) {
                $.ajax({
                    url: '{{ url('/') }}/AjaxGet_party_data_indent/' + stateID,
                    type: "GET",

                    dataType: "json",
                    success: function (data) {
                        $("input[name='consignor_name']").empty();

                        var Vals = data;
                        $("input[name='consignor_name']").val(Vals.name);
                    }
                });

            } else {

            }

        });
        $(document).ready(function() {

            var i=1;
            var count=0;
            $(document).on('click', '.addrow', function(){

                $(this).text('x Del');
                $(this).attr('class','btn btn-info btn-sm del');
                i++;

                count++;
                var id=count;


                $(".item-row:last").after('<tr class="item-row" style="border-bottom: solid 1px black">' +
                        '<td data-title="Destination" class="main_td"><select name="rows[' + id + '][destination]" id=\"destination' + id + '\" style="width: 100%!important;" class="destination form-control"required>'+
                        '<option value=""> Select Destination</option><?php  $datas = App\Location::all(); ?>@foreach($datas as $data)<option value="{{$data->city}}">{{$data->city}}</option>@endforeach</select></td>'+
                        '<td data-title="Consignee" class="main_td"><input name="rows[' + id + '][consignee]" id=\"consignee' + id + '\"  class="consignee form-control" required /></td>'+
                        '<td data-title="Tonnage" class="main_td"><input name="rows[' + id + '][tonnage]" id=\"tonnage' + id + '\"  class="tonnage form-control" required /></td>'+
                        '<td data-title="Truck Type" class="main_td"><select name="rows[' + id + '][truck_type]" id=\"truck_type' + id + '\"  class="truck_type form-control" required>'+
                        '<option value=""> Select Truck Type</option><?php  $datas = App\Trucktype::all(); ?>@foreach($datas as $data)<option value="{{$data->id}}">{{$data->trucktype}}</option>@endforeach</select></td>'+
                        '<td data-title="ACTION" class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>');


                var destination =  [/* states array*/];
                $(".destination").select2({
                    data: destination
                });
            });

        });

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
        var brand = [ /* states array*/ ];
        $(".destination").select2({
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

//            $("#paid").blur(update_balance);

//            $(document).on('click', '.addrow', function() {
//
//                $(this).text('x Del');
//                $(this).attr('class', 'btn btn-info btn-sm del');
//                $(".item-row:last").find('.mybtn').hide();
//                i++;
//
//                count++;
//                var id = count;
//
//                bind();
//                $("#country" + id).select1({
//                    source: country
//                });
//                //
//            });

            $('body').on('focus', ".datepicker_recurring_start", function() {
                $(this).datepicker({
                    dateFormat: 'dd-mm-yy'
                });
            });

//            bind();
//            $(document).on('click', '.del', function() {
//                //                        $(".del").on('click',function(){
//                $(this).parent().parent().remove();
//                update_total();
//                total_discount();
//                total_taxble_amount();
//                total_gst();
//                grandtotal();
//
//                //                        });
//            });
//            $(document).on('click', '.delete', function() {
//                //                        $(".del").on('click',function(){
//                $(this).parent().parent().remove();
//                $(".del").eq(-1).text('ADD');
//                $('.del').eq(-1).attr('class', 'btn btn-danger btn-sm addrow');
//                update_total();
//                total_discount();
//                total_taxble_amount();
//                total_gst();
//                grandtotal();
//
//                //                        });
//            });


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

        //        var customer =  [/* states array*/];
        //        $("#truck_type").select2({
        //            data: customer
        //        });

        var customer =  [/* states array*/];
        $("#material").select2({
            data: customer
        });

    </script>





@endsection