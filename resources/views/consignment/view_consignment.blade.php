@extends('layouts.adminPanelTable')
@section('title')
    View Materialcategory
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
        <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">View Consignment Entry</span></h4>

        <a href="{{url('consignment')}}" class="btn btn-primary btn-sm">Back</a>
        <hr>
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="panel panel-default">

            <div class="panel-body">

                <?php echo Form::open(array('url' =>['update_consignment',$bata->id])); ?>

                <div class="row">
                    <div class="col-md-6">
                        <br>
                        <table class="table table-striped">

                            <tr>
                                <td style="width: 30%">Consignment No<span style="color: red">*</span></td>
                                <td>
                                    <input type="text" name="consignment_no" id="consignment_no" value="{{$bata->consignment_no}}" class="form-control" placeholder="Consignment No" required tabindex="1" readonly>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Consignor Name<span style="color: red">*</span></td>
                                <td>

                                    <select name="consignor_name" id="consignor_name" class="form-control" required tabindex="3" disabled>
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
                                <td style="width: 30%">From<span style="color: red">*</span></td>
                                <td>

                                    <select name="from" id="from" class="form-control" tabindex="6" required disabled>
                                        <option value="{{$bata->from_id}}">{{$bata->from}}</option>
                                        <?php  $datas = App\Location::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->city}}</option>
                                        @endforeach
                                    </select>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Truck Type</td>
                                <td >

                                    {{--it create the drop downlist--}}
                                    <select name="truck_type" id="truck_type" class="form-control" tabindex="8" disabled>
                                        <option value="{{$bata->truck_type_id}}">{{$bata->truck_type}}</option>
                                        <?php  $datas = App\Trucktype::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->trucktype}}</option>
                                        @endforeach
                                    </select>
                                    {{--it create the drop downlist end--}}

                                </td>
                            </tr>

                        </table>
                        <br>
                    </div>

                    <!-- --------------------end here---------------------- -->

                    <div class="col-md-6">
                        <br>
                        <table class="table table-striped">

                            <tr>
                                <td style="width: 30%">Consignment Date<span style="color: red">*</span></td>
                                <td>

                                    <input type="text" name="con_date" id="con_date" value="{{date('d/m/Y',strtotime($bata->con_date))}}" class="form-control" tabindex="2" placeholder=" Consignment Date" required readonly>
                                </td>
                            </tr>



                            <tr >
                                <td style="width: 30%">Billed At<span style="color: red">*</span></td>
                                <td>

                                    {{--it create the drop downlist--}}
                                    <select name="billed_at" id="billed_at" class="form-control" tabindex="4" required disabled>
                                        <option value="{{$bata->billed_at_id}}">{{$bata->billed_at}}</option>
                                        <?php  $datas = App\Branch::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->city}}</option>
                                        @endforeach
                                    </select>
                                    {{--it create the drop downlist end--}}
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Consignee Name <span style="color: red">*</span></td>
                                <td >

                                    <input type="text" name="consignee_name" value="{{$bata->consignee_name}}" id="consignee_name" class="form-control" placeholder="Consignee Name" tabindex="5" required readonly>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">To<span style="color: red">*</span></td>
                                <td>
                                    {{--it create the drop downlist--}}
                                    <select name="to" id="to" class="form-control" required tabindex="7" disabled>
                                        <option value="{{$bata->to_id}}">{{$bata->to}}</option>
                                        <?php  $datas = App\Location::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->city}}</option>
                                        @endforeach
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td  class="text-left" style="width: 30%">Truck No<span style="color: red">*</span></td>
                                <td>
                                    {{--it create the drop downlist--}}
                                    <select name="truck_no" id="truck_no" class="form-control" required tabindex="9" disabled>
                                        <option value="{{$bata->truck_no_id}}">{{$bata->truck_no}}</option>
                                        <?php  $datas = App\Lorry::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->id}}">{{$data->truck_no}}</option>
                                        @endforeach
                                    </select>
                                    {{--it create the drop downlist end--}}

                                </td>
                            </tr>


                        </table>
                        <br>
                    </div>
                </div>
                {{-------------------------------------- retail customer ends here ---------------------  --}}

                {{--First Append Start--}}

                <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Invoice Information</span></h4>
                <div class="table-responsive">
                    <table id="items" class="table table-bordered billing_table" style="font-size: 13px!important;">

                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th>Invoice No.<span style="color: red">*</span></th>
                            <th>Invoice Date<span style="color: red">*</span></th>
                            <th>Invoice Value<span style="color: red">*</span></th>
                            <th>Way Bill No</th>
                            <th>Validity <span style="color: red">*</span></th>

                        </tr>
                        <?php $con_child = \App\Consignment_child::where('consignment_id',$bata->id)->get(); ?>
                        <?php $con_length = \App\Consignment_child::where('consignment_id',$bata->id)->count(); ?>
                        <?php
                        $count=0;
                        $i = 1;
                        ?>
                        @foreach($con_child as $child)

                            <tr class="item-row" style="border-bottom: solid 1px black">


                                <td class="main_td"><input name="rows[{{$count}}][invoice_no]" value="{{$child->invoice_no}}" class="invoice_no form-control"required tabindex="10" readonly></td>
                                <?php $newDate = date("d/m/Y", strtotime($child->invoice_date)); ?>
                                <td class="main_td"><input name="rows[{{$count}}][invoice_date]" value="{{$newDate}}" tabindex="11" class="invoice_date form-control"required readonly></td>
                                <td class="main_td"><input name="rows[{{$count}}][invoice_value]" value="{{$child->invoice_value}}" class="invoice_value form-control"  required tabindex="12" readonly>
                                <td class="main_td"><input name="rows[{{$count}}][way_bill_no]" value="{{$child->way_bill_no}}" class="way_bill_no form-control" tabindex="13" readonly>
                                <?php $validityDate = date("d/m/Y", strtotime($child->validity)); ?>
                                <td class="main_td"><input name="rows[{{$count}}][validity]" value="{{$validityDate}}" tabindex="14" class="validity form-control" readonly></td>
                                <input type="hidden" name="rows[{{$count}}][myflag]" value="1">
                                <input type="hidden" name="rows[{{$count}}][child_id]" value="{{$child->id}}">
                                </td>


                            </tr>

                            <?php $count+=1 ?>
                            <?php $i+=1 ?>
                        @endforeach

                    </table>
                </div>
                {{--First Append End--}}

                {{--Second Append Start--}}

                <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Consignment Details</span></h4>
                <div class="table-responsive">
                    <table id="items" class="table table-bordered billing_table" style="font-size: 13px!important;">

                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th>Category<span style="color: red">*</span></th>
                            <th>Package<span style="color: red">*</span></th>
                            <th>Description</th>
                            <th>Net Weight</th>
                            <th>Gross Weight</th>
                            <th>Remarks</th>

                        </tr>

                        <?php $con_child = \App\Consignment_child2::where('consignment_id',$bata->id)->get(); ?>
                        <?php $con_length2 = \App\Consignment_child2::where('consignment_id',$bata->id)->count(); ?>
                        <?php $count2=0 ?>
                        <?php $i2=1 ?>
                        @foreach($con_child as $child)
                            <tr class="item-row2" style="border-bottom: solid 1px black">

                                <td class="main_td">
                                    <select name="rows2[{{$count2}}][category]" id="category" class="form-control" tabindex="15" required disabled>
                                        <option value="{{$child->category_id}}">{{$child->category}}</option>
                                        <?php $material_cat = \App\Materialcategory::all(); ?>
                                        @foreach($material_cat as $mat)
                                            <option value="{{$mat->id}}">{{$mat->category}}</option>
                                        @endforeach
                                    </select>
                                </td>
                                <td class="main_td"><input name="rows2[{{$count2}}][package]" value="{{$child->package}}" class="package form-control" tabindex="16" required readonly></td>
                                <td class="main_td"><input name="rows2[{{$count2}}][description]" value="{{$child->description}}" class="description form-control" tabindex="17" readonly></td>
                                <td class="main_td"><input name="rows2[{{$count2}}][net_weight]" value="{{$child->net_weight}}" class="description form-control" tabindex="18" readonly></td>
                                <td class="main_td"><input name="rows2[{{$count2}}][gross_weight]" value="{{$child->gross_weight}}" class="description form-control" tabindex="19" readonly></td>
                                <td class="main_td"><input name="rows2[{{$count2}}][remark]" value="{{$child->remark}}" class="description form-control" tabindex="20" readonly>
                                    <input type="hidden" name="rows2[{{$count2}}][myflag]" value="1">
                                    <input type="hidden" name="rows2[{{$count2}}][child_id]" value="{{$child->id}}">
                                </td>


                            </tr>
                            <?php $count2+=1 ?>
                            <?php $i2+=1 ?>
                        @endforeach
                    </table>
                </div>
                {{--Second Append End--}}


                <br>
                <div class="row">

                    <div class="col-md-12">
                        <table class="table table-bordered">
                            <tr style="background-color: #EEEEEE!important;">
                                <td style="width: 20%;padding-top: 15px!important;font-size:13px;font-weight: 600!important;">Consignment Value</td>
                                <td><input type="number" name="cn_value" value="{{$bata->cn_value}}" id="cn_value" class="form-control"readonly> </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br>

                <div class="row">

                    <div class="col-md-1"><a  class="btn btn-success btn-sm" href="{{url('consignment')}}">Back</a>
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

        //--------------------------------------- create new customer------------


        // ----------------------------- datepicker --------------------------------------

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
        // if i will select city then it will give you the deails of district and state


        $('select[name="consignor_name"]').on('change', function() {

            var stateID = $(this).val();

            if(stateID) {

                $.ajax({

                    url: '{{ url('/') }}/AjaxGet_party_name/'+stateID,

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

        //        ----------------------------------------------- get party name by party code-------------------------------
        //            First Append Start
        $(document).ready(function() {

            var i=1;
            var count=<?php echo $count ?>;
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
                        '<td class="main_td"><input name="rows[' + id + '][invoice_no]" class="form-control"required></td>'+
                        '<td class="main_td"><input name="rows[' + id + '][invoice_date]" id=\"invoice_date' + id + '\"  class=" form-control" required> </td>'+
                        '<td class="main_td"><input name="rows[' + id + '][invoice_value]" class="invoice_value form-control" required></td>'+
                        '<td class="main_td"><input name="rows[' + id + '][way_bill_no]" class="way_bill_no form-control" required></td>'+
                        '<td class="main_td"><input name="rows[' + id + '][validity]" id=\"validity' + id + '\"  class=" form-control" required> </td>'+
                        '<td class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>')


                bind();
                $("#country"+id).select1({
                    source: country
                });

            });

//          Second Append End
            $(document).on('click', '.addrow2', function(){
                var count2=<?php echo $count2 ?>;
                $(this).text('x Del');
                $(this).attr('class','btn btn-info btn-sm del');
                $(".item-row2:last").find('.mybtn').hide();
                i++;

                count2++;
                var id=count2;

                $(".item-row2:last").after('<tr class="item-row2" style="border-bottom: solid 1px black">' +

                        '<td class="main_td">' +
                        ' <select name="rows2[' + id + '][category]" id=\"country' + id + '\" class="form-control">'+
                        '<option value="">select one category</option>'+
                        <?php $material_cat = \App\Materialcategory::all(); ?>
                         @foreach($material_cat as $mat)
                        '<option value="{{$mat->id}}">{{$mat->category}}</option>'+
                        @endforeach
                        '</select>' +
                        '</td>'+

                        '<td class="main_td"><input name="rows2[' + id + '][package]" class="package form-control"></td>'+
                        '<td class="main_td"><input name="rows2[' + id + '][description]" class="description form-control"></td>'+
                        '<td class="main_td"><input name="rows2[' + id + '][net_weight]" class="net_weight form-control"></td>'+
                        '<td class="main_td"><input name="rows2[' + id + '][gross_weight]" class="net_weight form-control"></td>'+
                        '<td class="main_td"><input name="rows2[' + id + '][remark]" class="net_weight form-control"></td>'+
                        '<td class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow2" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system2" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>')

                bind();
                $("#country"+id).select2({
                    source: country
                });

            });


//            Second append end

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

        var product_type =  [/* states array*/];
        $("#consignor_name").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#billed_at").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#from").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#to").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#truck_type").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#truck_no").select2({
            data: product_type
        });

        var product_type =  [/* states array*/];
        $("#category").select2({
            data: product_type
        });

    </script>



@endsection

