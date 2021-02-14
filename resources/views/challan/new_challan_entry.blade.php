@extends('layouts.adminPanel')
@section('title')
    Create Challan
@endsection

@section('custom_css')
@endsection

@section('manual_style_code')

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
            <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">New Challan Entry</span></h4>

        <a href="{{url('home_page')}}" class="btn btn-primary btn-sm">Back</a>
            <a class="btn btn-sm btn-info" data-toggle="modal" data-target="#create_challan">+Consignment No</a>
        <hr>
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}

            <div class="panel panel-default">

            <div class="panel-body">


                <?php echo Form::open(array('route' => 'store_challan_entry','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>

                    <div class="row">
                        <div class="col-md-6">

                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Challan No<span style="color: red">*</span></td>

                                    <td>

                                        <input type="text" name="challan_no" id="challan_no" class="form-control" placeholder="Challan No" required>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">From<span style="color: red">*</span></td>
                                    <td>

                                        <select name="from" id="from" class="form-control" tabindex="2" required>
                                            <option value=""> Select From</option>
                                            <?php  $datas = App\Location::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->id}}">{{$data->city}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>
                            </table>
                            <br>
                        </div>

                        <!-- --------------------end here---------------------- -->

                        <div class="col-md-6">

                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Date<span style="color: red">*</span></td>
                                    <td>

                                        <input type="text" name="date" id="date" class="form-control" tabindex="1" placeholder=" Date" required value="<?php echo date('d/m/Y');?>"/>
                                    </td>
                                </tr>

                                <tr >
                                    <td style="width: 30%">To<span style="color: red">*</span></td>
                                    <td>
                                        <select name="to" id="to" class="form-control" tabindex="3" required>
                                            <option value=""> Select To</option>
                                            <?php  $datas = App\Location::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->id}}">{{$data->city}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    {{-------------------------------------- retail customer ends here ---------------------  --}}


                    <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Consignment Date and Destination</span></h5>
                    <div class="row">
                        <div class="col-md-6">

                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Consignment No<span style="color: red">*</span></td>
                                    <td>
                                        <select name="consignment_id" class="form-control" id="consignment_id" style="width: 100%" required>
                                            <option value="">Select Consignment No.</option>
                                            <?php  $mycons = App\Consignment::where('status','==',0)->get(); ?>
                                            @foreach($mycons as $con)
                                                <option value="{{$con->id}}">{{$con->consignment_no}}</option>
                                            @endforeach
                                        </select>
                                        {{--<input type="hidden" name="consigment_id" class="form-control" >--}}

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Destination<span style="color: red">*</span></td>
                                    <td>
                                        <input type="text" name="destination" id="destination" class="form-control" placeholder="Destination" required>

                                    </td>
                                </tr>

                            </table>
                            <br>
                        </div>

                        <!-- --------------------end here---------------------- -->

                        <div class="col-md-6">

                            <table class="table table-bordered">
                             <tr>
                                    <td style="width: 30%">Consignment Date<span style="color: red">*</span></td>
                                    <td>

                                        <input type="text" name="con_date" id="con_date"  class="form-control" placeholder=" Date" required>
                                    </td>
                                </tr>

                            </table>

                        </div>
                    </div>
                    {{-------------------------------------- retail customer ends here ---------------------  --}}

                {{--First Append Start--}}

                <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Add Consignment Details</span></h5>
                <div class="table-responsive">
                    <table id="items" class="table table-bordered billing_table" style="font-size: 13px!important;">

                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th>Package</th>
                            <th>Net Wt</th>
                            <th>Gross WT</th>
                            <th>Action</th>
                        </tr>

                        <tr class="item-row" style="border-bottom: solid 1px black">

                            <td class="main_td"><input name="rows[0][package]" class="package form-control"  required tabindex="7"></td>
                            <td class="main_td"><input name="rows[0][net_weight]" class="net_weight form-control"  required tabindex="8"></td>
                            <td class="main_td"><input name="rows[0][gross_weight]" class="gross_weight form-control"  required tabindex="9"></td>
                            <td><a class="btn btn-danger btn-sm addrow updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">ADD</a></td>
                        </tr>

                    </table>
                </div>
                {{--First Append End--}}

                    {{-- ----------------------------------------1st Row --------------------------------}}

                    <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Add Truck And Truck Owner's Details</span></h5>

                    <div class="row">
                        <div class="col-md-4">
                            <br>
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Truck No</td>
                                    <td>
                                        <input type="text" name="truck_no" id="truck_no" class="form-control" placeholder="Truck No">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Make</td>
                                    <td>
                                        <input type="text" name="make" id="make" class="form-control" placeholder="Make">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Owner's Phone</td>
                                    <td>
                                        <input type="text" name="owners_phone" id="owners_phone"  class="form-control" placeholder="Owner's Phone">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Pan No</td>
                                    <td>
                                        <input type="text" name="pan_no" id="pan_no" class="form-control" placeholder="Pan No" tabindex="5">

                                    </td>
                                </tr>


                            </table>
                            <br>
                        </div>

                        <!-- --------------------2nd row---------------------- -->

                        <div class="col-md-4" >
                            <br>
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Engine No</td>
                                    <td>
                                        <input type="text" name="engine_no" id="engine_no" class="form-control" placeholder="Engine No">

                                    </td>
                                </tr>



                                <tr>
                                    <td style="width: 30%">Owner's Name</td>
                                    <td>

                                        <input type="text" name="truck_owner_name" id="truck_owner_name" class="form-control" placeholder="Truck Owner Name">
                                        <input type="hidden" name="truck_owner_id"  class="form-control" placeholder="Truck Owner Name">

                                    </td>
                                </tr>


                                <tr>
                                    <td style="width: 30%">Pan Applicable</td>
                                    <td>
                                        <select style="width: 100%" class="form-control" name="pan_applicable" id="pan_applicable">
                                            <option value="">Select</option>
                                            <option value="Yes">Yes</option>
                                            <option value="No">No</option>
                                        </select>
                                    </td>
                                    <!-- <input type="text" name="pan_applicable" id="pan_applicable" class="form-control" placeholder="Pan Applicable"> -->

                                <tr>
                                    <td style="width: 30%">Pan Name</td>
                                    <td>
                                        <input type="text" name="pan_name" id="pan_name" class="form-control" placeholder="Pan Name">

                                    </td>
                                </tr>


                                </td>
                                </tr>

                            </table>
                            <br>
                        </div>

                        <!-- -----------3rd row------ -->
                        <div class="col-md-4">
                            <br>
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Chassis No</td>
                                    <td>
                                        <input type="text" name="chassis_no" id="chassis_no" class="form-control" placeholder="Chassis No">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Owner's Address</td>
                                    <td>
                                        <input type="text" name="owners_address" id="owners_address"  class="form-control" placeholder="Owner's Address">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Pan Of</td>
                                    <td>
                                        <select style="width: 100%" class="form-control" name="pan_of" id="pan_of">
                                            <option value="">Select Pan Of</option>
                                            <option value="Broker">Broker</option>
                                            <option value="Driver">Driver</option>
                                            <option value="Driver">Truck Owner</option>
                                        </select>

                                    </td>
                                </tr>


                                <tr>
                                    <td style="width: 30%">Declaration Submitted</td>
                                    <td>

                                        <select style="width: 100%" class="form-control" name="declaration_submitted" id="declaration_submitted">
                                            <option value="">Select</option>
                                            <option value="Yes">Yes</option>
                                            <option value="No">No</option>
                                        </select>

                                    </td>
                                </tr>


                            </table>

                            <br>
                        </div>
                        <hr>

                    </div>


                    {{-- ----------------------------------------4th Row --------------------------------}}

                    <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Add Broker's And Truck Driver's Details</span></h5>

                    <div class="row">
                        <div class="col-md-4">
                            <br>
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Broker</td>
                                    <td>

                                        <select style="width: 100%" class="form-control" name="broker" id="broker" tabindex="10">
                                            <option value="">Select</option>
                                            <option value="Yes">Yes</option>
                                            <option value="No">No</option>
                                        </select>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Broker's Slip No</td>
                                    <td>
                                        <input type="text" name="broker_slip_no" id="broker_slip_no" class="form-control" placeholder="Slip No" tabindex="12">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Driver's Name</td>
                                    <td>

                                        <select name="drivers_name" id="drivers_name" class="form-control" tabindex="11">

                                            <option value=""> Select Driver's Name</option>
                                            <?php  $datas = \App\Lorry::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->id}}">{{$data->truck_driver_name}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">License No</td>
                                    <td>
                                        <input type="text" name="license_no" id="license_no" class="form-control" placeholder="License No">

                                    </td>
                                </tr>


                            </table>
                            <br>
                        </div>

                        {{-- ----------------------------------------5th Row --------------------------------}}

                        <div class="col-md-4">
                            <br>
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Broker Name</td>
                                    <td>

                                        <select name="broker_name" id="broker_name" class="form-control">

                                            <option value=""> Select Broker Name</option>
                                            <?php  $datas = App\Broker::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->id}}">{{$data->name}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Insurance Name</td>
                                    <td>

                                        <select name="insurance_name" id="insurance_name" class="form-control" tabindex="13">
                                            <option value=""> Select Insurance Name</option>
                                            <?php  $datas = App\Insurance::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->insurance_name}}">{{$data->insurance_name}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Driver's Contact No</td>
                                    <td>
                                        <input type="text" name="drivers_contact_no" id="drivers_contact_no" class="form-control" placeholder="Driver's Contact No">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Place Of Issue</td>
                                    <td>
                                        <input type="text" name="place_of_issue" id="place_of_issue" class="form-control" placeholder="Place Of Issue">

                                    </td>
                                </tr>

                            </table>

                        </div>

                        {{-- ----------------------------------------6th Row --------------------------------}}
                        <div class="col-md-4">
                            <br>
                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Broker Phone</td>
                                    <td>
                                        <input type="text" name="broker_phone" id="broker_phone" class="form-control" placeholder="Broker Phone">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Policy No</td>
                                    <td>
                                        <input type="text" name="policy_no" id="policy_no" class="form-control" placeholder="Policy No" tabindex="14">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Driver's Address</td>
                                    <td>
                                        <input type="text" name="drivers_address" id="drivers_address" class="form-control" placeholder="Driver's Address">

                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    {{-- ----------------------------------------7th Row --------------------------------}}

                    <div class="row">
                        <div class="col-md-4">

                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Balance Payable At</td>
                                    <td>
                                        {{--it create the drop downlist--}}
                                        <select name="balance_payable_at" id="balance_payable_at" class="form-control" tabindex="16">
                                            <option value=""> Select Balance Payable At</option>
                                            <?php  $datas = App\Branch::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->city}}">{{$data->city}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Cash Advance</td>
                                    <td>
                                        <input type="number" name="cash_advance" id="cash_advance" class="form-control"tabindex="19">

                                    </td>
                                </tr>

                            </table>

                        </div>

                        <!-- --------------------8th row---------------------- -->

                        <div class="col-md-4">

                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Freight Amt</td>
                                    <td>
                                        <input type="number" name="freight" id="freight" class="form-control" tabindex="17">

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Balance Amt</td>
                                    <td>
                                        <input type="number" name="balance" id="balance" class="form-control" readonly="" tabindex="20">

                                    </td>
                                </tr>

                            </table>

                        </div>


                        <div class="col-md-4">

                            <table class="table table-bordered">

                                <tr>
                                    <td style="width: 30%">Diesel Amt</td>
                                    <td>
                                        <input type="number" name="diesel" id="diesel" class="form-control" tabindex="18">

                                    </td>
                                </tr>

                            </table>

                        </div>
                        <hr>

                    </div>
                    </br>

                <div class="row">

                    <div class="col-md-1">
                        <button type="reset" class="btn btn-info btn-sm" >Reset <span class="glyphicon glyphicon-refresh"></span></button>
                    </div>

                    <div class="col-md-1"><a  class="btn btn-success btn-sm" href="{{url('home_page')}}">Back</a>
                    </div>
                </div>

                <br>

                {{form::close()}}
            </div> <!-- panel body ends here -->
        </div> <!-- invoice details panel ends here -->
    </div>

    {{------------------------------------------------ modal for create new challan ------------------------------}}

    <div class="modal fade" id="create_challan"  role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <?php echo Form::open(array('route' => 'save_new_challan_entry','class'=> 'form-horizontal')); ?>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Select Consignment No.</h4>
                </div>
                <div class="modal-body">

                    <fieldset>

                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-2">
                                <select name="consignment_id" class="form-control" id="consignment_id" style="width: 100%" required>
                                    <option value="">Select Consignment No.</option>
                                    <?php  $mycons = App\Consignment::where('status','==',0)->get(); ?>
                                    @foreach($mycons as $con)
                                        <option value="{{$con->id}}">{{$con->consignment_no}}</option>
                                    @endforeach
                                </select>
                                {{--<input class="form-control autocomplete_txt_to" type='text' data-type="to" id='to' name='to' placeholder="To" tabindex="3">--}}

                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
                </form>
            </div>
        </div>
    </div>

    {{------------------------------------------------------------------- challan ends here ------------------------------}}
    <script>
        $('#consignment_id').on('change', function() {
            var stateID = $('#consignment_id').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_id/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        // $('input[name="destination"]').empty();
                        // $('input[name="con_date"]').empty();
                        // // $('input[name="to"]').empty();
                        $('#truck_no').value().empty();

                        var Vals = data;
                        var Val1= data1;

                        // $("input[name='destination']").val(Vals.destination);
                        // $("input[name='con_date']").val(Vals.consignment_date);
                        $('#truck_no').value(Vals.truck);

                        // $("input[name='package']").val(Vals.package);
                        // $("input[name='qty']").val(Vals.net_weight);
                        // $("input[name='qty']").val(Vals.gross_weight);


                    }

                });

            } else {

            }

        });
    </script>
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}
    <script>

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
        var country =  [/* states array*/];
        $("#product_name").select({
            data: country
        });
        var customer =  [/* states array*/];
        $("#customer").select({
            data: customer
        });
        $('#customer').select2('open').select2('close');
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

        //    ----------------------Truck owner's Name taken from json link-----------------
        $('select[name="challan_no"]').on('change', function() {
            var stateID = $(this).val();

            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_challan_number/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="date"]').empty();
                        $('input[name="truck_no"]').empty();
                        $('input[name="engine_no"]').empty();
                        $('input[name="chassis_no"]').empty();
                        $('input[name="make"]').empty();
                        $('input[name="truck_owner_name"]').empty();
                        $('input[name="owners_address"]').empty();
                        $('input[name="owners_phone"]').empty();
                        $('input[name="to"]').empty();

                        var Vals = data;

                        $("input[name='date']").val(Vals.date);
                        $("input[name='truck_no']").val(Vals.truck_no);
                        $("input[name='engine_no']").val(Vals.engine_no);
                        $("input[name='chassis_no']").val(Vals.chassis_no);
                        $("input[name='make']").val(Vals.make);
                        $("input[name='truck_owner_name']").val(Vals.truck_owner_name);
                        $("input[name='owners_address']").val(Vals.owners_address);
                        $("input[name='owners_phone']").val(Vals.owners_phone);
                        $("input[name='to']").val(Vals.to);

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

            }

        });

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


            $(document).on('click', '.addrow', function(){

                $(this).text('x Del');
                $(this).attr('class','btn btn-info btn-sm del');
                $(".item-row:last").find('.mybtn').hide();
                i++;

                count++;
                var id=count;


                $(".item-row:last").after('<tr class="item-row" style="border-bottom: solid 1px black">' +

                        '<td class="main_td"><input name="rows[' + id + '][package]" class="package form-control" required></td>'+
                        '<td class="main_td"><input name="rows[' + id + '][net_weight]" class="package form-control" required></td>'+
                        '<td class="main_td"><input name="rows[' + id + '][gross_weight]" class="gross_weight form-control" required></td>'+
                        '<td class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>')
                bind();
                $("#country"+id).select1({
                    source: country
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
            balance_amount = balance_amount.toFixed(2)
            $('#balance').val("" + balance_amount);
        }
        //--------------bluer mean focus lana -------
        $('#freight').blur(balance_amount);
        $('#diesel').blur(balance_amount);
        $('#cash_advance').blur(balance_amount);
        //--------------------Balance Amount calulation function end-----------

        var product_type =  [/* states array*/];
        $("#consignment_id").select2({
            data: product_type
        });

    </script>

@endsection

