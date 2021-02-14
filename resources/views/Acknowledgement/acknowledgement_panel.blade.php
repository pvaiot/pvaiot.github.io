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
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">Coke Consignment Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-center">Date</th>
                    <th class="text-center">Challan Number</th>
                    <th class="text-center">Origin</th>
                    <th class="text-center">Destination</th>
                    <th class="text-center">Vehicle No</th>
                    <th class="text-center">Pan No</th>
                    <th class="text-center">Action</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_acknowledgement as $consign)
                    <tr>
                        @if($consign->date!="")
                            <td data-title="Date" class="text-left"><?php echo date( 'd-m-Y', strtotime($consign->date)) ?></td>
                        @else
                            <td data-title="Date" class="text-left">-</td>
                        @endif
                        @if($consign->challan_number!="")
                            <td data-title="Challan Number" class="text-left">{{$consign->challan_number}}</td>
                        @else
                            <td data-title="Challan Number" class="text-left">-</td>
                        @endif
                        @if($consign->origin!="")
                            <td data-title="Origin" class="text-left">{{$consign->origin}}</td>
                        @else
                            <td data-title="Origin" class="text-left">-</td>
                        @endif
                        @if($consign->destination!="")
                            <td data-title="Destination" class="text-left">{{$consign->destination}}</td>
                        @else
                            <td data-title="Destination" class="text-left">-</td>
                        @endif
                        @if($consign->vehicle_no!="")
                            <td data-title="Vehicle No." class="hidden-xs hidden-sm text-left">{{$consign->vehicle_no}}</td>
                        @else
                            <td data-title="Vehicle No." class="hidden-xs hidden-sm text-left">-</td>
                        @endif
                        @if($consign->pan_no!="")
                            <td data-title="Pan No" class="text-left">{{$consign->pan_no}}</td>
                        @else
                            <td data-title="Pan No" class="text-left">-</td>
                        @endif
                        <td data-title="ACTION" class="text-left">
                            <a href="{{url('edit_acknowledgement')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="delete_acknowledgement/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 25px !important;padding-left: 5px;"></i></a>
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
