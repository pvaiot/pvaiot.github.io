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
        .select2-container .select2-selection--single {
            height: 35px !important;
            border-color:#555555!important;

        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-top: 3px!important;
        }
        select{
            width: 100%;
        }
        #consignment_no_error{
            display: none;
            margin-bottom: -10px;
        }#error_location{
             display: none;
         }
        .btn:focus{
            background-color: #0088cc !important;
            font-size: 15px;
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
        <h2>View  Bill Data</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Bill Data</span></li>
            </ol>

            <a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif
    @if(Session::has('flash_message_error'))
        <div class="alert alert-danger">
            {{ Session::get('flash_message_error') }}
        </div>
    @endif
    {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="row">


            <?php echo Form::open(array('route' => 'normal_bill_view_report_panel', 'method'=>'get'))?>

            {{--____________________________________________________________________________________________________________________________________________________________--}}

                <div class="col-sm-3">
                    <div class="form-group">
                        <input type="text" name="coke_bill_no" id="coke_bill_no" class="form-control"  placeholder="Coke Bill No" required  autofocus>
                        <p style="color: red;font-size: 10px;" id="consignment_no_error">* Bill No. Does't Exist *</p>
                    </div>
                </div>
                <button type="submit" class="btn btn-success" id="submit">View</button>


        {{form::close()}}
    </div>
    {{--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>--}}
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}
    <script>
        $('#coke_bill_no').on('blur', function() {
            var stateID = $('#coke_bill_no').val();
            if (stateID) {

                $.ajax({
                    url: '{{ url('/') }}/AjaxGet_normal_bill_no_data2/' + stateID,
                    type: "GET",
                    success: function(response) {
                        if(response != 'unique'){

                            $('#consignment_no').css( 'border-bottom-color','red');
                            $('#consignment_no_error').css('display','block');
                            $('#submit').prop('disabled',true);
                        }else{
                            $('#consignment_no_error').css('display','none');
                            $('#consignment_no').css( 'border-bottom-color','silver');
                            $('#submit').prop('disabled',false);
                        }
                    }
                });

            } else {

            }

        });
        $('#consignment_no').on('keyup', function() {
            var stateID = $('#consignment_no').val();
            if (stateID) {

                $.ajax({
                    url: '{{ url('/') }}/AjaxGet_consignment_no_data2/' + stateID,
                    type: "GET",
                    success: function(response) {
                        if(response != 'unique'){

                            $('#consignment_no').css( 'border-bottom-color','red');
                            $('#consignment_no_error').css('display','block');
                            $('#submit').prop('disabled',true);
                        }else{
                            $('#consignment_no_error').css('display','none');
                            $('#consignment_no').css( 'border-bottom-color','silver');
                            $('#submit').prop('disabled',false);
                        }
                    }
                });

            } else {

            }

        });
     </script>


@endsection

