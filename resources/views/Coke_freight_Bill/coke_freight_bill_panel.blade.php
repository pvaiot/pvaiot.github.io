@extends('layouts.newAdminPanalTable')
@section('custom_css')


@endsection
@section('content')
    <br>
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    @if(Session::has('flash_message_error'))
        <div class="alert alert-danger">
            {{ Session::get('flash_message_error') }}
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
                    <th class="text-left">Bill Number</th>
                    <th class="text-left">Date</th>
                    <th class="text-left">Amount</th>
                    <th class="text-left">Party</th>
                    <th class="text-left">Print</th>
                    <th class="text-left">Action</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_bill as $consign)
                    <tr>
                        @if($consign->bill_no!="")
                            <td data-title="Bill No" class="text-left">{{$consign->bill_no}}</td>
                        @else
                            <td data-title="Bill No" class="text-left">-</td>
                        @endif
                        @if($consign->bill_date!="")
                            <td data-title="Date" class="text-left"><?php echo date( 'd-m-Y', strtotime($consign->bill_date)) ?></td>
                        @else
                            <td data-title="Date" class="text-left">-</td>
                        @endif
                        @if($consign->total_amount!="")
                            <td data-title="Amount" class="text-left">{{$consign->total_amount}}</td>
                        @else
                            <td data-title="Amount" class="text-left">-</td>
                        @endif
                        @if($consign->party_name!="")
                            <td data-title="Party" class="text-left">{{$consign->party_name}}</td>
                        @else
                            <td data-title="Party" class="text-left">-</td>
                        @endif
                        <td data-title="Print" class="text-left">
                            <a href="{{url('print_coke_bill')}}/{{$consign->id}}" data-toggle="tooltip" data-placement="top" title="Print" target="_blank" class="btn btn-sm btn-primary">
                                Print
                            </a>
                        </td>
                        <td data-title="ACTION" class="text-left">
                            <a href="{{url('edit_freight_coke_bill')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="delete_coke_bill/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 25px !important;padding-left: 5px;"></i></a>
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

