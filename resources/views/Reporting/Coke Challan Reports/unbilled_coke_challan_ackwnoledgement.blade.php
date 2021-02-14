@extends('layouts.newAdminPanalTable')
@section('custom_css')
<style>
    .table tbody tr td{
        padding: 10px !important;
    }
</style>

@endsection
@section('content')
    <br>
    @if(Session::has('flash_message1'))
        <div class="alert alert-danger">
            <span class="glyphicon glyphicon-ban-circle"></span> {{ Session::get('flash_message1') }}
        </div>
    @endif
    <header class="page-header">
        <h2>Coke Acknowledgement Details123</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Coke Acknowledgement Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <div class="panel-body">
        <?php echo Form::open(array('route' => 'unbilled_coke_challan_acknowledgement', 'method'=>'get')); ?>
        <div class="form-group col-sm-3">
            <div class="col-sm-12">
                <input type="text" name="acknowledgement_date_from" id="acknowledgement_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd/m/Y', strtotime($from_date)) ?>" />
            </div>
        </div>
        <div class="form-group col-sm-3">
            <div class="col-sm-12">
                <input type="text" name="acknowledgement_date_upto" id="acknowledgement_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd/m/Y', strtotime($upto_date)) ?>" />
            </div>
        </div>
        <div class="col-sm-2">
            <button type="submit" class="btn btn-primary">View</button>
        </div>
        {{form::close()}}
    </div>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
        <?php echo Form::open(array('route' => 'export_unbilled_coke_challan_acknowledgement_data', 'method'=>'post')); ?>
        <h3 class="panel-title">Unacknowledged Challans - From <strong><?php echo date( 'd/m/Y', strtotime($from_date)) ?></strong> To <strong><?php echo date( 'd/m/Y', strtotime($upto_date)) ?></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="hidden" name="from_date" id="from_date" class="form-control" value="{{$from_date}}">
            <input type="hidden" name="upto_date" id="upto_date" class="form-control" value="{{$upto_date}}">
            <button type="submit" class="btn btn-md btn-success" id="submit"> Send to Exel </button>
        </h3>
        {{form::close()}}
        </header>
            <div class="panel-body">
        <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                    <thead>
                    <tr>
                        <th class="text-center">Challan Number</th>
                        <th class="text-center">Load ID</th>
                        <th class="text-center">Trip ID</th>
                        <th class="text-center" style="width: 150px;">Date</th>
                        <th class="text-center">From</th>
                        <th class="text-center">To</th>
                        <th class="text-center">Party Name</th>
                        <th class="text-center">Broker Name</th>
                        <th class="text-center">Truck No</th>
                    </tr>
                    </thead>
                    <tbody>
                            <?php
                            $sl=1;
                            $challan = \App\CokeChallan::whereBetween('date', array($from_date, $upto_date))->get();
                            ?>
                            @foreach ($challan as $challan)
                                <?php
                            $cock_ack = \App\Coke_acknowledgement::where('challan_number','=',$challan->challan_no)->count();
                                ?>
                                @if($cock_ack<=0)
                                <?php
                            $coke_challan_child2_count=\App\CokeChallan_child2::where('challan_id','=',$challan->id)->count();
                            ?>
                                <tr>
                                    <td>{{$challan->challan_no}}</td>
                                    <?php  $challan_child2_count= \App\CokeChallan_child2::where('challan_id','=',$challan->id)->count(); ?>
                                    <?php  $challan_child2= \App\CokeChallan_child2::where('challan_id','=',$challan->id)->get(); ?>
                                    @if($challan_child2_count==1)
                                        <td data-title="Diesel Amount" class="text-center">
                                            @foreach($challan_child2 as $challan_child2)
                                                <?php $consignment_data=\App\CockConsignment::find($challan_child2->consignment_id); ?>
                                                @if($consignment_data->load_id!="")
                                                    {{$consignment_data->load_id}}
                                                @endif
                                            @endforeach
                                        </td>
                                    @else
                                        <td data-title="Diesel Amount" class="text-center">
                                            @foreach($challan_child2 as $challan_child2)
                                                <?php $consignment_data=\App\CockConsignment::find($challan_child2->consignment_id); ?>
                                                @if($consignment_data->load_id!="")
                                                    {{$consignment_data->load_id}} /
                                                @endif
                                            @endforeach
                                        </td>
                                    @endif

                                    <?php  $challan_child2_count= \App\CokeChallan_child2::where('challan_id','=',$challan->id)->count(); ?>
                                    <?php  $challan_child2= \App\CokeChallan_child2::where('challan_id','=',$challan->id)->get(); ?>
                                    @if($challan_child2_count==1)
                                        <td data-title="Diesel Amount" class="text-center">
                                            @foreach($challan_child2 as $challan_child2)
                                                <?php $consignment_data=\App\CockConsignment::find($challan_child2->consignment_id); ?>
                                                @if($consignment_data->trip_id!="")
                                                    {{$consignment_data->trip_id}}
                                                @endif
                                            @endforeach
                                        </td>
                                    @else
                                        <td data-title="Diesel Amount" class="text-center">
                                            @foreach($challan_child2 as $challan_child2)
                                                <?php $consignment_data=\App\CockConsignment::find($challan_child2->consignment_id); ?>
                                                @if($consignment_data->trip_id!="")
                                                    {{$consignment_data->trip_id}} /
                                                @endif
                                            @endforeach
                                        </td>
                                    @endif
                                    <td>{{$challan->date}}</td>
                                    <td>{{$challan->from}}</td>
                                    <td>{{$challan->to}}</td>
                                    @if($coke_challan_child2_count==1)
                                       <?php
                                        $coke_challan_child2=\App\CokeChallan_child2::where('challan_id','=',$challan->id)->first();
                                        $coke_consignment=\App\CockConsignment::find($coke_challan_child2->consignment_id);
                                        ?>
                                           <td>{{$coke_consignment->consignee_name}}</td>
                                        @else
                                        <?php
                                        $coke_challan_child2=\App\CokeChallan_child2::where('challan_id','=',$challan->id)->get();
                                        ?>
                                        <td>@foreach($coke_challan_child2 as $coke_challan_child2)
                                                <?php $coke_consignment=\App\CockConsignment::find($coke_challan_child2->consignment_id); ?>
                                            {{$coke_consignment->consignee_name}} /
                                                @endforeach
                                        </td>
                                        @endif
                                    <td>{{$challan->broker_name}}</td>
                                    <td>{{$challan->truck_no}}</td>
                                </tr>
                                <?php $sl++; ?>
                              @endif
                            @endforeach
                    
                    </tbody>
                </table>
            </div>
    </section>
    <script>
        $(function() {
            $(".styledate")
                    .mask(
                    '99/99/9999',
                    { validate: function (fld,cur) {
                        // 1 == month; 0 == day; 2 == year
                        var mm = parseInt(fld[1]),
                                dd = parseInt(fld[0]),
                                yy = parseInt(fld[2]),
                                vl = true;
                        if (!(mm >= 0 && mm < 13) && cur == 1) {
                            fld[1] = '12';
                            vl = false;
                        }
                        if (!(dd >= 0 && dd <= 31) && cur == 0) {
                            fld[0] = '01';
                            vl = false;
                        }
                        if (!(yy >= 1976 && yy < 2199) && cur == 2 && fld[2].replace('_','').length == 4) {
                            fld[2] = '2012';
                            vl = false;
                        }
                        return vl;
                    }
                    });

        });
        //    delete commande
        function ConfirmDelete() {
            var x = confirm("Are you sure you want to delete?");
            if (x)
                return true;
            else
                return false;
        }
        $(".alert").fadeTo(2000, 500).slideUp(500, function() {
            $(".alert").slideUp(500);
        });
    </script>
@endsection
