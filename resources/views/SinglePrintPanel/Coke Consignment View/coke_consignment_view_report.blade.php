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
        table tbody tr td{
            border: 1px solid lightslategray !important
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
        <h2>View Consignment Data</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>View Consignment Data</span></li>
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
    <div class="row">


        <?php echo Form::open(array('route' => 'coke_consignment_print_report_panel', 'method'=>'get'))?>

        {{--____________________________________________________________________________________________________________________________________________________________--}}

        <div class="col-sm-3">
            <?php  $serial_no = \App\Cn_serial_no::where('id','=','1')->first(); ?>
            <div class="form-group">
                <input type="text" name="consignment_no" id="consignment_no" class="form-control"  maxlength="{{$serial_no->consignment_serial_no}}" placeholder="Consignment No" required  autofocus>
                <p style="color: red;font-size: 10px;" id="consignment_no_error">* Consignment No. Does Not Exist *</p>
            </div>
        </div>
        <button type="submit" class="btn btn-success" id="submit">View</button>


        {{form::close()}}
    </div>
    <div class="row">

        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item active">
                <a class="nav-link" data-toggle="tab" href="#tabs-1" role="tab">Consignment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Challan</a>
            </li>
        </ul>
        <?php $consignment_data=\App\CockConsignment::where('consignment_no','=',$consignment_no)->first(); ?>
        <div class="tab-content">
            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                <a href="{{url('print_cokeconsignment')}}/{{$consignment_data->id}}" target="_blank" class="btn btn-sm btn-success">
                    Print Consignment
                </a>
            </div>
            <div class="tab-pane" id="tabs-2" role="tabpanel">
                <?php $challan_child2_data_count=\App\CokeChallan_child2::where('consignment_id','=',$consignment_data->id)->count(); ?>
                    @if($challan_child2_data_count>0)
                    <?php $challan_child2_data=\App\CokeChallan_child2::where('consignment_id','=',$consignment_data->id)->first(); ?>
                    <?php $challan_data=\App\CokeChallan::find($challan_child2_data->challan_id); ?>
                    <a href="{{url('print_lorry_coke_challan')}}/{{$challan_data->id}}" target="_blank" class="btn btn-sm btn-success">
                        Print Lorry
                    </a>
                    <a href="{{url('print_balance_coke_challan')}}/{{$challan_data->id}}" target="_blank" class="btn btn-sm btn-success">
                        Print Balance
                    </a>
                    <a href="{{url('print_record_coke_challan')}}/{{$challan_data->id}}" target="_blank" class="btn btn-sm btn-success">
                        Print Record
                    </a>
                @else
                <div class="well col-md-12">
                    <h4>Challan Not Ready Yet!!!</h4>
                </div>
                @endif
            </div>
        </div>

    </div>
    <script>
        $('#consignment_no').on('blur', function() {
            var stateID = $('#consignment_no').val();
            if (stateID) {

                $.ajax({
                    url: '{{ url('/') }}/AjaxGet_consignment_no_data_for_single/' + stateID,
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
                    url: '{{ url('/') }}/AjaxGet_consignment_no_data_for_single/' + stateID,
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

