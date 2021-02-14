@extends('layouts.adminPanel')
@section('title')
    Admin Panel
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
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .cndata .form-control{
            font-size: 12px;padding: 0px;font-weight: 400;
        }

        #cndetails input[type=number]{
            border-top: 0px;border-right: 0px;border-left: 0px;border-radius: 0px;
        }

    </style>
@endsection


@section('content')


    <div class="well" style="border: 0px;">
        @if(Session::has('flash_message'))
            <div class="alert alert-success">
                {{ Session::get('flash_message') }}
            </div>
        @endif
        <br>

        <h4 class="text-center"><span style="border-bottom: dotted 2px green;padding-bottom: 2px">New Freight Bill</span></h4>

        @if($errors->any())
            <div class="alert alert-danger">
                @foreach($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>
        @endif

        <a href="{{url('acknowledgement')}}" class="btn btn-primary btn-sm">Back</a>
        <hr>
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="panel panel-default" style="border: 0px">
            <?php echo Form::open(array('url' =>['update_freight_bill', $ack->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");')); ?>

            <div class="panel-body">
                <div class="row">



                    {{-- ------------------------------- 4column------------------------------------------ --}}

                    <div class="row">
                        <div class="col-md-4">

                            <table class="table table-striped">

                                <tr>
                                    <td style="width: 30%">Bill Date<span style="color:red">*</span></td>
                                    <td>

                                        <input type="text" name="bill_date" id="bill_date"  class="styledate form-control" value="{{date('d/m/Y',strtotime($ack->bill_date))}}" disabled/>                                    </td>

                                </tr>

                                <tr>
                                    <td style="width: 30%">Party Code<span style="color:red">*</span></td>
                                    <td>

                                        <select name="party_code" id="party_code" class="form-control" disabled>
                                            <option value="{{$ack->party_code}}">{{$ack->party_code}}</option>
                                            <?php  $datas = App\Party::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->party_code}}">{{$data->party_code}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>


                            </table>

                        </div>

                        <!-- --------------------2nd row---------------------- -->

                        <div class="col-md-4">

                            <table class="table table-striped">

                                <tr>
                                    <td style="width: 30%">Branch Code<span style="color:red">*</span></td>
                                    <td>

                                        <select name="branch_code" id="branch_code" class="form-control" disabled>
                                            <option value="{{$ack->branch_code}}">{{$ack->branch_code}}</option>
                                            <?php  $datas = App\Branch::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->branch_code}}">{{$data->branch_code}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Misc Party</td>
                                    <td>

                                        <select name="misc_Party" id="misc_Party" class="form-control" disabled>
                                            <option value="{{$ack->misc_pary}}">{{$ack->misc_pary}}</option>
                                            <?php  $datas = App\Party::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->party_code}}">{{$data->party_code}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>



                            </table>

                        </div>

                        <!-- -----------3rd row------ -->
                        <div class="col-md-4">

                            <table class="table table-striped">

                                <tr>
                                    <td style="width: 30%">Bill No<span style="color:red">*</span></td>
                                    <td>
                                        <input type="text" name="bill_no" id="bill_no" class="form-control" placeholder="Bill No" value="{{$ack->bill_no}}" disabled/>

                                    </td>
                                </tr>



                                <tr>
                                    <td style="width: 30%">Dealer</td>
                                    <td>

                                        <select name="dealer" id="dealer" class="form-control" disabled>
                                            <option value="{{$ack->dealer}}">{{$ack->dealer}}</option>
                                            <?php  $datas = App\Party::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->name}}">{{$data->name}}</option>
                                            @endforeach
                                        </select>

                                    </td>
                                </tr>


                            </table>

                            <br>
                        </div>
                        <hr>

                    </div>

                    <!-- --------------------end here---------------------- -->




                    <div class="row" style="padding: 0px;">

                        <div class="col-md-4">
                            <table class="table table-striped" style="">

                                <tr>
                                    <td style="width: 30%">Party Name</td>
                                    <td>
                                        <?php  $datas = \App\Party::where("party_code",$ack->party_code)->get(); ?>
                                        @foreach($datas as $data)
                                        <input type="text" value="{{$data->name}}" name="party_name" id="party_name" class="form-control" placeholder="Party Name" value="" disabled/>

                                        @endforeach
                                    </td>
                                </tr>





                                <!-- --------------------end here---------------------- -->



                                <tr>
                                    <td style="width: 30%">Party Address</td>
                                    <td>
                                        <?php  $datas = \App\Party::where("party_code",$ack->party_code)->get(); ?>
                                        @foreach($datas as $data)
                                        <input type="text" value="{{$data->address}}" name="party_address" id="party_address" class="form-control" placeholder="Party Address" disabled/>
                                    @endforeach
                                    </td>
                                </tr>

                            </table>
                            <br>
                        </div>

                        <div class="col-md-8">

                            <table class="table table-striped">

                                <tr>
                                    <td style="width: 40%">Consignment Type<span style="color:red">*</span></td>
                                    <td>
                                        <label class="radio-inline">
                                            <input class="radio-inline" type="radio" name="with_acknowledgement" value="1" <?php if($ack->consignment_type=="1"){?> checked="true" <?php } ?> disabled/> With Acknowledgement
                                        </label>
                                        <label class="radio-inline">
                                            <input class="radio-inline" type="radio" name="with_acknowledgement" value="0" <?php if($ack->consignment_type=="0"){?> checked="true" <?php } ?> disabled/> Without Acknowledgement
                                        </label>

                                    </td>
                                </tr>



                                <tr>
                                    <td style="width: 30%">GST<span style="color:red">*</span></td>
                                    <td>
                                        <label class="radio-inline">
                                            <input class="radio-inline" id="with_gst" type="radio" name="with_gst" value="1" <?php if($ack->gst_type=="1"){?> checked="true" <?php } ?> disabled/> With GST
                                        </label>
                                        <label class="radio-inline">
                                            <input class="radio-inline" id="with_out_gst" type="radio" name="with_gst" value="0" <?php if($ack->gst_type=="0"){?> checked="true" <?php } ?> disabled/> With IGST
                                        </label>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Consignment No<span style="color:red">*</span></td>
                                    <td>

                                        <select name="consignment_no" id="consignment_no" class="form-control" required tabindex="2" style="width: 68%;float: left;" disabled>
                                            <option value="{{$ack->consignment_no}}">{{$ack->consignment_no}}</option>
                                            <?php  $datas = App\Acknowledgement::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->challan_number}}">{{$data->challan_number}}</option>
                                            @endforeach
                                        </select>

                                        <button type="button" class="btn btn-primary btn-md" style="width: 30%;margin-left: 5px;">Show CN Details</button>

                                    </td>
                                </tr>

                            </table>

                            <br>
                        </div>
                    </div>

                </div>
                {{-- ----------------------------------------1st Row --------------------------------}}

            </div>


            {{-------------------------------------- Row End Here --------------------- --}}
            {{-------------------------------------- retail customer ends here ---------------------  --}}


            {{----------------------------------------------------------------------------------- form end here ----------------------------------}}
            {{----------------------------------------------------------------------------------- Show CN details here ----------------------------------}}


            <div class="table-responsive" id="cndetails">
                <table class="table table-striped table-condensed table-bordered" id="table">

                    <thead>
                    <tr style="font-size: 12px;">
                        <th class="text-center">LR NO.</th>
                        <th class="text-center">DATE</th>
                        <th class="text-center">FROM</th>
                        <th class="text-center">TO</th>
                        <th class="text-center">VEHICLE NO</th>
                        <th class="text-center">QTY/PKG</th>
                        <th class="text-center">FREIGHT</th>
                        <th class="text-center">DETENTION</th>
                        <th class="text-center">LABOUR</th>
                        <th class="text-center">COCK LR NO.</th>
                        <th class="text-center">INVOICE NO.</th>
                        <th class="text-center">S.N.T. CHARGE</th>
                        <th class="text-center">TOLL TAX</th>
                        <th class="text-center">WEIGHT</th>
                        <th class="text-center">TOTAL FREIGHT</th>
                        <th class="text-center">DEL</th>
                    </tr>
                    </thead>
                    <tbody class="cndata">
                    <?php  $datas = \App\Acknowledgement::where("challan_number",$ack->consignment_no)->get(); ?>
                    @foreach($datas as $data)
                    <tr style="font-size: 12px;">
                        <td class="text-center"><input value="{{$data->challan_number}}" type="text" name="lrno" id="lrno" class="form-control" readonly disabled/></td>
                        <td class="text-center"><input value="{{date('d/m/Y',strtotime($data->date))}}" type="text" name="date" id="date" class="form-control" readonly disabled/></td>
                        <td class="text-center"><input value="{{$data->origin}}" type="text" name="from" id="from" class="form-control" readonly disabled/></td>
                        <td class="text-center"><input value="{{$data->destination}}" type="text" name="to" id="to" class="form-control" readonly disabled/></td>
                        <td class="text-center"><input value="{{$data->vehicle_no}}" type="text" name="truck_no" id="truck_no" class="form-control" readonly disabled/></td>
                        <td class="text-center"><input value="{{$ack->qty}}" type="number" name="qty" id="qty" class="form-control" disabled/></td>
                        <td class="text-center"><input value="{{$ack->freight}}" type="number" name="freight" id="freight" class="form-control"  disabled onkeyup="calctotalfreight()" onchange="gstfunction2()" onblur="gstfunction3()"/></td>
                        <td class="text-center"><input value="{{$ack->detention}}" type="number" name="detention" id="detention" class="form-control" disabled value="0"/></td>
                        <td class="text-center"><input value="{{$ack->labour}}" type="number" name="labour" id="labour" class="form-control"  disabled onkeyup="calctotalfreight()" onchange="gstfunction2()" onblur="gstfunction3()"/></td>
                        <td class="text-center"><input value="{{$ack->cock_lr_no}}" type="text" name="cocklr" id="cocklr" class="form-control" disabled/></td>
                        <td class="text-center"><input value="{{$ack->invoice_no}}" type="text" name="invoiceno" id="invoiceno" class="form-control" disabled/></td>
                        <td class="text-center"><input value="{{$ack->snt_charge}}" type="number" name="sntcharge" id="sntcharge" class="form-control"  disabled onkeyup="calctotalfreight()" onchange="gstfunction2()" onblur="gstfunction3()"/></td>
                        <td class="text-center"><input value="{{$ack->toll_tax}}" type="number" name="tolltax" id="tolltax" class="form-control"  disabled onkeyup="calctotalfreight()" onchange="gstfunction2()" onblur="gstfunction3()"/></td>
                        <td class="text-center"><input value="{{$ack->weight}}" type="number" name="weight" id="weight" class="form-control"  disabled/></td>
                        <td class="text-center"><input value="{{$ack->total_amount}}" type="number" name="Totalfreight" id="Totalfreight" class="form-control" disabled readonly/></td>
                        <td class="text-center"><input type="button" name="delete" id="delete" class="form-control" disabled/></td>
                    </tr>
                    </tbody>
                    @endforeach


                </table>

            </div>



            <hr>

            {{----------------------------------------------------------------------------------- end of CN details here ----------------------------------}}
            {{----------------------------------------------------------------------------------- All bill will be here ----------------------------------}}


            <div class="well col-md-6" style="float:right;border: none;box-shadow: none;">
                <?php  $datas = \App\Freightbill_child::where("freight_bill_id",$ack->id)->get(); ?>
                @foreach($datas as $data)
                <table class="table table-striped">

                    <tr>
                        <td style="width: 30%">Total Amount</td>
                        <td>
                            <input type="text" name="total_amount" value="{{$ack->total_amount}}" id="total_amount" class="form-control" placeholder="Total Amount" onchange="gstfunction2();gstfunction3();" disabled readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%;">
                            <span style="width: 30%;">SGST</span>
                            <input value="{{$data->rate_of_sgst}}" style="width: 20%;margin-top: 12px;margin-left: 15%;" type="text" name="gst_per" id="gst_per" onkeyup="gstfunction2();gstfunction3();" onchange="gstfunction2(),gstfunction3()" disabled/>
                            <span style="width: 10%;">%</span>
                        </td>
                        <td>
                            <input type="text" value="{{$data->sgst_amount}}" name="total_gst" id="total_gst" class="form-control" placeholder="0" readonly disabled/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%;">
                            <span style="width: 30%;">CGST</span>
                            <input value="{{$data->rate_of_cgst}}" style="width: 20%;margin-top: 12px;margin-left: 15%" type="text" name="cgst_per" id="cgst_per" onkeyup="gstfunction2(),gstfunction3()" onchange="gstfunction2(),gstfunction3()" disabled/>
                            <span style="width: 10%;">%</span>
                        </td>
                        <td>
                            <input type="text" value="{{$data->cgst_amount}}" name="total_cgst" id="total_cgst" class="form-control" placeholder="0" disabled/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%;">
                            <span style="width: 30%;">IGST</span>
                            <input value="{{$data->rate_of_igst}}" style="width: 20%;margin-top: 12px;margin-left: 15%;" type="text" name="igst_per" id="igst_per" onkeyup="gstfunction2(),gstfunction3()" onchange="gstfunction2(),gstfunction3()" disabled/>
                            <span style="width: 10%;">%</span>
                        </td>
                        <td>
                            <input type="text" name="total_igst" value="{{$data->igst_amount}}" id="total_igst" class="form-control" placeholder="0"  readonly disabled/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%">Net Amount</td>
                        <td>
                            <input type="text" name="net_amount" value="{{$ack->net_amount}}" id="net_amount" class="form-control" placeholder="Net Amount" disabled/>
                        </td>
                    </tr>
