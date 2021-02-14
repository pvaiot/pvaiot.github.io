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
        <h2>Branch Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Branch Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">Branch Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-left">SL No</th>
                    <th class="text-left">CITY</th>
                    <th class="text-left">DISTRICT</th>
                    <th class="text-left">STATE</th>
                    <th class="text-left">BRANCH CODE</th>
                    <th class="text-left">ACTION</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($area_branch as $consign)
                    <tr>
                        <td data-title="SL No">{{$sl_no}}</td>
                        @if($consign->city!="")
                            <td data-title="CITY" class="text-left">{{$consign->city}}</td>
                        @else
                            <td data-title="CITY" class="text-left">-</td>
                        @endif
                        @if($consign->dist!="")
                            <td data-title="DISTRICT" class="text-left">{{$consign->dist}}</td>
                        @else
                            <td data-title="DISTRICT" class="text-left">-</td>
                        @endif
                        @if($consign->state!="")
                            <td data-title="STATE" class="text-left">{{$consign->state}}</td>
                        @else
                            <td data-title="STATE" class="text-left">-</td>
                        @endif
                        @if($consign->branch_code!="")
                            <td data-title="BRANCH CODE" class="text-left">{{$consign->branch_code}}</td>
                        @else
                            <td data-title="BRANCH CODE" class="text-left">-</td>
                        @endif
                        <td data-title="ACTION" class="text-left">
                            <a href="{{url('view_branch')}}/{{$consign->id}}" class="on-default"><i class="fa fa-eye" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="{{url('edit_branch')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="delete_branch/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 25px !important;padding-left: 5px;"></i></a>
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