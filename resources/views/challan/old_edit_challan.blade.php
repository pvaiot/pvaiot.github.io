@extends('layouts.adminPanel')
@section('title')
    Update Challan
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
        <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Update Challan Entry</span></h4>

        <a href="{{url('challan')}}" class="btn btn-primary btn-sm">Back</a>

        <hr>
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="panel panel-default">

            <div class="panel-body">

                <?php echo Form::open(array('url' =>['update_challan', $bata->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");')); ?>

                <div class="row">
                    <div class="col-md-6">
                        <br>

                        <table class="table table-bordered">

                            <tr>
                                <td style="width: 30%">Challan No<span style="color: red">*</span></td>

                                <td>

                                    <input type="text" name="challan_no" value="{{$bata->challan_no}}" id="challan_no" class="form-control" placeholder="Challan No" required>
                                    <input type="hidden" name="consigment_id" class="form-control" value="{{$bata->consignment_id}}">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">From<span style="color: red">*</span></td>
                                <td>



                                    <input class="form-control autocomplete_txt_from" type='text' data-type="from" id='from' value="{{$bata->from}}" name='from' placeholder="From" tabindex="2">

                                    <input class="form-control autocomplete_txt_from" type='hidden' data-type="from_id" id='from_id' value="{{$bata->from_id}}" name='from_id'>

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
                                <td style="width: 30%">Date<span style="color: red">*</span></td>
                                <td>


                                    <input type="text" name="date" id="date" value="{{date('d/m/Y',strtotime($bata->date))}}" class="form-control" tabindex="2" placeholder=" Date" required autofocus>
                                </td>
                            </tr>

                            <tr >
                                <td style="width: 30%">To</td>
                                <td>

                                    <input class="form-control autocomplete_txt_to" type='text' data-type="to" id='to' value="{{$bata->to}}" name='to' placeholder="To" tabindex="3">

                                    <input class="form-control autocomplete_txt_to" type='hidden' data-type="to_id" id='to_id' value="{{$bata->to_id}}" name='to_id'>

                                </td>
                            </tr>
                        </table>
                        <br>
                    </div>
                </div>
                {{-------------------------------------- retail customer ends here ---------------------  --}}


                <h5 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Consignment Date and Destination</span></h5>
                <div class="row">
                    <div class="col-md-6">
                        <br>
                        <table class="table table-bordered">
                            <tr>
                                <td style="width: 30%">Consignment No<span style="color: red">*</span></td>
                                <td>
                                    <input type="text" name="consignment_no" id="consignment_no" value="{{$bata->consignment_no}}" class="form-control" placeholder="Consignment No" required>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Destination<span style="color: red">*</span></td>
                                <td>
                                    <input type="text" name="destination" id="destination" value="{{$bata->destination}}" class="form-control" placeholder="Destination" required>

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
                                <td style="width: 30%">Consignment Date<span style="color: red">*</span></td>
                                <td>

                                    <input type="text" name="con_date" id="con_date" value="{{date('d/m/Y',strtotime($bata->con_date))}}" class="form-control" placeholder=" Date" required>
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

                        <?php $con_child = \App\Challan_Child::where('challan_id',$bata->id)->get(); ?>
                        <?php $con_length = \App\Challan_Child::where('challan_id',$bata->id)->count(); ?>
                        <?php
                        $count=0;
                        $i = 1;
                        ?>
                        @foreach($con_child as $child)

                            <tr class="item-row" style="border-bottom: solid 1px black">

                                <td class="main_td"><input name="rows[{{$count}}][package]" value="{{$child->package}}" class="package form-control"  required></td>
                                <td class="main_td"><input name="rows[{{$count}}][net_weight]" value="{{$child->net_weight}}" class="net_weight form-control"  required></td>
                                <td class="main_td"><input name="rows[{{$count}}][gross_weight]" value="{{$child->gross_weight}}" class="gross_weight form-control"  required>
                                    <input name="rows[{{$count}}][category]" value="{{$child->category}}" class="category form-control" style="display: none;">
                                    <input type="hidden" name="rows[{{$count}}][myflag]" value="1">
                                    <input type="hidden" name="rows[{{$count}}][child_id]" value="{{$child->id}}">
                                </td>

                                <td>
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
                                    <input type="text" name="truck_no" id="truck_no" value="{{$bata->truck_no}}" class="form-control" placeholder="Truck No">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Make</td>
                                <td>

                                    <input type="text" name="make" id="make" value="{{$bata->make}}" class="form-control" placeholder="Make">


                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Owner's Phone</td>
                                <td>
                                    <input type="text" name="owners_phone" id="owners_phone" value="{{$bata->owners_phone}}" class="form-control" placeholder="Owner's Phone">

                                </td>
                            </tr>


                            <tr>
                                <td style="width: 30%">Pan No</td>
                                <td>
                                    <input type="text" name="pan_no" id="pan_no" value="{{$bata->pan_no}}" class="form-control" placeholder="Pan No" tabindex="6">

                                </td>
                            </tr>

                        </table>
                        <br>
                    </div>

                    <!-- --------------------2nd row---------------------- -->

                    <div class="col-md-4">
                        <br>
                        <table class="table table-bordered">



                            <tr>
                                <td style="width: 30%">Engine No</td>
                                <td>
                                    <input type="text" name="engine_no" id="engine_no" value="{{$bata->engine_no}}" class="form-control" placeholder="Engine No">

                                </td>
                            </tr>



                            <tr>
                                <td style="width: 30%">Owner's Name</td>
                                <td>

                                    <input type="text" name="owners_name" id="owners_name" value="{{$bata->owners_name}}" class="form-control" placeholder="Truck Owner Name">


                                </td>
                            </tr>



                            <tr>
                                <td style="width: 30%">Pan Applicable</td>
                                <td>
                                    <select style="width: 100%" class="form-control" name="pan_applicable" id="pan_applicable" tabindex="4">
                                        <option value="{{$bata->pan_applicable}}">{{$bata->pan_applicable}}</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </td>


                            <tr>
                                <td style="width: 30%">Pan Name</td>
                                <td>
                                    <input type="text" name="pan_name" id="pan_name" value="{{$bata->pan_name}}" class="form-control" placeholder="Pan Name" readonly>

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
                                    <input type="text" name="chassis_no" id="chassis_no" value="{{$bata->chassis_no}}" class="form-control" placeholder="Chassis No">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Owner's Address</td>
                                <td>
                                    <input type="text" name="owners_address" id="owners_address" value="{{$bata->owners_address}}" class="form-control" placeholder="Owner's Address">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Pan Of</td>
                                <td>
                                    <select style="width: 100%" class="form-control" name="pan_of" id="pan_of" tabindex="5">
                                        <option value="{{$bata->pan_of}}">{{$bata->pan_of}}</option>
                                        <option value="Broker">Broker</option>
                                        <option value="Driver">Driver</option>
                                        <option value="Driver">Truck Owner</option>
                                    </select>

                                </td>
                            </tr>


                            <tr>
                                <td style="width: 30%">Declaration Submitted</td>
                                <td>

                                    <select style="width: 100%" class="form-control" name="declaration_submitted" id="declaration_submitted" tabindex="8">
                                        <option value="{{$bata->declaration_submitted}}">{{$bata->declaration_submitted}}</option>
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

                                    <select style="width: 100%" class="form-control" name="broker" id="broker" tabindex="9">
                                        <option value="{{$bata->broker}}">{{$bata->broker}}</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Broker's Slip No</td>
                                <td>
                                    <input type="text" name="broker_slip_no" id="broker_slip_no" value="{{$bata->broker_slip_no}}" class="form-control" placeholder="Slip No" tabindex="11">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Driver's Name</td>
                                <td>

                                    <select name="drivers_name" id="drivers_name" class="form-control" tabindex="14">

                                        <option value="{{$bata->drivers_id}}">{{$bata->drivers_name}}</option>
                                        <?php  $datas = \App\Driver::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->truck_driver_name}}</option>
                                        @endforeach
                                    </select>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">License No</td>
                                <td>
                                    <input type="text" name="license_no" id="license_no" value="{{$bata->license_no}}" class="form-control" placeholder="License No">

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

                                    <select name="broker_name" id="broker_name" class="form-control" tabindex="10">

                                        <option value="{{$bata->broker_id}}">{{$bata->broker_name}}</option>
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

                                    <select name="insurance_name" id="insurance_name" class="form-control" tabindex="12">
                                        <option value="{{$bata->insurance_name}}">{{$bata->insurance_name}}</option>
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
                                    <input type="text" name="drivers_contact_no" id="drivers_contact_no" value="{{$bata->drivers_contact_no}}" class="form-control" placeholder="Driver's Contact No">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Place Of Issue</td>
                                <td>
                                    <input type="text" name="place_of_issue" id="place_of_issue" value="{{$bata->place_of_issue}}" class="form-control" placeholder="Place Of Issue">

                                </td>
                            </tr>




                        </table>
                        <br>
                    </div>

                    {{-- ----------------------------------------6th Row --------------------------------}}
                    <div class="col-md-4">
                        <br>
                        <table class="table table-bordered">

                            <tr>
                                <td style="width: 30%">Broker Phone</td>
                                <td>
                                    <input type="text" name="broker_phone" id="broker_phone" value="{{$bata->broker_phone}}" class="form-control" placeholder="Broker Phone">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Policy No</td>
                                <td>
                                    <input type="text" name="policy_no" id="policy_no" value="{{$bata->policy_no}}" class="form-control" placeholder="Policy No" tabindex="13">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Driver's Address</td>
                                <td>
                                    <input type="text" name="drivers_address" id="drivers_address" value="{{$bata->drivers_address}}" class="form-control" placeholder="Driver's Address">

                                </td>
                            </tr>


                        </table>

                        <br>
                    </div>
                    <hr>

                </div>


                {{-- ----------------------------------------7th Row --------------------------------}}


                <div class="row">
                    <div class="col-md-4">

                        <table class="table table-bordered">

                            <tr>
                                <td style="width: 30%">Balance Payable At</td>
                                <td>
                                    {{--it create the drop downlist--}}
                                    <select name="balance_payable_at" id="balance_payable_at" class="form-control" tabindex="15">
                                        <option value="{{$bata->balance_payable_at_id}}">{{$bata->balance_payable_at}}</option>
                                        <?php  $datas = App\Branch::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->city}}</option>
                                        @endforeach
                                    </select>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Cash Advance</td>
                                <td>
                                    <input type="number" name="cash_advance" id="cash_advance" value="{{$bata->cash_advance}}" class="form-control"tabindex="18">

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
                                    <input type="number" name="freight" id="freight" value="{{$bata->freight}}" class="form-control" tabindex="16">

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Balance Amt</td>
                                <td>
                                    <input type="number" name="balance" id="balance" value="{{$bata->balance}}" class="form-control" readonly="" tabindex="20">

                                </td>
                            </tr>

                        </table>

                    </div>


                    <div class="col-md-4">

                        <table class="table table-bordered">

                            <tr>
                                <td style="width: 30%">Diesel Amt</td>
                                <td>
                                    <input type="number" name="diesel" id="diesel" value="{{$bata->diesel}}" class="form-control" tabindex="17">

                                </td>
                            </tr>

                        </table>

                        <br>
                    </div>
                    <hr>

                </div>


                <div class="row">
                    <div class="col-md-1 col-md-offset-4">
                        <button type="submit" id="submit" class="btn btn-warning btn-sm" tabindex="19">Save <span class="glyphicon glyphicon-hdd"></span></button>
                    </div>
                    <div class="col-md-1">
                        <button type="reset" class="btn btn-info btn-sm" >Reset <span class="glyphicon glyphicon-refresh"></span></button>
                    </div>

                    <div class="col-md-1"><a  class="btn btn-success btn-sm" href="{{url('challan')}}">Back</a>
                    </div>
                </div>

                <br>

                {{form::close()}}
            </div> <!-- panel body ends here -->
        </div> <!-- invoice details panel ends here -->
    </div>


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
        document.getElementById('testform').onsubmit= function(e){
            e.preventDefault();
        }

        document.getElementById('testform1').onsubmit= function(e){
            e.preventDefault();
        }

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
        $("#product_name").select1({
            data: country
        });
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
        $("#broker_name").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#insurance_name").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#drivers_name").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#balance_payable_at").select2({
            data: product_type
        });

        //   ----------------date validation--------------------
        $(function() {
            $("#date")
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

        //        --------------------auto complete of from-----------
        $(document).on('focus','.autocomplete_txt_from',function(){
            type = $(this).data('type');

            if(type =='from' )autoType='city';

            $(this).autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    $.ajax({
                        url: "{{ route('searchajax_from1') }}",
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
                        url: "{{ route('searchajax_to1') }}",
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


    </script>

@endsection

