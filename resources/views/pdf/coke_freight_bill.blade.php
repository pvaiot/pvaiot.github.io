<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="">
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/bootstrap/css/bootstrap.css')}}" />

    <title>{{$bill->bill_no}}</title>
</head>
<style>
    @media print{
        body{
            padding: 20px !important;
        }
        .hide_mailing_btn{
            display: none;!important;
        }
    }
    #bill_table tr th{
        text-align: center;
    }
    body {
        margin: 0px;
        padding: 0px;

    }
    .container-fluid{
        border:1px solid black;
    }
    body{
        padding: 20px !important;
    }
    .first_row {

        height: 100px !important;

    }

    .text {
        position: absolute !important;

        left: 30px !important;

    }

    .text_one {
        margin-top: -11px !important;
    }
    .text2{
        position:absolute !important;
        right:30px;
        top:-10px;

    }
    table {
        border-collapse: collapse;
    }

    table, td, th {
        border: 1px solid black;
        padding:2px;
    }
    .last{

        height:150px;
    }
    .auth{
        top:20px;
    }
    .dyanamic_data td{
        font-size:10px !important;
        font-weight: bold;
    }
    .heading_data th{
        font-size:12px !important;
    }
</style>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 first_row" id="second_box">
            <div class="text1 text-center">
                <p>ANNEXURE</p>
                <p class="text_one" style="font-size: 25px;">
                    <b>SHRI BHAWANI TRANSPORT SERVICE</b>
                </p>
                <p class="text_one">
                    SARKARPARA,BAMKIMNAGAR, SEVOKE ROAD,SILIGURI
                </p>

                <p class="text_one">
                    Ph:+91-9775987006, Email: sbts.slg@gmail.com

                </p>

            </div>
        </div>
        <div class="row">
            <div class="col-xs-5 first_row" id="first_box">
                <div class="text"><strong>
                    <p>To,</p>
                    <p style="margin-top:-11px;">{{$bill->party_name}},</p>
                    <p style="margin-top:-11px;">{{$bill->party_address}}</p></strong>
                </div>
            </div>
            <div class="col-xs-2 first_row" id="second_box">
                <div class="text1 text-center">
                    <p class="text_one" style="position:absolute !important;right:0px !important;">
                        <b style="font-size:12px;">PAN NO.:BMTPK7851H</b>
                    </p>
                </div>
            </div>
            <div class="col-xs-5 first_row" id="third_box">
                <div class="text2">
                    <strong> <p>
                        Invoice No.&nbsp;&nbsp; : &nbsp;{{$bill->bill_no}}

                    </p>
                    <P class="text_one">Invoice Date :  &nbsp;{{date( 'd-m-Y', strtotime($bill->bill_date))}}</P></strong>
                </div>
            </div>



        </div>
    </div>
    <div class="row text-center">
        <table id="bill_table" style="width:100%;">
            <tr class="heading_data">
                <th>SL</th>
                <th>LR No.</th>
                <th>COKE LR No.</th>
                <th>Date</th>
                <th>Invoice No</th>
                <th>Destination</th>
                <th>Vehicle No</th>
                <th>Weight</th>
                <th>Qty/Pkg</th>
                <th>Freight</th>
                <th>Detention</th>
                <th>S.N.T</th>
                <th>Toll Tax</th>
                <th>Total</th>
            </tr>
            <?php $bill_child_data=\App\CokeFreightBill_child::where('freight_bill_id','=',$bill->id)->get();
            $sl_no=1;
            ?>
            @foreach($bill_child_data as $bill_child)
            <tr class="dyanamic_data">
                <td><b>{{$sl_no}}</b></td>
                <td>{{$bill_child->consignment_no}}</td>
                <td>{{$bill_child->cock_lr_no}}</td>
                <td>{{date( 'd/m/Y', strtotime($bill_child->consignment_date))}}</td>
                <td>{{$bill_child->invoice_no}}</td>
                <td>{{$bill_child->consignment_to}}</td>
                <td>{{$bill_child->consignment_vehicle_no}}</td>
                <td>{{$bill_child->weight}}</td>
                <td>{{$bill_child->consignment_qty}}</td>
                <td>{{$bill_child->freight}}</td>
                <td>{{$bill_child->detention}}</td>
                <td>{{$bill_child->snt_charge}}</td>
                <td>{{$bill_child->toll_tax}}</td>
                <td>{{$bill_child->total_freight}}</td>
            </tr>
                <?php $sl_no++; ?>
            @endforeach
            <tr>
                <td> <b>Rs.</b></td>
                <td colspan="11" class="text-left"> <b>{{$bill->total_amount_in_words}}</b> </td>
                <td> <b>TOTAL</b></td>
                <td><b>{{$bill->total_amount}}</b></td>
            </tr>
        </table>
    </div>
    <div class="row">
        <div class="col-xs-8 auth">
            <p>Remark: &nbsp;Under Reserve Charge Mechanism, GST is payble by the Consigner.</p>
        </div>
        <div class="col-xs-4 text-center auth">
            <table>
                <tr>
                    <th style="border:1px solid white !important;font-size:13px;">For Shri Bhawani Transport Service</th>

                </tr>
                <tr>
                    <th style="border:1px solid white !important;font-size:13px;">
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <td style="border:1px solid white !important;">
                        E.& O.E
                    </td>
                </tr>
                <tr>
                    <td style="border:1px solid white !important;">Authorized Signatory</td>
                </tr>
            </table>
            <p> </p>

        </div>
    </div>
    <div class="row col-xs-12">
        <p style="font-size:11px;">Kindly make payment cashed/cheque/demand draft in favour of Shri bhawani Transport Service. for delay in paymen intrest 24% P.A will be charged.</p>
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