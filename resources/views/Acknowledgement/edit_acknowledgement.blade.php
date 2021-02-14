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
        #challan_no_error,#consignment_number_error{
            display: none;
            margin-bottom: -10px;
        }
        #challan_no_error1{
            display: none;
            margin-bottom: -10px;
        }
        .btn:focus{
            font-size: 15px;
            background-color: #0088cc !important;
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
        <h2>Edit Acknowledgement Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Edit Acknowledgement Entry</span></li>
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

            <?php echo Form::open(array('url' =>['update_acknowledgement', $ack->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");')); ?>

            <div class="row" style="margin: auto;">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Challan Number</label>
                        <input type="text" name="challan_number" value="{{$ack->challan_number}}" id="challan_number" class="form-control" placeholder="Challan No" autofocus>
                        <p style="color: red;font-size: 10px;" id="challan_no_error">* Acknowledge is Already done for this Challan No. *</p>
                        <p style="color: red;font-size: 10px;" id="challan_no_error1">* Challan No. Does Not Exist *</p>
                    </div>
                </div>
            </div>
            <br><br>

            {{-- ----------------------------------------1st Row --------------------------------}}
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Date</label>
                        <input type="text" name="date" id="date" value="{{date('d/m/Y',strtotime($ack->date))}}" class="styledate form-control" placeholder="Date" required />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Origin</label>
                        <input type="text" name="origin" id="origin" value="{{$ack->origin}}" class="form-control" placeholder="Origin" readonly>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Destination</label>
                        <input type="text" name="destination" id="destination" value="{{$ack->destination}}" class="form-control" placeholder="Destination" readonly>
                    </div>
                </div>
            </div><br>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Vehicle No</label>
                        <input type="text" name="vehicle_no" id="vehicle_no" value="{{$ack->vehicle_no}}" class="form-control" placeholder="Vehicle No" readonly>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Reporting Date</label>
                        <input type="text" name="reporting_date" id="reporting_date" value="{{date('d/m/Y',strtotime($ack->reporting_date))}}" class="styledate form-control" placeholder="Reporting Date">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Reporting Time	</label>
                        <input type="time" name="reporting_time" id="reporting_time" class="form-control styletime" value="{{$ack->reporting_time}}" placeholder="Reporting Time">
                    </div>
                </div>
            </div><br>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Unloading Date</label>
                        <input type="text" name="unloading_date" value="{{date('d/m/Y',strtotime($ack->unloading_date))}}" id="unloading_date" class="styledate form-control" placeholder="Unloading Date">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Unloading Time</label>
                        <input type="time" name="unloading_time" value="{{$ack->unloading_time}}" id="unloading_time" class="form-control styletime" placeholder="Unloading Time">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Pan No</label>
                        <input type="text" name="pan_no" id="pan_no" value="{{$ack->pan_no}}" class="form-control" placeholder="Pan No">
                    </div>
                </div>
            </div><br>
            {{-------------------------------------- Row End Here --------------------- --}}
            {{-------------------------------------- retail customer ends here ---------------------  --}}

            {{--First Append Start--}}

            <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Add Consignment Details</span></h4>
            <div class="table-responsive">
                <table id="items" class="table table-no-more table-bordered mb-none billing_table" style="font-size: 13px!important;">
                    <thead>
                    <tr style="background-color: #09C6AB;color: #ffffff">

                        <th>RCVD QTY</th>
                        <th>RCVD WT</th>
                        <th>IS GOOD CONDITION</th>
                        <th>CAUSE OF LOSS</th>
                        <th>DAMAGE MODE</th>
                        <th>REMARKS</th>
                        <th>QTY</th>
                        <th>VALUE</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <?php $ack_child = \App\acknowledgementChild::where('acknowledgement_id',$ack->id)->get(); ?>
                    <?php $ack_length = \App\acknowledgementChild::where('acknowledgement_id',$ack->id)->count(); ?>
                    <?php
                    $count=0;
                    $i = 1;
                    ?>
                    @foreach($ack_child as $child)
                        <tr class="item-row" style="border-bottom: solid 1px black">


                            <td data-title="Received Qty" class="main_td"><input name="rows[{{$count}}][received_qty]" value="{{$child->received_qty}}" class="received_qty form-control"required></td>

                            <td data-title="Received Weight" class="main_td"><input name="rows[{{$count}}][received_weight]" value="{{$child->received_weight}}" class="received_weight form-control"  required></td>

                            <td data-title="IS GOOD CONDITION" class="main_td">
                                <select name="rows[{{$count}}][is_good_condition]" id="is_good_condition" class="form-control" required>
                                    <option value="{{$child->is_good_condition}}">{{$child->is_good_condition}}</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </td>

                            <td data-title="CAUSE OF LOSS" class="main_td">
                                <select name="rows[{{$count}}][cause_of_loss]" id="cause_of_loss" class="form-control" required>
                                    <option value="{{$child->cause_of_loss}}">{{$child->cause_of_loss}}</option>
                                    <option value="Damage">DAMAGE</option>
                                    <option value="Shortage">SHORTAGE</option>
                                    <option value="Damage&Shortage">DAMAGE+SHORTAGE</option>
                                    <option value="Theft">THEFT</option>
                                    <option value="Hijack">HIJACK</option>
                                </select>
                            </td>

                            <td data-title="Damage Mode" class="main_td">
                                <select name="rows[{{$count}}][damage_mode]" id="damage_mode" class="form-control" required>
                                    <option value="{{$child->damage_mode}}">{{$child->damage_mode}}</option>
                                    <option value="Current">CURRENT</option>
                                    <option value="Previous">PREVIOUS</option>
                                    <option value="Previous&Current">PREVIOUS+PREVIOUS</option>
                                </select>
                            </td>

                            <td data-title="Remarks" class="main_td"><input name="rows[{{$count}}][remarks]" value="{{$child->remarks}}" class="remarks form-control"  required ></td>
                            <td data-title="Quantity" class="main_td"><input name="rows[{{$count}}][quantity]" value="{{$child->quantity}}" class="quantity form-control"  required></td>

                            <td data-title="Value" class="main_td"><input name="rows[{{$count}}][value]" value="{{$child->value}}" class="value form-control"  required>
                                <input type="hidden" name="rows[{{$count}}][myflag]" value="1">
                                <input type="hidden" name="rows[{{$count}}][acknowledgement_id]" value="{{$child->id}}">
                            </td>
                            <td data-title="Action">
                                @if($i < $ack_length)
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
                </table>
            </div>
            <br>
            {{--First Append End--}}

            {{-- ----------------------------------------4th Row --------------------------------}}
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Balance Payable At</label>
                        <select name="balance_payable_at" id="balance_payable_at" class="form-control">
                            <option value="{{$ack->balance_payable_at}}"> {{$ack->balance_payable_at}}</option>

                            <?php  $datas = App\Branch::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->city}}">{{$data->city}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Acknowledgement Received Date</label>
                        <input type="text" name="acknowledgement_received_date" id="acknowledgement_received_date" value="{{date('d/m/Y',strtotime($ack->acknowledgement_received_date))}}" class="styledate form-control" placeholder="Acknowledgement Received Date">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Payment Date</label>
                        <input type="text" name="payment_date" id="payment_date" value="{{date('d/m/Y',strtotime($ack->payment_date))}}" class="styledate form-control" placeholder="Payment Date">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label">Balance Amount</label>
                        <input type="number" name="balance_amount" id="balance_amount" value="{{$ack->balance_amount}}" class="form-control" readonly>
                    </div>
                </div>
            </div><br>


            {{-------------------------------------- Row End Here --------------------- --}}

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
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}
    <script>
        $('#challan_number').on('change', function() {
            var stateID = $('#challan_number').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_challan_no_value/' + stateID,
                    type: "GET",
                    success: function(response) {
                        if(response == 'unique'){
                            $('#challan_no_error1').css('display','none');
                            $('#challan_number').css( 'border-bottom-color','silver');
                            $('#submit').prop('disabled',false);
                        }else{
                            $('#challan_number').css( 'border-bottom-color','red');
                            $('#challan_no_error1').css('display','block');
                            $('#submit').prop('disabled',true);

                        }
                    }
                });

            } else {

            }

        });
        $('#challan_number').on('change', function() {
            var stateID = $('#challan_number').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_challan_no_acknowledge/' + stateID,
                    type: "GET",
                    success: function(response) {
                        if(response == 'unique'){
                            $('#challan_number').css( 'border-bottom-color','red');
                            $('#challan_no_error').css('display','block');
                            $('#submit').prop('disabled',true);

                        }else{
                            $('#challan_no_error').css('display','none');
                            $('#challan_number').css( 'border-bottom-color','silver');
                            $('#submit').prop('disabled',false);
                        }
                    }
                });

            } else {

            }

        });

        $('#challan_number').on('change', function() {
            var stateID = $(this).val();
            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_challan_no/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="date"]').empty();
                        $('input[name="origin"]').empty();
                        $('input[name="destination"]').empty();
                        $('input[name="vehicle_no"]').empty();
                        $('input[name="pan_no"]').empty();
                        $('input[name="balance_amount"]').empty();


                        var Vals = data;

                        $("input[name='date']").val(Vals.date);
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

        $('#consignment_number').on('blur', function() {
            var stateID = $(this).val();
            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_number/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="date"]').empty();
                        $('input[name="origin"]').empty();
                        $('input[name="destination"]').empty();
                        $('input[name="vehicle_no"]').empty();
                        $('input[name="pan_no"]').empty();
                        $('input[name="balance_amount"]').empty();


                        var Vals = data;
                        $("input[name='challan_number']").val(Vals.challan_no);
                        $("input[name='date']").val(Vals.date);
                        $("input[name='origin']").val(Vals.origin);
                        $("input[name='destination']").val(Vals.destination);
                        $("input[name='vehicle_no']").val(Vals.vehicle_no);
                        $("input[name='pan_no']").val(Vals.pan_no);
                        $("input[name='balance_amount']").val(Vals.balance_amount);
                        $('#consignment_number_error').css('display', 'none');
                        $('#consignment_number').css('border-bottom-color', 'silver');
                        $('#submit').prop('disabled', false);

                        var stateID1 =Vals.challan_no;


                        if (stateID1) {

                            $.ajax({

                                url: '{{ url('/') }}/AjaxGet_challan_no_acknowledge/' + stateID1,
                                type: "GET",
                                success: function (response) {
                                    if (response == 'unique') {
                                        $('#challan_number').css('border-bottom-color', 'red');
                                        $('#challan_no_error').css('display', 'block');
                                        $('#submit').prop('disabled', true);

                                    } else {
                                        $('#challan_no_error').css('display', 'none');
                                        $('#challan_number').css('border-bottom-color', 'silver');
                                        $('#submit').prop('disabled', false);
                                    }
                                }
                            });
                        }


                        else {

                        }
                    },
                    error: function (data) {
                        $("input[name='challan_number']").val("");
                        $("input[name='date']").val("");
                        $("input[name='origin']").val("");
                        $("input[name='destination']").val("");
                        $("input[name='vehicle_no']").val("");
                        $("input[name='pan_no']").val("");
                        $("input[name='balance_amount']").val("");
                        $('#consignment_number').css('border-bottom-color', 'red');
                        $('#consignment_number_error').css('display', 'block');
                        $('#submit').prop('disabled', true);
                    }
                });

            }

        });

        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });

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

        // //        Current time takes from unloading_time
        // var time = new Date();
        //
        // var mytime = toLocaleString('en-US', {
        //     hour: 'numeric',
        //     minute: 'numeric',
        //     hour12: true
        // })
        // $('#unloading_time').val("" + mytime);
        // //        Current time takes from unloading_time
        //
        // //        current time taken from reporting_time
        // var time = new Date();
        //
        // var mytime = time.toLocaleString('en-US', {
        //     hour: 'numeric',
        //     minute: 'numeric',
        //     hour12: true
        // })
        // $('#reporting_time').val("" + mytime);
        // //        current time taken from reporting_time

        //    ----------------------Truck Driver's Name taken from json link-----------------


        //        ----------------------------------------------- get party name by party code-------------------------------
        //            First Append Start
        $(document).ready(function() {

            var i=1;
            var count=0;
            $('input').click(function(){
                $(this).select();
            });

            $("#paid").blur(update_balance);


            $(document).on('click', '.addrow', function(){

                $(this).text('x Del');
                $(this).attr('class','btn btn-info btn-sm del');
                $(".item-row:last").find('.mybtn').hide();
                i++;

                count++;
                var id=count;


                $(".item-row:last").after('<tr class="item-row" style="border-bottom: solid 1px black">' +

                        '<td data-title="Received Qty" class="main_td"><input name="rows[' + id + '][received_qty]" id=\"received_qty' + id + '\"  class=" form-control" required></td>'+
                        '<td data-title="Received Weight" class="main_td"><input name="rows[' + id + '][received_weight]" class="received_weight form-control" required></td>'+

                        '<td data-title="Is Good Condition" class="main_td">' +
                        ' <select name="rows[' + id + '][is_good_condition]" id=\"is_good_condition'+id+'\" class="form-control">'+
                        '<option value="No">No</option>'+
                        '<option value="Yes">Yes</option>'+
                        '</select>' +
                        '</td>'+


                        '<td data-title="Cause Of Loss" class="main_td">' +
                        ' <select name="rows[' + id + '][cause_of_loss]" id=\"cause_of_loss'+id+'\" class="form-control">'+
                        '<option value="Damage">DAMAGE</option>'+
                        '<option value="Shortage">SHORTAGE</option>'+
                        '<option value="Damage+Shortage">DAMAGE+SHORTAGE</option>'+
                        '<option value="Theft">THEFT</option>'+
                        '<option value="Hijack">HIJACK</option>'+
                        '</select>' +
                        '</td>'+


                        '<td data-title="Damage Mode" class="main_td">' +
                        ' <select name="rows[' + id + '][damage_mode]" id=\"damage_mode'+id+'\" class="form-control">'+
                        '<option value="Current">Current</option>'+
                        '<option value="Prevous">Prevous</option>'+
                        '<option value="Prevous+Current">Prevous+Current</option>'+
                        '</select>' +
                        '</td>'+

                        '<td data-title="Remarks" class="main_td"><input name="rows[' + id + '][remarks]" id=\"remarks'+id+'\" class="remarks form-control" required></td>'+
                        '<td data-title="Quantity" class="main_td"><input name="rows[' + id + '][quantity]" id=\"quantity'+id+'\" class="quantity form-control" required></td>'+
                        '<td data-title="Value" class="main_td"><input name="rows[' + id + '][value]" id=\"value'+id+'\" class="value form-control" required></td>'+
                        '<td data-title="Action" class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>')
                bind();
//                $("#country"+id).select1({
//                    source: country
//                });

                $('#is_good_condition'+id).on('change', function(event) {

//                    alert('on change is working');

                    var i = $(this).val();
                    if (i == "No") {
                        $('#cause_of_loss'+id).attr('disabled', false); // hide the first one
                        $('#damage_mode'+id).attr('disabled', false);
                        $('#remarks'+id).attr('disabled', false);
                        $('#quantity'+id).attr('disabled', false);
                        $('#value'+id).attr('disabled', false);// hide the first one
                        // alert(this.value+id);
                    }

                    if (i == "Yes") // equal to a selection option
                    {
                        $('#cause_of_loss'+id).attr('disabled', true); // hide the first one
                        $('#damage_mode'+id).attr('disabled', true);
                        $('#remarks'+id).attr('disabled', true);
                        $('#quantity'+id).attr('disabled', true);
                        $('#value'+id).attr('disabled', true);// hide the first one (# for id). for name
                    }

                });

            });


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
            // alert('on change is working');
            var i = $(this).val();
            if (i == "Yes") {
                $('#cause_of_loss').attr('disabled', true); // hide the first one
                $('#damage_mode').attr('disabled', true); // hide the first one
                $('#remarks').attr('disabled', true);
                $('#quantity').attr('disabled', true);
                $('#value').attr('disabled', true);
            }

            if (i == "No") // equal to a selection option
            {
                $('#cause_of_loss').attr('disabled', false); // hide the first one
                $('#damage_mode').attr('disabled', false);
                $('#remarks').attr('disabled', false);
                $('#quantity').attr('disabled', false);
                $('#value').attr('disabled', false);// hide the first one (# for id). for name
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

