{{--@extends('layouts.app')--}}

{{--@section('content')--}}

    {{--<link rel="shortcut icon" href="img/favicon.png">--}}
        {{--<!-- Bootstrap CSS -->--}}
{{--<link href="css/bootstrap.min.css" rel="stylesheet">--}}
{{--<!-- bootstrap theme -->--}}
{{--<link href="css/bootstrap-theme.css" rel="stylesheet">--}}
{{--<!--external css-->--}}
{{--<!-- font icon -->--}}
{{--<link href="css/elegant-icons-style.css" rel="stylesheet" />--}}
{{--<link href="css/font-awesome.css" rel="stylesheet" />--}}
{{--<!-- Custom styles -->--}}
{{--<link href="css/style.css" rel="stylesheet">--}}
{{--<link href="css/style-responsive.css" rel="stylesheet" />--}}



{{--<div class="container">--}}
    {{--<div class="row">--}}
        {{--<div class="col-md-8 col-md-offset-2">--}}
            {{--<div class="panel panel-default">--}}
                {{--<div class="panel-heading">Login</div>--}}
                {{--<div class="panel-body">--}}
                    {{--<form class="form-horizontal" role="form" method="POST" action="{{ url('/login') }}">--}}
                        {{--{{ csrf_field() }}--}}

                        {{--<div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">--}}
                            {{--<label for="email" class="col-md-4 control-label">E-Mail Address</label>--}}

                            {{--<div class="col-md-6">--}}
                                {{--<input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus>--}}

                                {{--@if ($errors->has('email'))--}}
                                    {{--<span class="help-block">--}}
                                        {{--<strong>{{ $errors->first('email') }}</strong>--}}
                                    {{--</span>--}}
                                {{--@endif--}}
                            {{--</div>--}}
                        {{--</div>--}}

                        {{--<div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">--}}
                            {{--<label for="password" class="col-md-4 control-label">Password</label>--}}

                            {{--<div class="col-md-6">--}}
                                {{--<input id="password" type="password" class="form-control" name="password" required>--}}

                                {{--@if ($errors->has('password'))--}}
                                    {{--<span class="help-block">--}}
                                        {{--<strong>{{ $errors->first('password') }}</strong>--}}
                                    {{--</span>--}}
                                {{--@endif--}}
                            {{--</div>--}}
                        {{--</div>--}}

                        {{--<div class="form-group">--}}
                            {{--<div class="col-md-6 col-md-offset-4">--}}
                                {{--<div class="checkbox">--}}
                                    {{--<label>--}}
                                        {{--<input type="checkbox" name="remember" {{ old('remember') ? 'checked' : ''}}> Remember Me--}}
                                    {{--</label>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                        {{--</div>--}}

                        {{--<div class="form-group">--}}
                            {{--<div class="col-md-8 col-md-offset-4">--}}
                                {{--<button type="submit" class="btn btn-primary">--}}
                                    {{--Login--}}
                                {{--</button>--}}

                                {{--<a class="btn btn-link" href="{{ url('/password/reset') }}">--}}
                                    {{--Forgot Your Password?--}}
                                {{--</a>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                    {{--</form>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
{{--@endsection--}}
{{--@extends('layouts.app')--}}

{{--@section('content')--}}
        {{--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">--}}

        {{--<!-- Vendor CSS -->--}}
        {{--<link rel="stylesheet" href="login-assets/vendor/bootstrap/css/bootstrap.css" />--}}
        {{--<link rel="stylesheet" href="login-assets/vendor/font-awesome/css/font-awesome.css" />--}}
        {{--<link rel="stylesheet" href="login-assets/vendor/magnific-popup/magnific-popup.css" />--}}
        {{--<link rel="stylesheet" href="login-assets/vendor/bootstrap-datepicker/css/datepicker3.css" />--}}

        {{--<!-- Theme CSS -->--}}
        {{--<link rel="stylesheet" href="login-assets/stylesheets/theme.css" />--}}

        {{--<!-- Skin CSS -->--}}
        {{--<link rel="stylesheet" href="login-assets/stylesheets/skins/default.css" />--}}

        {{--<!-- Theme Custom CSS -->--}}
        {{--<link rel="stylesheet" href="login-assets/stylesheets/theme-custom.css">--}}

        {{--<!-- Head Libs -->--}}
        {{--<script src="login-assets/vendor/modernizr/modernizr.js"></script>--}}

    {{--</head>--}}
    {{--<body>--}}
    {{--<!-- start: page -->--}}
    {{--<section class="body-sign">--}}
        {{--<div class="center-sign">--}}
            {{--<H2 class="logo pull-left" style="font-size: 24px;margin-top: 35px;">--}}
                {{--Shri Bhawani Transport Service--}}
            {{--</H2>--}}

            {{--<div class="panel panel-sign">--}}
                {{--<div class="panel-title-sign mt-xl text-right">--}}
                    {{--<h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i> Sign In</h2>--}}
                {{--</div>--}}
                {{--<div class="panel-body">--}}
                    {{--<form class="form-horizontal" role="form" method="POST" action="{{ url('/login') }}">--}}
                        {{--{{ csrf_field() }}--}}


                        {{--<div class="form-group mb-lg">--}}
                            {{--<div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">--}}
                            {{--<label>Username</label>--}}
                            {{--<div class="input-group input-group-icon">--}}
                                {{--<input id="email" type="email" class="form-control input-lg"  name="email" value="{{ old('email') }}" required autofocus>--}}
                                {{--<span class="input-group-addon">--}}
										{{--<span class="icon icon-lg">--}}
											{{--<i class="fa fa-user"></i>--}}
										{{--</span>--}}
									{{--</span>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                            {{--@if ($errors->has('email'))--}}
                                {{--<span class="help-block">--}}
                                {{--<strong style="color: #a94442;">{{ $errors->first('email') }}</strong>--}}
                                {{--</span>--}}
                            {{--@endif--}}
                        {{--</div>--}}
                        {{--<div class="form-group mb-lg">--}}
                          {{--<div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">--}}
                            {{--<div class="clearfix">--}}
                                {{--<label class="pull-left">Password</label>--}}
                                {{--<a href="{{ url('/password/reset') }}" class="pull-right">Lost Password?</a>--}}
                            {{--</div>--}}
                            {{--<div class="input-group input-group-icon">--}}
                                {{--<input id="password" type="password" class="form-control input-lg" name="password" required>--}}

									{{--<span class="input-group-addon">--}}
										{{--<span class="icon icon-lg">--}}
											{{--<i class="fa fa-lock"></i>--}}
										{{--</span>--}}
									{{--</span>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                            {{--@if ($errors->has('password'))--}}
                                {{--<span class="help-block">--}}
                                {{--<strong style="color: #a94442;">{{ $errors->first('password') }}</strong>--}}
                                {{--</span>--}}
                            {{--@endif--}}
                        {{--</div>--}}
                        {{--<div class="row">--}}
                            {{--<div class="col-sm-8">--}}
                                {{--<div class="checkbox">--}}
                                    {{--<label>--}}
                                    {{--<input type="checkbox" name="remember" {{ old('remember') ? 'checked' : ''}}> Remember Me--}}
                                    {{--</label>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                            {{--<div class="col-sm-4 text-right">--}}
                                {{--<button type="submit" class="btn btn-primary hidden-xs">Sign In</button>--}}
                                {{--<button type="submit" class="btn btn-primary btn-block btn-lg visible-xs mt-lg">Sign In</button>--}}
                            {{--</div>--}}
                        {{--</div>--}}


                    {{--</form>--}}
                {{--</div>--}}
            {{--</div>--}}
 {{--</div>--}}
    {{--</section>--}}
    {{--<!-- end: page -->--}}

    {{--<!-- Vendor -->--}}
    {{--<script src="login-assets/vendor/jquery/jquery.js"></script>--}}
    {{--<script src="login-assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>--}}
    {{--<script src="login-assets/vendor/bootstrap/js/bootstrap.js"></script>--}}
    {{--<script src="login-assets/vendor/nanoscroller/nanoscroller.js"></script>--}}
    {{--<script src="login-assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>--}}
    {{--<script src="login-assets/vendor/magnific-popup/magnific-popup.js"></script>--}}
    {{--<script src="login-assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>--}}

    {{--<!-- Theme Base, Components and Settings -->--}}
    {{--<script src="login-assets/javascripts/theme.js"></script>--}}

    {{--<!-- Theme Custom -->--}}
    {{--<script src="login-assets/javascripts/theme.custom.js"></script>--}}

    {{--<!-- Theme Initialization Files -->--}}
    {{--<script src="login-assets/javascripts/theme.init.js"></script>--}}

    {{--</body>--}}
        {{--@endsection--}}







        <!DOCTYPE html>
        <html lang="en">
        <head>
            <title>SBTS</title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!--===============================================================================================-->
            <link rel="icon" type="image/png" href="Login_assets/images/logo.jpg"/>
            <!--===============================================================================================-->
            <link rel="stylesheet" type="text/css" href="Login_assets/vendor/bootstrap/css/bootstrap.min.css">
            <!--===============================================================================================-->
            <link rel="stylesheet" type="text/css" href="Login_assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
            <!--===============================================================================================-->
            <link rel="stylesheet" type="text/css" href="Login_assets/vendor/animate/animate.css">
            <!--===============================================================================================-->
            <link rel="stylesheet" type="text/css" href="Login_assets/vendor/css-hamburgers/hamburgers.min.css">
            <!--===============================================================================================-->
            <link rel="stylesheet" type="text/css" href="Login_assets/vendor/select2/select2.min.css">
            <!--===============================================================================================-->
            <link rel="stylesheet" type="text/css" href="Login_assets/css/util.css">
            <link rel="stylesheet" type="text/css" href="Login_assets/css/main.css">
            <script src="{{asset('adminDesign/js/jquery-2.1.4.min.js')}}"></script>
            <!--===============================================================================================-->

            <style>
                .help-block{
                    display: none;
                }
            </style>
        </head>
        <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="Login_assets/images/logo.jpg" alt="IMG">
                    </div>

                        <form class="login100-form validate-form" role="form" method="POST" action="{{ url('/login') }}">
                            {{ csrf_field() }}
					<span class="login100-form-title">
						Login
					</span>
                            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                                <input id="emp_id" type="text" class="input100" name="emp_id" autocomplete="off" placeholder="Employee ID" required>
                                {{--<input class="input100" type="email" name="email" >--}}
                                <span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
                            </div>
                            <span class="help-block">
                                <strong style="color: #a94442;">Employee Id not exist!</strong>
                                </span>
                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz" style="display: none;">
                            <input id="email" type="email" class="input100" name="email" placeholder="Email" required>
                            {{--<input class="input100" type="email" name="email" >--}}
                            <span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
                        </div>
                            @if ($errors->has('email'))
                                <span class="help-block">
                                <strong style="color: #a94442;">{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100 " type="password" name="password" id="password" placeholder="Password" required>
                            <span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                        </div>
                            @if ($errors->has('password'))
                                <span class="help-block">
                                <strong style="color: #a94442;">{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
                        <div class="container-login100-form-btn">
                            <button type="submit" class="login100-form-btn">
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-12">

                        </div>

                        <div class="text-center p-t-136">

                        </div>
                    </form>
                </div>
            </div>
        </div>

<script>
    $('#emp_id').on('change', function() {
        var stateID = $('#emp_id').val();
        if (stateID) {

            $.ajax({
                url: '{{ url('/') }}/AjaxGet_login_email/' + stateID,
                type: "GET",

                dataType: "json",
                success: function (data) {
                    $("input[name='email']").empty();
                    $('.help-block').css('display','none');

                    var Vals = data;
                    $("input[name='email']").val(Vals.email);
                },
                error: function (error) {
                    $("input[name='email']").empty();
                    $('.help-block').css('display','block');
                }

            });

        }
    });
</script>


        <!--===============================================================================================-->
        <script src="Login_assets/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="Login_assets/vendor/bootstrap/js/popper.js"></script>
        <script src="Login_assets/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="Login_assets/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="Login_assets/vendor/tilt/tilt.jquery.min.js"></script>
        <script >
            $('.js-tilt').tilt({
                scale: 1.1
            })
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        </body>
        </html>