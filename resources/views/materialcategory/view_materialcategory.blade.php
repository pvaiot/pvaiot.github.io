@extends('layouts.newAdminPanal_select')
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
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <header class="page-header">
        <h2>New Material Category Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Material Category Entry</span></li>
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
                    <td style="width: 30%">Category<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <input type="text" name="category" id="category" value="{{$mater->category}}" class="form-control" placeholder="Category" required autofocus>

                    </td>
                </tr>

            </table>

        </div>
<br>
        <footer class="col-md-8 col-md-offset-4">
            <a class="btn btn-primary btn-sm" href="{{url('materialcategory')}}">Back</a>
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