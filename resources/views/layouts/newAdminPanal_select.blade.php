<!doctype html>
<html @if(Route::currentRouteName() == 'coke_bill')class="fixed sidebar-left-collapsed"
      @elseif(request()->is('edit_freight_coke_bill/*'))class="fixed sidebar-left-collapsed"
      @elseif(Route::currentRouteName() == 'invoice')class="fixed sidebar-left-collapsed"
      @elseif(Route::currentRouteName() == 'new_bill_register_entry')class="fixed sidebar-left-collapsed"
      @elseif(Route::currentRouteName() == 'view_bill_register_entry')class="fixed sidebar-left-collapsed"
      @elseif(Route::currentRouteName() == 'view_indentplacement')class="fixed sidebar-left-collapsed"
      @elseif(request()->is('edit_invoice/*'))class="fixed sidebar-left-collapsed"
      @else class="fixed"
        @endif>
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>SBTS - Admin</title>
    <meta name="keywords" content="prince sharma admin" />
    <meta name="description" content="prince sharma admin">
    <meta name="author" content="prince sharma admin">
    <link rel="icon" type="image/png" href="Login_assets/images/logo.jpg"/>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Icomoon Icon Fonts-->

    <!-- Magnific Popup -->
    <!-- Modernizr JS -->
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <![endif]-->

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/jquery-datatables-bs3/assets/css/datatables.css')}}" />
    <!-- Animate.css -->
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/bootstrap-multiselect/bootstrap-multiselect.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/morris/morris.css')}}" />
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/bootstrap/css/bootstrap.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/font-awesome/css/font-awesome.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/magnific-popup/magnific-popup.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/bootstrap-datepicker/css/datepicker3.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/stylesheets/theme.css')}}" />

    <link rel="stylesheet" href="{{asset('newadminDesign/stylesheets/skins/default.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/stylesheets/theme-custom.css')}}">

    <!-- Theme style  -->


    <!-- Modernizr JS -->
    <script src="{{asset('newadminDesign/vendor/modernizr/modernizr.js')}}"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <![endif]-->

    <script src="{{asset('adminDesign/js/jquery-2.1.4.min.js')}}"></script>

    {{--<script type='text/javascript' src='{{ asset('salesAndPurchaseStyle/js/min.js')}}'></script>--}}
    {{--<script src="{{ asset('js/saleJquery.min.js')}}"></script>--}}
    <link href="{{ asset('css/select2.min.css')}}" rel="stylesheet" />
    {{--<link href="{{ asset('css/select1.min.css')}}" rel="stylesheet" />--}}
    <script src="{{ asset('js/select2.min.js')}}"></script>
    {{--<script src="{{ asset('js/select1.min.js')}}"></script>--}}
    <script src="{{ asset('js/jquery-ui.js')}}"></script>

    <!-- ******************************************************************************************** -->



    <!-- ******************************************************************************************** -->
    @yield('custom_css')
    <style>
        .form-control{
            border: 1px solid #666;
        }
        .form-control:focus {
            border-color: #fff75a;
            background-color: #ffff00;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(0, 136, 204, 0.3);
        }
        .select2-selection:focus {
            border-color: #0086c9;
            background-color: #fff75a;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(0, 136, 204, 0.3);
        }
        label a:focus{
            color: red;
            text-decoration: underline ;
        }
    </style>
