@extends('layouts.newAdminPanal')
@section('title')
    Create Location
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
    </style>
@endsection
@section('content')
    <br>
    <br>
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <header class="page-header">
        <h2>Edit Location Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Edit Location Entry</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    <div class="row">
        <div class="col-md-8 col-md-offset-2" style="">
            <br>
            <table class="table">

                <tr>
                    <td style="width: 30%">City<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <input type="text" name="city" id="city" value="{{$loco->city}}" class="form-control" placeholder="City" required autofocus>

                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">District</td>
                    <td>
                        <input type="text" name="dist" id="dist" value="{{$loco->dist}}" class="form-control" placeholder="Dist">
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">State</td>
                    <td>
                        <input type="text" name="state" id="state" value="{{$loco->state}}" class="form-control" placeholder="State">
                    </td>
                </tr>
            </table>
            <br>

        </div>

        <br>
        <footer class="col-md-8 col-md-offset-4">
            <a class="btn btn-primary btn-sm" href="{{url('location')}}">Back</a>
        </footer><br>
</div>
        {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

        <script>
            $("input").prop("disabled", true);

            $(".alert").fadeTo(2000, 500).slideUp(500, function(){
                $(".alert").slideUp(500);
            });

        </script>

@endsection