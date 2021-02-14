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
        <h2>Consignment Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Consignment Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <div class="panel-body">
        <?php echo Form::open(array('route' => 'party_wise_coke_consignment_report', 'method'=>'get')); ?>
            <div class="col-sm-4">
                <select id='party_name' name='party_name' class="form-control" style="width: 100%;">
                    <option value=""> Select Party Name</option>
                    <?php  $datas = App\Party::all(); ?>
                    @foreach($datas as $data)
                        <option value="{{$data->party_code}}">{{$data->name}}</option>
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
            <?php echo Form::open(array('route' => 'export_party_wise_consignment_data')); ?>
            <h3 class="panel-title">Consignment Details For &nbsp;- <strong>{{$party_name}}</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="hidden" name="party_code" id="party_code" class="form-control" value="{{$party_code}}">
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
                    <?php  $area_consignment= \App\Consignment::where('party_code','=',$party_code)->orderBy('con_date', 'ASC')->get(); ?>
                    <?php  $area_consignment_count= \App\Consignment::where('party_code','=',$party_code)->orderBy('con_date', 'ASC')->count(); ?>
                    <?php $sl_no=1; ?>
                    <?php $overall_cn_value=0;$overall_total_pakage=0;$overall_total_weight=0; ?>
                    @if($area_consignment_count>0)
                        @foreach($area_consignment as $consign)
                            <tr>
                                <?php  $consignment_child2= \App\Consignment_child2::where('consignment_id','=',$consign->id)->get(); ?>
                                <?php  $consignment_child1= \App\Consignment_child2::where('consignment_id','=',$consign->id)->first(); ?>
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
