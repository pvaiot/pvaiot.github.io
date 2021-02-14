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
        <h2>Petrol Pump Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Petrol Pump Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <div class="panel-body">
        <?php echo Form::open(array('route' => 'normal_petrol_pump_report', 'method'=>'get')); ?>
            <div class="col-sm-3">
                <select id='petrol_pump' name='petrol_pump' class="form-control" style="width: 100%;">
                    <option value=""> Select Petrol Pump Name</option>
                    <?php  $datas = App\Petrol_Pump::all(); ?>
                    @foreach($datas as $data)
                        <option value="{{$data->id}}">{{$data->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-sm-3">
                <div class="col-sm-12">
                    <input type="text" name="petrol_pump_date_from" id="petrol_pump_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd/m/Y', strtotime($from_date)) ?>" />
                   </div>
            </div>
            <div class="form-group col-sm-3">
                <div class="col-sm-12">
                    <input type="text" name="petrol_pump_date_upto" id="petrol_pump_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd/m/Y', strtotime($upto_date)) ?>" />
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
            <?php echo Form::open(array('route' => 'export_normal_petrol_pump_report')); ?>
            <?php $petrol_pump_data=\App\Petrol_Pump::find($petrol_pump_id); ?>
            <h3 class="panel-title">Petrol Pump Details for <strong>{{$petrol_pump_data->name}}</strong> - From <strong><?php echo date( 'd/m/Y', strtotime($from_date)) ?></strong> To <strong><?php echo date( 'd/m/Y', strtotime($upto_date)) ?></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="hidden" name="petrol_pump_id" id="petrol_pump_id" class="form-control" value="{{$petrol_pump_id}}">
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
                        <th class="text-center">Challan Date</th>
                        <th class="text-center">Challan No</th>
                        <th class="text-center">Petrol Pump Name</th>
                        <th class="text-center">Diesel Amount</th>

                    </tr>
                    </thead>
                    <tbody>
                        <?php  $area_challan_count=\App\Challan::whereBetween('date', array($from_date, $upto_date))
                                ->where('petrol_pump_id', $petrol_pump_id)
                                ->orderBy('con_date', 'ASC')->
                                count(); ?>
                    <?php $sl_no=1; ?>
                    <?php
                    $overall_diesel_value=0;?>
                    @if($area_challan_count>0)
                        <?php  $area_challan= \App\Challan::whereBetween('date', array($from_date, $upto_date))
                                ->where('petrol_pump_id',$petrol_pump_id)
                                ->orderBy('con_date', 'ASC')->
                                get(); ?>
                        @foreach($area_challan as $consign)
                            <tr>
                                @if($consign->date!="")
                                    <td data-title="Challan Date" class="text-center">{{date( 'd-m-Y', strtotime($consign->date))}}</td>
                                @else
                                    <td data-title="Challan Date" class="text-center">-</td>
                                @endif
                                @if($consign->challan_no!="")
                                    <td data-title="Challan No" class="text-center">{{$consign->challan_no}}</td>
                                @else
                                    <td data-title="Challan No" class="text-center">-</td>
                                @endif
                                     <?php $petrol_pump_name=\App\Petrol_Pump::find($consign->petrol_pump_id); ?>
                                @if($consign->petrol_pump_id!="")
                                    <td data-title="Petrol Pump Name" class="text-center">{{$petrol_pump_name->name}}</td>
                                @else
                                    <td data-title="Petrol Pump Name" class="text-center">-</td>
                                @endif
                                    <td data-title="Diesel Amount" class="text-center">{{$consign->diesel}}</td>
                            </tr>

                            <?php
                            $overall_diesel_value+=(float)$consign->diesel;
                            ?>
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
            <h5 class="panel-title">Total Diesel Value :<strong>&#x20B9; <?php echo $overall_diesel_value; ?></strong> &nbsp;&nbsp;&nbsp;</h5>
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
        var destination =  [/* states array*/];
        $("#truck_no").select2({
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
