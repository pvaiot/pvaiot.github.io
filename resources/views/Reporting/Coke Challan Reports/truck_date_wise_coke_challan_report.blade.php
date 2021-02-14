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
        <h2>Coke Challan Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Coke Challan Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <div class="panel-body">
        <?php echo Form::open(array('route' => 'truck_date_wise_coke_consignment_report', 'method'=>'get')); ?>
        <div class="col-sm-3">
            <select id='truck_no' name='truck_no' class="form-control" style="width: 100%;">
                <option value=""> Select Truck No</option>
                <?php  $datas = \App\Lorry::all(); ?>
                @foreach($datas as $data)
                    <option value="{{$data->truck_no}}">{{$data->truck_no}}</option>
                @endforeach
            </select>
        </div>
            <div class="form-group col-sm-3">
                <div class="col-sm-12">
                    <input type="text" name="truck_date_wise_date_from" id="truck_date_wise_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd/m/Y', strtotime($from_date)) ?>" />
                   </div>
            </div>
            <div class="form-group col-sm-3">
                <div class="col-sm-12">
                    <input type="text" name="truck_date_wise_date_upto" id="truck_date_wise_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date( 'd/m/Y', strtotime($upto_date)) ?>" />
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
            <?php echo Form::open(array('route' => 'export_truck_date_wise_coke_challan_data')); ?>
            <h3 class="panel-title">Coke Challan Details For <strong>{{$truck_no}}</strong>- From <strong><?php echo date( 'd/m/Y', strtotime($from_date)) ?></strong> To <strong><?php echo date( 'd/m/Y', strtotime($upto_date)) ?></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="hidden" name="truck_no" id="truck_no" class="form-control" value="{{$truck_no}}">
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
                        <th class="text-center">CN Numbers</th>
                        <th class="text-center">From</th>
                        <th class="text-center">Destination</th>
                        <th class="text-center">Truck No</th>
                        <th class="text-center">Total Package</th>
                        <th class="text-center">Total Weight</th>
                        <th class="text-center">Freight Amount</th>
                        <th class="text-center">Advance Amount</th>
                        <th class="text-center">Diesel Amount</th>
                        <th class="text-center">Balance Amount</th>
                        <th class="text-center" style="min-width: 250px;">Petrol Pump</th>
                        <th class="text-center">Payable At</th>
                        <th class="text-center" style="min-width: 250px;">Declaration Submitted</th>
                        <th class="text-center">Entry By</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php  $area_challan= \App\CokeChallan::where('truck_no','=',$truck_no)
                                ->whereBetween('date', array($from_date, $upto_date))
                                ->orderBy('date', 'ASC')->get(); ?>
                        <?php  $area_challan_count= \App\CokeChallan::where('truck_no','=',$truck_no)
                                ->whereBetween('date', array($from_date, $upto_date))
                                ->orderBy('date', 'ASC')->count(); ?>
                    <?php $sl_no=1; ?>
                    <?php $overall_freight_value=0;
                    $overall_advance_value=0;
                    $overall_diesel_value=0;
                    $overall_balance_value=0;
                    $overall_total_pakage=0;$overall_total_weight=0; ?>
                    @if($area_challan_count>0)
                        @foreach($area_challan as $consign)
                            <tr>
                                <?php  $challan_child3= \App\CokeChallan_child3::where('challan_id','=',$consign->id)->first(); ?>
                                <?php  $challan_child2_count= \App\CokeChallan_child2::where('challan_id','=',$consign->id)->count(); ?>
                                <?php  $challan_child2= \App\CokeChallan_child2::where('challan_id','=',$consign->id)->get(); ?>


                                @if($consign->date!="")
                                    <td data-title="Challan Date" class="text-center"><?php echo date( 'd-m-Y', strtotime($consign->date)) ?></td>
                                @else
                                    <td data-title="Challan Date" class="text-center">-</td>
                                @endif
                                @if($consign->challan_no!="")
                                    <td data-title="Challan No" class="text-center">{{$consign->challan_no}}</td>
                                @else
                                    <td data-title="Challan No." class="text-center">-</td>
                                @endif
                                @if($challan_child2_count>0)
                                    @if($challan_child2_count==1)
                                        <td data-title="CN Numbers" class="text-center">@foreach($challan_child2 as $challan_child2){{$challan_child2->consignment_no}}@endforeach</td>
                                    @else
                                        <td data-title="CN Numbers" class="text-center">@foreach($challan_child2 as $challan_child2){{$challan_child2->consignment_no}} ,@endforeach</td>
                                    @endif
                                @else
                                    <td data-title="CN Numbers" class="text-center">-</td>
                                @endif
                                @if($consign->from!="")
                                    <td data-title="From" class="text-center">{{$consign->from}}</td>
                                @else
                                    <td data-title="From" class="text-center">-</td>
                                @endif
                                @if($consign->to!="")
                                    <td data-title="Destination" class="text-center">{{$consign->to}}</td>
                                @else
                                    <td data-title="Destination" class="text-center">-</td>
                                @endif
                                @if($consign->truck_no!="")
                                    <td data-title="Truck No" class="text-center">{{$consign->truck_no}}</td>
                                @else
                                    <td data-title="Truck No" class="text-center">-</td>
                                @endif
                                @if($challan_child3->total_package!="")
                                    <td data-title="Total Package" class="text-center">{{$challan_child3->total_package}}</td>
                                @else
                                    <td data-title="Total Package" class="text-center">-</td>
                                @endif
                                @if($challan_child3->total_gross_weight!="")
                                    <td data-title="Total Weight" class="text-center">{{$challan_child3->total_gross_weight}}</td>
                                @else
                                    <td data-title="Total Weight" class="text-center">-</td>
                                @endif
                                @if($consign->freight!="")
                                    <td data-title="Freight Amt" class="text-center">{{$consign->freight}}</td>
                                @else
                                    <td data-title="Freight Amt" class="text-center">-</td>
                                @endif
                                @if($consign->cash_advance!="")
                                    <td data-title="Advance" class="text-center">{{$consign->cash_advance}}</td>
                                @else
                                    <td data-title="Advance" class="text-center">-</td>
                                @endif
                                @if($consign->diesel!="")
                                    <td data-title="Diesel" class="text-center">{{$consign->diesel}}</td>
                                @else
                                    <td data-title="Diesel" class="text-center">-</td>
                                @endif
                                @if($consign->balance!="")
                                    <td data-title="Balance" class="text-center">{{$consign->balance}}</td>
                                @else
                                    <td data-title="Balance" class="text-center">-</td>
                                @endif
                                @if($consign->petrol_pump_id>0)
                                    <?php $petrol_pump_name=\App\Petrol_Pump::find($consign->petrol_pump_id); ?>
                                    <td data-title="Petrol Pump" class="text-center">{{$petrol_pump_name->name}}</td>
                                @else
                                    <td data-title="Petrol Pump" class="text-center">-</td>
                                @endif
                                @if($consign->balance_payable_at!="")
                                    <td data-title="Payable At" class="text-center">{{$consign->balance_payable_at}}</td>
                                @else
                                    <td data-title="Payable At" class="text-center">-</td>
                                @endif
                                @if($consign->declaration_submitted!="")
                                    <td data-title="Declaration Submitted" class="text-center">{{$consign->declaration_submitted}}</td>
                                @else
                                    <td data-title="Declaration Submitted" class="text-center">-</td>
                                @endif
                                @if($consign->created_by!="")
                                    <td data-title="Entry By" class="text-center">{{$consign->created_by}}</td>
                                @else
                                    <td data-title="Entry By" class="text-center">-</td>
                                @endif
                            </tr>

                            <?php $overall_freight_value+=(float)$consign->freight;
                            $overall_advance_value+=(float)$consign->cash_advance;
                            $overall_diesel_value+=(float)$consign->diesel;
                            $overall_balance_value+=(float)$consign->balance;
                            $overall_total_pakage+=(float)$challan_child3->total_package;
                            $overall_total_weight+=(float)$challan_child3->total_gross_weight;

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
            <h5 class="panel-title">Total Freight Value :<strong>&#x20B9; <?php echo $overall_freight_value; ?></strong> &nbsp;&nbsp;&nbsp;Total Advance Value :<strong>&#x20B9; <?php echo $overall_advance_value; ?></strong> &nbsp;&nbsp;&nbsp;Total Diesel Value :<strong>&#x20B9; <?php echo $overall_diesel_value; ?></strong> &nbsp;&nbsp;&nbsp;</h5><br>
            <h5 class="panel-title">Total Balance Value :<strong>&#x20B9; <?php echo $overall_balance_value; ?></strong> &nbsp;&nbsp;&nbsp;Total Packages :<strong> <?php echo $overall_total_pakage; ?></strong> &nbsp;&nbsp;&nbsp;Total Weight : <strong><?php echo $overall_total_weight; ?></strong></h5>
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
