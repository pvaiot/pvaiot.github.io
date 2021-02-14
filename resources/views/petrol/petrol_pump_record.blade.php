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
        <a class="btn btn-md btn-warning" style="margin-left:90px;margin-bottom: 20px; " href="{{url('petrol_pump')}}"><span class="glyphicon glyphicon-home"></span> Back To Home</a>
        <a class="btn btn-md btn-success" style="margin-left:90px;margin-bottom: 20px; " href="" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-home"></span> Report By Date</a>
<?php $final_bills= \App\Petrol_Pump::find($id); ?>
            <h3 class="text-center"><span style="border-bottom: solid 2px green;padding-top: 20px!important;">{{$final_bills->name}}</span></h3>
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
            @foreach($area_location as $consign)
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
    <div class="modal fade" id="myModal2"  role="dialog" aria-labelledby="myModalLabel">
        <?php echo Form::open(array('route' => 'petrol_pump_recordbydate','id'=>"data_form",'name'=>"data_form"))?>
        <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Get Record By Date</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-sm-6">
                                <div class="form-group has-success has-feedback">From Date
                                    <input type="text" name="from_date" id="date" class="form-control" placeholder="From Date" required />
                                    {{--<input type="hidden" name="_token" value="{{ csrf_token() }}">--}}
                                    <input type="hidden" name="id" value="{{ $id }}">
                                </div>
                            </div>
                                <div class="col-md-6 col-lg-6 col-sm-6">
                                    <div class="form-group has-success has-feedback">To Date
                                        <input type="text" name="to_date" id="to_date" class="form-control" placeholder="To Date" required />
                                    </div>
                                </div>

                        </div>


                    </div>



                    <div class="modal-footer clearfix">
                        <div class="row">
                            {{--<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 col-md-offset-3">--}}
                            {{--<button type="reset" class="btn btn-success" data-dismiss="modal"><i class="fa fa-refresh"></i> Clear</button>--}}
                            {{--</div>--}}
                            <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                <button type="button" class="btn btn-danger" data-dismiss="modal"> Close</button>
                            </div>
                            <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                <button type="submit" id="addnewbroker"  class="btn btn-primary"> Proceed</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
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
        $(function() {
            $("#date")
                    .mask(
                    '99/99/9999',
                    { validate: function (fld,cur) {
                        // 1 == month; 0 == day; 2 == year
                        var mm = parseInt(fld[1]),
                                dd = parseInt(fld[0]),
                                yy = parseInt(fld[2]),
                                vl = true;
                        if (!(mm >= 0 && mm < 13) && cur == 1) {
                            fld[1] = '12';
                            vl = false;
                        }
                        if (!(dd >= 0 && dd <= 31) && cur == 0) {
                            fld[0] = '01';
                            vl = false;
                        }
                        if (!(yy >= 1976 && yy < 2199) && cur == 2 && fld[2].replace('_','').length == 4) {
                            fld[2] = '2012';
                            vl = false;
                        }
                        return vl;
                    }
                    });

        });
        $(function() {
            $("#to_date")
                    .mask(
                    '99/99/9999',
                    { validate: function (fld,cur) {
                        // 1 == month; 0 == day; 2 == year
                        var mm = parseInt(fld[1]),
                                dd = parseInt(fld[0]),
                                yy = parseInt(fld[2]),
                                vl = true;
                        if (!(mm >= 0 && mm < 13) && cur == 1) {
                            fld[1] = '12';
                            vl = false;
                        }
                        if (!(dd >= 0 && dd <= 31) && cur == 0) {
                            fld[0] = '01';
                            vl = false;
                        }
                        if (!(yy >= 1976 && yy < 2199) && cur == 2 && fld[2].replace('_','').length == 4) {
                            fld[2] = '2012';
                            vl = false;
                        }
                        return vl;
                    }
                    });

        });
    </script>
@endsection