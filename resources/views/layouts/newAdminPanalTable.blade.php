<!doctype html>
<html class="fixed">
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

    <!-- Web Fonts  -->
       <!-- ******************************************************************************************** -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/jquery-datatables-bs3/assets/css/datatables.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/bootstrap/css/bootstrap.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/font-awesome/css/font-awesome.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/magnific-popup/magnific-popup.css')}}" />
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/bootstrap-datepicker/css/datepicker3.css')}}" />
    <!-- Theme CSS -->
    <link rel="stylesheet" href="{{asset('newadminDesign/vendor/select2/select2.css')}}" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="{{asset('newadminDesign/stylesheets/theme.css')}}" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="{{asset('newadminDesign/stylesheets/skins/default.css')}}" />

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="{{asset('newadminDesign/stylesheets/theme-custom.css')}}">
    <!-- Head Libs -->
    <script src="{{asset('newadminDesign/vendor/modernizr/modernizr.js')}}"></script>
    <script src="{{asset('adminDesign/js/jquery-2.1.4.min.js')}}"></script>


    <!-- ******************************************************************************************** -->
    @yield('custom_css')
    <style>
        .form-control{
            border: 1px solid #666;
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
                        <li>
                            <a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i> Lock Screen</a>
                        </li>
                        <li>
                            <a role="menuitem" tabindex="-1" href="{{url('logout')}}"><i class="fa fa-power-off"></i> Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
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
<script src="{{asset('adminDesign/js/jquery-2.1.4.min.js')}}"></script>
<!-- Vendor -->
<script src="{{asset('newadminDesign/vendor/jquery/jquery.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-browser-mobile/jquery.browser.mobile.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/bootstrap/js/bootstrap.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/bootstrap-maxlength/bootstrap-maxlength.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/nanoscroller/nanoscroller.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/magnific-popup/magnific-popup.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-placeholder/jquery.placeholder.js')}}"></script>

<script src="{{asset('newadminDesign/vendor/select2/select2.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-datatables/media/js/jquery.dataTables.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js')}}"></script>
<script src="{{asset('newadminDesign/vendor/jquery-datatables-bs3/assets/js/datatables.js')}}"></script>

<script src="{{asset('newadminDesign/javascripts/theme.js')}}"></script>

<!-- Theme Custom -->
<script src="{{asset('newadminDesign/javascripts/theme.custom.js')}}"></script>

<!-- Theme Initialization Files -->
<script src="{{asset('newadminDesign/javascripts/theme.init.js')}}"></script>


<!-- **************************************************************************************** -->
<script src="{{asset('newadminDesign/javascripts/tables/examples.datatables.default.js')}}"></script>
<script src="{{asset('newadminDesign/javascripts/tables/examples.datatables.row.with.details.js')}}"></script>
<script src="{{asset('newadminDesign/javascripts/tables/examples.datatables.tabletools.js')}}"></script>

<!-- Theme Custom -->

<!-- **************************************************************************************** -->
</body>
</html>