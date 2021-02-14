<!DOCTYPE HTML>
<!--
	Aesthetic by gettemplates.co
	Twitter: http://twitter.com/gettemplateco
	URL: http://gettemplates.co
-->
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bhawani Transport</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Website Template by GetTemplates.co" />
    <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="GetTemplates.co" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="{{asset('trave/css/animate.css')}}">

    <link rel="stylesheet" href="{{asset('trave/css/font-awesome.css')}}">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="{{asset('trave/css/icomoon.css')}}">
    <!-- Themify Icons-->
    <link rel="stylesheet" href="{{asset('trave/css/themify-icons.css')}}">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="{{asset('trave/css/bootstrap.css')}}">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="{{asset('trave/css/magnific-popup.css')}}">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="{{asset('trave/css/bootstrap-datepicker.min.css')}}">
    <link rel="stylesheet" href="{{asset('trave/css/owl.theme.default.min.css')}}">

    <!-- Theme style  -->
    <link rel="stylesheet" href="{{asset('trave/css/style.css')}}">

    <!-- Modernizr JS -->
    <script src="{{asset('trave/js/modernizr-2.6.2.min.js')}}"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="{{asset('trave/js/respond.min.js')}}"></script>
    <![endif]-->

    <script src="{{asset('adminDesign/js/jquery-2.1.4.min.js')}}"></script>
    <script src="{{ asset('js/jquery.dataTables.min.js')}}"></script>
    <script src="{{ asset('css/bootstrap/js/dataTables.bootstrap.min.js')}}"></script>
    <link rel="stylesheet" href="{{ asset('css/bootstrap/css/dataTables.bootstrap.min.css')}}">

    {{--<script type='text/javascript' src='{{ asset('salesAndPurchaseStyle/js/min.js')}}'></script>--}}
    {{--<script src="{{ asset('js/saleJquery.min.js')}}"></script>--}}
    <link href="{{ asset('css/select2.min.css')}}" rel="stylesheet" />
    {{--<link href="{{ asset('css/select1.min.css')}}" rel="stylesheet" />--}}
    <link href="{{ asset('css/jquery-ui.css')}}" rel="stylesheet" />
    <script src="{{ asset('js/select2.min.js')}}"></script>
    {{--<script src="{{ asset('js/select1.min.js')}}"></script>--}}
    <script src="{{ asset('js/jquery-ui.js')}}"></script>
    <script src="{{ asset('js/comboBox.js')}}"></script>

    @yield('custom_css')
    <style>

        /*.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {*/
        /*background-color:  #e1f8ff;*/
        /*}*/
        body{
            background-color: #ffffff!important;
        }


        .msg {
            background: #fefefe;
            color: #666666;
            font-weight: bold;
            font-size: small;
            padding: 12px;
            padding-left: 16px;
            border-top: solid 3px #CCCCCC;
            border-radius: 5px;
            margin-bottom: 10px;
            -webkit-box-shadow: 0 10px 10px -5px rgba(0,0,0,.08);
            -moz-box-shadow: 0 10px 10px -5px rgba(0,0,0,.08);
            box-shadow: 0 10px 10px -5px rgba(0,0,0,.08);
        }
        .msg-clear {
            border-color: #fefefe;
            -webkit-box-shadow: 0 7px 10px -5px rgba(0,0,0,.15);
            -moz-box-shadow: 0 7px 10px -5px rgba(0,0,0,.15);
            box-shadow: 0 7px 10px -5px rgba(0,0,0,.15);
        }


        .msg-success {
            border-color: #cef2b8;
        }

        .msg-success-text {
            color: #80d651;
        }.dropdown-content {
             display: none;
             position: absolute;
                     background-color: #fff;margin-left: -100px;padding: 2px;
             min-width: 175px;
             box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
             z-index: 1;
         }



    </style>
    @yield('manual_style_code')
</head>

<body>

<div class="gtco-loader"></div>

