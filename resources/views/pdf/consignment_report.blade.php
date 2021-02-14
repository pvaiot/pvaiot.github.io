<!DOCTYPE html>
<html lang="en">
<head>
    <title>{{$consignment->consignment_no}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{{asset('trave/css/bootstrap.css')}}">

    <style>
        .head{
            border:1px solid black;
            margin-top:5px;
        }
        .fl_no{
            border:1px solid black;
            margin-top:25px;
        }
        .backcont{

        }
        #p1{
            margin-top:-10px;
        }
        #p2{
            margin-top:-10px;
        }
        #p3{
            margin-top:-10px;
        }
        .vehicle{
            list-style-type:none;

            margin-top:20px;

        }
        .li1{
            list-style-type:none;
            float:left;
        }
        .lii{
            list-style-type:none;
        }
        #package_info tr th{
            border: 1px solid black;
        }
        #package_info tr td{
            border: 1px solid black;
            padding-top: 2px;
            padding-bottom: 2px;
            font-size: 12px;
        }
        .body_box{
            border:1px solid black;
        }
        table tr th{
            font-size: 12px;
            padding: 5px !important;
        }

        /*#header_data p{*/
            /*border: 1px solid red;*/
        /*}*/
    </style>
</head>
<body>

<div class="body" style="padding-bottom: -20px;margin-top: -20px;">
    <div class="row head">
        <div class="col-md-2 text-center">
            <img src="{{asset('/images/logo.jpg')}}" width="100" height="100" style="float: left;margin-top: 20px;"/>
        </div>
        <div class="col-md-7 text-center" id="header_data">
            <p style="margin-top:-10px;text-decoration:underline;margin-bottom:-20px;margin-top:5px;">Subject to Jalpaiguri Jurisdiction</p>
            <h1 style="font-size: 48px">Shri Bhawani Transport Service</h1>
            <p style="margin-top:-10px;font-size: 12px;">Address:Admin & Communication Office: Sarkarpara, Bankim Nagar,Sevoke Road, Siliguri,</p>
            <p style="margin-top:-10px;font-size: 12px;" >Dist: Jallpaiguri West Bengal 734001,Phone: 0353-2544271/+919775987006 Email:sbts.slg@gmail.com</p><br>

            <p style="margin-top:-25px;padding-left: 90px;font-weight: bold">CONSIGNMENT NOTE</p>
            </div>
        <div>
            <p style="margin-top:-75px;float: right;font-size: 10px;font-weight: bold">GST No. :19BMTPK7851H1ZA </p>
            <p style="margin-top:-60px;float: right;font-size: 10px;font-weight: bold">PAN No. :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BMTPK7851H </p>
            <p style="margin-top:-45px;float: right;font-size: 10px;font-weight: bold">FSSAI No. :&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;12818009000216 </p>
        </div>

    </div>


