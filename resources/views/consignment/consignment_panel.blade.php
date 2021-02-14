@extends('layouts.newAdminPanalTable')
@section('custom_css')


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
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">Consignment Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-center">Consignment Date</th>
                    <th class="text-center">Consignment No</th>
                    <th class="text-center">Party Code</th>
                    <th class="text-center">From</th>
                    <th class="text-center">To</th>
                    <th class="hidden-xs hidden-sm text-center">Consignor Name</th>
                    <th class="text-center">Truck No</th>
                    <th class="text-center">Print</th>
                    <th class="text-center">Action</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_consignment as $consign)
                    <tr>
                        @if($consign->con_date!="")
                            <td data-title="Consignment Date" class="text-left"><?php echo date( 'd-m-Y', strtotime($consign->con_date)) ?></td>
                        @else
                            <td data-title="Consignment Date" class="text-left">-</td>
                        @endif
                        @if($consign->consignment_no!="")
                            <td data-title="Consignment No" class="text-left">{{$consign->consignment_no}}</td>
                        @else
                            <td data-title="Consignment No." class="text-left">-</td>
                        @endif
                        @if($consign->party_code!="")
                            <td data-title="Party Code" class="text-left">{{$consign->party_code}}</td>
                        @else
                            <td data-title="Party Code" class="text-left">-</td>
                        @endif
                        @if($consign->from!="")
                            <td data-title="From" class="text-left">{{$consign->from}}</td>
                        @else
                            <td data-title="From" class="text-left">-</td>
                        @endif
                        @if($consign->to!="")
                            <td data-title="To" class="text-left">{{$consign->to}}</td>
                        @else
                            <td data-title="To" class="text-left">-</td>
                        @endif
                        @if($consign->consignor_name!="")
                            <td data-title="Consignor Name" class="hidden-xs hidden-sm text-left">{{$consign->consignor_name}}</td>
                        @else
                            <td data-title="Consignor Name" class="hidden-xs hidden-sm text-left">-</td>
                        @endif
                        @if($consign->truck_no!="")
                            <td data-title="Truck No" class="text-left">{{$consign->truck_no}}</td>
                        @else
                            <td data-title="Truck No" class="text-left">-</td>
                        @endif
                        <td data-title="Print" class="text-center">
                            <a href="{{url('print_consignment')}}/{{$consign->id}}" target="_blank" class="btn btn-sm btn-success">
                                Print
                            </a>
                        </td>
                        <td data-title="ACTION" class="text-left">
                            <a href="{{url('edit_consignment')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="delete_consignment/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 25px !important;padding-left: 5px;"></i></a>
                        </td>
                    </tr>
                    <?php $sl_no +=1; ?>
                @endforeach
                </tbody>
            </table>
        </div>
    </section>
    <script>
        $(document).ready(function() {
            $('#table').DataTable();
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

