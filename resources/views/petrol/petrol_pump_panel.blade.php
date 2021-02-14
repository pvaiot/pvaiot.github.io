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
        <h2>Petrol Pump Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Petrol Pump Detailss</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">Petrol Pump Details Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-left">SL No</th>
                    <th class="text-left">NAME</th>
                    <th class="text-left">ADDRESS</th>
                    <th class="text-left">ACTION</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_location as $consign)
                    <tr>
                        <td data-title="SL No">{{$sl_no}}</td>
                        @if($consign->name!="")
                            <td data-title="NAME" class="text-left">{{$consign->name}}</td>
                        @else
                            <td data-title="NAME" class="text-left">-</td>
                        @endif
                        @if($consign->address!="")
                            <td data-title="ADDRESS" class="text-left">{{$consign->address}}</td>
                        @else
                            <td data-title="ADDRESS" class="text-left">-</td>
                        @endif
                        <td data-title="ACTION" class="text-left">
                            <a href="{{url('view_petrol_pump_report')}}/{{$consign->id}}" class="on-default"><i class="fa fa-print" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="{{url('view_petrol_pump')}}/{{$consign->id}}" class="on-default"><i class="fa fa-eye" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="{{url('edit_petrol_pump')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="delete_petrol_pump/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 25px !important;padding-left: 5px;"></i></a>
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