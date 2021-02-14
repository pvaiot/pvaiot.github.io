@extends('layouts.newAdminPanal_select')
@section('custom_css')
    <style>
        table, tr,td{
            border-top: none!important;
        }
        .btn{
            padding-top: 8px;
            padding-bottom: 8px;

        }
        .select2-container .select2-selection--single {
            height: 35px !important;
            border-color:#555555!important;

        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-top: 3px!important;
        }
        select{
            width: 100%;
        }
        #consignment_no_error{
            display: none;
            margin-bottom: -10px;
        }#error_location{
             display: none;
         }
        .btn:focus{
            background-color: #0088cc !important;
            font-size: 15px;
        }
        table tbody tr td{
            border: 1px solid lightslategray !important
        }
    </style>
@endsection
@section('content')
    <br>
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <header class="page-header">
        <h2>View Consignment Data</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>View Consignment Data</span></li>
            </ol>

            <a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif
    @if(Session::has('flash_message_error'))
        <div class="alert alert-danger">
            {{ Session::get('flash_message_error') }}
        </div>
    @endif
    <div class="row">

        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Consignment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Challan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Acknowledgement</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">Bill</a>
            </li>
        </ul>
        <?php $consignment_data=\App\Consignment::where('consignment_no','=',$consignment_no)->first(); ?>
        <div class="tab-content">
            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Consignment Info</h4>
                    <table class="table table-striped">
                        <tbody>
                        <tr>
                            <td width="200px">Consignment No</td>
                            <td>{{$consignment_data->consignment_no}}</td>

                        </tr>
                        <tr>
                            <td>Consignment Date</td>
                            <td>{{date('d/m/Y',strtotime($consignment_data->con_date))}}</td>

                        </tr>
                        <tr>
                            <td>Party Code</td>
                            <td>{{$consignment_data->party_code}}</td>

                        </tr>
                        <tr>
                            <td>Consignor Name</td>
                            <td>{{$consignment_data->consignor_name}}</td>

                        </tr>
                        <tr>
                            <td>Consignor Address</td>
                            <td>{{$consignment_data->consignor_address}}</td>

                        </tr>
                        <tr>
                            <td>Consignee Name</td>
                            <td>{{$consignment_data->consignee_name}}</td>

                        </tr>
                        <tr>
                            <td>Consignee Address</td>
                            <td>{{$consignment_data->consignee_address}}</td>

                        </tr>
                        <tr>
                            <td>From</td>
                            <td>{{$consignment_data->from}}</td>

                        </tr>
                        <tr>
                            <td>To</td>
                            <td>{{$consignment_data->to}}</td>

                        </tr>
                        <tr>
                            <td>Truck Type</td>
                            <td>{{$consignment_data->truck_type}}</td>

                        </tr>

                        <tr>
                            <td>Truck No</td>
                            <td>{{$consignment_data->truck_no}}</td>

                        </tr>
                        <tr>
                            <td>Billed At</td>
                            <td>{{$consignment_data->billed_at}}</td>

                        </tr>
                        <tr>
                            <td>Entry By</td>
                            <td>{{$consignment_data->created_user}}</td>

                        </tr>
                        </tbody>
                    </table>
                        <h4>Total Info</h4>
                        <?php $consignment_child2_total_info=\App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get(); ?>
                        <?php
                        $total_packages=0;
                        $total_gross_weight=0;
                        ?>
                        @foreach($consignment_child2_total_info as $consignment_child2_total_info)
                           <?php
                            $total_packages+=(float)$consignment_child2_total_info->package;
                            $total_gross_weight+=(float)$consignment_child2_total_info->gross_weight;
                            ?>
                            @endforeach
                        <table class="table table-striped">
                            <tbody>
                            <tr>
                                <td width="200px">Consignment Value</td>
                                <td>{{$consignment_data->cn_value}}</td>
                            </tr>
                            <tr>
                                <td width="200px">Total Packages</td>
                                <td>{{$total_packages}}</td>
                            </tr>
                            <tr>
                                <td width="200px">Total Packages</td>
                                <td>{{$total_gross_weight}}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <h4>Invoice Info</h4>
                        <?php $consignment_child=\App\Consignment_child::where('consignment_id','=',$consignment_data->id)->get(); ?>
                        @foreach($consignment_child as $consignment_child)
                        <table class="table table-striped">
                            <tbody>
                                    <tr>
                                        <td width="200px">Invoice No</td>
                                        <td>{{$consignment_child->invoice_no}}</td>

                                    </tr>
                                    <tr>
                                        <td>Invoice Date</td>
                                        <td>{{date('d/m/Y',strtotime($consignment_child->invoice_date))}}</td>

                                    </tr>
                                    <tr>
                                        <td>Invoice Value</td>
                                        <td>{{$consignment_child->invoice_value}}</td>

                                    </tr>
                                    <tr>
                                        <td>Way Bill No</td>
                                        <td>{{$consignment_child->way_bill_no}}</td>

                                    </tr>
                                    <tr>
                                        <td>Validity</td>
                                        @if($consignment_child->validity!=null)
                                        <td>{{date('d/m/Y',strtotime($consignment_child->validity))}}</td>
                                            @else
                                            <td></td>
                                        @endif
                                    </tr>
                            </tbody>
                        </table>
                            @endforeach
                    </div>
                    <div class="col-md-6">
                        <h4>Package Info</h4>
                        <?php $consignment_child2=\App\Consignment_child2::where('consignment_id','=',$consignment_data->id)->get(); ?>
                        @foreach($consignment_child2 as $consignment_child2)
                            <table class="table table-striped">
                                <tbody>
                                <tr>
                                    <td width="200px">Category</td>
                                    <td>{{$consignment_child2->category}}</td>

                                </tr>
                                <tr>
                                    <td>Discription</td>
                                    <td>{{$consignment_child2->description}}</td>

                                </tr>
                                <tr>
                                    <td>Packages</td>
                                    <td>{{$consignment_child2->package}}</td>

                                </tr>
                                <tr>
                                    <td>Net Weight</td>
                                    <td>{{$consignment_child2->net_weight}}</td>

                                </tr>
                                <tr>
                                    <td>Gross Weight</td>
                                    <td>{{$consignment_child2->gross_weight}}</td>

                                </tr>
                                <tr>
                                    <td>Remarks</td>
                                    <td>{{$consignment_child2->remark}}</td>

                                </tr>
                                </tbody>
                            </table>
                        @endforeach
                    </div>
                </div><br>
                <a href="{{url('print_consignment')}}/{{$consignment_data->id}}" target="_blank" class="btn btn-sm btn-success">
                    Print Consignment
                </a>
                <a href="{{url('edit_consignment')}}/{{$consignment_data->id}}" target="_blank" class="btn btn-sm btn-warning">
                    Edit Consignment
                </a>
            </div>
            <div class="tab-pane" id="tabs-2" role="tabpanel">
                <?php $challan_child2_data_count=\App\Challan_Child2::where('consignment_id','=',$consignment_data->id)->count(); ?>
                    @if($challan_child2_data_count>0)
                    <?php $challan_child2_data=\App\Challan_Child2::where('consignment_id','=',$consignment_data->id)->first(); ?>
                    <?php $challan_data=\App\Challan::find($challan_child2_data->challan_id); ?>
                <div class="row">
                    <div class="col-md-6">
                        <h4>Challan Info</h4>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td width="250px">Challan No.</td>
                            <td>{{$challan_data->challan_no}}</td>

                        </tr>
                        <tr>
                            <td>Date</td>
                            <td>{{date('d/m/Y',strtotime($challan_data->date))}}</td>

                        </tr>
                        <tr>
                            <td>From</td>
                            <td>{{$challan_data->from}}</td>

                        </tr>
                        <tr>
                            <td>To</td>
                            <td>{{$challan_data->to}}</td>

                        </tr>
                        <tr>
                            <td>Truck No.</td>
                            <td>{{$challan_data->truck_no}}</td>

                        </tr>
                        <tr>
                            <td>Engine No.</td>
                            <td>{{$challan_data->engine_no}}</td>

                        </tr>
                        <tr>
                            <td>Chassis No.</td>
                            <td>{{$challan_data->chassis_no}}</td>

                        </tr>
                        <tr>
                            <td>Make</td>
                            <td>{{$challan_data->make}}</td>

                        </tr>
                        <tr>
                            <td>Owner's Name</td>
                            <td>{{$challan_data->owners_name}}</td>

                        </tr>
                        <tr>
                            <td>Owner's Address</td>
                            <td>{{$challan_data->owners_address}}</td>

                        </tr>
                        <tr>
                            <td>Owner's Phone</td>
                            <td>{{$challan_data->owners_phone}}</td>

                        </tr>
                        <tr>
                            <td>Pan Applicable</td>
                            <td>{{$challan_data->pan_applicable}}</td>

                        </tr>
                        <tr>
                            <td>Pan Of</td>
                            <td>{{$challan_data->pan_of}}</td>

                        </tr>
                        <tr>
                            <td>Pan No.</td>
                            <td>{{$challan_data->pan_no}}</td>

                        </tr>
                        <tr>
                            <td>Pan Name</td>
                            <td>{{$challan_data->pan_name}}</td>

                        </tr>
                        <tr>
                            <td>Declaration Submitted</td>
                            <td>{{$challan_data->declaration_submitted}}</td>

                        </tr>
                        <tr>
                            <td>Broker</td>
                            <td>{{$challan_data->broker}}</td>

                        </tr>
                        <tr>
                            <td>Broker Name</td>
                            <td>{{$challan_data->broker_name}}</td>

                        </tr>
                        <tr>
                            <td>Broker Phone</td>
                            <td>{{$challan_data->challan_no}}</td>

                        </tr>
                        <tr>
                            <td>Broker's Slip No.</td>
                            <td>{{$challan_data->broker_slip_no}}</td>

                        </tr>
                        <tr>
                            <td>Insurance Name</td>
                            <td>{{$challan_data->insurance_name}}</td>

                        </tr>
                        <tr>
                            <td>Policy No.</td>
                            <td>{{$challan_data->policy_no}}</td>

                        </tr>
                        <tr>
                            <td>Place Of Issue</td>
                            <td>{{$challan_data->insurance_place_issue}}</td>

                        </tr>
                        <tr>
                            <td>Driver's Name</td>
                            <td>{{$challan_data->drivers_name}}</td>

                        </tr>
                        <tr>
                            <td>Driver's Address</td>
                            <td>{{$challan_data->drivers_address}}</td>

                        </tr>
                        <tr>
                            <td>License No. </td>
                            <td>{{$challan_data->license_no}}</td>

                        </tr>
                        <tr>
                            <td>Place Of Issue for Licence No.</td>
                            <td>{{$challan_data->place_of_issue}}</td>

                        </tr>
                        <tr>
                            <td>Driver's Contact No.</td>
                            <td>{{$challan_data->drivers_contact_no}}</td>

                        </tr>
                        <tr>
                            <td>Balance Payable At</td>
                            <td>{{$challan_data->balance_payable_at}}</td>

                        </tr>
                        <tr>
                            <td>Freight Amount</td>
                            <td>{{$challan_data->freight}}</td>

                        </tr>
                        <tr>
                            <td>Deisel Amount</td>
                            <td>{{$challan_data->diesel}}</td>

                        </tr>
                        <tr>
                            <td>Cash Advance</td>
                            <td>{{$challan_data->cash_advance}}</td>

                        </tr>
                        <tr>
                            <td>Petrol Pump</td>
                            @if($challan_data->petrol_pump_id>0)
                                <?php $petrol_pump_name=\App\Petrol_Pump::find($challan_data->petrol_pump_id); ?>
                            <td>{{$petrol_pump_name->name}}</td>
                                @else
                            <td></td>
                            @endif

                        </tr>
                        <tr>
                            <td>Balance Amount</td>
                            <td>{{$challan_data->balance}}</td>

                        </tr>
                        <tr>
                            <td>Entry By</td>
                            <td>{{$challan_data->created_by}}</td>

                        </tr>

                        </tbody>
                    </table>
                    </div>
                    <div class="col-md-6">
                        <h4>Consignment Added In Challan Info</h4>
                        <table class="table table-bordered">
                            <tbody>
                            <?php $challan_child2_count=\App\Challan_Child2::where('challan_id','=',$challan_data->id)->count(); ?>
                            <?php $challan_child2_val_data=\App\Challan_Child2::where('challan_id','=',$challan_data->id)->get(); ?>
                            <tr>
                                <td width="250px">Challan No.</td>
                                @if($challan_child2_count==1)
                                <td>@foreach($challan_child2_val_data as $challan_child2_val_data){{$challan_child2_val_data->consignment_no}}@endforeach</td>
                                    @else
                                    <td>@foreach($challan_child2_val_data as $challan_child2_val_data){{$challan_child2_val_data->consignment_no}} / &nbsp;@endforeach</td>
                                @endif

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <h4>Total Packages and Weight Challan Info</h4>
                        <table class="table table-bordered">
                            <tbody>
                            <?php $challan_child3_val_data=\App\Challan_Child3::where('challan_id','=',$challan_data->id)->first(); ?>
                            <tr>
                                <td width="250px">Total Packages</td>
                                    <td>{{$challan_child3_val_data->total_package}}</td>
                            </tr>
                          <tr>
                                <td width="250px">Total Weight</td>
                                    <td>{{$challan_child3_val_data->total_gross_weight}}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div><br>
                    <a href="{{url('print_lorry_challan')}}/{{$challan_data->id}}" target="_blank" class="btn btn-sm btn-success">
                        Print Lorry
                    </a>
                    <a href="{{url('print_balance_challan')}}/{{$challan_data->id}}" target="_blank" class="btn btn-sm btn-success">
                        Print Balance
                    </a>
                    <a href="{{url('print_record_challan')}}/{{$challan_data->id}}" target="_blank" class="btn btn-sm btn-success">
                        Print Record
                    </a>
                    <a href="{{url('edit_challan')}}/{{$challan_data->id}}" target="_blank" class="btn btn-sm btn-warning">
                        Edit Challan
                    </a>
                @else
                <div class="well col-md-12">
                    <h4>Challan Not Ready Yet!!!</h4>
                </div>
                @endif
            </div>
            <div class="tab-pane" id="tabs-3" role="tabpanel">
                <div class="row">
                    @if($challan_child2_data_count>0)
                    <?php $coke_ack_data_count=\App\Acknowledgement::where('challan_number','=',$challan_data->challan_no)->count(); ?>

                        @if($coke_ack_data_count>0)
                    <?php $coke_ack_data=\App\Acknowledgement::where('challan_number','=',$challan_data->challan_no)->first(); ?>
                    <div class="col-md-6">
                        <h4>Acknowledgement Info</h4>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td width="250px">Challan Number</td>
                            <td>{{$coke_ack_data->challan_number}}</td>

                        </tr>
                        <tr>
                            <td>Acknowledgement Date</td>
                            <td>{{date('d/m/Y',strtotime($coke_ack_data->date))}}</td>

                        </tr>
                        <tr>
                            <td>Origin</td>
                            <td>{{$coke_ack_data->origin}}</td>

                        </tr>
                        <tr>
                            <td>Destination</td>
                            <td>{{$coke_ack_data->destination}}</td>

                        </tr>
                        <tr>
                            <td>Vehicle No</td>
                            <td>{{$coke_ack_data->vehicle_no}}</td>

                        </tr>
                        <tr>
                            <td>Reporting Date</td>
                            <td>{{date('d/m/Y',strtotime($coke_ack_data->reporting_date))}}</td>

                        </tr>
                        <tr>
                            <td>Reporting Time</td>
                            <td>{{$coke_ack_data->reporting_time}}</td>

                        </tr>
                        <tr>
                            <td>Unloading Date</td>
                            <td>{{date('d/m/Y',strtotime($coke_ack_data->unloading_date))}}</td>

                        </tr>
                        <tr>
                            <td>Unloading Time</td>
                            <td>{{$coke_ack_data->unloading_time}}</td>

                        </tr>
                        <tr>
                            <td>Pan No</td>
                            <td>{{$coke_ack_data->pan_no}}</td>

                        </tr>
                        <tr>
                            <td>Balance Payable At</td>
                            <td>{{$coke_ack_data->balance_payable_at}}</td>

                        </tr>
                        <tr>
                            <td>Acknowledgement Received Date</td>
                            <td>{{date('d/m/Y',strtotime($coke_ack_data->acknowledgement_received_date))}}</td>

                        </tr>
                        <tr>
                            <td>Payment Date</td>
                            <td>{{date('d/m/Y',strtotime($coke_ack_data->payment_date))}}</td>

                        </tr>
                        <tr>
                            <td>Balance Amount</td>
                            <td>{{$coke_ack_data->balance_amount}}</td>

                        </tr>
                        <tr>
                            <td>Entry By</td>
                            <td>{{$coke_ack_data->created_by}}</td>

                        </tr>

                        </tbody>
                    </table>
                </div>
                        <div class="col-md-6">
                            <h4>Product Condition Info</h4>
                            <?php $ack_child=\App\acknowledgementChild::where('acknowledgement_id','=',$coke_ack_data->id)->get(); ?>
                            @foreach($ack_child as $ack_child)
                                <table class="table table-striped">
                                    <tbody>
                                    <tr>
                                        <td width="200px">Received QTY</td>
                                        <td>{{$ack_child->received_qty}}</td>

                                    </tr>
                                    <tr>
                                        <td width="200px">Received Weight</td>
                                        <td>{{$ack_child->received_weight}}</td>
                                    </tr>
                                    <tr>
                                        <td>IS Good Condition</td>
                                        <td>{{$ack_child->is_good_condition}}</td>
                                    </tr>
                                    <tr>
                                        <td>Cause Of Loss</td>
                                        <td>{{$ack_child->cause_of_loss}}</td>
                                    </tr>
                                    <tr>
                                        <td>Damage Mode</td>
                                        <td>{{$ack_child->damage_mode}}</td>

                                    </tr>
                                    <tr>
                                        <td>Remarks</td>
                                        <td>{{$ack_child->remarks}}</td>

                                    </tr>
                                    <tr>
                                        <td>Quantity</td>
                                        <td>{{$ack_child->quantity}}</td>

                                    </tr>
                                    <tr>
                                        <td>Value</td>
                                        <td>{{$ack_child->value}}</td>

                                    </tr>
                                    </tbody>
                                </table>
                            @endforeach
                        </div>
                </div><br>
                        <a href="{{url('edit_acknowledgement')}}/{{$coke_ack_data->id}}" target="_blank" class="btn btn-sm btn-warning">
                            Edit Acknowledgement
                        </a>
                        @else
                            <div class="well col-md-12">
                                <h4>Acknowledgement Not Ready Yet!!!</h4>
                            </div>
                    @endif
                        @else
                            <div class="well col-md-12">
                                <h4>Challan Not Ready Yet!!!</h4>
                            </div>
                    @endif
            </div>
            <div class="tab-pane" id="tabs-4" role="tabpanel">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Bill Info</h4>
                        @if($challan_child2_data_count>0)
                        @if($coke_ack_data_count>0)
                            <?php $bill_data_child_count=\App\Freightbill_child::where('consignment_no','=',$consignment_data->consignment_no)->count(); ?>
                                @if($bill_data_child_count>0)
                                    <?php $bill_child_data=\App\Freightbill_child::where('consignment_no','=',$consignment_data->consignment_no)->first(); ?>
                                    <?php $bill_data=\App\FreightBill::find($bill_child_data->freight_bill_id); ?>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td>Bill No</td>
                            <td>{{$bill_data->bill_no}}</td>

                        </tr>
                        <tr>
                            <td>Bill Date</td>
                            <td>{{date('d/m/Y',strtotime($bill_data->bill_date))}}</td>

                        </tr>
                        <tr>
                            <td>Branch Code</td>
                            <td>{{$bill_data->branch_code}}</td>

                        </tr>
                        <tr>
                            <td>Party Code</td>
                            <td>{{$bill_data->party_code}}</td>

                        </tr>
                        <tr>
                            <td>Party Name</td>
                            <td>{{$bill_data->party_name}}</td>

                        </tr>
                        <tr>
                            <td width="200px">Party Address</td>
                            <td>{{$bill_data->party_address}}</td>
                        </tr>
                        <tr>
                            <td>Total Bill Amount</td>
                            <td>{{$bill_data->total_amount}}</td>
                        </tr>
                        <tr>
                            <td>Total Bill Amount (in words)</td>
                            <td>{{$bill_data->total_amount_in_words}}</td>
                        </tr>

                        </tbody>
                    </table>
                        </div>

                </div>
                @else
                    <div class="well col-md-12">
                        <h4>Bill Not Ready Yet!!!</h4>
                    </div>
                @endif
                @else
                    <div class="well col-md-12">
                        <h4>Acknowledgement Not Ready Yet!!!</h4>
                    </div>
                @endif
                @else
                    <div class="well col-md-12">
                        <h4>Challan Not Ready Yet!!!</h4>
                    </div>
                @endif
            </div>
        </div>

    </div>
@endsection