@endforeach
                </table>

            </div>
            <div class="row col-md-12">
                <div class="col-md-1 col-md-offset-">
                    <a href="{{url('invoicealter')}}" class="btn btn-primary btn-sm">Back</a>
                    </div>
            </div>

            {{form::close()}}
                    <!-- panel body ends here -->
        </div> <!-- invoice details panel ends here -->
    </div>

    {{----------------------------------------------------------------------------------- end of bill here ----------------------------------}}

    <script>
        function totalamountfunction() {
            gstfunction2();
            gstfunction3();
        }

        {{------------------------------------------------- Calculate total amount ---------------------------------------------------------}}

        function calctotalfreight() {

            var freight= document.getElementById('freight').value;
            var labour= document.getElementById('labour').value;
            var snt= document.getElementById('sntcharge').value;
            var toll= document.getElementById('tolltax').value;

            var totalfreight= document.getElementById('Totalfreight').value=parseFloat(freight)+parseFloat(labour)+parseFloat(snt)+parseFloat(toll);
            document.getElementById('total_amount').value=totalfreight;

        }


        {{------------------------------------------------- end of Calculation  ---------------------------------------------------------}}

        {{------------------------------------------------- Fill Cn details with ajax---------------------------------------------------------}}


        $('#consignment_no').on('change', function() {
            var stateID = $('#consignment_no').val();


            if (stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_consignment_no/' + stateID,

                    type: "GET",

                    dataType: "json",

                    success: function(data) {

                        $('input[name="date"]').empty();
                        $('input[name="from"]').empty();
                        $('input[name="to"]').empty();
                        $('input[name="truck_no"]').empty();

                        var Vals = data;

                        $("input[name='date']").val(Vals.consignment_date);
                        $("input[name='from']").val(Vals.confrom);
                        $("input[name='to']").val(Vals.conto);
                        $("input[name='truck_no']").val(Vals.vehicle_no);
                        $("input[name='lrno']").val(stateID);


                    }

                });

            } else {
                $('input[name="date"]').empty();
                $('input[name="from"]').empty();
                $('input[name="to"]').empty();
                $('input[name="truck_no"]').empty();

            }

        });

        {{---------------------------------------------------end of ajax--------------------------------------------------------------------}}
        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });

        $(function() {
            $(".base").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        } );

        $(document).ready(function(){
            $("input[type='radio']").click(function(){
                var radioValue = $("input[name='with_gst']:checked").val();
                if(radioValue==0){
                    document.getElementById('gst_per').value="0";
                    document.getElementById('cgst_per').value="0";
                    document.getElementById('gst_per').value="0";
                    document.getElementById('igst_per').value="12";
                    document.getElementById("gst_per").readOnly = true;
                    document.getElementById("cgst_per").readOnly = true;
                    document.getElementById("igst_per").readOnly = false;
                    document.getElementById('total_gst').value="0";
                    document.getElementById('total_cgst').value="0";
                    gstfunction3();
                }else{
                    document.getElementById("gst_per").readOnly = false;
                    document.getElementById("cgst_per").readOnly = false;
                    document.getElementById("igst_per").readOnly = true;
                    document.getElementById('total_igst').value="0";
                    document.getElementById('igst_per').value="0";
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

