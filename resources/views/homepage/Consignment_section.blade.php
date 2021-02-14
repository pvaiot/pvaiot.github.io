@extends('layouts.adminPanel')
@section('title')
    Admin Panel
@endsection
@section('custom_css')

    <style>
        .btn{
            padding: 10px;
        }
        .myhover a:hover{
            color: red;
        }
    </style>

@endsection

@section('content')

    <div class="well">
        <div class="row text-center myhover" style="padding:30px">


           <div class="col-sm-3 col-md-3">
               <a href="{{url('#')}}"><i class="	fa fa-truck custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle">Consignment</span>  </a>
           </div>


            <div class="col-sm-3 col-md-3">
                <a href="{{url('challan')}}"><i class="	fa fa-file-text custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle">Challan</span>  </a>
            </div>

            <div class="col-sm-3 col-md-3">
                <a href="{{url('acknowledgement')}}"><i class="	fa fa-font custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle">Acknowledgement</span>  </a>
            </div>

            <div class="col-sm-3 col-md-3">
                <a href="{{url('indent')}}"><i class="	fa fa-envelope-o custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle">Indent</span>  </a>
            </div>

       </div>


        <br>
        <div class="row text-center myhover" style="padding: 30px">

            <div class="col-sm-3 col-md-3">
                <a href="{{url('indentplacement')}}"><i class="fa fa-inr custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle"> Indent Placement </span> </a>
            </div>

            <div class="col-sm-3 col-md-3">
                <a href="{{url('#')}}"><i class="fa fa-codepen custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle"> Supplimentry Bill With CN </span> </a>
            </div>

            <div class="col-sm-3 col-md-3">
                <a href="{{url('#')}}"><i class="fa fa-cc-diners-club custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle"> Bill Delivery Submisson </span> </a>
            </div>

            <div class="col-sm-3 col-md-3">
                <a href="{{url('#')}}"><i class="fa fa-credit-card custom-icon-bhaskar" style="font-size: 60px"></i><br><span class="mystyle"> Income Tax Deposit Receipt </span> </a>
            </div>



        </div>
    </div>


@endsection