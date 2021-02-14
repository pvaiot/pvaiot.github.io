<!DOCTYPE HTML>
<html>
<head>
    <title>@yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    {{--<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>--}}
    <link href="{{asset('adminDesign/css/bootstrap.min.css')}}" rel='stylesheet' type='text/css' />

    <link rel="stylesheet" href="{{asset('adminDesign/css/morris.css')}}" type="text/css"/>
    <link href="{{asset('adminDesign/css/font-awesome.css')}}" rel="stylesheet">
    <script src="{{asset('adminDesign/js/jquery-2.1.4.min.js')}}"></script>
    {{--<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>--}}
    {{--<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>--}}
    <link rel="stylesheet" href="{{asset('adminDesign/css/icon-font.min.css')}}" type='text/css' />
    {{--<script src="{{ asset('js/jquery-1.12.4.js')}}"></script>--}}
    <script src="{{ asset('js/jquery.dataTables.min.js')}}"></script>
    <script src="{{ asset('css/bootstrap/js/dataTables.bootstrap.min.js')}}"></script>
    <link rel="stylesheet" href="{{ asset('css/bootstrap/css/dataTables.bootstrap.min.css')}}">
    <link href="{{asset('adminDesign/css/style.css')}}" rel='stylesheet' type='text/css' />
    <script type='text/javascript' src='{{ asset('salesAndPurchaseStyle/js/min.js')}}'></script>
    <script src="{{ asset('js/saleJquery.min.js')}}"></script>
    <link href="{{ asset('css/select2.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('css/select1.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('css/jquery-ui.css')}}" rel="stylesheet" />
    <script src="{{ asset('js/select2.min.js')}}"></script>
    <script src="{{ asset('js/select1.min.js')}}"></script>
    <script src="{{ asset('js/jquery-ui.js')}}"></script>
    <script src="{{ asset('js/comboBox.js')}}"></script>

    @yield('custom_css')
    <style>
        .well{
            background-color: #ffffff;
        }
        .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
            background-color:  #e1f8ff;
        }

    </style>
</head>
@yield('manual_style_code')

<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content"> <!-- left corner start here -->
        <div class="mother-grid-inner">
            <!--header start here-->
            <div class="header-main">
                <div class="logo-w3-agile">

                    <h4>
                        Shri Bhawani Transport Service
                    </h4>
                </div>
                <div class="profile_details w3l">
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <div class="profile_img">
                                    <span class="prfil-img"><img src="{{asset('adminDesign/images/usericon.png')}}" alt=""> </span>
                                    <div class="user-name" style="margin-left: 6px;margin-top: 14px">
                                        <p style="color: green;font-size: 12px;margin-top: 10px;margin-left: 1px;">{{ Auth::user()->name }}</p>
                                    </div>
                                    <i class="fa fa-angle-down" style="background-color: #22BEEF;font-size: 1.0em;padding: 5px;border-radius: 10px"></i>
                                    <i class="fa fa-angle-up"style="background-color: #22BEEF;font-size: 1.0em;padding: 5px;border-radius: 10px"></i>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                            <ul class="dropdown-menu drp-mnu">
                                <li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li>
                                <li> <a href="#"><i class="fa fa-user"></i> </a> </li>
                                <?php if( Auth::check()) {?>
                                <li> <a href="{{url('logout')}}"><i class="fa fa-sign-out"></i> Logout</a> </li>
                                <?php } ?>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="clearfix"> </div>
            </div>
            <br>

            {{---------------------------- content area ------------------------------------------------------}}

            @yield('content')


            {{---------------------------- content area ------------------------------------------------------}}

            <div class="sidebar-menu">
                <header class="logo1">
                    <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
                </header>
                <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                <div class="menu">

                    <ul id="menu" >
                        {{--<li><a href="{{url('home')}}"><i class="fa fa-tachometer"></i> <span>Dashboard</span><div class="clearfix"></div></a></li>--}}


                        <li id="menu-academico" ><a  href="{{url('home_page')}}"><i class="fa fa-file-text-o"></i>  <span>Master</span> <div class="clearfix"></div></a>

                        </li>
                        <li id="menu-academico" ><a href="{{url('transaction')}}"><i class="fa fa-gift"></i>  <span>Transaction</span> <div class="clearfix"></div></a>

                        </li>


                        {{--<li><a href="{{url('AdmissionsMainSectionLink')}}"><i class="fa fa-group (alias)" aria-hidden="true"></i><span>Admissions</span><div class="clearfix"></div></a></li>--}}
                        {{--<li><a href="{{url('AcademicsMainSectionLink')}}"><i class="fa fa-group (alias)" aria-hidden="true"></i><span>Academics</span><div class="clearfix"></div></a></li>--}}
                        {{--<li id="menu-academico" ><a href="{{url('DepartmentMainSectionLink')}}"><i class="fa fa-rupee (alias)"></i>  <span>Department</span><div class="clearfix"></div></a>--}}

                        {{--<li id="menu-academico" ><a href="{{url('FacilitiesMainSectionLink')}}"><i class="fa fa-rupee (alias)"></i>  <span>Facilities</span><div class="clearfix"></div></a>--}}
                        {{--<li id="menu-academico" ><a href="{{url('TenderMainSectionLink')}}"><i class="fa fa-rupee (alias)"></i>  <span>Tender</span><div class="clearfix"></div></a>--}}
                        {{--<li id="menu-academico" ><a href="{{url('GalleryMainSectionLink')}}"><i class="fa fa-rupee (alias)"></i>  <span>Gallery</span><div class="clearfix"></div></a>--}}
                        {{--<li id="menu-academico" ><a href="{{url('ContactUsMainSectionLink')}}"><i class="fa fa-file-text-o"></i>  <span>Contact Us</span><div class="clearfix"></div></a>--}}


                    </ul>

                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <script>
            var toggle = true;

            $(".sidebar-icon").click(function() {
                if (toggle)
                {
                    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
                    $("#menu span").css({"position":"absolute"});
                }
                else
                {
                    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
                    setTimeout(function() {
                        $("#menu span").css({"position":"relative"});
                    }, 400);
                }

                toggle = !toggle;
            });
        </script>
        <!--js -->
        @yield('custom_js')
        <script src="{{asset('adminDesign/js/jquery.nicescroll.js')}}"></script>
        <script src="{{asset('adminDesign/js/scripts.js')}}"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="{{asset('adminDesign/js/bootstrap.min.js')}}"></script>
        <!-- /Bootstrap Core JavaScript -->
        <!-- morris JavaScript -->
        <script src="{{asset('adminDesign/js/raphael-min.js')}}"></script>
        <script src="{{asset('adminDesign/js/morris.js')}}"></script>
        <script>
            $(document).ready(function() {
                //BOX BUTTON SHOW AND CLOSE
                jQuery('.small-graph-box').hover(function() {
                    jQuery(this).find('.box-button').fadeIn('fast');
                }, function() {
                    jQuery(this).find('.box-button').fadeOut('fast');
                });
                jQuery('.small-graph-box .box-close').click(function() {
                    jQuery(this).closest('.small-graph-box').fadeOut(200);
                    return false;
                });

                //CHARTS



            });
        </script>
</body>
</html>
