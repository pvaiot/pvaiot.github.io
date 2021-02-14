<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <title>{{$bill->bill_no}}</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
</head>
<style>
    @media print {
        /* landscape styles */
        @page {size: A4 landscape; }
        body{
            padding: 20px !important;
        }
        .hide_mailing_btn{
            display: none;!important;
        }
        #bill_content thead tr th,#bill_content tbody tr td{
        border: 1px solid black;
        padding: 2px;
    }
    #doc_content tr th{
        padding: 2px;
    }
    #doc_content tr th{
        border: 1px solid black;
        padding: 5px;
    }
    }
    #bill_content thead tr th,#bill_content tbody tr td{
        border: 1px solid black;
        padding: 2px;
    }
    #doc_content tr th{
        padding: 2px;
    }
    #doc_content tr th{
        border: 1px solid black;
        padding: 5px;
    }


</style>
<body>
<div class="container-fluid">
    {{--<div class="col-lg-12 col-md-12 col-sm-12 ">--}}
    {{--<img src="assets/img/logo.jpg" style="padding-bottom:20px;" />--}}
    {{--</div>--}}
    <div class="col-lg-12 col-md-12 col-sm-12 text-center"style="padding-bottom: -15px;">
        <img src="{{asset('/images/logo.jpg')}}" width="100" height="100" style="float: left;margin-top: 10px;"/>
        <p style="font-size: 35px;margin-bottom: -25px;">Shri Bhawani Transport Services</p><br>
        <p style="font-size: 14px;margin-bottom: -2px;">Address : Admin & Communication Office : Sarkarpara, Bankim Nagar</p>
        <p style="font-size: 14px;margin-bottom: -2px;">Sevoke Road, Siliguri, Dist : Jalpaiguri West Bengal - 734001</p>
        <p style="font-size: 13px;">+91-9832617171, +91-9475535150 www.sbts.co.in / e-mail - naveen@sbts.co.in</p>
        <p style="font-size: 13px;"><strong>Invoice</strong></p>
    </div>
<div class="row col-lg-12 col-md-12 col-xs-12">
    <div class="col-lg-6 col-md-6 col-sm-6" style="text-align: left;">
        <p style="font-size: 13px;margin-bottom: -2px;"><strong>To,</strong></p>
        <?php $partycode = \App\Party::where("party_code",$bill->party_code)->first(); ?>
        <p style="font-size: 12px;margin-bottom: -1px;"><strong>{{$bill->party_name}}</strong></p>
        <p style="font-size: 12px;margin-bottom: -1px;"><strong>{{$bill->party_address}}</strong></p>
        <p style="font-size: 12px;margin-bottom: -1px;"><strong>GSTIN : {{$bill->customer_gstin}}</strong></p>
        <?php $bill_child_data_cn_no=\App\Freightbill_child::where('freight_bill_id','=',$bill->id)->first();
        $consignment=\App\Consignment::find($bill_child_data_cn_no->consignment_id);
        ?>
        <p style="font-size: 12px;margin-bottom: -1px;">Freight bill raised towards the consignment carried from {{$consignment->from}} to {{$consignment->to}}.</p>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4" style="text-align: right;float: right;">
        <p style="font-size: 13px;margin-bottom: -1px;"><strong>Freight Bill No : {{$bill->bill_no}}</strong></p>
        <p style="font-size: 13px;margin-bottom: -1px;"><strong>Bill Date : {{date('d/m/Y',strtotime($bill->bill_date))}}</strong></p>
    </div>