<div id="page">


    <!-- <div class="page-inner"> -->
    <nav class="gtco-nav" role="navigation">
        <div class="gtco-container-fluid" style="padding-left: 10px;padding-right: 100px;">

            <div class="row" >
                <div class="col-sm-4 col-xs-12">
                    <div id="gtco-logo"><a href="{{url('home')}}">Shri Bhawani Transport Service</a></div>
                </div>
                <div class="col-xs-8 text-right menu-1">
                    <ul>
                        <li class="has-dropdown">
                            <a href="#">Master</a>
                            <ul class="dropdown">
                                <li><a href="{{url('new_location_entry')}}">Location</a></li>
                                <li><a href="{{url('new_petrol_pump_entry')}}">Petrol Pump</a></li>
                                <li><a href="{{url('new_branch_entry')}}">Branch</a></li>
                                <li><a href="{{url('new_party_entry')}}">Party</a></li>
                                <li><a href="{{url('new_broker_entry')}}">Broker</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc "></li>
                                <li><a href="{{url('new_materialcategory_entry')}}">Material Category</a></li>
                                <li><a href="{{url('new_lorry_entry')}}">Lorry</a></li>
                                <li><a href="{{url('new_trucktype_entry')}}">Truck Type</a></li>
                                <li><a href="{{url('new_bank_account_entry')}}">Bank A/C</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>
                                <li><a href="{{url('new_bank_name_entry')}}">Bank Name</a></li>
                                <li><a href="{{url('new_insurance_entry')}}">Insurance</a></li>
                                <li><a href="{{url('new_driver_entry')}}">Driver</a></li>

                            </ul>
                        </li>

                            <li class="has-dropdown">
                            <a href="#">Master Alter</a>
                            <ul class="dropdown">
                                <li><a href="{{url('location')}}">Location</a></li>
                                <li><a href="{{url('petrol_pump')}}">Petrol Pump</a></li>
                                <li><a href="{{url('branch')}}">Branch</a></li>
                                <li><a href="{{url('party')}}">Party</a></li>
                                <li><a href="{{url('broker')}}">Broker</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc "></li>
                                <li><a href="{{url('materialcategory')}}">Material Category</a></li>
                                <li><a href="{{url('lorry')}}">Lorry</a></li>
                                <li><a href="{{url('trucktype')}}">Truck Type</a></li>
                                <li><a href="{{url('bank_account')}}">Bank A/C</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>
                                <li><a href="{{url('bank_name')}}">Bank Name</a></li>
                                <li><a href="{{url('insurance')}}">Insurance</a></li>
                                <li><a href="{{url('driver')}}">Driver</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="#">Indent</a>
                            <ul class="dropdown" style="width: 200px;">

                                <li><a href="{{url('new_indent_entry')}}">Indent Entry</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>
                                <li href="#" style="width: 150px;">Indent Alter
                                    <ul class="" id="bill_menu" style="margin-left: 10px;">
                                        <li><a href="{{url('indent')}}">Indent</a></li>
                                        <li><a href="{{url('indentplacement')}}">Indent Placement</a></li>
                                        <li><a href="{{url('indentplacement_lorry')}}">Indent Placement Lorry</a></li>
                                    </ul>
                                </li>

                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="#">Coke</a>
                            <ul class="dropdown" style="width: 200px;">

                                <li><a href="{{url('new_coke_consignment_entry')}}">Coke Consignment Entry</a></li>
                                <li><a href="{{url('CokeChallan_entry')}}">Coke Challan Entry</a></li>
                                <li><a href="{{url('new_coke_acknowledgement_entry')}}">Coke Acknowlegement Entry</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>
                                <li href="#" style="width: 150px;">Coke Consignment Alter
                                    <ul class="" id="bill_menu" style="margin-left: 10px;">
                                        <li><a href="{{url('cokeconsignment')}}">Coke Consignment</a></li>
                                        <li><a href="{{url('cokechallan')}}">Coke Challan</a></li>
                                        <li><a href="{{url('cokeacknowledgement')}}">Coke Acknowledgement</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="#">Transaction</a>
                            <ul class="dropdown" style="width: 200px;">
                                <li><a href="{{url('new_consignment_entry')}}">Consignment</a></li>
                                <li><a href="{{url('Challan_entry')}}">Challan</a></li>
                                <li><a href="{{url('new_acknowledgement_entry')}}">Acknowledgement</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>

                                <li href="#" style="width: 150px;">Bill
                                    <ul class="" id="bill_menu" style="margin-left: 10px;">
                                        <li><a href="{{url('invoice')}}">Freight</a></li>
                                        <li><a href="#">Freight-Differential</a></li>
                                    </ul>
                                </li>
                                <li><a href="{{url('advance_voucher')}}">Advance Voucher</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>
                                <li><a href="{{url('new_balance_process')}}">Lorry Hire Processing</a></li>
                            </ul>
                        </li>

                        <li class="has-dropdown">
                            <a href="#">Transaction Alter</a>
                            <ul class="dropdown">
                                <li><a href="{{url('consignment')}}">Consignment</a></li>
                                <li><a href="{{url('challan')}}">Challan</a></li>
                                <li><a href="{{url('acknowledgement')}}">Acknowledgement</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>

                                <li href="#" style="width: 150px;">Bill
                                    <ul class="" id="bill_menu" style="margin-left: 10px;">
                                        <li><a href="{{url('invoicealter')}}">Freight</a></li>
                                        <li><a href="#">Freight-Differential</a></li>
                                    </ul>
                                </li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>


                            </ul>
                        </li>

                            


                        <li class="has-dropdown">
                            <a href="#"><img src="{{asset('trave/images/user.png')}}" alt="">&nbsp;{{ Auth::user()->name }}</a>
                            <ul class="dropdown">
                                <li><a href="#">Settings</a></li>
                                <li class="divider" style="border-top: dashed 1px #cccccc"></li>
                                <li><a href="{{url('logout')}}">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>
    <!--	---------------------------------------- main Content Area Starts here------------------------------------------------------ -->

    <br>
    <br>

    @yield('content')








            <!--	---------------------------------------- main Content Area Ends Here------------------------------------------------------ -->


    {{--<footer id="gtco-footer" role="contentinfo">--}}
        {{--<section class="index-social" style="background-color:#7e394c">--}}
            {{--<div class="container">--}}
                {{--<div class="row index-social-link text-center">--}}
                    {{--<br>--}}
                    {{--<p class="copy-c" style="color: #ffffff;font-weight: 500;font-size: 13px">&copy; 2018. All Rights Reserved | Design & Developed By Mus Technologies</p>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</section>--}}
    {{--</footer>--}}
    <!-- </div> -->

