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
        <h2>Normal Consignment Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Normal Consignment Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <div class="panel-body">
        <?php echo Form::open(array('route' => 'detailed_normal_consignment_report', 'method'=>'get')); ?>
        <div class="form-group col-sm-2">
            <div class="col-sm-12">
                <input type="text" name="from_date3" id="from_date3" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y', strtotime($from_date));?>" />
            </div>
        </div>
        <div class="form-group col-sm-2">
            <div class="col-sm-12">
                <input type="text" name="upto_date3" id="upto3" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y', strtotime($upto_date));?>" />
            </div>
        </div>
        <div class="col-sm-3">
            <select id='party_name3' name='party_name3' class="form-control" style="width: 100%;">
                <option value="all"> All Party</option>
                <?php  $datas = App\Party::all(); ?>
                @foreach($datas as $data)
                    @if($data->party_code==$party_code)
                        <option value="{{$data->party_code}}" selected>{{$data->name}}</option>
                    @endif
                        @if($data->party_code==$party_code)

                            @else
                    <option value="{{$data->party_code}}">{{$data->name}}</option>
                        @endif
                @endforeach
            </select>
        </div>
        <div class="col-sm-3">
            <select id='location3' name='location3' class="form-control" style="width: 100%;">
                <option value="all"> All Destination</option>
                <?php  $datas = App\Location::all(); ?>
                @foreach($datas as $data)
                    @if($data->city==$location)
                        <option value="{{$data->city}}" selected>{{$data->city}}</option>
                    @endif
                        @if($data->city==$location)
                            @else
                    <option value="{{$data->city}}">{{$data->city}}</option>
                        @endif
                @endforeach
            </select>
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
            <?php echo Form::open(array('route' => 'export_detailed_normal_consignment_data')); ?>
            <h3 class="panel-title">Detailed Coke Consignment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="hidden" name="party_code" id="party_code" class="form-control" value="{{$party_code}}">
                <input type="hidden" name="location" id="location" class="form-control" value="{{$location}}">
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
                        <th class="text-center">From</th>
                        <th class="text-center">Destination</th>
                        <th class="text-center" style="min-width: 450px !important;">Party Name</th>
                        <th class="text-center" style="min-width: 250px !important;">Consignee Name</th>
                        <th class="text-center">Truck No</th>
                        <th class="text-center">Total Package</th>
                        <th class="text-center">Total Weight</th>
                        <th class="text-center" style="min-width: 150px !important;">Contents</th>
                        <th class="text-center" style="min-width: 150px !important;">Invoice No</th>
                        <th class="text-center" style="min-width: 150px !important;">E-way Bill No</th>
                        <th class="text-center" style="min-width: 250px !important;">Consignment Value</th>
                        <th class="text-center">Challan No</th>
                        <th class="text-center">Broker</th>
                        <th class="text-center">Reporting Date</th>
                        <th class="text-center">Unloading Date</th>
                        <th class="text-center">No Of Days Detained</th>
                        <th class="text-center">Bill No</th>
                        <th class="text-center">Bill Total Freight for This CN</th>
                        <th class="text-center">Entry By</th>
                    </tr>
                    </thead>
                    <tbody>
                    @if($party_code=="all" && $location=="all")
                        <?php  $area_consignment= \App\Consignment::whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->
                                get(); ?>
                        <?php  $area_consignment_count= \App\Consignment::
                                whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->count(); ?>
                    @elseif($party_code!="all" && $location=="all")
                        <?php  $area_consignment= \App\Consignment::where('party_code','=',$party_code)
                                ->whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->get(); ?>
                        <?php  $area_consignment_count= \App\Consignment::where('party_code','=',$party_code)
                                ->whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->count(); ?>

                    @elseif($party_code=="all" && $location!="all")
                        <?php  $area_consignment= \App\Consignment::where('to','=',$location)
                                ->whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->get(); ?>
                        <?php  $area_consignment_count= \App\CockConsignment::where('to','=',$location)
                                ->whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->count(); ?>
                    @elseif($party_code!="all" && $location!="all")
                        <?php  $area_consignment= \App\Consignment::where('party_code','=',$party_code)
                                ->where('to','=',$location)
                                ->whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->get(); ?>
                        <?php  $area_consignment_count= \App\Consignment::where('party_code','=',$party_code)
                                ->where('to','=',$location)
                                ->whereBetween('con_date', array($from_date, $upto_date))
                                ->orderBy('consignment_no', 'ASC')->count(); ?>
                    @endif
                    <?php $sl_no=1; ?>
                    <?php $overall_cn_value=0;$overall_total_pakage=0;$overall_total_weight=0; ?>
                    @if($area_consignment_count>0)
                        @foreach($area_consignment as $consign)
                            <tr>
                                <?php  $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consign->id)->get(); ?>
                                <?php  $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consign->id)->first(); ?>
                                <?php  $consignment_child_data= \App\Consignment_child::where('consignment_id','=',$consign->id)->get(); ?>
                                <?php  $consignment_child_count= \App\Consignment_child::where('consignment_id','=',$consign->id)->count(); ?>
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
                                @if($consign->consignor_name!="")
                                    <td data-title="Consignor Name" class="text-center">{{$consign->consignor_name}}</td>
                                @else
                                    <td data-title="Consignor Name" class="text-center">-</td>
                                @endif
                                    @if($consign->consignee_name!="")
                                        <td data-title="Consignee Name" class="text-center">{{$consign->consignee_name}}</td>
                                    @else
                                        <td data-title="Consignee Name" class="text-center">-</td>
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
                                @if($consignment_child1->category!="")
                                    <td data-title="Contains" class="text-center">{{$consignment_child1->category}}</td>
                                @else
                                    <td data-title="Contains" class="text-center">-</td>
                                @endif
                                    @if($consignment_child_count>0)
                                        @if($consignment_child_count==1)
                                            <td data-title="Invoice No" class="text-center">@foreach($consignment_child_data as $consignment_child){{$consignment_child->invoice_no}}@endforeach</td>
                                        @else
                                            <td data-title="Invoice No" class="text-center">@foreach($consignment_child_data as $consignment_child){{$consignment_child->invoice_no}},@endforeach</td>
                                        @endif
                                    @else
                                        <td data-title="Invoice No" class="text-center">-</td>
                                    @endif
                                    @if($consignment_child_count>0)
                                        @if($consignment_child_count==1)
                                            <td data-title="E-way Bill No" class="text-center">@foreach($consignment_child_data as $consignment_child){{$consignment_child->way_bill_no}} {{date( 'd/m/Y', strtotime($consignment_child->validity))}}@endforeach</td>
                                        @else
                                            <td data-title="E-way Bill No" class="text-center">@foreach($consignment_child_data as $consignment_child){{$consignment_child->way_bill_no}} {{date( 'd/m/Y', strtotime($consignment_child->validity))}} , @endforeach</td>
                                        @endif
                                    @else
                                        <td data-title="E-way Bill No" class="text-center">-</td>
                                    @endif
                                @if($consign->cn_value!="")
                                    <td data-title="Consignment Value" class="text-center">{{$consign->cn_value}}</td>
                                @else
                                    <td data-title="Consignment Value" class="text-center">-</td>
                                @endif
                                    <?php  $challan_child2_count= \App\CokeChallan_child2::where('consignment_id','=',$consign->id)->count(); ?>
                                    @if($challan_child2_count>0)
                                    <?php  $challan_child2= \App\CokeChallan_child2::where('consignment_id','=',$consign->id)->first(); ?>
                                    <?php  $challan_data= \App\CokeChallan::find($challan_child2->challan_id); ?>
                                    <td data-title="Challan No" class="text-center">{{$challan_data->challan_no}}</td>
                                @else
                                    <td data-title="Challan No" class="text-center">-</td>
                                @endif
                                @if($challan_child2_count>0)
                                <?php  $challan_child2= \App\CokeChallan_child2::where('consignment_id','=',$consign->id)->first(); ?>
                                    <?php  $challan_data= \App\CokeChallan::find($challan_child2->challan_id); ?>
                                    @if($challan_data->broker_name!="")
                                    <td data-title="Broker Name" class="text-center">{{$challan_data->broker_name}}</td>
                                    @else
                                    <td data-title="Broker Name" class="text-center">-</td>
                                    @endif
                                @else
                                    <td data-title="Broker Name" class="text-center">-</td>
                                @endif
                                    @if($challan_child2_count>0)
                                        <?php  $acknowledgement_data= \App\Coke_acknowledgement::where('challan_id','=',$challan_child2->challan_id)->first(); ?>
                                        <?php  $acknowledgement_count_data= \App\Coke_acknowledgement::where('challan_id','=',$challan_child2->challan_id)->count(); ?>
                                            @if($acknowledgement_count_data>0)
                                            <td data-title="Reporting Date" class="text-center">{{date( 'd/m/Y', strtotime($acknowledgement_data->reporting_date))}}</td>
                                            @else
                                                <td data-title="Reporting Date" class="text-center">-</td>
                                                @endif
                                            @else
                                        <td data-title="Reporting Date" class="text-center">-</td>
                                    @endif
                                    @if($challan_child2_count>0)
                                        <?php  $acknowledgement_data= \App\Coke_acknowledgement::where('challan_id','=',$challan_child2->challan_id)->first(); ?>
                                        <?php  $acknowledgement_count_data= \App\Coke_acknowledgement::where('challan_id','=',$challan_child2->challan_id)->count(); ?>
                                        @if($acknowledgement_count_data>0)
                                            <td data-title="Reporting Date" class="text-center">{{date( 'd/m/Y', strtotime($acknowledgement_data->unloading_date))}}</td>
                                            @else
                                                <td data-title="Reporting Date" class="text-center">-</td>
                                            @endif
                                    @else
                                        <td data-title="Reporting Date" class="text-center">-</td>
                                    @endif
                                    @if($challan_child2_count>0)
                                        @if($acknowledgement_count_data>0)
                                            <?php
                                            $fdate = $acknowledgement_data->reporting_date;
                                            $tdate = $acknowledgement_data->unloading_date;
                                            $datetime1 = new DateTime($fdate);
                                            $datetime2 = new DateTime($tdate);
                                            $interval = $datetime1->diff($datetime2);
                                            $days = $interval->format('%a');//now do whatever you like with $days
                                            ?>
                                            <td data-title="No of Days" class="text-center">{{$days}}</td>
                                        @else
                                            <td data-title="No of Days" class="text-center">-</td>
                                        @endif
                                    @else
                                        <td data-title="No of Days" class="text-center">-</td>
                                    @endif
                                    <?php  $bill_freight_child_count= \App\CokeFreightBill_child::where('consignment_id','=',$consign->id)->count(); ?>
                                    @if($bill_freight_child_count>0)
                                        <?php  $bill_freight_child= \App\CokeFreightBill_child::where('consignment_id','=',$consign->id)->first(); ?>
                                        <?php  $bill_freight= \App\CokeFreightBill::find($bill_freight_child->freight_bill_id); ?>
                                        <td data-title="Bill No" class="text-center">{{$bill_freight->bill_no}}</td>
                                    @else
                                        <td data-title="Bill No" class="text-center">-</td>
                                    @endif
                                    <?php  $bill_freight_child_count= \App\CokeFreightBill_child::where('consignment_id','=',$consign->id)->count(); ?>
                                    @if($bill_freight_child_count>0)
                                        <?php  $bill_freight_child= \App\CokeFreightBill_child::where('consignment_id','=',$consign->id)->first(); ?>
                                        <?php  $bill_freight= \App\CokeFreightBill::find($bill_freight_child->freight_bill_id); ?>
                                        <td data-title="Bill Total Freight for this CN" class="text-center">{{$bill_freight_child->total_freight}}</td>
                                    @else
                                        <td data-title="Bill Total Freight for this CN" class="text-center">-</td>
                                    @endif
                                    @if($consign->created_user)
                                        <td data-title="Entry By" class="text-center">{{$consign->created_user}}</td>
                                    @else
                                        <td data-title="Entry By" class="text-center">-</td>
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
        $("#party_name3").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#location3").select2({
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