<div class="row body_box">
    <div class=" backcont" style="margin-top:20px;">
        <div class="col-md-6" style="width: 50%;float: right;">
            <div class="col-md-6" style="width: 50%;">
                <table class="table table-borderless" >
                    <tr>
                        <th style="font-weight: bold;border:none;width: 40%;"  >Vehicle No:</th>
                        <th style="font-weight: bold;border:none;">{{$consignment->truck_no}}</th>
                    </tr>
                    <tr>
                        <th style="font-weight: bold;border:none;width: 40%;">To</th>
                        <th style="font-weight: bold;border:none;">{{$consignment->to}}</th>

                    </tr>
                </table>
            </div>
            <div class="col-md-6" style="width: 50%;float: right;margin-top: -100px;">
                <table class="table table-borderless" >
                    <tr>
                        <th style="font-weight: bold;border:none;"; >CN No :</th>
                        <th style="font-weight: bold;border:none;" >{{$consignment->consignment_no}}</th>

                    </tr>
                    <tr>
                        <th style="font-weight: bold;border:none;">CN Date :</th>
                        <th style="font-weight:bold;border:none;" >{{date('d/m/Y',strtotime($consignment->con_date))}}</th>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-md-7">
            <table class="table table-borderless" style="padding-top: 20px;">
                <tr>
                    <th style="font-weight: bold;border:none;width:15%;" >From :</th>
                    <th style="font-weight: bold;border:none;">{{$consignment->from}}</th>
                </tr>
                <tr>
                    <th style="font-weight: normal;border:none;width:15%;">Consigner:</th>
                    <th style="border:none;">
                        <p style="font-weight: normal;border:none;">{{$consignment->consignor_name}}</p>
                        <p style="margin-top: -5px;font-weight: normal;border:none;">{{$consignment->consignor_address}}</p>
                    </th>
                </tr>
            </table>
        </div>
        <div class="row" style="margin-top: -25px;padding-left: 15px;margin-bottom: 25px;">
            <div class="col-md-6" style="width: 60%;">
                <table class="table table-borderless">
                    <tr>
                        <th style="font-weight: normal;border:none;width:23.5%;">Consignee:</th>
                        <th style="font-weight: normal;border:none;">
                            <p style="font-weight: normal;border:none;">{{$consignment->consignee_name}}</p>
                            <p style="margin-top: -5px;font-weight: normal;border:none;">{{$consignment->consignee_address}}</p>
                    </tr>

                </table>
            </div>
            <div class="col-md-4" style="border: 1px solid black;margin-top: -100px;margin-right: 20px;width: 20%;float: right;">
                <p style="font-size: 10px;">We here by declare that GTA has not availed input tax Credit of CGST/SGST/IGST/UTGST.</p>
            </div>
        </div>
        <div class="row" style="margin-top: 5px;">
        <table class="table table-borderless" id="package_info" style="width:60%;margin:auto;border:1px solid black;margin-bottom: 10px;">
            <tr >
                <td style="font-weight:normal;" ><b>Pakages</b></td>
                <td style="font-weight: normal;"><b>Product Details</b></td>
                <td style="font-weight: normal;"><b>Actual Weight</b></td>
            </tr>
            <tr>
                <?php $datas = DB::table("consignment_child2")->where("consignment_id",$consignment->id)->get();
                $count_data = DB::table("consignment_child2")->where("consignment_id",$consignment->id)->count();
                    $net_package=0;
                    $net_weight=0;
                    foreach($datas as $data1){
                        $net_package+=$data1->package;
                        $net_weight+=$data1->gross_weight;
                    }
                ?>
                <?php $j=$count_data; ?>
                <td>{{$net_package}} </td>

                <td >@foreach($datas as $data){{$data->category}} <?php if($count_data>1){echo ",";} ?> @endforeach</td>
                <td >{{$net_weight}}&nbsp; MT</td>
            </tr>
        </table>
        </div>
        <div class="col-md-12">
        <div class="col-md-6" style="width: 50%;float: left;">
            <table class="table table-borderless" >
                <?php $child1 = DB::table("consignment_child")->where("consignment_id",$consignment->id)->get();
                $count_child1 = DB::table("consignment_child")->where("consignment_id",$consignment->id)->count();
                $invoice_value=0;
                foreach($child1 as $child1){
                    $invoice_value+=$child1->invoice_value;
                }
                ?>
                <tr>
                    <th style="font-weight: normal;border:none;width: 30%;">Remarks :</th>
                    <th style="font-weight: normal;border:none;">@foreach($datas as $data){{$data->remark}} <?php if($count_data>1){echo ",";} ?> @endforeach</th>

                <tr>
                        <?php $consignment_childs = DB::table("consignment_child")->where("consignment_id",$consignment->id)->get();
                        $count_consignment_child= DB::table("consignment_child")->where("consignment_id",$consignment->id)->count(); ?>
                    <th style="font-weight: normal;border:none;" >Invoice No. :</th>
                    <th style="font-weight:normal;border:none;"> @foreach($consignment_childs as $consignment_child){{ $consignment_child->invoice_no}} <?php if($count_consignment_child>1){echo "/";} ?>@endforeach</th>
                </tr>
                    <tr>
                        <th style="font-weight: normal;border:none;">Invoice Value :</th>
                        <th style="font-weight: normal;border:none;">@if($invoice_value!=""){{$invoice_value}}@else As per Invoice @endif</th>
                    </tr>
                <tr>
                    <?php $consignment_child_date = DB::table("consignment_child")->where("consignment_id",$consignment->id)->first(); ?>
                    <th style="font-weight: normal;border:none;">Invoice Date :</th>
                    <th style="font-weight: normal;border:none;">{{date('d/m/Y',strtotime($consignment_child_date->invoice_date))}}</th>
                </tr>
                <tr>
                    <th style="font-weight: normal;border:none;">Vehicle Type :</th>
                    <th style="font-weight: normal;border:none;">{{$consignment->truck_type}}</th>
                </tr>
            </table>
        </div>
        <div class="col-md-6" style="width:30%;float: right;">
            <table class="table table-borderless">
                <tr>
                    <th style="font-weight: normal;border:none;">E-Way Bill :</th>
                    <th style="font-weight: normal;border:none;">@foreach($consignment_childs as $consignment_child){{ $consignment_child->way_bill_no}} <?php if($count_consignment_child>1){echo "/";} ?>@endforeach</th>

                </tr>
                <tr>
                    <th style="font-weight: normal;border:none;">Validity :</th>
                    <th style="font-weight: normal;border:none;">@if($consignment_child_date->validity!=""){{date('d/m/Y',strtotime($consignment_child_date->validity))}}@else {{$consignment_child_date->validity}}@endif</th>

                </tr>
                <tr>
                    <th style="font-weight: normal;border:none;">Bill At :</th>
                    <th style="font-weight: normal;border:none;">{{$consignment->billed_at}}</th>

                </tr>
                <tr>
                    <th style="font-weight: normal;border:none;">Others :</th>
                    <th style="font-weight: normal;border:none;"></th>

                </tr>
            </table>
        </div>
        </div>
        <div>
            <table class="table table-borderless text-center" style="margin-top:150px;">
                <tr >
                    <td style="font-weight:normal;border:none;font-size: 12px" ><b>Consignor Signature</b></td>
                    <td style="font-weight: normal;border:none;font-size: 12px"><b>Consignor/Consignee/Acknowledgement Copy</b></td>
                    <td style="font-weight: normal;border:none;font-size: 12px"><b>CN Generated BY</b></td>

                </tr>
                <tr>
                    <td style="font-weight:normal;border:none;font-size: 12px"></td>
                    <td style="font-weight:normal;border:none;font-size: 12px"></td>
                    <td style="font-weight:normal;border:none;font-size: 12px"></td>
                </tr>
                <tr>
                    <td style="font-weight:normal;border:none;font-size: 12px"></td>
                    <td style="font-weight:normal;border:none;font-size: 12px"></td>
                    <td style="font-weight:bold;border:none;font-size: 12px">{{$consignment->created_user}}</td>
                </tr>
            </table>

        </div>
        </div>
    </div>
</div>

<p style="font-size: 10px;">Note : &nbsp; This is computer generated print</p>
</body>

</html>