</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>

<!-- jQuery -->
{{--<script src="trave/js/jquery.min.js"></script>--}}
<!-- jQuery Easing -->
<script src="{{asset('trave/js/jquery.easing.1.3.js')}}"></script>
<!-- Bootstrap -->
<script src="{{asset('trave/js/bootstrap.min.js')}}"></script>
<!-- Waypoints -->
<script src=" {{asset('trave/js/jquery.waypoints.min.js')}}"></script>
<!-- Carousel -->
<script src=" {{asset('trave/js/owl.carousel.min.js')}}"></script>
<!-- countTo -->
<script src=" {{asset('trave/js/jquery.countTo.js')}}"></script>

<!-- Stellar Parallax -->
<script src=" {{asset('trave/js/jquery.stellar.min.js')}}"></script>

<!-- Magnific Popup -->
<script src=" {{asset('trave/js/jquery.magnific-popup.min.js')}}"></script>
<script src="{{asset('trave/js/magnific-popup-options.js')}}"></script>

<!-- Datepicker -->
<script src=" {{asset('trave/js/bootstrap-datepicker.min.js')}}"></script>

<!-- Main -->
<script src=" {{asset('trave/js/main.js')}}"></script>
<script src=" {{asset('trave/js/jquery.maskedinput.js')}}"></script>
<script src=" {{asset('trave/js/jquery.maskedinput.min.js')}}"></script>
<script src=" {{asset('trave/js/globalize.js')}}"></script>

{{--<script src=" {{asset('trave/js/jquery-3.2.1.min.js')}}"></script>--}}
<script src=" {{asset('trave/js/jquery-ui.min.js')}}"></script>

<script src=" {{asset('trave/css/jquery-ui.min.css')}}"></script>
<script src=" {{asset('trave/css/bootstrap.min.css')}}"></script>

{{--<script src=" {{asset('trave/js/autocomplete-0.3.0.min.js')}}"></script>--}}

{{--<script src=" {{asset('trave/js/jquery-1.7.2.min.js')}}"></script>--}}
{{--<script src=" {{asset('trave/js/jquery.maskedinput-ben.js')}}"></script>--}}
{{--<script src=" {{asset('trave/js/jquery.inputmask.js')}}"></script>--}}
</body>
</html>

