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
    <title>{{$challan->challan_no}}</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
    <style>
        body {
            padding: 0px;
        }
        @page {
            margin-top: 0.3em;
            margin-left: 2em;
            margin-bottom:0.3em;
        }
        #content-table tr td{
            padding-left: 5px;
            padding-bottom: 5px;
            padding-right: 2px;
            padding-top: 5px;
            border: none;
        }
        #contains-table thead tr th{
            border: 1px solid black;
        }
        #content-table1 tr td{
            padding: 3px;border: none;
        }
        #content-table2 tr td{
            padding: 5px;
        }
        #dynamic_tbody tr td{
            padding: 10px;
        }
        #amount_table{
            text-align: right;
        }
        #heading-down-table tr td{
            padding: 3px;
            border: none;
        }
        #contains-table tbody tr td{
            padding: 2px;border: 1px solid black;
        }
        #amount_table tr td{
            border: 1px solid black;
        }
        .boxex{
            display: flex;
            flex-flow: row nowrap;
        }
    </style>
</head>
<body>
<div class="lorry-advance" style="width: 50%;margin-top: 5px;padding: 2px;margin-left: 53%;">
    {{--<div class="col-lg-12 col-md-12 col-sm-12 ">--}}
    {{--<img src="assets/img/logo.jpg" style="padding-bottom:20px;" />--}}
    {{--</div>--}}
    <div class="col-lg-12 col-md-12 col-sm-12 text-center"style="padding-bottom: -15px;">
        <img src="{{asset('/images/logo.jpg')}}" width="50" height="50" style="float: left;margin-top: 20px;margin-left: 10px;"/>
        <p style="font-size: 13px;width: fit-content;margin-top: 10px;text-decoration: underline;margin-bottom: -7px;">BALANCE</p>
        <p style="font-size: 25px;margin-bottom: -25px;">Shri Bhawani Transport Services</p><br>
        <p style="width: content-box;font-size: 13px;margin-bottom: -2px;">Sarkar Para, Bankimnagar, Sevoke Road, Siliguri - 734001</p>
        <p style="font-size: 13px;">+91-9832617171, +91-9475535150 www.sbts.co.in / e-mail - naveen@sbts.co.in</p>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12" style="font-size: 11px;margin-top: 1px;">
        <table class="table text-center" id="heading-down-table">
            <thead>
            <tr>
                <td>From : </td>
                <td>{{$challan->from}}</td>
                <td>To : </td>
                <td>{{$challan->to}}</td>
                <td>Challan No : </td>
                <td><strong>{{$challan->challan_no}}</strong></td>
            </tr>
            </thead>
            <tr>
                <td>Date : </td>
                <td>{{date('d/m/Y',strtotime($challan->date))}}</td>
                <td></td><td></td>
                <td>Truck No : </td>
                <td>{{$challan->truck_no}}</td>
            </tr>
        </table>
    </div>

    <div class="col-lg-12 col-md-12 col-sm-12" style="font-size: 12px;">
        <div class="table-responsive">
            <table class="table" id="contains-table" style="text-align: center;">
                <thead>
                <tr>
                    <th style="width: 10%;padding: 2px">S. No.</th>
                    <th style="width: 20%;padding: 2px">C.N.No.</th>
                    <th style="width: 15%;padding: 2px">Date</th>
                    <th style="width: 5%;padding: 2px">Pkgs.</th>
                    <th style="width: 25%;padding: 2px">CONTENTS</th>
                    <th style="width: 10%;padding: 2px">Weight M.T.</th>
                    <th style="width: 20%;padding: 2px">Destination</th>
                </tr>
                </thead>
                <tbody id="dynamic_tbody">
                <?php $total_weight=0;
                $i=1;
                ?>
                <?php $con_child = \App\CokeChallan_child2::where('challan_id',$challan->id)->get(); ?>
                @foreach($con_child as $challan_childs)
                    <?php $con_length2 = \App\CockConsignment::find($challan_childs->consignment_id); ?>
                    <tr>
                        <td>{{$i}}</td>
                        <td><strong>{{$challan_childs->consignment_no}}</strong></td>
                        <td>{{date('d/m/Y',strtotime($con_length2->con_date))}}</td>
                        <td>{{$challan_childs->total_package}}</td>
                        <td>
                            <?php $con_length3 = \App\CockConsignment_child2::where('consignment_id',$challan_childs->consignment_id)->get(); ?>
                            @foreach($con_length3 as $con_length3)
                                {{$con_length3->category}}
                            @endforeach
                        </td>
                        <?php $total_weight +=$challan_childs->total_gross_weight; ?>
                        <td>{{$challan_childs->total_gross_weight}}</td>
                        <td>{{$con_length2->to}}</td>
                    </tr>
                    <?php $i+=1; ?>
                @endforeach
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><strong>Total Weight</strong></td>
                    <td><strong>{{$total_weight}}</strong></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="boxex" style="">

        <div  style="border: 1px solid black;padding-top: 2px;font-size: 10px;width: 54%;float: left;height: 410px !important;">
            <table class="table" id="content-table">
                <tr>
                    <td style="width: 40%;">Engine No : </td>
                    <td>{{$challan->engine_no}}</td>
                </tr>

                <tr>
                    <td style="width: 40%">Chassis No : </td>
                    <td>{{$challan->chassis_no}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Make : </td>
                    <td>{{$challan->make}}</td>
                </tr>

                <tr>
                    <td style="width: 40%">Owner's Name : </td>
                    <td>{{$challan->owners_name}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Owner's Address : </td>
                    <td>{{$challan->owners_address}}</td>
                </tr>

                <tr>
                    <td style="width: 40%">Owner's Contact No : </td>
                    <td>{{$challan->owners_phone}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Insurance Name : </td>
                    <td>{{$challan->insurance_name}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Policy No : </td>
                    <td>{{$challan->policy_no}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Place of Issue : </td>
                    <td>{{$challan->insurance_place_issue}}</td>
                </tr>

                <tr>
                    <td style="width: 40%">Driver's Name : </td>
                    <td>{{$challan->drivers_name}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Driver's Address : </td>
                    <td>{{$challan->drivers_address}}</td>
                </tr>

                <tr>
                    <td style="width: 40%">Licence No : </td>
                    <td>{{$challan->license_no}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Place of Issue : </td>
                    <td>{{$challan->place_of_issue}}</td>
                </tr>
                <tr>
                    <td style="width: 50%">Agent Broker Name : </td>
                    <td>{{$challan->broker_name}}</td>
                </tr>

                <tr>
                    <td style="width: 40%">Broker Mobile No : </td>
                    <td>{{$challan->broker_phone}}</td>
                </tr>
                <tr>
                    <td style="width: 40%">Driver's Signature : </td>
                    <td>...................</td>
                </tr>
            </table>
        </div>

        <div  style="font-size: 10px;margin-left: 55%;width: 44%;float: right;border: 1px solid black;height: 412px !important;">
            <div style="padding-left: 5px;padding-right: 5px;padding-top: 2px;height: 265px !important;">
                <br>
                <p>Balance Lorry Hire Rupees :  {{$challan->in_word}}</p>

                <table class="table" id="content-table1">
                    <tr>
                        <td style="width: 40%">Payable at : </td>
                        <td>{{$challan->balance_payable_at}}</td>
                    </tr>
                    <table class="table"  style="width: 90%;">
                        <tr style="width: 30%;float: left;">
                            <td style="width: 30%">Weight</td>
                            <td>{{$total_weight}} tons</td>
                        </tr>
                    </table>
                    <table class="table" id="amount_table" style="width: 80%;">
                        <tr>
                            <td></td>
                            <td style="font-weight: bold;text-align: center;">Rs.</td>
                        </tr>
                        <tr>
                            <td style="width: 40%;font-weight: bold;text-align: center;">FREIGHT</td>
                            <td>{{sprintf('%0.2f',$challan->freight)}} </td>
                        </tr>
                        <tr>
                            <td style="width: 40%;font-weight: bold;text-align: center;">DIESEL</td>
                            <td>{{sprintf('%0.2f',$challan->diesel)}} </td>
                        </tr>
                        <tr>
                            <td style="width: 40%;font-weight: bold;text-align: center;">ADVANCE</td>
                            <td>{{sprintf('%0.2f',$challan->cash_advance)}} </td>
                        </tr>
                        <tr>
                            <td style="width: 40%;font-weight: bold;text-align: center;">BALANCE</td>
                            <td>{{sprintf('%0.2f',$challan->balance)}} </td>
                        </tr><br>
                    </table>
                </table>
            </div>
            <div style="border-top: 1px solid black;padding-left: 5px;padding-right: 5px;margin-top: 10px;padding-top: 1px;">
                <table class="table" id="content-table2">
                    <tr>
                        <td width="70%" style="border: none;"><strong>Pan No. :</strong></td>
                        <td style="border: none;">{{$challan->pan_no}}</td>
                    </tr>
                    <tr>
                        <td width="70%" style="border: none;"><strong>Driver's mobile :</strong></td>
                        <td style="border: none;">{{$challan->drivers_contact_no}}</td>
                    </tr>
                </table>
                <p style="font-weight: bold;font-size: 12px;"><i>For Shri Bhawani Transport Services</i></p>
                <p style="float: right;font-size: 12px;margin-top: 10px;"><strong><i>Despatching Officer</i></strong></p>
                <br>
            </div>
        </div>

    </div>
</div>


</body>
</html>