</head>
<body style="background-color: #f6f6f6;background-image: -webkit-linear-gradient(#f6f6f6 0%, white 45%);">
<section class="body">

    <!-- start: header -->
    <header class="header">
        <div class="logo-container">
            <a href="{{url('home_page')}}" class="logo">
                <img  src="{{asset('newadminDesign/images/logo.png')}}" height="35" alt="SBTS" />
            </a>
            <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
            </div>
        </div>

        <!-- start: search & user box -->
        <div class="header-right">

            <form action="pages-search-results.html" class="search nav-form">
                <div class="input-group input-search">
                    <input type="text" class="form-control" name="q" id="q" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
							</span>
                </div>
            </form>

            <span class="separator"></span>


            <div id="userbox" class="userbox">
                <a href="#" data-toggle="dropdown">
                    <figure class="profile-picture">
                        <img src="{{asset('newadminDesign/images/logged_in_user.png')}}" alt="{{ Auth::user()->name }}" class="img-circle" data-lock-picture="{{asset('newadminDesign/images/!logged-user.jpg')}}" />
                    </figure>
                    <div class="profile-info" data-lock-name="{{ Auth::user()->name }}" data-lock-email="{{ Auth::user()->email }}">
                        <span class="name">{{ Auth::user()->name }}</span>
                        <span class="role">&nbsp;{{ Auth::user()->role }}</span>
                    </div>

                    <i class="fa custom-caret"></i>
                </a>

                <div class="dropdown-menu">
                    <ul class="list-unstyled">
                        <li class="divider"></li>
                        @if(Auth::user()->role=='Admin'&&Route::currentRouteName() == 'home_page')
                        <li>
                            <a href="" data-toggle="modal" data-target="#myModal_serial"><i class="fa fa-plus"></i>  CN Serial No.</a>
                        </li>
                            <li>
                                <a href="{{url('users')}}"><i class="fa fa-group"></i>  Add Employee</a>
                            </li>
                            {{--<li>--}}
                                {{--<a href="{{url('')}}">--}}
                                    {{--<i class="fa fa-home" aria-hidden="true"></i>--}}
                                    {{--<span>Dashboard</span>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                        @endif
                        <li>
                            <a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i> Lock Screen</a>
                        </li>
                        <li>
                            <a role="menuitem" tabindex="-1" href="{{url('logout')}}"><i class="fa fa-power-off"></i> Logout</a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="modal fade" id="myModal_serial"  role="dialog" aria-labelledby="myModalLabel">
                <form id="testform">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">ADD Serial for Consignment No.</h4>
                            </div>
                            <div class="modal-body">
                                <?php  $datas = \App\Cn_serial_no::where('id','=','1')->first(); ?>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-6">
                                        <div class="form-group has-success has-feedback">Serial
                                            <input type="text" name="serial_no" id="serial_no" class="form-control" value="{{$datas->consignment_serial_no}}">
                                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer clearfix">
                                <div class="row">
                                    {{--<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 col-md-offset-3">--}}
                                    {{--<button type="reset" class="btn btn-success" data-dismiss="modal"><i class="fa fa-refresh"></i> Clear</button>--}}
                                    {{--</div>--}}
                                    <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"> Close</button>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                        <button type="submit" id="addserial"  class="btn btn-primary"> Save</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            $("#testform").submit(function(e){
                e.preventDefault();
            });


            $('#addserial').click(function() {
               $.ajax({

                    url: '{{url('')}}/Ajaxcnserialno',

                    type: "post",
                    dataType: "json",
                    data: {
                        '_token':$('input[name=_token]').val(),
                        'serial_no':$('input[name=serial_no]').val(),
                    },

                    success:function(data) {
//                $(data, function(key, value) {
                        var Vals    =  data;
                        alert(Vals.done);
//                });


                        $('#myModal_serial').modal('hide')
                    }

                });

            });
        </script>
        <!-- end: search & user box -->
    </header>
    <!-- end: header -->

    <div class="inner-wrapper">
        <!-- start: sidebar -->
        <aside id="sidebar-left" class="sidebar-left">

            <div class="sidebar-header">
                <div class="sidebar-title text-bold" style="color:#abb4be !important;">
                    Navigation
                </div>
                <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
                    <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
                </div>
            </div>

            @if(Auth::user()->role=='Admin')
                @include('layouts.adminlayout')
                @else
                @include('layouts.userlayout')
            @endif

        </aside>
        <!-- end: sidebar -->
        <section role="main" class="content-body">
            @yield('content')
        </section>


    </div>

    <aside id="sidebar-right" class="sidebar-right">
        <div class="nano">
            <div class="nano-content">
                <a href="#" class="mobile-close visible-xs">
                    Collapse <i class="fa fa-chevron-right"></i>
                </a>

                <div class="sidebar-right-wrapper">

                    <div class="sidebar-widget widget-calendar">
                        <h6>Calander</h6>
                        <div data-plugin-datepicker data-plugin-skin="dark" ></div>
                    </div>

                </div>
            </div>
        </div>
    </aside>
</section>

<script src="{{asset('newadminDesign/vendor/nanoscroller/nanoscroller.js')}}"></script>
<script src="{{asset('trave/js/jquery.easing.1.3.js')}}"></script>
<!-- Bootstrap -->
<script src="{{asset('newadminDesign/vendor/bootstrap-maxlength/bootstrap-maxlength.js')}}"></script>

<script src="{{asset('newadminDesign/vendor/bootstrap/js/bootstrap.js')}}"></script>
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

<script src=" {{asset('trave/js/jquery.maskedinput.js')}}"></script>
<script src=" {{asset('trave/js/jquery.maskedinput.min.js')}}"></script>
<script src=" {{asset('trave/js/globalize.js')}}"></script>

{{--<script src=" {{asset('trave/js/jquery-3.2.1.min.js')}}"></script>--}}
<script src=" {{asset('trave/js/jquery-ui.min.js')}}"></script>



<!-- **************************************************************************************** -->

<script src="{{asset('newadminDesign/vendor/jquery-maskedinput/jquery.maskedinput.js')}}"></script>

<!-- Theme Custom -->
<script src="{{asset('newadminDesign/javascripts/theme.custom.js')}}"></script>
<script src="{{asset('newadminDesign/javascripts/theme.custom.js')}}"></script>
<script src="{{asset('newadminDesign/javascripts/theme.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-browser-mobile/jquery.browser.mobile.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-datatables/media/js/jquery.dataTables.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-datatables-bs3/assets/js/datatables.js')}}"></script>

<script src="{{asset('newadminDesign/vendor/jquery-autosize/jquery.autosize.js')}}"></script>
<!-- **************************************************************************************** -->
</body>
</html>