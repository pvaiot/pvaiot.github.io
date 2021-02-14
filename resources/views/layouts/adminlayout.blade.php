<div class="nano">
    <div class="nano-content">
        <nav id="menu" class="nav-main" role="navigation">
            <ul class="nav nav-main">
                <li @if(Route::currentRouteName() == 'home_page')class="nav-active"@endif>
                    <a href="{{url('home_page')}}">
                        <i class="fa fa-home" aria-hidden="true"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li @if(Route::currentRouteName() == 'new_location_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_petrol_pump_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_branch_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_party_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_materialcategory_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_lorry_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_broker_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_trucktype_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_bank_account_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_bank_name_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_insurance_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_driver_entry')class="nav-parent nav-expanded nav-active"
                    @else class="nav-parent"
                        @endif>

                    <a>
                        <i class="fa fa-tasks" aria-hidden="true"></i>
                        <span>Master</span>
                    </a>
                    <ul class="nav nav-children">
                        <li class="{{ Route::currentRouteName() == 'new_location_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_location_entry')}}">Location</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_petrol_pump_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_petrol_pump_entry')}}">Petrol Pump</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_branch_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_branch_entry')}}">Branch</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_party_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_party_entry')}}">Party</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_broker_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_broker_entry')}}">Broker</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_materialcategory_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_materialcategory_entry')}}">Material Category</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_lorry_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_lorry_entry')}}">Lorry</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_trucktype_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_trucktype_entry')}}">Truck Type</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_bank_account_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_bank_account_entry')}}">Bank A/C</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_bank_name_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_bank_name_entry')}}">Bank Name</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_insurance_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_insurance_entry')}}">Insurance</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'new_driver_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_driver_entry')}}">Driver</a>
                        </li>
                      
                    </ul>
                </li>
                <li @if(Route::currentRouteName() == 'location')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'petrol_pump')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'branch')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'party')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'materialcategory')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'lorry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'broker')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'trucktype')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'bank_account')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'bank_name')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'insurance')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'driver')class="nav-parent nav-expanded nav-active"
                    @else class="nav-parent"
                        @endif>
                    <a>
                        <i class="fa fa-tasks" aria-hidden="true"></i>
                        <span>Master Alter</span>
                    </a>
                    <ul class="nav nav-children">
                        <li class="{{ Route::currentRouteName() == 'location' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('location')}}">Location</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'petrol_pump' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('petrol_pump')}}">Petrol Pump</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'branch' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('branch')}}">Branch</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'party' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('party')}}">Party</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'broker' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('broker')}}">Broker</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'materialcategory' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('materialcategory')}}">Material Category</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'lorry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('lorry')}}">Lorry</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'trucktype' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('trucktype')}}">Truck Type</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'bank_account' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('bank_account')}}">Bank A/C</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'bank_name' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('bank_name')}}">Bank Name</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'insurance' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('insurance')}}">Insurance</a>
                        </li>
                        <li class="{{ Route::currentRouteName() == 'driver' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('driver')}}">Driver</a>
                        </li>
                      
                    </ul>
                </li>
                <li class="{{ Route::currentRouteName() == 'new_indent_entry' ? 'nav-active' : '' }}">
                    <a href="{{url('new_indent_entry')}}">
                        <span class="pull-right"><i class="fa fa-external-link" aria-hidden="true"></i></span>
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <span>Indent Entry</span></a>
                </li>
                <li @if(Route::currentRouteName() == 'indent')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'indentplacement')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'indentplacement_lorry')class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('placement_indent/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('edit_indent/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('view_indentplacement/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('lorry_entry_indent/*'))class="nav-parent nav-expanded nav-active"
                    @else class="nav-parent"
                        @endif>
                    <a>
                        <i class="fa fa-list-alt" aria-hidden="true"></i>
                        <span>Indent Alter</span>
                    </a>
                    <ul class="nav nav-children">
                        <li class="{{ Route::currentRouteName() == 'indent' ? 'nav-active' : '' }}"><a href="{{url('indent')}}">Indent</a></li>
                        <li class="{{ Route::currentRouteName() == 'indentplacement' ? 'nav-active' : '' }}"><a href="{{url('indentplacement')}}">Indent Placement</a></li>
                        <li class="{{ Route::currentRouteName() == 'indentplacement_lorry' ? 'nav-active' : '' }}"><a href="{{url('indentplacement_lorry')}}">Indent Placement Lorry</a></li>
                    </ul>
                </li>
                <li @if(Route::currentRouteName() == 'new_consignment_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'Challan_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_acknowledgement_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'invoice')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_balance_process')class="nav-parent nav-expanded nav-active"
                    @else class="nav-parent"
                        @endif>
                    <a>
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <span>Transations</span>
                    </a>
                    <ul class="nav nav-children">
                        <li class="{{ Route::currentRouteName() == 'new_consignment_entry' ? 'nav-active' : '' }}"><a href="{{url('new_consignment_entry')}}">Consignment</a></li>
                        <li class="{{ Route::currentRouteName() == 'Challan_entry' ? 'nav-active' : '' }}"><a href="{{url('Challan_entry')}}">Challan</a></li>
                        <li class="{{ Route::currentRouteName() == 'new_acknowledgement_entry' ? 'nav-active' : '' }}"><a href="{{url('new_acknowledgement_entry')}}">Acknowledgement</a></li>
                        <li class="{{ Route::currentRouteName() == 'invoice' ? 'nav-active' : '' }}"><a href="{{url('invoice')}}">Freight Bill</a></li>
                        <li class="{{ Route::currentRouteName() == 'new_balance_process' ? 'nav-active' : '' }}"><a href="{{url('new_balance_process')}}">Lorry Hire Processing</a></li>
                           <li class="{{ Route::currentRouteName() == 'new_courier_entry' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('new_courier_entry')}}">Courier</a>
                        </li>
                    </ul>
                </li>
                <li @if(Route::currentRouteName() == 'new_coke_consignment_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'CokeChallan_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'new_coke_acknowledgement_entry')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'coke_bill')class="nav-parent nav-expanded nav-active"
                    @else class="nav-parent"
                        @endif>
                    <a>
                        <i class="fa fa-table" aria-hidden="true"></i>
                        <span>Coke Transations</span>
                    </a>
                    <ul class="nav nav-children">
                        <li class="{{ Route::currentRouteName() == 'new_coke_consignment_entry' ? 'nav-active' : '' }}"><a href="{{url('new_coke_consignment_entry')}}">Coke Consignment Entry</a></li>
                        <li class="{{ Route::currentRouteName() == 'CokeChallan_entry' ? 'nav-active' : '' }}"><a href="{{url('CokeChallan_entry')}}">Coke Challan Entry</a></li>
                        <li class="{{ Route::currentRouteName() == 'new_coke_acknowledgement_entry' ? 'nav-active' : '' }}"><a href="{{url('new_coke_acknowledgement_entry')}}">Coke Acknowlegement Entry</a></li>
                        <li class="{{ Route::currentRouteName() == 'coke_bill' ? 'nav-active' : '' }}"><a href="{{url('coke_bill')}}">Coke Freight Bill Entry</a></li>
                    </ul>
                </li>

                <li @if(Route::currentRouteName() == 'consignment')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'challan')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'acknowledgement')class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('edit_consignment/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('edit_challan/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('edit_acknowledgement/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'invoicealter')class="nav-parent nav-expanded nav-active"
                    @else class="nav-parent"
                        @endif>
                    <a>
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <span>Transations Alter</span>
                    </a>
                    <ul class="nav nav-children">
                        <li><a href="{{url('consignment')}}">Consignment</a></li>
                        <li><a href="{{url('challan')}}">Challan</a></li>
                        <li><a href="{{url('acknowledgement')}}">Acknowledgement</a></li>
                        <li><a href="{{url('invoicealter')}}">Freight Bill</a></li>
                           <li class="{{ Route::currentRouteName() == 'all_courier' ? 'nav-expanded nav-active' : '' }}">
                            <a href="{{url('all_courier')}}">Courier</a>
                        </li>
                    </ul>
                </li>
                <li @if(Route::currentRouteName() == 'cokeconsignment')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'cokechallan')class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('edit_coke_consignment/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('edit_coke_challan/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(request()->is('edit_coke_acknowledgement/*'))class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'cokeacknowledgement')class="nav-parent nav-expanded nav-active"
                    @elseif(Route::currentRouteName() == 'coke_bill_panel')class="nav-parent nav-expanded nav-active"
                    @else class="nav-parent"
                        @endif>
                    <a>
                        <i class="fa fa-table" aria-hidden="true"></i>
                        <span>Coke Transations Alter</span>
                    </a>
                    <ul class="nav nav-children">
                        <li class="{{ Route::currentRouteName() == 'cokeconsignment' ? 'nav-active' : '' }}"><a href="{{url('cokeconsignment')}}">Coke Consignment</a></li>
                        <li class="{{ Route::currentRouteName() == 'cokechallan' ? 'nav-active' : '' }}"><a href="{{url('cokechallan')}}">Coke Challan</a></li>
                        <li class="{{ Route::currentRouteName() == 'cokeacknowledgement' ? 'nav-active' : '' }}"><a href="{{url('cokeacknowledgement')}}">Coke Acknowledgement</a></li>
                        <li class="{{ Route::currentRouteName() == 'coke_bill_panel' ? 'nav-active' : '' }}"><a href="{{url('coke_bill_panel')}}">Coke Freight Bill</a></li>
                    </ul>
                </li>
                <li class="nav-parent">
                    <a>
                        <i class="fa fa-table" aria-hidden="true"></i>
                        <span>Transations Cancellation</span>
                    </a>
                    <ul class="nav nav-children">
                        <li><a href="{{url('new_consignment_cancel')}}">Consignment Cancellation</a></li>
                        <li><a href="{{url('cokechallan')}}">Coke Challan</a></li>
                        <li><a href="{{url('cokeacknowledgement')}}">Coke Acknowledgement</a></li>
                    </ul>
                </li>
                <li class="nav-parent">
                    <a>
                        <i class="fa fa-table" aria-hidden="true"></i>
                        <span>Coke Transaction Reporting</span>
                    </a>
                    <ul class="nav nav-children">
                        <li><a href="{{url('coke_consignment_report_panel')}}">Coke Consignment Report</a></li>
                        <li><a href="{{url('coke_challan_report_panel')}}">Coke Challan Report</a></li>
                        <li><a href="{{url('coke_bill_report_panel')}}">Coke Bill Report</a></li>
                    </ul>
                </li>
                <li class="nav-parent">
                    <a>
                        <i class="fa fa-table" aria-hidden="true"></i>
                        <span>Transaction Reporting</span>
                    </a>
                    <ul class="nav nav-children">
                        <li><a href="{{url('normal_consignment_report_panel')}}">Consignment Report</a></li>
                        <li><a href="{{url('normal_challan_report_panel')}}">Challan Report</a></li>
                        <li><a href="{{url('normal_bill_report_panel')}}">Bill Report</a></li>
                    </ul>
                </li>
                <li class="nav-parent">
                    <a>
                        <i class="fa fa-table" aria-hidden="true"></i>
                        <span>View Transation</span>
                    </a>
                    <ul class="nav nav-children">
                        <li><a href="{{url('single_consignment_view_panel')}}">View Consignment</a></li>
                    </ul>
                </li>
                <li class="{{ Route::currentRouteName() == 'view_bill_register_entry' ? 'nav-active' : '' }}">
                    <a href="{{url('view_bill_register_entry')}}">
                        <span class="pull-right"><i class="fa fa-external-link" aria-hidden="true"></i></span>
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                        <span>Bill Register Entry</span></a>
                </li>
                <li class="nav-parent">
                    <a>
                        <i class="fa fa-table" aria-hidden="true"></i>
                        <span>Truck Tracking Panel</span>
                    </a>
                    <ul class="nav nav-children">
                        <li><a href="{{url('truck_create_panel')}}">Truck Track Create Panel</a></li>
                        <li><a href="{{url('truck_view_panel')}}">Truck Track View Panel</a></li>
                        <li><a href="{{url('truck_track')}}">Truck Track</a></li>
                    </ul>
                </li>
                <li>
                    <a href="{{url('single_consignment_print_panel')}}">
                        <i class="fa fa-print" aria-hidden="true"></i>
                        <span>Single Print</span>
                    </a>
                </li>

            </ul>
        </nav>

        <hr class="separator" />

        <div class="sidebar-widget widget-stats">
            <div class="widget-header">
                <h6>Company Stats</h6>
                <div class="widget-toggle">+</div>
            </div>
            <div class="widget-content">
                <ul>
                    <li>
                        <span class="stats-title">Stat 1</span>
                        <span class="stats-complete">85%</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-primary progress-without-number" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
                                <span class="sr-only">85% Complete</span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span class="stats-title">Stat 2</span>
                        <span class="stats-complete">70%</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-primary progress-without-number" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
                                <span class="sr-only">70% Complete</span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span class="stats-title">Stat 3</span>
                        <span class="stats-complete">2%</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-primary progress-without-number" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                                <span class="sr-only">2% Complete</span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>