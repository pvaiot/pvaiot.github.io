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
        <h2>Coke Consignment Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Coke Consignment Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <div class="panel-body">
        <?php echo Form::open(array('route' => 'date_wise_coke_consignment_report', 'method'=>'get')); ?>
            <div class="form-group col-sm-4">
                <label class="col-sm-4 control-label">Date From : </label>
                <div class="col-sm-8">
                    <input type="text" name="date_wise_date_from" id="date_wise_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd-m-Y', strtotime($from_date)) ?>" />
                </div>
            </div>
            <div class="form-group col-sm-4">
                <div class="col-sm-8">
                    <input type="text" name="date_wise_date_upto" id="date_wise_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd-m-Y', strtotime($upto_date)) ?>" />
                </div>
            </div>
        <div class="col-sm-4">
            <button type="submit" class="btn btn-primary">View</button>
        </div>
        {{form::close()}}
    </div>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <?php echo Form::open(array('route' => 'export_date_wise_coke_consignment_data')); ?>
            <h3 class="panel-title">Coke Consignment Details - From <strong><?php echo date( 'd/m/Y', strtotime($from_date)) ?></strong> To <strong><?php echo date( 'd/m/Y', strtotime($upto_date)) ?></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="hidden" name="from_date" id="from_date" class="form-control" value="{{$from_date}}">
            <input type="hidden" name="upto_date" id="upto_date" class="form-control" value="{{$upto_date}}">
            <button type="submit" class="btn btn-md btn-success" id="submit"> Send to Exel </button>
            {{form::close()}}
            </h3>
        </header>
        <div class="panel-body">
            <div class="table-responsive" style="min-height: 400px !important;max-height: 400px;">
                <table class="table table-bordered table-striped table-condensed mb-none">
                    <thead>
                <tr>
                    <th class="text-center">Consignment Date</th>
                    <th class="text-center">Consignment No</th>
                    <th class="text-center">Load ID</th>
                    <th class="text-center">Trip ID</th>
                    <th class="text-center">From</th>
                    <th class="text-center">To</th>
                    <th class="text-center" style="min-width: 450px !important;">Party Name</th>
                    <th class="text-center">Truck No</th>
                    <th class="text-center">Total Package</th>
                    <th class="text-center">Total Weight</th>
                    <th class="text-center" style="min-width: 150px !important;">Contents</th>
                    <th class="text-center" style="min-width: 250px !important;">Consignment Value</th>
                </tr>
                </thead>
                <tbody>
                <?php  $area_consignment= \App\CockConsignment::whereBetween('con_date', array($from_date, $upto_date))->orderBy('con_date', 'ASC')->get(); ?>
                <?php  $area_consignment_count= \App\CockConsignment::whereBetween('con_date', array($from_date, $upto_date))->orderBy('con_date', 'ASC')->count(); ?>
                <?php $sl_no=1; ?>
                <?php $overall_cn_value=0;$overall_total_pakage=0;$overall_total_weight=0; ?>
                @if($area_consignment_count>0)
                @foreach($area_consignment as $consign)
                    <tr>
                        <?php  $consignment_child2= \App\CockConsignment_child2::where('consignment_id','=',$consign->id)->get(); ?>
                        <?php  $consignment_child1= \App\CockConsignment_child2::where('consignment_id','=',$consign->id)->first(); ?>
                        <?php $total_package=0; ?>
                        <?php $total_weight=0; ?>
                            @foreach($consignment_child2 as $consignment_child2)
                                <?php $total_package+=(float)$consignment_child2->package; ?>
                                <?php $total_weight+=(float)$consignment_child2->gross_weight; ?>
                        @endforeach

                    @if($consign->con_date!="")
                            <td data-title="Consignment Date" class="text-center"><?php echo date( 'd-m-Y', strtotime($consign->con_date)) ?></td>
                        @else
                            <td data-title="Consignment Date" class="text-center">-</td>
                        @endif
                        @if($consign->consignment_no!="")
                            <td data-title="Consignment No" class="text-center">{{$consign->consignment_no}}</td>
                        @else
                            <td data-title="Consignment No." class="text-center">-</td>
                        @endif
                        @if($consign->load_id!="")
                            <td data-title="Load ID" class="text-center">{{$consign->load_id}}</td>
                        @else
                            <td data-title="Load ID" class="text-center">-</td>
                        @endif
                        @if($consign->trip_id!="")
                            <td data-title="Trip ID" class="text-center">{{$consign->trip_id}}</td>
                        @else
                            <td data-title="Trip ID" class="text-center">-</td>
                        @endif
                        @if($consign->from!="")
                            <td data-title="From" class="text-center">{{$consign->from}}</td>
                        @else
                            <td data-title="From" class="text-center">-</td>
                        @endif
                        @if($consign->to!="")
                            <td data-title="To" class="text-center">{{$consign->to}}</td>
                        @else
                            <td data-title="To" class="text-center">-</td>
                        @endif
                        @if($consign->consignor_name!="")
                            <td data-title="Consignor Name" class="text-center">{{$consign->consignor_name}}</td>
                        @else
                            <td data-title="Consignor Name" class="text-center">-</td>
                        @endif
                        @if($consign->truck_no!="")
                            <td data-title="Truck No" class="text-center">{{$consign->truck_no}}</td>
                        @else
                            <td data-title="Truck No" class="text-center">-</td>
                        @endif
                            @if($total_package!=0)
                                <td data-title="Total Package" class="text-center">{{$total_package}}</td>
                            @else
                                <td data-title="Total Package" class="text-center">-</td>
                            @endif
                            @if($total_weight!=0)
                                <td data-title="Total Weight" class="text-center">{{$total_weight}}</td>
                            @else
                                <td data-title="Total Weight" class="text-center">-</td>
                            @endif
                            @if($consign->truck_no!="")
                                <td data-title="Contains" class="text-center">{{$consignment_child1->category}}</td>
                            @else
                                <td data-title="Contains" class="text-center">-</td>
                            @endif
                            @if($consign->truck_no!="")
                                <td data-title="Consignment Value" class="text-center">{{$consign->cn_value}}</td>
                            @else
                                <td data-title="Consignment Value" class="text-center">-</td>
                            @endif
                    </tr>
                    <?php $sl_no +=1; ?>
                    <?php $overall_cn_value+=(float)$consign->cn_value; ?>
                    <?php $overall_total_pakage+=(float)$total_package; ?>
                    <?php $overall_total_weight+=(float)$total_weight; ?>
                @endforeach
                    @else<tr>
                    <td valign="top" colspan="12" class="dataTables_empty">NO DATA FOUND.....</td>
                </tr>
                @endif
                </tbody>
            </table>
            </div>
        </div>
        <header class="panel-heading">
            <h5 class="panel-title">Total Consignment Value :<strong>&#x20B9; <?php echo $overall_cn_value; ?></strong> &nbsp;&nbsp;&nbsp;Total Packages :<strong> <?php echo $overall_total_pakage; ?></strong> &nbsp;&nbsp;&nbsp;Total Weight : <strong><?php echo $overall_total_weight; ?></strong></h5>
        </header>

    </section>
    <script>
        var destination =  [/* states array*/];
        $("#party_name").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#party_name2").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#location").select2({
            data: destination
        });
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
