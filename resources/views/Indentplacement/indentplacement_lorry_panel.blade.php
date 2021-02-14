

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
        <h2>Indent Placement Lorry Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Indent Placement Lorry Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">Indent Placement Lorry Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-center">S.L. No</th>
                    <th class="text-center">Truck No</th>
                    <th class="text-center">Destination</th>
                    <th class="text-center">Lorry Entry</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_indentplacement as $consign)
                    <?php
                    $lorry= \App\Lorry::where('truck_no',$consign->truck_no)->count();
                    ?>
                    @if($lorry<=0 && $consign->truck_no!="")
                    <tr>
                            <td data-title="SL NO" class="text-left">{{$sl_no}}</td>
                        @if($consign->truck_no!="")
                            <td data-title="Truck No" class="text-left"><a href="lorry_entry_indent/{{$consign->id}}">{{$consign->truck_no}}</a></td>
                        @else
                            <td data-title="Truck No" class="text-left">-</td>
                        @endif
                        @if($consign->destination!="")
                            <td data-title="Destination" class="text-left">{{$consign->destination}}</td>
                        @else
                            <td data-title="Destination" class="text-left">-</td>
                        @endif
                        <td data-title="Lorry Entry" class="text-left">
                            <a href="{{url('lorry_entry_indent')}}/{{$consign->id}}" class="btn btn-sm btn-success">Add To Lorry</a>
                        </td>
                    </tr>
                    <?php $sl_no+=1; ?>
                    @endif

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
