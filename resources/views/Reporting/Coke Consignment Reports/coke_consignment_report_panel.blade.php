@extends('layouts.newAdminPanal_select')
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
     <header class="page-header">
        <h2>Coke Consignment Report</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Coke Consignment Report</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <section class="panel">
        <div class="row">
            <div class="col-md-6">
                <div class="panel-group" id="accordionSuccess">
                    <div class="panel panel-accordion panel-accordion-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSuccess" href="#collapseSuccessOne">
                                    <i class="fa fa-caret-down"></i> Date Wise Report
                                </a>
                            </h4>
                        </div>
                        <div id="collapseSuccessOne" class="accordion-body collapse">
                            <div class="panel-body">
                                <?php echo Form::open(array('route' => 'date_wise_coke_consignment_report', 'method'=>'get')); ?>
                                    <div class="row" style="margin: 20px">
                                        <div class="col-sm-6" >
                                            <label for="date_wise_date_from" style="font-size: small">Date From (DD/MM/YYYY)</label><br>
                                            <input type="text" name="date_wise_date_from" id="date_wise_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="date_wise_date_to" style="font-size: small">Date Upto (DD/MM/YYYY)</label><br>
                                            <input type="text" name="date_wise_date_upto" id="date_wise_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" name="date_wise_submit" class="btn btn-primary">View</button>
                                    </div>
                                {{form::close()}}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion panel-accordion-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSuccess" href="#collapseSuccessTwo">
                                    <i class="fa fa-caret-down"></i> Party Wise Report
                                </a>
                            </h4>
                        </div>
                        <div id="collapseSuccessTwo" class="accordion-body collapse">
                            <div class="panel-body">
                                <?php echo Form::open(array('route' => 'party_wise_coke_consignment_report', 'method'=>'get')); ?>
                                <div class="row" style="margin: 20px">
                                    <div class="col-sm-12">
                                        <label for="party_name" style="font-size: small">Party Name</label><br>
                                        <select id='party_name' name='party_name' class="form-control" style="width: 100%;">
                                            <option value=""> Select Party Code</option>
                                            <?php  $datas = App\Party::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->party_code}}">{{$data->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">View</button>
                                </div>
                                {{form::close()}}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion panel-accordion-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionSuccess" href="#collapseSuccessThree">
                                    <i class="fa fa-caret-down"></i> Truck No. & Date Wise Report
                                </a>
                            </h4>
                        </div>
                        <div id="collapseSuccessThree" class="accordion-body collapse">
                            <div class="panel-body">
                                <?php echo Form::open(array('route' => 'truck_date_wise_coke_consignment_report', 'method'=>'get')); ?>
                                <div class="row" style="margin: 20px">
                                    <div class="col-sm-12">
                                        <label for="truck_no" style="font-size: small">Truck No</label><br>
                                        <select id='truck_no' name='truck_no' class="form-control" style="width: 100%;">
                                            <option value=""> Select Truck No</option>
                                            <?php  $datas = \App\Lorry::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->truck_no}}">{{$data->truck_no}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-6" >
                                        <label for="truck_date_wise_date_from" style="font-size: small">Date From (DD/MM/YYYY)</label><br>
                                        <input type="text" name="truck_date_wise_date_from" id="truck_date_wise_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="truck_date_wise_date_upto" style="font-size: small">Date Upto (DD/MM/YYYY)</label><br>
                                        <input type="text" name="truck_date_wise_date_upto" id="truck_date_wise_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">View</button>
                                </div>
                                {{form::close()}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="panel-group" id="accordionWarning">
                    <div class="panel panel-accordion panel-accordion-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionWarning" href="#collapseWarningOne">
                                    <i class="fa fa-caret-down"></i> Party and Date Wise Report
                                </a>
                            </h4>
                        </div>
                        <div id="collapseWarningOne" class="accordion-body collapse">
                            <div class="panel-body">
                                <?php echo Form::open(array('route' => 'party_date_wise_coke_consignment_report', 'method'=>'get')); ?>
                                <div class="row" style="margin: 20px">
                                    <div class="col-sm-12">
                                        <label for="party_name" style="font-size: small">Party Name</label><br>
                                        <select id='party_name2' name='party_name2' class="form-control" style="width: 100%;">
                                            <option value=""> Select Party Code</option>
                                            <?php  $datas = App\Party::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->party_code}}">{{$data->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-6" >
                                        <label for="party_date_wise_date_from" style="font-size: small">Date From (DD/MM/YYYY)</label><br>
                                        <input type="text" name="party_date_wise_date_from" id="party_date_wise_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="party_date_wise_date_upto" style="font-size: small">Date Upto (DD/MM/YYYY)</label><br>
                                        <input type="text" name="party_date_wise_date_upto" id="party_date_wise_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">View</button>
                                </div>
                                {{form::close()}}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion panel-accordion-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionWarning" href="#collapseWarningTwo">
                                    <i class="fa fa-caret-down"></i> Location and Date Wise Report
                                </a>
                            </h4>
                        </div>
                        <div id="collapseWarningTwo" class="accordion-body collapse">
                            <div class="panel-body">
                                <?php echo Form::open(array('route' => 'location_date_wise_coke_consignment_report', 'method'=>'get')); ?>
                                <div class="row" style="margin: 20px">
                                    <div class="col-sm-12">
                                        <label for="location" style="font-size: small">Location</label><br>
                                        <select id='location' name='location' class="form-control" style="width: 100%;">
                                            <option value=""> Select location</option>
                                            <?php  $datas = App\Location::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->city}}">{{$data->city}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-6" >
                                        <label for="party_date_wise_date_from" style="font-size: small">Date From (DD/MM/YYYY)</label><br>
                                        <input type="text" name="location_date_wise_date_from" id="location_date_wise_date_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="party_date_wise_date_upto" style="font-size: small">Date Upto (DD/MM/YYYY)</label><br>
                                        <input type="text" name="location_date_wise_date_upto" id="location_date_wise_date_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">View</button>
                                </div>
                                {{form::close()}}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion panel-accordion-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionWarning" href="#collapseWarningThree">
                                    <i class="fa fa-caret-down"></i> Unbilled Consignment
                                </a>
                            </h4>
                        </div>
                        <div id="collapseWarningThree" class="accordion-body collapse">
                            <div class="panel-body">
                                <?php echo Form::open(array('route' => 'unbilled_coke_consignment_report', 'method'=>'get')); ?>
                                <div class="row" style="margin: 20px">
                                    <div class="col-sm-6" >
                                        <label for="unbilled_from" style="font-size: small">Date From (DD/MM/YYYY)</label><br>
                                        <input type="text" name="unbilled_from" id="unbilled_from" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="unbilled_upto" style="font-size: small">Date Upto (DD/MM/YYYY)</label><br>
                                        <input type="text" name="unbilled_upto" id="unbilled_upto" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">View</button>
                                </div>
                                {{form::close()}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel-group" id="accordion2">
                    <div class="panel panel-accordion panel-accordion-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapse2Five">
                                    <i class="fa fa-caret-down"></i> Detailed Booking Report
                                </a>
                            </h4>
                        </div>
                        <div id="collapse2Five" class="accordion-body collapse">
                            <div class="panel-body">
                                <?php echo Form::open(array('route' => 'detailed_coke_consignment_report', 'method'=>'get')); ?>
                                <div class="form-group col-sm-2">
                                    <div class="col-sm-12">
                                        <input type="text" name="from_date3" id="from_date3" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                </div>
                                <div class="form-group col-sm-2">
                                    <div class="col-sm-12">
                                        <input type="text" name="upto_date3" id="upto3" class="styledate form-control" placeholder="__/__/____" value="<?php echo date('d/m/Y');?>" />
                                    </div>
                                </div>
                                    <div class="col-sm-3">
                                        <select id='party_name3' name='party_name3' class="form-control" style="width: 100%;">
                                            <option value="all"> All Party</option>
                                            <?php  $datas = App\Party::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->party_code}}">{{$data->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <select id='location3' name='location3' class="form-control" style="width: 100%;">
                                            <option value="all"> All Destination</option>
                                            <?php  $datas = App\Location::all(); ?>
                                            @foreach($datas as $data)
                                                <option value="{{$data->city}}">{{$data->city}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="submit" class="btn btn-primary">View</button>
                                    </div>
                                {{form::close()}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        var destination =  [/* states array*/];
        $("#party_name").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#party_name2").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#location").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#party_name3").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#location3").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#truck_no").select2({
            data: destination
        });

        $(function() {
            $(".styledate")
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



