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
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        #tabledata tbody tr td input{
            padding: 1px !important;
            font-size: 12px;
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
        <h2>New Coke Bill Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Coke Bill Entry</span></li>
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

    <div class="row">
        <?php echo Form::open(array('route' => 'store_coke_freight_bill_entry','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>

        {{-- ------------------------------- 4column------------------------------------------ --}}

        <div class="row">
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Bill Date</label>
                    <input type="text" name="bill_date" id="bill_date" placeholder="__/__/____"  class="styledate form-control" autofocus  required/>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Branch Code</label>
                    <select name="branch_code" style="width: 100%;" id="branch_code" class="form-control" required >
                        <option value=""> Select Branch Code</option>
                        <?php  $datas = App\Branch::all(); ?>
                        @foreach($datas as $data)
                            <option value="{{$data->branch_code}}">{{$data->branch_code}}-{{$data->city}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Bill No</label>
                    <input type="text" name="bill_no" id="bill_no" class="form-control" placeholder="Bill No" required />
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Party Code</label>
                    <select name="party_code" style="width: 100%;" id="party_code" class="form-control" required >
                        <option value=""> Select Party Code</option>
                        <?php  $datas = App\Party::all(); ?>
                        @foreach($datas as $data)
                            <option value="{{$data->party_code}}">{{$data->party_code}}-{{$data->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div><br>

        <div class="row">
            <div class="col-sm-5">
                <div class="form-group">
                    <label class="control-label">Party Name</label>
                    <input type="text" name="party_name" id="party_name" class="form-control" placeholder="Party Name" />
                </div>
            </div>
            <div class="col-sm-7">
                <div class="form-group">
                    <label class="control-label">Party Address</label>
                    <textarea type="text" style="height: 34px !important; overflow: hidden; overflow-wrap: break-word; resize: none;" data-plugin-textarea-autosize name="party_address" id="party_address" class="form-control" placeholder="Party Address"></textarea>
                </div>
            </div>

        </div><br>

            <div class="row">
                <div class="table-responsive">
                    <table class="table table-no-more table-bordered mb-none" style="font-size: 13px!important;">
                        <thead>
                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th style="text-align: center;vertical-align: middle;">Trip Id</th>
                            <th style="text-align: center;vertical-align: middle;">Load ID</th>
                            <th style="text-align: center;vertical-align: middle;">Consignment Number</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="border-bottom: solid 1px black">

                            <td data-title="Trip ID">
                                <input type="text" name="trip_id_check" id="trip_id_check" class="form-control" placeholder="Trip ID Check" >
                            </td>
                            <td data-title="Load ID">
                                <input type="text" name="load_id_check" id="load_id_check" class="form-control" placeholder="Load ID Check" >
                            </td>
                            <td data-title="Consignment No">
                                <input type="text" name="consignment_no_check" id="consignment_no_check" class="form-control" placeholder="Consignment No Check" >
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div><br>
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-no-more table-bordered mb-none" style="font-size: 13px!important;">
                        <thead>
                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th style="text-align: center;vertical-align: middle;">Consignment No<span style="color: red">*</span></th>
                            <th style="text-align: center;vertical-align: middle;">Destination<span style="color: red">*</span></th>
                            <th style="text-align: center;vertical-align: middle;">Consignment Date<span style="color: red">*</span></th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="border-bottom: solid 1px black">

                            <td data-title="Consignment No.">
                                <select name="consignment_id" id="consignment_id" class="form-control" style="width: 100%">
                                    <option value=""> Select Consignment No.</option>
                                    <?php  $datas = \App\Coke_acknowledgement::all(); ?>
                                    @foreach($datas as $data)
                                        <?php  $challan_data = \App\CokeChallan_child2::where('challan_id','=',$data->challan_id)->first(); ?>
                                        <?php  $consignment_data = \App\CockConsignment::where('id','=',$challan_data->consignment_id)->first(); ?>
                                        <?php  $bill_cn = \App\CokeFreightBill_child::where('consignment_no','=',$consignment_data->consignment_no)->count(); ?>
                                        @if($bill_cn<=0)
                                            <option value="{{$consignment_data->consignment_no}}">{{$consignment_data->consignment_no}}</option>
                                        @endif
                                    @endforeach
                                </select>
                                <input type="hidden" name="consigment_id_value" id="consigment_id_value" class="form-control" >
                                <input type="hidden" name="from" id="from" class="form-control" >
                                <input type="hidden" name="vehicle_no" id="vehicle_no" class="form-control" >
                                <input type="hidden" name="package" id="package" class="form-control" >
                                <input type="hidden" name="weight" id="weight" class="form-control" >
                                <input type="hidden" name="invoice_no" id="invoice_no" class="form-control" >
                                <input type="hidden" name="cock_lr_no" id="cock_lr_no" class="form-control" >
                            </td>
                            <td data-title="Destination">
                                <input type="text" name="destination" id="destination" class="form-control" placeholder="Destination" >
                            </td>
                            <td data-title="Consignment Date">
                                <input type="text" name="con_date" id="con_date"  class="form-control" placeholder=" Date">
                            </td>
                            <td data-title="Action"><button type="button" class="btn btn-success btn-sm totaladd" id="totaladd" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px"> ADD</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
<br>
        <div class="table-responsive" id="cndetails">
            <table class="table table-no-more table-bordered mb-none" id="tabledata" style="font-size: 8px;">

                <thead>
                <tr style="background-color: #09C6AB;color: #ffffff;font-size: 12px;">
                    <th >CN NO.</th>
                    <th >COCK LR NO.</th>
                    <th >DATE</th>
                    <th >INVOICE NO.</th>
                    <th style="width: 100px;">DESTINATION</th>
                    <th style="width: 100px;">VEHICLE NO</th>
                    <th >WEIGHT</th>
                    <th >QTY/PKG</th>
                    <th >FREIGHT</th>
                    <th >DETENTION</th>
                    <th >S.N.T</th>
                    <th >TOLL TAX</th>
                    <th >TOTAL FREIGHT</th>
                    <th >ACTION</th>
                </tr>
                </thead>
                <tbody class="cndata">

                </tbody>

                <tfoot>
                <tr>
                    <td colspan="12" class="text-right"><h4><b>Total</b></h4></td>
                    <td colspan="2"> <input type="text" name="full_amount" id="full_amount" class="form-control" readonly>
                        <input type="hidden" name="full_amount_word" id="full_amount_word" class="form-control" >
                    </td>
                </tr>
                </tfoot>

            </table>

        </div>


        <br>
        <div class="row">
            <footer class="col-md-8">
                <button type="submit" class="btn btn-success" id="submit">Submit</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </footer>
        </div>

        {{form::close()}}
                <!-- panel body ends here -->
    </div>

<script>
    $('#trip_id_check').on('keyup', function() {
        var stateID = $('#trip_id_check').val();
        if (stateID) {

            $.ajax({
                url: '{{ url('/') }}/AjaxGet_trip_id_check/' + stateID,
                type: "GET",

                dataType: "json",
                success: function (data) {
                    $("input[name='consignment_no_check']").empty();
                    var Vals = data;
                    $("input[name='consignment_no_check']").val(Vals.consignment_no);
                }
            });

        } else {

        }

    });
    $('#load_id_check').on('keyup', function() {
        var stateID = $('#load_id_check').val();
        if (stateID) {

            $.ajax({
                url: '{{ url('/') }}/AjaxGet_load_id_check/' + stateID,
                type: "GET",

                dataType: "json",
                success: function (data) {
                    $("input[name='consignment_no_check']").empty();
                    var Vals = data;
                    $("input[name='consignment_no_check']").val(Vals.consignment_no);
                }
            });

        } else {

        }

    });

</script>
    {{----------------------------------------------------------------------------------- end of bill here ----------------------------------}}
    <script>



        $('#consignment_id').on('change', function() {
            var stateID = $('#consignment_id').val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_getConsignment_data_for_bill/' + stateID,

                    type: "GET",

                    dataType: "json",
                    success: function(data) {

                        var Vals = data;
                        $('input[name="con_date"]').val(Vals.consignment_date);
                        $('input[name="destination"]').val(Vals.to);
                        $('input[name="consigment_id_value"]').val(Vals.consignment_id);
                        $('input[name="from"]').val(Vals.from);
                        $('input[name="vehicle_no"]').val(Vals.vehicle_no);
                        $('input[name="package"]').val(Vals.received_qty);
                        $('input[name="weight"]').val(Vals.weight);
                        $('input[name="invoice_no"]').val(Vals.invoice_no);
                        $('input[name="cock_lr_no"]').val(Vals.cock_lr_no);

                    }
                });

            }
        });

        $(document).ready(function() {
            var total_amount_of_bill=0;
            var count = 0;
            $('input').click(function () {
                $(this).select();
            });
            $(document).on('click', '.totaladd', function () {
                if ($('#consignment_id').val() !== "") {
                    var save_consignment_no = $('#consignment_id').val();
                    var saved_destination = $('#destination').val();
                    var saved_consignment_date = $('#con_date').val();
                    var saved_package = $('#package').val();
                    var save_weight = $('#weight').val();
                    var save_vehicle_no = $('#vehicle_no').val();
                    var save_from = $('#from').val();
                    var save_invoice_no = $('#invoice_no').val();
                    var save_consignment_id = $('#consigment_id_value').val();
                    var save_cock_lr_no = $('#cock_lr_no').val();


                    var id = count;

                    $(".cndata").append('<tr class="saved_data_row" style="font-size: 12px;">' +
                            '<td data-title="CN NO."><input type="text" value="'+save_consignment_no+'" name="rows2[' + id + '][consignment_no_added]" id="lrno'+id+'" class="consignment_no_row form-control" readonly/><input type="hidden" value="'+save_consignment_id+'" name="rows2[' + id + '][consignment_no_id_added]" class="form-control" readonly/></td>' +
                            '<td data-title="COCK LR NO."><input type="text" value="'+save_cock_lr_no+'" name="rows2[' + id + '][coke_lr_no]" id="coke_lr_no'+id+'" class="form-control" readonly/> <input type="hidden" id="id_value'+id+'" class="id_value form-control" value="'+id+'" readonly/></td>' +
                            '<td data-title="DATE"><input type="text" value="'+saved_consignment_date+'" name="rows2[' + id + '][date_added]" id="date'+id+'" class="form-control" readonly/></td>' +
                            '<td data-title="INVOICE NO."><input type="text" value="'+save_invoice_no+'" name="rows2[' + id + '][invoiceno_added]" id="invoiceno'+id+'" class="form-control" readonly/></td>' +
                            '<td data-title="TO"><input type="text" value="'+saved_destination+'" name="rows2[' + id + '][to_added]" id="to'+id+'" class="form-control" readonly/></td>' +
                            '<td data-title="VEHICLE NO"><input type="text" value="'+save_vehicle_no+'" name="rows2[' + id + '][truck_no_added]" id="truck_no'+id+'" class="form-control" value="0" readonly/></td>' +
                            '<td data-title="WEIGHT"><input value="'+save_weight+'" name="rows2[' + id + '][weight_added]" id="weight'+id+'" class="weight form-control" readonly></td>' +
                            '<td data-title="QTY/PKG"><input type="number" step="0.01" value="'+saved_package+'" name="rows2[' + id + '][qty_added]" id="qty'+id+'" class="form-control" readonly/></td>' +
                            '<td data-title="FREIGHT"><input type="number" step="0.01" name="rows2[' + id + '][freight_added]" id="freight'+id+'" class="form-control" value="0"  /></td>' +
                            '<td data-title="DETENTION"><input type="number" step="0.01" name="rows2[' + id + '][detention_added]" id="detention'+id+'" class="form-control" value="0"  /></td>' +
                            '<td data-title="S.N.T"><input type="number" step="0.01" name="rows2[' + id + '][snt_added]" id="snt'+id+'" class="form-control" value="0" /></td>' +
                            '<td data-title="TOLL TAX"><input type="number" step="0.01" name="rows2[' + id + '][tolltax_added]" id="tolltax'+id+'" class=" tolltax form-control" value="0" /></td>' +
                            '<td data-title="TOTAL FREIGHT" class="total_freight_td"><input type="number" step="0.01" name="rows2[' + id + '][Totalfreight_added]" id="Totalfreight'+id+'" class="Totalfreight_added_row form-control" value="0" readonly/></td>' +
                            '<td data-title="ACTION"><a class=" deletesaved mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a></td>' +
                            '</tr>');
                    bind();

                    $('input[name="con_date"]').val("");
                    $('input[name="destination"]').val("");
                    $('input[name="consigment_id_value"]').val("");
                    $('input[name="from"]').val("");
                    $('input[name="vehicle_no"]').val("");
                    $('input[name="package"]').val("");
                    $('input[name="weight"]').val("");
                    $('input[name="invoice_no"]').val("");
                    $('option[value="'+save_consignment_no+'"]').remove();
                    $("#select2-consignment_id-container").html("Select Consignment No.")


                    function calctotalfreight() {
                        freight=$('#freight'+id+'').val();
                        if(freight==""){
                            freight=0;
                        }
                        snt=$('#snt'+id+'').val();
                        if(snt==""){
                            snt=0;
                        }
                        tolltax=$('#tolltax'+id+'').val();
                        if(tolltax==""){
                            tolltax=0;
                        }
                        detention=$('#detention'+id+'').val();
                        if(detention==""){
                            detention=0;
                        }

                        var totalfreight=parseFloat(freight)+parseFloat(detention)+parseFloat(snt)+parseFloat(tolltax);
                        $('#Totalfreight'+id+'').val(Math.round(totalfreight * 100) / 100);

                    }
                    function bind(){
                        $('#freight'+id+'').keyup(calctotalfreight);
                        $('#freight'+id+'').keyup(all_amount);
                        $('#snt'+id+'').keyup(calctotalfreight);
                        $('#snt'+id+'').keyup(all_amount);
                        $('#tolltax'+id+'').keyup(calctotalfreight);
                        $('#tolltax'+id+'').keyup(all_amount);
                        $('#detention'+id+'').keyup(calctotalfreight);
                        $('#detention'+id+'').keyup(all_amount);
                        $('#freight'+id+'').blur(calctotalfreight);
                        $('#freight'+id+'').blur(all_amount);
                        $('#snt'+id+'').blur(calctotalfreight);
                        $('#snt'+id+'').blur(all_amount);
                        $('#tolltax'+id+'').blur(calctotalfreight);
                        $('#tolltax'+id+'').blur(all_amount);
                        $('#detention'+id+'').blur(calctotalfreight);
                        $('#detention'+id+'').blur(all_amount);
                    }
                    $('#invoiceno'+id+'').focus(function()
                    {
                        /*to make this flexible, I'm storing the current width in an attribute*/
                        $(this).attr('data-default', $(this).width());
                        $(this).animate({ width: 150 },{ height: 20 }, 'slow');
                    }).blur(function()
                    {
                        /* lookup the original width */
                        var w = $(this).attr('data-default');
                        $(this).animate({ width: '100%' }, 'slow');
                    });
                    $('#Totalfreight'+id+'').focus(function()
                    {
                        /*to make this flexible, I'm storing the current width in an attribute*/
                        $(this).attr('data-default', $(this).width());
                        $(this).animate({ width: 150 }, 'slow');
                    }).blur(function()
                    {
                        /* lookup the original width */
                        var w = $(this).attr('data-default');
                        $(this).animate({ width: '100%' }, 'fast');
                    });
                    $('#freight'+id+'').focus(function(){
                        var freight=$(this).val();
                        if(freight==0){
                            $('#freight'+id+'').val("");
                        }
                    }).blur(function()
                    {
                        var freight=$(this).val();
                        if(freight==""){
                            $('#freight'+id+'').val(0);
                        }
                    });
                    $('#detention'+id+'').focus(function(){
                        var freight=$(this).val();
                        if(freight==0){
                            $('#detention'+id+'').val("");
                        }
                    }).blur(function()
                    {
                        var freight=$(this).val();
                        if(freight==""){
                            $('#detention'+id+'').val(0);
                        }
                    });
                    $('#tolltax'+id+'').focus(function(){
                        var freight=$(this).val();
                        if(freight==0){
                            $('#tolltax'+id+'').val("");
                        }
                    }).blur(function()
                    {
                        var freight=$(this).val();
                        if(freight==""){
                            $('#tolltax'+id+'').val(0);
                        }
                    });
                    $('#untolltax'+id+'').focus(function(){
                        var freight=$(this).val();
                        if(freight==0){
                            $('#untolltax'+id+'').val("");
                        }
                    }).blur(function()
                    {
                        var freight=$(this).val();
                        if(freight==""){
                            $('#untolltax'+id+'').val(0);
                        }
                    });
                    $('#snt'+id+'').focus(function(){
                        var freight=$(this).val();
                        if(freight==0){
                            $('#snt'+id+'').val("");
                        }
                    }).blur(function()
                    {
                        var freight=$(this).val();
                        if(freight==""){
                            $('#snt'+id+'').val(0);
                        }
                    });

                    count++;
                    function all_amount(){
                    var a=0;
                    for(var j=0;j<count;j++){
                        var TOTALFREIGHTAMT=$('#Totalfreight'+j+'').val();
                        if(TOTALFREIGHTAMT==""){TOTALFREIGHTAMT==0;}
                        a+=parseFloat(TOTALFREIGHTAMT);
                    }
                    $('#full_amount').val(Math.round(a * 100) / 100);
                    $('#full_amount_word').val(Math.round(a));
                    }


                }
                else {
                    alert("Please Select Consignment No.")
                }
            });
            $(document).on('click', '.deletesaved', function(){
                var row = $(this).parents('.saved_data_row');
                var consignment_no_row=row.find('.consignment_no_row').val();
                var Totalfreight_added_row=row.find('.Totalfreight_added_row').val();
                var id_value_row=row.find('.id_value').val();
                var full_amount_row= $('#full_amount').val();
                var all_final_amt_row=parseFloat(full_amount_row)-parseFloat(Totalfreight_added_row);
                $('#full_amount').val(Math.round(all_final_amt_row * 100) / 100);
                $('#full_amount_word').val(Math.round(all_final_amt_row));
                $("#consignment_id").append('<option value="'+consignment_no_row+'">'+consignment_no_row+'</option>');
                $(".total_freight_td").append('<input type="hidden" id="Totalfreight'+id_value_row+'" value="0" class="form-control" >');
                $(this).parent().parent().remove();
            });
        });


        {{------------------------------------------------- Calculate total amount ---------------------------------------------------------}}
        var destination =  [/* states array*/];
        $("#consignment_id").select2({
            data: destination
        });
        $('#freight').focus(function(){
            var freight=$(this).val();
            if(freight==0){
                $('#freight').val("");
            }
        }).blur(function()
        {
            var freight=$(this).val();
            if(freight==""){
                $('#freight').val(0);
            }
        });
        $('#detention').focus(function(){
            var freight=$(this).val();
            if(freight==0){
                $('#detention').val("");
            }
        }).blur(function()
        {
            var freight=$(this).val();
            if(freight==""){
                $('#detention').val(0);
            }
        });
        $('#tolltax').focus(function(){
            var freight=$(this).val();
            if(freight==0){
                $('#tolltax').val("");
            }
        }).blur(function()
        {
            var freight=$(this).val();
            if(freight==""){
                $('#tolltax').val(0);
            }
        });
        $('#untolltax').focus(function(){
            var freight=$(this).val();
            if(freight==0){
                $('#untolltax').val("");
            }
        }).blur(function()
        {
            var freight=$(this).val();
            if(freight==""){
                $('#untolltax').val(0);
            }
        });
        $('#snt').focus(function(){
            var freight=$(this).val();
            if(freight==0){
                $('#snt').val("");
            }
        }).blur(function()
        {
            var freight=$(this).val();
            if(freight==""){
                $('#snt').val(0);
            }
        });
        {{------------------------------------------------- end of Calculation  ---------------------------------------------------------}}

        $('#party_code').on('change', function() {
            var stateID = $('#party_code').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_party_code/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        var Vals = data;

                        $("input[name='party_name']").val(Vals.name);
                        $("textarea[name='party_address']").val(Vals.address);
                    }

                });

            } else {
                $("input[name='party_name']").empty();
                $("input[name='party_address']").empty();
            }

        });






        {{------------------------------------------------- Fill Cn details with ajax---------------------------------------------------------}}
        $('#party_address').focus(function()
        {
            /*to make this flexible, I'm storing the current width in an attribute*/
            $(this).attr('data-default', $(this).height());
            $(this).animate({ height: '100px' }, 'slow');
        }).blur(function()
        {
            /* lookup the original width */
            var w = $(this).attr('data-default', $(this).height());
            $(this).animate({ height: '34px' }, 'slow');
        });

        $('#invoiceno').focus(function()
        {
            /*to make this flexible, I'm storing the current width in an attribute*/
            $(this).attr('data-default', $(this).width());
            $(this).animate({ width: 150 },{ height: 20 }, 'slow');
        }).blur(function()
        {
            /* lookup the original width */
            var w = $(this).attr('data-default');
            $(this).animate({ width: '100%' }, 'slow');
        });
        $('#Totalfreight').focus(function()
        {
            /*to make this flexible, I'm storing the current width in an attribute*/
            $(this).attr('data-default', $(this).width());
            $(this).animate({ width: 150 }, 'slow');
        }).blur(function()
        {
            /* lookup the original width */
            var w = $(this).attr('data-default');
            $(this).animate({ width: '100%' }, 'fast');
        });

        $('#consignment_no').on('change', function() {
            var stateID = $('#consignment_no').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_no/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $("#cndetails").css("display", "block");

                        $('input[name="date"]').empty();
                        $('input[name="from"]').empty();
                        $('input[name="to"]').empty();
                        $('input[name="truck_no"]').empty();

                        var Vals = data;

                        $("input[name='date']").val(Vals.consignment_date);
                        $("input[name='from']").val(Vals.confrom);
                        $("input[name='to']").val(Vals.conto);
                        $("input[name='truck_no']").val(Vals.vehicle_no);
                        $("input[name='lrno']").val(Vals.consignment_no);
                        $("input[name='qty']").val(Vals.received_qty);
                        $("input[name='weight']").val(Vals.weight);
                        $("input[name='invoiceno']").val(Vals.invoice_no);


                    }

                });

            } else {
                $("#cndetails").css("display", "none");
                $('input[name="date"]').empty();
                $('input[name="from"]').empty();
                $('input[name="to"]').empty();
                $('input[name="truck_no"]').empty();

            }

        });

        {{---------------------------------------------------end of ajax--------------------------------------------------------------------}}
