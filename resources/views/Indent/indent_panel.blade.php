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
        <h2>Indent Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Indent Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">Indent Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-center">Indent No</th>
                    <th class="text-center">Indent Date</th>
                    <th class="text-center">Branch Code</th>
                    <th class="text-center">Origin</th>
                    <th class="text-center">Consignor Name</th>
                    <th class="text-center">Placement</th>
                    <th class="text-center">ACTION</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_indent as $consign)
                    <tr>
                        @if($consign->indent_no !="")
                            <td data-title="Indent NO" class="text-left">{{$consign->indent_no}}</td>
                        @else
                            <td data-title="Indent NO" class="text-left">-</td>
                        @endif
                        @if($consign->indent_date!="")
                            <td data-title="Indent Date" class="text-left">{{date( 'd/m/Y', strtotime($consign->indent_date))}}</td>
                        @else
                            <td data-title="Indent Date" class="text-left">-</td>
                        @endif
                        @if($consign->branch_code!="")
                            <td data-title="Branch Code" class="text-left">{{$consign->branch_code}}</td>
                        @else
                            <td data-title="Branch Code" class="text-left">-</td>
                        @endif
                        @if($consign->origin!="")
                            <td data-title="Origin" class="text-left">{{$consign->origin}}</td>
                        @else
                            <td data-title="Origin" class="text-left">-</td>
                        @endif
                        @if($consign->consignor_name!="")
                            <td data-title="Consignor Name" class="text-left">{{$consign->consignor_name}}</td>
                        @else
                            <td data-title="Consignor Name" class="text-left">-</td>
                        @endif
                        <td data-title="Placement" class="text-left">
                            <a href="{{url('placement_indent')}}/{{$consign->id}}" class="btn btn-sm btn-success">Placement</a>
                        </td>
                        <td data-title="ACTION" class="text-left">
                            <a href="{{url('edit_indent')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 15px !important;padding-left: 5px;"></i></a>&nbsp;&nbsp;
                            <a href="delete_indent/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 15px !important;padding-left: 5px;"></i></a>
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