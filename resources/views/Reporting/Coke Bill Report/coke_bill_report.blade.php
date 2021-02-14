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
        <h2>Coke Bill Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Coke Bill Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <?php echo Form::open(array('route' => 'export_coke_bill_report')); ?>
            <h3 class="panel-title">Coke Bill Details - {{$coke_bill_no}} &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="hidden" name="bill_no" id="bill_no" class="form-control" value="{{$coke_bill_no}}">
                <button type="submit" class="btn btn-md btn-success" id="submit"> Send to Exel </button>
                {{form::close()}}
            </h3>
        </header>
        <div class="panel-body">
            <div class="table-responsive" style="min-height: 110px !important;max-height: 110px;">
                <table class="table table-bordered table-striped table-condensed mb-none">
                    <thead>
                    <tr>
                        <th class="text-center">Bill No</th>
                        <th class="text-center">Bill Date</th>
                        <th class="text-center">Party Name</th>
                        <th class="text-center">Party Address</th>
                        <th class="text-center">Total Amount</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $bill_data=\App\CokeFreightBill::where('bill_no','=',$coke_bill_no)->first(); ?>
                    <tr>
                        <td class="text-center">{{$bill_data->bill_no}}</td>
                        <td class="text-center">{{date( 'd-m-Y', strtotime($bill_data->bill_date))}}</td>
                        <td class="text-center">{{$bill_data->party_name}}</td>
                        <td class="text-center">{{$bill_data->party_address}}</td>
                        <td class="text-center">{{$bill_data->total_amount}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h3>Added Consignment Details</h3>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-condensed mb-none">
                    <thead>
                    <tr>
                        <th class="text-center">SL No.</th>
                        <th class="text-center">Consignment No.</th>
                        <th class="text-center">Consignment Date</th>
                        <th class="text-center">Destination</th>
                        <th class="text-center">Vehicle No</th>
                        <th class="text-center">Weight</th>
                        <th class="text-center">Total QTY</th>
                        <th class="text-center">Freight</th>
                        <th class="text-center">Detention</th>
                        <th class="text-center">SNT Charge</th>
                        <th class="text-center">Toll Tax</th>
                        <th class="text-center">Total Freight</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $bill_data_count=\App\CokeFreightBill_child::where('freight_bill_id','=',$bill_data->id)->count(); ?>

                    @if($bill_data_count>0)
                        <?php $bill_data=\App\CokeFreightBill_child::where('freight_bill_id','=',$bill_data->id)->get(); ?>
                       <?php $sl_no=1; ?>
                        @foreach($bill_data as $bill_data)
                            <tr>
                                <td data-title="SL No." class="text-center">{{$sl_no}}</td>
                                @if($bill_data->consignment_no!="")
                                    <td data-title="Consignment No." class="text-center">{{$bill_data->consignment_no}}</td>
                                @else
                                    <td data-title="Consignment No." class="text-center">-</td>
                                @endif
                                @if($bill_data->consignment_date!="")
                                    <td data-title="Consignment Date" class="text-center"><?php echo date( 'd-m-Y', strtotime($bill_data->consignment_date)) ?></td>
                                @else
                                    <td data-title="Consignment Date" class="text-center">-</td>
                                @endif
                                @if($bill_data->consignment_to!="")
                                    <td data-title="Destination" class="text-center">{{$bill_data->consignment_to}}</td>
                                @else
                                    <td data-title="Destination" class="text-center">-</td>
                                @endif
                                @if($bill_data->consignment_vehicle_no!="")
                                    <td data-title="Vehicle No" class="text-center">{{$bill_data->consignment_vehicle_no}}</td>
                                @else
                                    <td data-title="Vehicle No" class="text-center">-</td>
                                @endif
                                @if($bill_data->weight!="")
                                    <td data-title="Weight" class="text-center">{{$bill_data->weight}}</td>
                                @else
                                    <td data-title="Weight" class="text-center">-</td>
                                @endif
                                @if($bill_data->consignment_qty!="")
                                    <td data-title="Total QTY" class="text-center">{{$bill_data->consignment_qty}}</td>
                                @else
                                    <td data-title="Total QTY" class="text-center">-</td>
                                @endif
                                @if($bill_data->freight!="")
                                    <td data-title="Freight" class="text-center">{{$bill_data->freight}}</td>
                                @else
                                    <td data-title="Freight" class="text-center">-</td>
                                @endif
                                @if($bill_data->detention!="")
                                    <td data-title="Detention" class="text-center">{{$bill_data->detention}}</td>
                                @else
                                    <td data-title="Detention" class="text-center">-</td>
                                @endif
                                @if($bill_data->snt_charge!="")
                                    <td data-title="SNT Charge" class="text-center">{{$bill_data->snt_charge}}</td>
                                @else
                                    <td data-title="SNT Charge" class="text-center">-</td>
                                @endif
                                @if($bill_data->toll_tax!="")
                                    <td data-title="Toll Tax" class="text-center">{{$bill_data->toll_tax}}</td>
                                @else
                                    <td data-title="Toll Tax" class="text-center">-</td>
                                @endif
                                @if($bill_data->total_freight!="")
                                    <td data-title="Total Freight" class="text-center">{{$bill_data->total_freight}}</td>
                                @else
                                    <td data-title="Total Freight" class="text-center">-</td>
                                @endif
                            </tr>
                            <?php $sl_no+=1; ?>

                        @endforeach
                    @else
                        <div class="well col-md-12">
                            <h4>Consignment Not Added In This Bill Yet!!!</h4>
                        </div>
                    @endif

                    </tbody>
                </table>
            </div>
        </div>
        <header class="panel-heading">

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
