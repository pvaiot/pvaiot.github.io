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
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">Coke Challan Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-center">Challan Number</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">From</th>
                    <th class="text-center">To</th>
                    <th class="text-center">Print</th>
                    <th class="text-center">Action</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_challan as $consign)
                    <tr>
                        @if($consign->challan_no!="")
                            <td data-title="Challan No" class="text-left">{{$consign->challan_no}}</td>
                        @else
                            <td data-title="Challan No." class="text-left">-</td>
                        @endif
                            @if($consign->date!="")
                                <td data-title="Date" class="text-left"><?php echo date( 'd-m-Y', strtotime($consign->date)) ?></td>
                            @else
                                <td data-title="Date" class="text-left">-</td>
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
                            <td data-title="Print" class="text-center">
                                <a href="{{url('print_lorry_coke_challan')}}/{{$consign->id}}" data-toggle="tooltip" data-placement="top" title="Print Lorry Advance" target="_blank" class="btn btn-sm btn-primary">
                                    Lorry
                                </a>
                                <a href="{{url('print_balance_coke_challan')}}/{{$consign->id}}" data-toggle="tooltip" data-placement="top" title="Print Balance" target="_blank" class="btn btn-sm btn-primary">
                                    Balance
                                </a>
                                <a href="{{url('print_record_coke_challan')}}/{{$consign->id}}" data-toggle="tooltip" data-placement="top" title="Print Record" target="_blank" class="btn btn-sm btn-primary">
                                    Record
                                </a>
                            </td>
                        <td data-title="ACTION" class="text-left">
                            <a href="{{url('edit_coke_challan')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="delete_coke_challan/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 25px !important;padding-left: 5px;"></i></a>
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