</div>
    <div class="row col-lg-12 col-md-12 col-xs-12" >
        <div class="table-responsive" style="padding:10px;font-size: 10px;font-weight: normal;" >
            <table class="table table-bordered text-center" id="bill_content">
                <thead>
                <tr>
                    <th>Shipment Date</th>
                    <th>CN/LR Number</th>
                    <th>Truck No</th>
                    <th>Invoice No</th>
                    <th>Pkgs</th>
                    @if($bill->hide_weight !=1)
                    <th>Weight M.T.</th>
                    @endif
                    <th>Date of Arrival</th>
                    <th>Date of Delivery</th>
                    <th>Truck Type</th>
                    <th>Freight Amt(Rs.)</th>
                    <th>Detention</th>
                    <th>Loading Charge</th>
                    <th>Unloading Charge</th>
                    <th>Total Amount(Rs.)</th>
                    @if($bill->total_gst_amount!=0)
                    <th>Gst %</th>
                    <th>Total Gst Amount(Rs.)</th>
                    <th>Net Amount(Rs.)</th>
                    @endif
                </tr>
                </thead>
                <tbody >
                <?php $bill_child_data=\App\Freightbill_child::where('freight_bill_id','=',$bill->id)->get();
                $freight=0;
                $detention=0;
                $loading_charge=0;
                $unloading_charge=0;
                $total_freight=0;
                ?>
                @foreach($bill_child_data as $bill_child)
                    <?php $consignment_details=\App\Consignment::find($bill_child->consignment_id);?>
                    <?php $challan_child2_details=\App\Challan_Child2::where('consignment_id','=',$bill_child->consignment_id)->first();?>
                    <?php $acknowledgement_details=\App\Acknowledgement::where('challan_id','=',$challan_child2_details->challan_id)->first();?>
                    <tr class="dyanamic_data">
                        <td>{{date( 'd/m/Y', strtotime($bill_child->consignment_date))}}</td>
                        <td>{{$bill_child->consignment_no}}</td>
                        <td>{{$bill_child->consignment_vehicle_no}}</td>
                        <td>{{$bill_child->invoice_no}}</td>
                        <td>{{$bill_child->consignment_qty}}</td>
                        @if($bill->hide_weight !=1)
                        <td>{{$bill_child->weight}}</td>
                        @endif
                        <td>{{date('d/m/Y',strtotime($acknowledgement_details->reporting_date))}}</td>
                        <td>{{date('d/m/Y',strtotime($acknowledgement_details->unloading_date))}}</td>
                        <td>{{$consignment_details->truck_type}}</td>
                        <td>{{$bill_child->freight}}</td>
                        <td>{{$bill_child->detention}}</td>
                        <td>{{$bill_child->loading_charge}}</td>
                        <td>{{$bill_child->unloading_charge}}</td>
                        <td>{{$bill_child->total_freight}}</td>
                        @if($bill->total_gst_amount!=0)
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        @endif
                    </tr>
                    <?php $freight+=(float)$bill_child->freight;
                    $detention+=(float)$bill_child->detention;
                    $loading_charge+=(float)$bill_child->loading_charge;
                    $unloading_charge+=(float)$bill_child->unloading_charge;
                    $total_freight+=(float)$bill_child->total_freight;
                    ?>
                @endforeach
                <tr class="font-weight-bold">
                    @if($bill->hide_weight !=1)
                    <td colspan="8" class="text-left font-weight-bold">
                        @else
                        <td colspan="7" class="text-left font-weight-bold">
                            @endif
                        Net Amount in Words(Rs.):Rs. {{$bill->total_amount_in_words}}</td>
                    <td class="text-left">TOTAL</td>
                    <td>{{$freight}}</td>
                    <td>{{$detention}}</td>
                    <td>{{$loading_charge}}</td>
                    <td>{{$unloading_charge}}</td>
                    <td>{{$total_freight}}</td>
                    @if($bill->total_gst_amount!=0)
                        <td>{{((int)$bill->sgst_per)+((int)$bill->cgst_per)+((int)$bill->igst_per)}}%</td>
                        <td>{{$bill->total_gst_amount}}</td>
                        <td>{{$bill->net_amount}}</td>
                    @endif
                </tr>
                </tbody>
            </table>
        </div>
    </div>
        <div class="col-lg-12 col-md-12 col-sm-12" >
            <p style="font-size: 14px;margin-bottom: -25px;">Remark: Under Reserve Charge Mechanism, GST is payable by the Consigner.</p><br>
            <p style="font-size: 13px;margin-bottom: -25px;">Description of Goods Transport Service By Road<br>Service accounting Code : 996511</p><br>
        </div>

    <div class=" col-lg-12 col-md-12 col-xs-12" >
        <div class="col-lg-5 col-md-5 col-sm-5" style="text-align: left;float: left;" >
            <div class="table-responsive"  style="padding:10px;font-size: 10px;font-weight: normal;">
                <table class="table table-bordered text-center" id="doc_content">
                    <tr>
                        <th>Our Pan No</th>
                        <th>BMTPK7851H</th>
                    </tr>
                    <tr>
                        <th>Service Tax Registration No</th>
                        <th>BMTPK7851HSD001</th>
                    </tr>
                    <tr>
                        <th>GST IN</th>
                        <th>19BMTPK7851H1ZA</th>
                    </tr>
                    <tr>
                        <th>SAC Code</th>
                        <th>996511</th>
                    </tr>
                    <tr>
                        <th>State Code</th>
                        <th>19</th>
                    </tr>
                </table>
            </div>

        </div>


        <div class="col-lg-6 col-md-6 col-sm-6" style="text-align: center;float: right;">
            <div  style="margin-top: 10px;">
                <p style="font-size: 14px;"><strong>For, Shri Bhawani Transport Service</strong></p><br>
                <p style="font-size: 13px;margin-bottom: -25px;"><strong>Authorized Signatory</strong></p><br>
            </div>
        </div>
    </div>

</div>
<div class="row" style="margin-bottom: 10px;margin-top: 10px">
    <div class="col-xs-12" style="text-align: center">
        <a href="#" onclick="myFunction()" class="btn btn-success hide_mailing_btn"><span class="glyphicon glyphicon-print"></span> Print</a>
    </div>
</div>
<script>
    function myFunction() {
        window.print();
    }
</script>
</body>
</html>