//        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
//            $(".alert").slideUp(500);
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

        $(document).ready(function(){
            $("select[name='with_gst']").change(function(){
                var radioValue = $("select[name='with_gst']").val();

                if(radioValue==0){
                    document.getElementById('gst_per').value="0";
                    document.getElementById('cgst_per').value="0";
                    document.getElementById('igst_per').value="0";
                    // document.getElementById('igst_per').value="12";
                    document.getElementById("gst_per").readOnly = true;
                    document.getElementById("cgst_per").readOnly = true;
                    document.getElementById("igst_per").readOnly = true;
                    // document.getElementById("igst_per").readOnly = false;
                    document.getElementById('total_gst').value="0";
                    document.getElementById('total_cgst').value="0";
                    document.getElementById('total_igst').value="0";
                    gstfunction3();
                }else{
                    document.getElementById("gst_per").readOnly = false;
                    document.getElementById("cgst_per").readOnly = false;
                    document.getElementById("igst_per").readOnly = false;
                    // document.getElementById('total_igst').value="0";
                    document.getElementById('igst_per').value="6";
                    document.getElementById('gst_per').value="6";
                    document.getElementById('cgst_per').value="6";
                }
            });

        });
        function gstfunction2() {

            var total_amount= document.getElementById('total_amount').value;
            var gst_per= document.getElementById('gst_per').value;
            var cgst_per= document.getElementById('cgst_per').value;
            var igst_per= document.getElementById('igst_per').value;

            document.getElementById('total_gst').value=(total_amount*gst_per)/100;
            document.getElementById('total_cgst').value=(total_amount*cgst_per)/100;
            document.getElementById('total_igst').value=(total_amount*igst_per)/100;
        }

        function gstfunction3() {

            var total_amount= document.getElementById('total_amount').value;
            var total_gst_amount=document.getElementById('total_gst').value;
            var total_cgst_amount=document.getElementById('total_cgst').value;
            var total_igst_amount=document.getElementById('total_igst').value;

            document.getElementById('net_amount').value=parseFloat(total_amount)+parseFloat(total_gst_amount)+parseFloat(total_cgst_amount)+parseFloat(total_igst_amount);
        }

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
        $("#product_type").select2({
            data: product_type
        });

        var brand =  [/* states array*/];
        $("#brand_name").select2({
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

        var customer =  [/* states array*/];
        $("#customer").select2({
            data: customer
        });
        $('#customer').select2('open').select2('close');
        var payment_type =  [/* states array*/];
        $("#payment_type").select2({
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

        //        Current time takes from unloading_time
        var time = new Date();

        var mytime = time.toLocaleString('en-US', {
            hour: 'numeric',
            minute: 'numeric',
            hour12: true
        })
        $('#unloading_time').val("" + mytime);
        //        Current time takes from unloading_time

        //        current time taken from reporting_time
        var time = new Date();

        var mytime = time.toLocaleString('en-US', {
            hour: 'numeric',
            minute: 'numeric',
            hour12: true
        })
        $('#reporting_time').val("" + mytime);
        //        current time taken from reporting_time


        //    ----------------------Truck Driver's Name taken from json link-----------------
        $('select[name="challan_number"]').on('change', function() {
            var stateID = $(this).val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_challan_no/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {


                        $('input[name="origin"]').empty();
                        $('input[name="destination"]').empty();
                        $('input[name="vehicle_no"]').empty();
                        $('input[name="pan_no"]').empty();
                        $('input[name="balance_amount"]').empty();


                        var Vals = data;


                        $("input[name='origin']").val(Vals.origin);
                        $("input[name='destination']").val(Vals.destination);
                        $("input[name='vehicle_no']").val(Vals.vehicle_no);
                        $("input[name='pan_no']").val(Vals.pan_no);
                        $("input[name='balance_amount']").val(Vals.balance_amount);

                    }

                });

            } else {


                $('input[name="origin"]').empty();
                $('input[name="destination"]').empty();
                $('input[name="vehicle_no"]').empty();
                $('input[name="pan_no"]').empty();
                $('input[name="balance_amount"]').empty();

            }

        });



        //        ----------------------------------------------- get party name by party code-------------------------------
        //            First Append Start


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

        $('#is_good_condition').on('change', function(event) {

            var i = $(this).val();
            if (i == "Yes") {
                $('#cause_of_loss').attr('readonly', false); // hide the first one
                $('#damage_mode').attr('readonly', false); // hide the first one
            }

            if (i == "No") // equal to a selection option
            {
                $('#cause_of_loss').attr('readonly', true); // hide the first one
                $('#damage_mode').attr('readonly', true); // hide the first one (# for id). for name
            }

        });

        //--------------------Balance Amount calulation function-----------

        function balance_amount() {
            var freight_amount = $('#freight').val();
            var diesel_amount = $('#diesel').val();
            var cash_advance_amount = $('#cash_advance').val();
            var balance_amount = Number(freight_amount) - Number(diesel_amount) - Number(cash_advance_amount);
            balance_amount = balance_amount.toFixed(2)
            $('#balance').val("" + balance_amount);
        }
        //--------------bluer mean focus lana -------
        $('#freight').blur(balance_amount);
        $('#diesel').blur(balance_amount);
        $('#cash_advance').blur(balance_amount);
        //--------------------Balance Amount calulation function end-----------

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
        $("#challan_number").select2({
            data: customer
        });


    </script>



@endsection

