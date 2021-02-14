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
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <a class="btn btn-default" style="margin-bottom: 10px;" href="{{url('createUsers')}}"><i class="fa fa fa-group">&nbsp;</i>New User</a>
    <header class="page-header">
        <h2>User Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>User Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
            </div>
            <h3 class="panel-title">User Details</h3>
        </header>
        <div class="panel-body">
            <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                <thead>
                <tr>
                    <th class="text-center">SL NO.</th>

                    <th class="text-center">Name</th>

                    <th class="text-center">Email</th>

                    <th class="text-center">Employee ID</th>
                    <th class="text-center">Nature&nbsp;&nbsp;</th>
                    <th class="text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php $sl_no=1; ?>
                @foreach($data as $item)

                    <tr class="item{{$item->id}}">
                        <td data-title="SL No">{{$sl_no}}</td>
                        @if($item->name!="")
                            <td data-title="Name" class="text-left">{{$item->name}}</td>
                        @else
                            <td data-title="Name" class="text-left">-</td>
                        @endif
                            @if($item->email!="")
                                <td data-title="Email" class="text-left">{{$item->email}}</td>
                            @else
                                <td data-title="Email" class="text-left">-</td>
                            @endif
                            @if($item->employee_id!="")
                                <td data-title="Employee ID" class="text-left">{{$item->employee_id}}</td>
                            @else
                                <td data-title="Employee ID" class="text-left">-</td>
                            @endif
                            @if($item->role!="")
                                <td data-title="Nature" class="text-left">{{$item->role}}</td>
                            @else
                                <td data-title="Nature" class="text-left">-</td>
                            @endif

                        <td data-title="ACTION" class="text-left">
                            <a href="editUser/{{$item->id}}" class="on-default"><i class="fa fa-pencil" style="width: 25px !important;padding-left: 5px;"></i></a>
                            <a href="deleteUser/{{$item->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 25px !important;padding-left: 5px;"></i></a>
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



