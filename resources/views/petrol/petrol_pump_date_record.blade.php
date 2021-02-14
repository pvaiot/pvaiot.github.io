@extends('layouts.adminPanel')
@section('title')
    Admin Panel
@endsection
@section('custom_css')

    <style>

        .table-striped>tbody>tr:nth-child(2n+1)>td,
        .table-striped>tbody>tr:nth-child(2n+1)>th {
            /*background-color:  #e1f8ff;*/
            background-color: #EEEEEE;
        }

        td {

            text-transform: capitalize !important;
            font-size: 13px;
        }

        th {
            font-size: 14px;
        }

        .modal label {
            font-size: 12px;
        }

    </style>
@endsection
@section('content')

    <div class="well">
        @if(Session::has('flash_message1'))
            <div class="alert alert-danger">
                <span class="glyphicon glyphicon-ban-circle"></span> {{ Session::get('flash_message1') }}
            </div>
        @endif
        <br>
        <!-- <a class="btn btn-sm btn-info" style="margin-left:90px;margin-bottom: 20px; " href="{{url('new_location_entry')}}">+New Location Entry</a> -->
        <a class="btn btn-md btn-warning" style="margin-left:90px;margin-bottom: 20px; " href="{{url('petrol_pump')}}"><span class="glyphicon glyphicon-home"></span> Back</a>

            <?php $final_bills= \App\Petrol_Pump::find($id); ?>
            <h3 class="text-center"><span style="padding-top: 20px!important;">{{$final_bills->name}}</span></h3>
            <h3 class="text-center"><span style="border-bottom: solid 2px green;padding-top: 20px!important;font-size: 20px;">{{$from_date}} - {{$to_date}}</span></h3>
            <table class="table table-striped table-bordered" id="table">
            <thead>
            <tr>
                <th class="text-center">SL No</th>
                <th class="text-center">DATE</th>
                <th class="text-center">AMOUNT</th>
            </tr>
            </thead>
            <tbody>
            <?php $sl_no=1;
            $total_amount=0;?>
            @foreach($final_record as $consign)
                <tr>

                    <td class="text-center">{{$sl_no}}</td>
                    <td class="text-center"><?php echo date( 'd/m/y', strtotime($consign->challan_date)) ?></td>
                    <td class="text-center">{{sprintf('%0.2f', $consign->amount)}}</td>
                    <?php $total_amount+=$consign->amount; ?>
                </tr>
                <?php $sl_no +=1; ?>
            @endforeach
            </tbody>
            <tr>
                <td class="text-center"></td>
                <td class="text-center">Total Amount</td>
                <td class="text-center">{{sprintf('%0.2f', $total_amount)}}</td>
            </tr>
        </table>
    </div>
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