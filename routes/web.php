<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/**/
//   ----------------------------------- Login Page bhawanitransport start --------------------
Auth::routes();
Route::get('/home', 'HomeController@index');
Route::get('/',array('as'=>'home', 'middleware' => ['auth'],'uses'=>'HomeController@index'));
Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');

//   ----------------------------------- Login Page bhawanitransport end --------------------

//   ----------------------------------- home page start --------------------

Route::get('home_page',array('as'=>'home_page','uses'=>'HomePageController@home_page'));

Route::post('Ajaxcnserialno',array('as'=>'Ajaxcnserialno','uses'=>'HomeController@Ajaxcnserialno'));

//   ----------------------------------- home page start end --------------------

Route::get('/alter_my_consignment_data',array('as'=>'alter_my_consignment_data','uses'=>'CockConsignmentController@alter_my_consignment_data'));



//Cancellation

Route::get('/new_consignment_cancel',array('as'=>'new_consignment_cancel','uses'=>'CancellationController@new_consignment_cancel'));
Route::post('/store_consignment_cancel',array('as'=>'store_consignment_cancel','uses'=>'CancellationController@store_consignment_cancel'));

// Location  routes
Route::get('/location',array('as'=>'location','uses'=>'LocationController@location'));
Route::get('/new_location_entry',array('as'=>'new_location_entry','uses'=>'LocationController@new_location_entry'));
Route::post('store_location_entry',array('as'=>'store_location_entry','uses'=>'LocationController@store_location_entry'));
Route::get('/edit_location/{id}',array('as'=>'edit_location','uses'=>'LocationController@edit_location'));
Route::post('update_location/{id}',array('as'=>'update_location','uses'=>'LocationController@update_location'));
Route::get('view_location/{id}',array('as'=>'view_location','uses'=>'LocationController@view_location'));
Route::get('delete_location/{id}',array('as'=>'delete_location','uses'=>'LocationController@delete_location'));

// --------------------Petrol Pump

Route::get('/petrol_pump',array('as'=>'petrol_pump','uses'=>'PetrolpumpController@petrol_pump'));
Route::get('/new_petrol_pump_entry',array('as'=>'new_petrol_pump_entry','uses'=>'PetrolpumpController@new_petrol_pump_entry'));
Route::post('store_petrol_pump_entry',array('as'=>'store_petrol_pump_entry','uses'=>'PetrolpumpController@store_petrol_pump_entry'));
Route::get('/edit_petrol_pump/{id}',array('as'=>'edit_petrol_pump','uses'=>'PetrolpumpController@edit_petrol_pump'));
Route::post('update_petrol_pump/{id}',array('as'=>'update_petrol_pump','uses'=>'PetrolpumpController@update_petrol_pump'));
Route::get('view_petrol_pump/{id}',array('as'=>'view_petrol_pump','uses'=>'PetrolpumpController@view_petrol_pump'));
Route::get('view_petrol_pump_report/{id}',array('as'=>'view_petrol_pump_report','uses'=>'PetrolpumpController@view_petrol_pump_report'));
Route::get('delete_petrol_pump/{id}',array('as'=>'delete_petrol_pump','uses'=>'PetrolpumpController@delete_petrol_pump'));
Route::post('petrol_pump_recordbydate',array('as'=>'petrol_pump_recordbydate','uses'=>'PetrolpumpController@petrol_pump_recordbydate'));

//   ------------//Branch routes

Route::get('/branch',array('as'=>'branch','uses'=>'BranchController@branch'));
Route::get('/new_branch_entry',array('as'=>'new_branch_entry','uses'=>'BranchController@new_branch_entry'));
Route::post('store_branch_entry',array('as'=>'store_branch_entry','uses'=>'BranchController@store_branch_entry'));
Route::get('/edit_branch/{id}',array('as'=>'edit_branch','uses'=>'BranchController@edit_branch'));
Route::post('update_branch/{id}',array('as'=>'update_branch','uses'=>'BranchController@update_branch'));
Route::get('view_branch/{id}',array('as'=>'view_branch','uses'=>'BranchController@view_branch'));
Route::get('delete_branch/{id}',array('as'=>'delete_branch','uses'=>'BranchController@delete_branch'));


//   ------------//party routes

Route::get('/party',array('as'=>'party','uses'=>'PartyController@party'));
Route::get('/new_party_entry',array('as'=>'new_party_entry','uses'=>'PartyController@new_party_entry'));
Route::post('store_party_entry',array('as'=>'store_party_entry','uses'=>'PartyController@store_party_entry'));
Route::get('/edit_party/{id}',array('as'=>'edit_party','uses'=>'PartyController@edit_party'));
Route::post('update_party/{id}',array('as'=>'update_party','uses'=>'PartyController@update_party'));
Route::get('view_party/{id}',array('as'=>'view_party','uses'=>'PartyController@view_party'));
Route::get('delete_party/{id}',array('as'=>'delete_party','uses'=>'PartyController@delete_party'));


//   ------------//Broker routes

Route::get('/broker',array('as'=>'broker','uses'=>'BrokerController@broker'));
Route::get('/new_broker_entry',array('as'=>'new_broker_entry','uses'=>'BrokerController@new_broker_entry'));
Route::post('store_broker_entry',array('as'=>'store_broker_entry','uses'=>'BrokerController@store_broker_entry'));
Route::get('/edit_broker/{id}',array('as'=>'edit_broker','uses'=>'BrokerController@edit_broker'));
Route::post('update_broker/{id}',array('as'=>'update_broker','uses'=>'BrokerController@update_broker'));
Route::get('view_broker/{id}',array('as'=>'view_broker','uses'=>'BrokerController@view_broker'));
Route::get('delete_broker/{id}',array('as'=>'delete_broker','uses'=>'BrokerController@delete_broker'));

//   ------------//Material Category routes

Route::get('/materialcategory',array('as'=>'materialcategory','uses'=>'MaterialcategoryController@materialcategory'));
Route::get('/new_materialcategory_entry',array('as'=>'new_materialcategory_entry','uses'=>'MaterialcategoryController@new_materialcategory_entry'));
Route::post('store_materialcategory_entry',array('as'=>'store_materialcategory_entry','uses'=>'MaterialcategoryController@store_materialcategory_entry'));
Route::get('/edit_materialcategory/{id}',array('as'=>'edit_materialcategory','uses'=>'MaterialcategoryController@edit_materialcategory'));
Route::post('update_materialcategory/{id}',array('as'=>'update_materialcategory','uses'=>'MaterialcategoryController@update_materialcategory'));
Route::get('view_materialcategory/{id}',array('as'=>'view_materialcategory','uses'=>'MaterialcategoryController@view_materialcategory'));
Route::get('delete_materialcategory/{id}',array('as'=>'delete_materialcategory','uses'=>'MaterialcategoryController@delete_materialcategory'));

//   ------------//truck type routes

Route::get('/trucktype',array('as'=>'trucktype','uses'=>'TrucktypeController@trucktype'));
Route::get('/new_trucktype_entry',array('as'=>'new_trucktype_entry','uses'=>'TrucktypeController@new_trucktype_entry'));
Route::post('store_trucktype_entry',array('as'=>'store_trucktype_entry','uses'=>'TrucktypeController@store_trucktype_entry'));
Route::get('/edit_trucktype/{id}',array('as'=>'edit_trucktype','uses'=>'TrucktypeController@edit_trucktype'));
Route::post('update_trucktype/{id}',array('as'=>'update_trucktype','uses'=>'TrucktypeController@update_trucktype'));
Route::get('view_trucktype/{id}',array('as'=>'view_trucktype','uses'=>'TrucktypeController@view_trucktype'));
Route::get('delete_trucktype/{id}',array('as'=>'delete_trucktype','uses'=>'TrucktypeController@delete_trucktype'));

//   ------------//Bank Name routes

Route::get('/bank_name',array('as'=>'bank_name','uses'=>'BanknameController@bank_name'));
Route::get('/new_bank_name_entry',array('as'=>'new_bank_name_entry','uses'=>'BanknameController@new_bank_name_entry'));
Route::post('store_bank_name_entry',array('as'=>'store_bank_name_entry','uses'=>'BanknameController@store_bank_name_entry'));
Route::get('/edit_bank_name/{id}',array('as'=>'edit_bank_name','uses'=>'BanknameController@edit_bank_name'));
Route::post('update_bank_name/{id}',array('as'=>'update_bank_name','uses'=>'BanknameController@update_bank_name'));
Route::get('view_bank_name/{id}',array('as'=>'view_bank_name','uses'=>'BanknameController@view_bank_name'));
Route::get('delete_bank_name/{id}',array('as'=>'delete_bank_name','uses'=>'BanknameController@delete_bank_name'));

//   ------------//insurance routes

Route::get('/insurance',array('as'=>'insurance','uses'=>'InsuranceController@insurance'));
Route::get('/new_insurance_entry',array('as'=>'new_insurance_entry','uses'=>'InsuranceController@new_insurance_entry'));
Route::post('store_insurance_entry',array('as'=>'store_insurance_entry','uses'=>'InsuranceController@store_insurance_entry'));
Route::get('/edit_insurance/{id}',array('as'=>'edit_insurance','uses'=>'InsuranceController@edit_insurance'));
Route::post('update_insurance/{id}',array('as'=>'update_insurance','uses'=>'InsuranceController@update_insurance'));
Route::get('view_insurance/{id}',array('as'=>'view_insurance','uses'=>'InsuranceController@view_insurance'));
Route::get('delete_insurance/{id}',array('as'=>'delete_insurance','uses'=>'InsuranceController@delete_insurance'));

//   ------------//Bank Account routes

Route::get('/bank_account',array('as'=>'bank_account','uses'=>'BankaccountController@bank_account'));
Route::get('/new_bank_account_entry',array('as'=>'new_bank_account_entry','uses'=>'BankaccountController@new_bank_account_entry'));
Route::post('store_bank_account_entry',array('as'=>'store_bank_account_entry','uses'=>'BankaccountController@store_bank_account_entry'));
Route::get('/edit_bank_account/{id}',array('as'=>'edit_bank_account','uses'=>'BankaccountController@edit_bank_account'));
Route::post('update_bank_account/{id}',array('as'=>'update_bank_account','uses'=>'BankaccountController@update_bank_account'));
Route::get('view_bank_account/{id}',array('as'=>'view_bank_account','uses'=>'BankaccountController@view_bank_account'));
Route::get('delete_bank_account/{id}',array('as'=>'delete_bank_account','uses'=>'BankaccountController@delete_bank_account'));

//   ------------//Driver routes

Route::get('/driver',array('as'=>'driver','uses'=>'DriverController@driver'));
Route::get('/new_driver_entry',array('as'=>'new_driver_entry','uses'=>'DriverController@new_driver_entry'));
Route::post('store_driver_entry',array('as'=>'store_driver_entry','uses'=>'DriverController@store_driver_entry'));
Route::get('/edit_driver/{id}',array('as'=>'edit_driver','uses'=>'DriverController@edit_driver'));
Route::post('update_driver/{id}',array('as'=>'update_driver','uses'=>'DriverController@update_driver'));
Route::get('view_driver/{id}',array('as'=>'view_driver','uses'=>'DriverController@view_driver'));
Route::get('delete_driver/{id}',array('as'=>'delete_driver','uses'=>'DriverController@delete_driver'));

//Courier Details
Route::get('/new_courier_entry',array('as'=>'new_courier_entry','uses'=>'CourierController@new_courier_entry'));
Route::post('store_curier_entry',array('as'=>'store_curier_entry','uses'=>'CourierController@store_curier_entry'));
Route::get('all_courier',array('as'=>'all_courier','uses'=>'CourierController@all_courier'));
Route::get('view_courier/{id}',array('as'=>'view_courier','uses'=>'CourierController@view_courier'));
Route::get('edit_courier/{id}',array('as'=>'edit_courier','uses'=>'CourierController@edit_courier'));
Route::post('update_courier/{id}',array('as'=>'update_courier','uses'=>'CourierController@update_courier'));
Route::get('courier',array('as'=>'courier','uses'=>'CourierController@courier'));
Route::get('delete_courier/{id}',array('as'=>'delete_courier','uses'=>'CourierController@delete_courier'));


//   ------------//lorry routes

Route::get('/lorry',array('as'=>'lorry','uses'=>'LorryController@lorry'));
Route::get('/new_lorry_entry',array('as'=>'new_lorry_entry','uses'=>'LorryController@new_lorry_entry'));
Route::post('store_lorry_entry',array('as'=>'store_lorry_entry','uses'=>'LorryController@store_lorry_entry'));
Route::get('/edit_lorry/{id}',array('as'=>'edit_lorry','uses'=>'LorryController@edit_lorry'));
Route::post('update_lorry/{id}',array('as'=>'update_lorry','uses'=>'LorryController@update_lorry'));
Route::get('view_lorry/{id}',array('as'=>'view_lorry','uses'=>'LorryController@view_lorry'));
Route::get('delete_lorry/{id}',array('as'=>'delete_lorry','uses'=>'LorryController@delete_lorry'));

Route::get('AjaxGet_truck_no_value/{id}',array('as'=>'AjaxGet_truck_no_value','uses'=>'LorryController@AjaxGet_truck_no_value'));



Route::get('print_consignment/{id}',array('as'=>'print_consignment','uses'=>'ConsignmentController@print_consignment'));
Route::get('print_cokeconsignment/{id}',array('as'=>'print_cokeconsignment','uses'=>'CockConsignmentController@print_cokeconsignment'));
//coke consignment


Route::get('/cokeconsignment',array('as'=>'cokeconsignment','uses'=>'CockConsignmentController@cokeconsignment'));
Route::get('/new_coke_consignment_entry',array('as'=>'new_coke_consignment_entry','uses'=>'CockConsignmentController@new_coke_consignment_entry'));
Route::post('store_coke_consignment_entry',array('as'=>'store_coke_consignment_entry','uses'=>'CockConsignmentController@store_coke_consignment_entry'));
Route::get('/edit_coke_consignment/{id}',array('as'=>'edit_coke_consignment','uses'=>'CockConsignmentController@edit_coke_consignment'));
Route::post('update_cokeconsignment/{id}',array('as'=>'update_cokeconsignment','uses'=>'CockConsignmentController@update_cokeconsignment'));
Route::get('delete_cokeconsignment/{id}',array('as'=>'delete_cokeconsignment','uses'=>'CockConsignmentController@delete_cokeconsignment'));



//Consignment  routes
Route::get('/consignment',array('as'=>'consignment','uses'=>'ConsignmentController@consignment'));
Route::get('/new_consignment_entry',array('as'=>'new_consignment_entry','uses'=>'ConsignmentController@new_consignment_entry'));
Route::post('store_consignment_entry',array('as'=>'store_consignment_entry','uses'=>'ConsignmentController@store_consignment_entry'));
Route::get('/edit_consignment/{id}',array('as'=>'edit_consignment','uses'=>'ConsignmentController@edit_consignment'));
Route::post('update_consignment/{id}',array('as'=>'update_consignment','uses'=>'ConsignmentController@update_consignment'));
Route::get('view_consignment/{id}',array('as'=>'view_consignment','uses'=>'ConsignmentController@view_consignment'));
Route::get('AjaxGet_party_name/{id}',array('as'=>'AjaxGet_party_name','uses'=>'ConsignmentController@AjaxGet_party_name'));
Route::get('delete_consignment/{id}',array('as'=>'delete_consignment','uses'=>'ConsignmentController@delete_consignment'));
Route::post('AjaxNewlocation',array('as'=>'AjaxNewlocation','uses'=>'ConsignmentController@AjaxNewlocation'));
Route::post('AjaxNewLocation',array('as'=>'AjaxNewLocation','uses'=>'ConsignmentController@AjaxNewLocation'));
Route::get('AjaxGet_truck_id/{id}',array('as'=>'AjaxGet_truck_id','uses'=>'ConsignmentController@AjaxGet_truck_id'));
Route::get('AjaxGet_party_data/{id}',array('as'=>'AjaxGet_party_data','uses'=>'ConsignmentController@AjaxGet_party_data'));


Route::get('searchajax', ['as'=>'searchajax','uses'=>'ConsignmentController@searchResponse']);
Route::get('searchajax_billed_at', ['as'=>'searchajax_billed_at','uses'=>'ConsignmentController@searchResponse_billed_at']);
Route::get('searchajax_from', ['as'=>'searchajax_from','uses'=>'ConsignmentController@searchResponse_from']);
Route::get('searchajax_to', ['as'=>'searchajax_to','uses'=>'ConsignmentController@searchResponse_to']);
Route::get('searchajax_truck_type', ['as'=>'searchajax_truck_type','uses'=>'ConsignmentController@searchResponse_truck_type']);
Route::get('searchajax_truck_no', ['as'=>'searchajax_truck_no','uses'=>'ConsignmentController@searchResponse_truck_no']);


Route::get('AjaxGet_consignment_no_data/{id}',array('as'=>'AjaxGet_consignment_no_data','uses'=>'ConsignmentController@AjaxGet_consignment_no_data'));
Route::get('AjaxGet_new_location_data/{id}',array('as'=>'AjaxGet_new_location_data','uses'=>'LocationController@AjaxGet_new_location_data'));

//-----------auto complete experiment-----------

//Challan  routes
Route::get('print_lorry_challan/{id}',array('as'=>'print_lorry_challan','uses'=>'ChallanController@print_lorry_challan'));
Route::get('print_balance_challan/{id}',array('as'=>'print_balance_challan','uses'=>'ChallanController@print_balance_challan'));
Route::get('print_record_challan/{id}',array('as'=>'print_record_challan','uses'=>'ChallanController@print_record_challan'));
Route::get('/Challan_entry',array('as'=>'Challan_entry','uses'=>'ChallanController@Challan_entry'));
Route::get('/challan',array('as'=>'challan','uses'=>'ChallanController@challan'));
Route::get('/new_challan_entry',array('as'=>'new_challan_entry','uses'=>'ChallanController@new_challan_entry'));
Route::post('/save_new_challan_entry',array('as'=>'save_new_challan_entry','uses'=>'ChallanController@save_new_challan_entry'));
Route::post('store_challan_entry',array('as'=>'store_challan_entry','uses'=>'ChallanController@store_challan_entry'));
Route::get('/edit_challan/{id}',array('as'=>'edit_challan','uses'=>'ChallanController@edit_challan'));
Route::post('update_challan/{id}',array('as'=>'update_challan','uses'=>'ChallanController@update_challan'));
Route::get('view_challan/{id}',array('as'=>'view_challan','uses'=>'ChallanController@view_challan'));
Route::get('delete_challan/{id}',array('as'=>'delete_challan','uses'=>'ChallanController@delete_challan'));


Route::get('AjaxGet_challan_number/{id}',array('as'=>'AjaxGet_challan_number','uses'=>'ChallanController@AjaxGet_challan_number'));
Route::get('AjaxGet_broker_name/{id}',array('as'=>'AjaxGet_broker_name','uses'=>'ChallanController@AjaxGet_broker_name'));
Route::get('AjaxGet_drivers_name/{id}',array('as'=>'AjaxGet_drivers_name','uses'=>'ChallanController@AjaxGet_drivers_name'));
Route::get('AjaxGet_consignment_details/{id}',array('as'=>'AjaxGet_consignment_details','uses'=>'ChallanController@AjaxGet_consignment_details'));
Route::get('AjaxGet_consignment_value/{id}',array('as'=>'AjaxGet_consignment_value','uses'=>'ChallanController@AjaxGet_consignment_value'));
Route::get('AjaxGet_challan_no_value/{id}',array('as'=>'AjaxGet_challan_no_value','uses'=>'ChallanController@AjaxGet_challan_no_value'));

Route::post('AjaxNewDriver',array('as'=>'AjaxNewDriver','uses'=>'ChallanController@AjaxNewDriver'));
Route::post('AjaxNewBroker',array('as'=>'AjaxNewBroker','uses'=>'ChallanController@AjaxNewBroker'));
Route::get('AjaxGet_consignment_id/{id}',array('as'=>'AjaxGet_consignment_id','uses'=>'ChallanController@AjaxGet_consignment_id'));
Route::get('AjaxGet_consignment_child_id/{id}',array('as'=>'AjaxGet_consignment_child_id','uses'=>'ChallanController@AjaxGet_consignment_child_id'));

//Coke Challan
Route::get('print_lorry_coke_challan/{id}',array('as'=>'print_lorry_coke_challan','uses'=>'CokeChallanController@print_lorry_coke_challan'));
Route::get('print_balance_coke_challan/{id}',array('as'=>'print_balance_coke_challan','uses'=>'CokeChallanController@print_balance_coke_challan'));
Route::get('print_record_coke_challan/{id}',array('as'=>'print_record_coke_challan','uses'=>'CokeChallanController@print_record_coke_challan'));

Route::get('AjaxGet_coke_consignment_id/{id}',array('as'=>'AjaxGet_coke_consignment_id','uses'=>'CokeChallanController@AjaxGet_coke_consignment_id'));
Route::get('AjaxGet_coke_consignment_child_id/{id}',array('as'=>'AjaxGet_coke_consignment_child_id','uses'=>'CokeChallanController@AjaxGet_coke_consignment_child_id'));
Route::get('AjaxGet_coke_consignment_value/{id}',array('as'=>'AjaxGet_coke_consignment_value','uses'=>'CokeChallanController@AjaxGet_coke_consignment_value'));
Route::get('/CokeChallan_entry',array('as'=>'CokeChallan_entry','uses'=>'CokeChallanController@CokeChallan_entry'));
Route::get('/cokechallan',array('as'=>'cokechallan','uses'=>'CokeChallanController@cokechallan'));
Route::get('/new_challan_entry',array('as'=>'new_challan_entry','uses'=>'ChallanController@new_challan_entry'));
Route::post('/save_new_challan_entry',array('as'=>'save_new_challan_entry','uses'=>'ChallanController@save_new_challan_entry'));
Route::post('store_coke_challan_entry',array('as'=>'store_coke_challan_entry','uses'=>'CokeChallanController@store_coke_challan_entry'));
Route::get('/edit_coke_challan/{id}',array('as'=>'edit_coke_challan','uses'=>'CokeChallanController@edit_coke_challan'));
Route::post('update_coke_challan/{id}',array('as'=>'update_coke_challan','uses'=>'CokeChallanController@update_coke_challan'));
Route::get('delete_coke_challan/{id}',array('as'=>'delete_coke_challan','uses'=>'CokeChallanController@delete_coke_challan'));

// serach for from
Route::get('searchajax_from1', ['as'=>'searchajax_from1','uses'=>'ChallanController@searchResponse_from1']);
Route::get('searchajax_to1', ['as'=>'searchajax_to1','uses'=>'ChallanController@searchResponse_to1']);
Route::get('searchajax1',array('as'=>'searchajax1','uses'=>'ChallanController@autoComplete'));

// Acknowledgement  routes
Route::get('/acknowledgement',array('as'=>'acknowledgement','uses'=>'AcknowledgementController@acknowledgement'));
Route::get('/new_acknowledgement_entry',array('as'=>'new_acknowledgement_entry','uses'=>'AcknowledgementController@new_acknowledgement_entry'));
Route::post('store_acknowledgement_entry',array('as'=>'store_acknowledgement_entry','uses'=>'AcknowledgementController@store_acknowledgement_entry'));
Route::get('/edit_acknowledgement/{id}',array('as'=>'edit_acknowledgement','uses'=>'AcknowledgementController@edit_acknowledgement'));
Route::post('update_acknowledgement/{id}',array('as'=>'update_acknowledgement','uses'=>'AcknowledgementController@update_acknowledgement'));
Route::get('view_acknowledgement/{id}',array('as'=>'view_acknowledgement','uses'=>'AcknowledgementController@view_acknowledgement'));
Route::get('delete_acknowledgement/{id}',array('as'=>'delete_acknowledgement','uses'=>'AcknowledgementController@delete_acknowledgement'));
Route::get('AjaxGet_challan_no/{id}',array('as'=>'AjaxGet_challan_no','uses'=>'AcknowledgementController@AjaxGet_challan_no'));
Route::get('AjaxGet_consignment_number/{id}',array('as'=>'AjaxGet_consignment_number','uses'=>'AcknowledgementController@AjaxGet_consignment_number'));
Route::get('AjaxGet_challan_no_value_for_acknowledge/{id}',array('as'=>'AjaxGet_challan_no_value_for_acknowledge','uses'=>'AcknowledgementController@AjaxGet_challan_no_value_for_acknowledge'));

Route::get('AjaxGet_challan_no_acknowledge/{id}',array('as'=>'AjaxGet_challan_no_acknowledge','uses'=>'AcknowledgementController@AjaxGet_challan_no_acknowledge'));
// Coke Acknowledgement
Route::get('AjaxGet_coke_challan_no/{id}',array('as'=>'AjaxGet_coke_challan_no','uses'=>'CokeAcknowledgementController@AjaxGet_coke_challan_no'));
Route::get('/edit_coke_acknowledgement/{id}',array('as'=>'edit_coke_acknowledgement','uses'=>'CokeAcknowledgementController@edit_coke_acknowledgement'));
Route::get('delete_coke_acknowledgement/{id}',array('as'=>'delete_coke_acknowledgement','uses'=>'CokeAcknowledgementController@delete_coke_acknowledgement'));
Route::post('update_coke_acknowledgement/{id}',array('as'=>'update_coke_acknowledgement','uses'=>'CokeAcknowledgementController@update_coke_acknowledgement'));
Route::get('/cokeacknowledgement',array('as'=>'cokeacknowledgement','uses'=>'CokeAcknowledgementController@cokeacknowledgement'));
Route::get('/new_coke_acknowledgement_entry',array('as'=>'new_coke_acknowledgement_entry','uses'=>'CokeAcknowledgementController@new_coke_acknowledgement_entry'));
Route::post('store_coke_acknowledgement_entry',array('as'=>'store_coke_acknowledgement_entry','uses'=>'CokeAcknowledgementController@store_coke_acknowledgement_entry'));
Route::get('AjaxGet_trip_id/{id}',array('as'=>'AjaxGet_trip_id','uses'=>'CokeAcknowledgementController@AjaxGet_trip_id'));
Route::get('AjaxGet_laod_id/{id}',array('as'=>'AjaxGet_laod_id','uses'=>'CokeAcknowledgementController@AjaxGet_laod_id'));
Route::get('AjaxGet_trip_id_value/{id}',array('as'=>'AjaxGet_trip_id_value','uses'=>'CokeAcknowledgementController@AjaxGet_trip_id_value'));
Route::get('AjaxGet_load_id_value/{id}',array('as'=>'AjaxGet_load_id_value','uses'=>'CokeAcknowledgementController@AjaxGet_load_id_value'));
Route::get('AjaxGet_challan_no_cokeacknowledge/{id}',array('as'=>'AjaxGet_challan_no_cokeacknowledge','uses'=>'CokeAcknowledgementController@AjaxGet_challan_no_cokeacknowledge'));





// Indent  routes
Route::get('/indent',array('as'=>'indent','uses'=>'IndentController@indent'));
Route::get('/new_indent_entry',array('as'=>'new_indent_entry','uses'=>'IndentController@new_indent_entry'));
Route::post('store_indent_entry',array('as'=>'store_indent_entry','uses'=>'IndentController@store_indent_entry'));
Route::get('/edit_indent/{id}',array('as'=>'edit_indent','uses'=>'IndentController@edit_indent'));
Route::post('update_indent/{id}',array('as'=>'update_indent','uses'=>'IndentController@update_indent'));
Route::get('view_indent/{id}',array('as'=>'view_indent','uses'=>'IndentController@view_indent'));
Route::delete('Ajax_delete_data/{id}',array('as'=>'Ajax_delete_data','uses'=>'IndentController@Ajax_delete_data'));
Route::get('delete_indent/{id}',array('as'=>'delete_indent','uses'=>'IndentController@delete_indent'));
Route::get('AjaxGet_branch_code/{id}',array('as'=>'AjaxGet_branch_code','uses'=>'IndentController@AjaxGet_branch_code'));
Route::get('AjaxGet_consignor_name/{id}',array('as'=>'AjaxGet_consignor_name','uses'=>'IndentController@AjaxGet_consignor_name'));
Route::get('AjaxGet_party_data_indent/{id}',array('as'=>'AjaxGet_party_data_indent','uses'=>'IndentController@AjaxGet_party_data_indent'));

// Indent Placement  routes
Route::get('placement_indent/{id}',array('as'=>'placement_indent','uses'=>'IndentPlacementController@placement_indent'));
Route::get('/indentplacement',array('as'=>'indentplacement','uses'=>'IndentPlacementController@indentplacement'));
Route::get('/indentplacement_lorry',array('as'=>'indentplacement_lorry','uses'=>'IndentPlacementController@indentplacement_lorry'));
Route::get('/lorry_entry_indent/{id}',array('as'=>'lorry_entry_indent','uses'=>'IndentPlacementController@lorry_entry_indent'));
Route::get('/new_indentplacement_entry',array('as'=>'new_indentplacement_entry','uses'=>'IndentPlacementController@new_indentplacement_entry'));
Route::post('store_indentplacement_entry',array('as'=>'store_indentplacement_entry','uses'=>'IndentPlacementController@store_indentplacement_entry'));
Route::get('/edit_indentplacement/{id}',array('as'=>'edit_indentplacement','uses'=>'IndentPlacementController@edit_indentplacement'));
Route::post('update_indentplacement/{id}',array('as'=>'update_indentplacement','uses'=>'IndentPlacementController@update_indentplacement'));
Route::post('edit_indentplacement_2/{id}',array('as'=>'edit_indentplacement_2','uses'=>'IndentPlacementController@edit_indentplacement_2'));
Route::get('view_indentplacement/{id}',array('as'=>'view_indentplacement','uses'=>'IndentPlacementController@view_indentplacement'));
Route::get('delete_indentplacement/{id}',array('as'=>'delete_indentplacement','uses'=>'IndentPlacementController@delete_indentplacement'));
Route::get('AjaxGet_indent_no/{id}',array('as'=>'AjaxGet_indent_no','uses'=>'IndentPlacementController@AjaxGet_indent_no'));
Route::get('AjaxGet_indent_no_value/{id}',array('as'=>'AjaxGet_indent_no_value','uses'=>'IndentPlacementController@AjaxGet_indent_no_value'));

// frieght  routes

// exacute-----
// bill
Route::get('/invoice',array('as'=>'invoice','middleware' => ['auth'], 'uses'=>'FreightBillController@invoice'));
Route::get('/invoicealter',array('as'=>'invoicealter','middleware' => ['auth'], 'uses'=>'FreightBillController@invoicealter'));
Route::get('/edit_invoice/{id}',array('as'=>'edit_invoice','middleware' => ['auth'],'uses'=>'FreightBillController@edit_invoice'));
Route::get('delete_invoice/{id}',array('as'=>'delete_invoice','middleware' => ['auth'],'uses'=>'FreightBillController@delete_invoice'));
Route::post('update_freight_bill/{id}',array('as'=>'update_freight_bill','middleware' => ['auth'],'uses'=>'FreightBillController@update_freight_bill'));
Route::get('view_freight_bill/{id}',array('as'=>'view_freight_bill','middleware' => ['auth'], 'uses'=>'FreightBillController@view_freight_bill'));
Route::get('AjaxGet_consignment_no/{id}',array('as'=>'FreightBillController','uses'=>'FreightBillController@AjaxGet_consignment_no'));
Route::post('save_freight_bill_entry',array('as'=>'save_freight_bill_entry','uses'=>'FreightBillController@store_freight_bill_entry'));
Route::get('AjaxGet_party_code/{id}',array('as'=>'FreightBillController','uses'=>'FreightBillController@AjaxGet_party_code'));
Route::post('update_invoice_freight_bill/{id}',array('as'=>'update_invoice_freight_bill','middleware' => ['auth'],'uses'=>'FreightBillController@update_invoice_freight_bill'));

Route::get('print_invoice/{id}',array('as'=>'FreightBillController','uses'=>'FreightBillController@print_invoice'));
Route::get('AjaxGet_getConsignment_data_for_normalbill/{id}',array('as'=>'AjaxGet_getConsignment_data_for_normalbill','uses'=>'FreightBillController@AjaxGet_getConsignment_data_for_normalbill'));


//end exacute-----
// bill
Route::get('/advance_voucher',array('as'=>'advance_voucher','middleware' => ['auth'], 'uses'=>'VoucherController@advance_voucher'));


//end exacute-----
//lorry hire processing

Route::get('/new_balance_process',array('as'=>'new_balance_process','middleware' => ['auth'], 'uses'=>'BalanceProcessController@new_balance_process'));
Route::post('/store_new_balance_process',array('as'=>'store_new_balance_process','middleware' => ['auth'], 'uses'=>'BalanceProcessController@store_new_balance_process'));
Route::get('AjaxGet_Challan_no/{id}',array('as'=>'AjaxGet_Challan_no','uses'=>'BalanceProcessController@AjaxGet_Challan_no'));

/*Home Page submenu*/

Route::get('transaction',array('as'=>'transaction','uses'=>'HomePageController@transaction'));
Route::post('updateHomeslider/{id}',array('as'=>'updateHomeslider','uses'=>'HomePageController@updateHomeslider'));
Route::get('PrincipalMsgLink',array('as'=>'PrincipalMsgLink','uses'=>'HomePageController@PrincipalMsgFunc'));


//deleting the data of new general notice
Route::get('/delete/{id}','HomePageController@delete');

Route::get('AdmissionsMainSectionLink',array('as'=>'AdmissionsMainSectionLink','uses'=>'HomePageController@AdmissionsMainSectionFunc'));

Route::get('AcademicsMainSectionLink',array('as'=>'AcademicsMainSectionLink','uses'=>'HomePageController@AcademicsMainSectionFunc'));

Route::get('DepartmentMainSectionLink',array('as'=>'DepartmentMainSectionLink','uses'=>'HomePageController@DepartmentMainSectionFunc'));

Route::get('FacilitiesMainSectionLink',array('as'=>'FacilitiesMainSectionLink','uses'=>'HomePageController@FacilitiesMainSectionFunc'));

Route::get('TenderMainSectionLink',array('as'=>'TenderMainSectionLink','uses'=>'HomePageController@TenderMainSectionFunc'));

Route::get('GalleryMainSectionLink',array('as'=>'GalleryMainSectionLink','uses'=>'HomePageController@GalleryMainSectionFunc'));

Route::get('ContactUsMainSectionLink',array('as'=>'ContactUsMainSectionLink','uses'=>'HomePageController@ContactUsMainSectionFunc'));

//Auth::routes();


Route::post('store_driver_entry1',array('as'=>'store_driver_entry1','uses'=>'TestController@store_driver_entry1'));
Route::get('store_driver_entry2',array('as'=>'store_driver_entry2','uses'=>'TestController@new_driver_entry1'));
Route::post('imgae_upload_test',array('as'=>'imgae_upload_test','uses'=>'TestController@imgae_upload_test'));
Route::post('exel',array('as'=>'exel','uses'=>'TestController@exel'));
Route::post('save_freight_bill_entry_test',array('as'=>'save_freight_bill_entry_test','uses'=>'TestController@store_freight_bill_entry_test'));
Route::get('AjaxGet_consignment_no_change/{id}',array('as'=>'AjaxGet_consignment_no_change','uses'=>'TestController@AjaxGet_consignment_no_change'));
Route::get('new_pdf',array('as'=>'new_pdf','uses'=>'TestController@new_pdf'));




//user routes
Route::get('/users',array('as'=>'users','middleware' => ['auth'], 'uses'=>'UserController@index'));
Route::get('createUsers',array('as'=>'createUsers','middleware' => ['auth'], 'uses'=>'UserController@register'));
Route::get('/singleUser/{id}',array('as'=>'singleUser','middleware' => ['auth'], 'uses'=>'UserController@singleUser'));
Route::Post('storeUser',['as'=>'storeUser','middleware' => ['auth'], 'uses'=>'UserController@storeUser']);
Route::get('/editUser/{id}',array('as'=>'editUser','middleware' => ['auth'], 'uses'=>'UserController@editUser'));
Route::Post('updateUser/{id}',array('as'=>'editUser','middleware' => ['auth'], 'uses'=>'UserController@updateUser'));
Route::get('deleteUser/{id}',array('as'=>'deleteUser','middleware' => ['auth'], 'uses'=>'UserController@deleteUser'));
Route::get('AjaxGet_login_email/{id}',array('as'=>'AjaxGet_login_email','uses'=>'UserController@AjaxGet_login_email'));



//coke bill

Route::get('/coke_bill_panel',array('as'=>'coke_bill_panel','middleware' => ['auth'], 'uses'=>'CokeFreightBillController@coke_bill_panel'));
Route::get('/coke_bill',array('as'=>'coke_bill','middleware' => ['auth'], 'uses'=>'CokeFreightBillController@coke_bill'));
Route::get('AjaxGet_getConsignment_data_for_bill/{id}',array('as'=>'AjaxGet_getConsignment_data_for_bill','uses'=>'CokeFreightBillController@AjaxGet_getConsignment_data_for_bill'));
Route::get('AjaxGet_trip_id_check/{id}',array('as'=>'AjaxGet_trip_id_check','uses'=>'CokeFreightBillController@AjaxGet_trip_id_check'));
Route::get('AjaxGet_load_id_check/{id}',array('as'=>'AjaxGet_load_id_check','uses'=>'CokeFreightBillController@AjaxGet_load_id_check'));
Route::post('store_coke_freight_bill_entry',array('as'=>'store_coke_freight_bill_entry','uses'=>'CokeFreightBillController@store_coke_freight_bill_entry'));
Route::get('print_coke_bill/{id}',array('as'=>'print_coke_bill','uses'=>'CokeFreightBillController@print_coke_bill'));
Route::get('edit_freight_coke_bill/{id}',array('as'=>'edit_freight_coke_bill','middleware' => ['auth'],'uses'=>'CokeFreightBillController@edit_freight_coke_bill'));
Route::get('delete_coke_bill/{id}',array('as'=>'delete_coke_bill','middleware' => ['auth'],'uses'=>'CokeFreightBillController@delete_coke_bill'));
Route::Post('update_freight_bill/{id}',array('as'=>'update_freight_bill','middleware' => ['auth'], 'uses'=>'CokeFreightBillController@update_freight_bill'));

//exel

Route::get('export_all_coke_consignment_data', 'CockConsignmentController@export_all_coke_consignment_data')->name('export_all_coke_consignment_data');
Route::get('export_all_coke_challan_data', 'CokeChallanController@export_all_coke_challan_data')->name('export_all_coke_challan_data');

//Coke Consignemntreporting
Route::get('coke_consignment_report_panel', 'ReportingController@coke_consignment_report_panel')->name('coke_consignment_report_panel');
Route::get('date_wise_coke_consignment_report', 'ReportingController@date_wise_coke_consignment_report')->name('date_wise_coke_consignment_report');
Route::get('party_wise_coke_consignment_report', 'ReportingController@party_wise_coke_consignment_report')->name('party_wise_coke_consignment_report');
Route::get('party_date_wise_coke_consignment_report', 'ReportingController@party_date_wise_coke_consignment_report')->name('party_date_wise_coke_consignment_report');
Route::get('truck_date_wise_coke_consignment_report', 'ReportingController@truck_date_wise_coke_consignment_report')->name('truck_date_wise_coke_consignment_report');
Route::get('unbilled_coke_consignment_report', 'ReportingController@unbilled_coke_consignment_report')->name('unbilled_coke_consignment_report');
Route::get('location_date_wise_coke_consignment_report', 'ReportingController@location_date_wise_coke_consignment_report')->name('location_date_wise_coke_consignment_report');
Route::get('detailed_coke_consignment_report', 'ReportingController@detailed_coke_consignment_report')->name('detailed_coke_consignment_report');
Route::post('export_date_wise_coke_consignment_data', 'ReportingController@export_date_wise_coke_consignment_data')->name('export_date_wise_coke_consignment_data');
Route::post('export_unbilled_coke_consignment_data', 'ReportingController@export_unbilled_coke_consignment_data')->name('export_unbilled_coke_consignment_data');
Route::post('export_party_wise_coke_consignment_data', 'ReportingController@export_party_wise_coke_consignment_data')->name('export_party_wise_coke_consignment_data');
Route::post('export_party_date_wise_coke_consignment_data', 'ReportingController@export_party_date_wise_coke_consignment_data')->name('export_party_date_wise_coke_consignment_data');
Route::post('export_truck_date_wise_coke_consignment_data', 'ReportingController@export_truck_date_wise_coke_consignment_data')->name('export_truck_date_wise_coke_consignment_data');
Route::post('export_location_date_wise_coke_consignment_data', 'ReportingController@export_location_date_wise_coke_consignment_data')->name('export_location_date_wise_coke_consignment_data');
Route::post('export_detailed_coke_consignment_data', 'ReportingController@export_detailed_coke_consignment_data')->name('export_detailed_coke_consignment_data');

Route::get('coke_bill_report_panel', 'ReportingController@coke_bill_report_panel')->name('coke_bill_report_panel');
Route::get('AjaxGet_consignment_no_data2/{id}',array('as'=>'AjaxGet_consignment_no_data2','uses'=>'ConsignmentController@AjaxGet_consignment_no_data2'));
Route::get('AjaxGet_coke_bill_no_data2/{id}',array('as'=>'AjaxGet_coke_bill_no_data2','uses'=>'ReportingController@AjaxGet_coke_bill_no_data2'));

Route::get('coke_bill_view_report_panel', 'ReportingController@coke_bill_view_report_panel')->name('coke_bill_view_report_panel');
Route::post('export_coke_bill_report', 'ReportingController@export_coke_bill_report')->name('export_coke_bill_report');

Route::get('export_indent_report/{id}',array('as'=>'export_indent_report','uses'=>'ReportingController@export_indent_report'));

//Coke Consignemntreporting
Route::get('coke_challan_report_panel', 'ReportingController@coke_challan_report_panel')->name('coke_challan_report_panel');
Route::get('date_wise_coke_challan_report', 'ReportingController@date_wise_coke_challan_report')->name('date_wise_coke_challan_report');
Route::get('unbilled_coke_challan_acknowledgement', 'ReportingController@unbilled_coke_challan_acknowledgement')->name('unbilled_coke_challan_acknowledgement');
Route::post('export_unbilled_coke_challan_acknowledgement_data', 'ReportingController@export_unbilled_coke_challan_acknowledgement_data')->name('export_unbilled_coke_challan_acknowledgement_data');
Route::post('export_date_wise_coke_challan_data', 'ReportingController@export_date_wise_coke_challan_data')->name('export_date_wise_coke_challan_data');
Route::get('detailed_coke_challan_report', 'ReportingController@detailed_coke_challan_report')->name('detailed_coke_challan_report');
Route::post('export_detailed_coke_challan_data', 'ReportingController@export_detailed_coke_challan_data')->name('export_detailed_coke_challan_data');
Route::get('truck_date_wise_coke_challan_report', 'ReportingController@truck_date_wise_coke_challan_report')->name('truck_date_wise_coke_challan_report');
Route::post('export_truck_date_wise_coke_challan_data', 'ReportingController@export_truck_date_wise_coke_challan_data')->name('export_truck_date_wise_coke_challan_data');
Route::get('petrol_pump_report', 'ReportingController@petrol_pump_report')->name('petrol_pump_report');
Route::post('export_petrol_pump_report', 'ReportingController@export_petrol_pump_report')->name('export_petrol_pump_report');
Route::get('pan_no_coke_challan_report', 'ReportingController@pan_no_coke_challan_report')->name('pan_no_coke_challan_report');


//test challan_no

Route::get('wowtest', 'BranchController@wowtest')->name('wowtest');
//view
Route::get('single_consignment_view_panel', 'SingleViewPanelController@single_consignment_view_panel')->name('single_consignment_view_panel');
Route::get('coke_consignment_view_report_panel', 'SingleViewPanelController@coke_consignment_view_report_panel')->name('coke_consignment_view_report_panel');
//print_panel
Route::get('single_consignment_print_panel', 'SingleViewPanelController@single_consignment_print_panel')->name('single_consignment_print_panel');
Route::get('coke_consignment_print_report_panel', 'SingleViewPanelController@coke_consignment_print_report_panel')->name('coke_consignment_print_report_panel');
Route::get('AjaxGet_consignment_no_data_for_single/{id}',array('as'=>'AjaxGet_consignment_no_data_for_single','uses'=>'SingleViewPanelController@AjaxGet_consignment_no_data_for_single'));


//bill register
Route::get('view_bill_register_entry', 'BillRegisterController@view_bill_register_entry')->name('view_bill_register_entry');
Route::get('new_bill_register_entry', 'BillRegisterController@new_bill_register_entry')->name('new_bill_register_entry');
Route::get('export_bill_register', 'BillRegisterController@export_bill_register')->name('export_bill_register');
Route::get('export_unpaid_bill', 'BillRegisterController@export_unpaid_bill')->name('export_unpaid_bill');
Route::post('store_bill_register', 'BillRegisterController@store_bill_register')->name('store_bill_register');

// Truck Tracking

Route::get('/truck_create_panel',array('as'=>'truck_create_panel','middleware' => ['auth'], 'uses'=>'TruckTrackingController@truck_create_panel'));

Route::get('ajax_truck/{id}',array('as'=>'ajax_truck','uses'=>'TruckTrackingController@ajax_truck'));
Route::post('/store_truck',array('as'=>'store_truck','middleware' => ['auth'], 'uses'=>'TruckTrackingController@store_truck'));
Route::get('truck_view_panel',array('as'=>'truck_view_panel','uses'=>'TruckTrackingController@truck_view_panel'));

Route::get('/edit_truck/{id}',array('as'=>'edit_truck','middleware' => ['auth'],'uses'=>'TruckTrackingController@edit_truck'));
Route::Post('update_truck_tracking/{id}',array('as'=>'update_truck_tracking','middleware' => ['auth'], 'uses'=>'TruckTrackingController@update_truck_tracking'));
Route::get('/truck_track',array('as'=>'truck_track','middleware' => ['auth'], 'uses'=>'TruckTrackingController@truck_track'));

Route::get('ajax_truck_track/{consignment_no}',array('as'=>'ajax_truck_track','uses'=>'TruckTrackingController@ajax_truck_track'));



//unbilled ackwnoledgement 

Route::get('/unbilled_coke_acknowledgement',array('as'=>'unbilled_coke_acknowledgement','middleware' => ['auth'], 'uses'=>'ReportingController@unbilled_coke_acknowledgement'));
Route::get('export_unbilled_coke_acknowledgement_data', 'ReportingController@export_unbilled_coke_acknowledgement_data')->name('export_unbilled_coke_acknowledgement_data');


//tax invoice

Route::get('/print_tax_invoice/{id}',array('as'=>'print_tax_invoice','middleware' => ['auth'], 'uses'=>'FreightBillController@print_tax_invoice'));



///normal transaction reporting

//consignment reports
Route::get('/normal_consignment_report_panel',array('as'=>'normal_consignment_report_panel','middleware' => ['auth'], 'uses'=>'TransactionReportingController@normal_consignment_report_panel'));
Route::get('/date_wise_normal_consignment_report',array('as'=>'date_wise_normal_consignment_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@date_wise_normal_consignment_report'));
Route::get('/party_date_wise_normal_consignment_report',array('as'=>'party_date_wise_normal_consignment_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@party_date_wise_normal_consignment_report'));
Route::get('/party_wise_normal_consignment_report',array('as'=>'party_wise_normal_consignment_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@party_wise_normal_consignment_report'));
Route::get('/location_date_wise_normal_consignment_report',array('as'=>'location_date_wise_normal_consignment_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@location_date_wise_normal_consignment_report'));
Route::get('/truck_date_wise_normal_consignment_report',array('as'=>'truck_date_wise_normal_consignment_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@truck_date_wise_normal_consignment_report'));
Route::get('/unbilled_normal_consignment_report',array('as'=>'unbilled_normal_consignment_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@unbilled_normal_consignment_report'));

//Challan Reports
Route::get('/normal_challan_report_panel',array('as'=>'normal_challan_report_panel','middleware' => ['auth'], 'uses'=>'TransactionReportingController@normal_challan_report_panel'));
Route::get('/date_wise_normal_challan_report',array('as'=>'date_wise_normal_challan_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@date_wise_normal_challan_report'));
Route::get('/normal_petrol_pump_report',array('as'=>'normal_petrol_pump_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@normal_petrol_pump_report'));
Route::get('/truck_date_wise_normal_challan_report',array('as'=>'truck_date_wise_normal_challan_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@truck_date_wise_normal_challan_report'));
Route::get('/detailed_normal_challan_report',array('as'=>'detailed_normal_challan_report','middleware' => ['auth'], 'uses'=>'TransactionReportingController@detailed_normal_challan_report'));
Route::get('unbilled_normal_challan_acknowledgement', 'TransactionReportingController@unbilled_normal_challan_acknowledgement')->name('unbilled_normal_challan_acknowledgement');
Route::get('normal_bill_report_panel', 'TransactionReportingController@normal_bill_report_panel')->name('normal_bill_report_panel');
Route::get('normal_bill_view_report_panel', 'TransactionReportingController@normal_bill_view_report_panel')->name('normal_bill_view_report_panel');
Route::get('AjaxGet_normal_bill_no_data2/{id}',array('as'=>'AjaxGet_normal_bill_no_data2','uses'=>'ReportingController@AjaxGet_normal_bill_no_data2'));

Route::get('pan_no_normal_challan_report', 'TransactionReportingController@pan_no_normal_challan_report')->name('pan_no_normal_challan_report');




///export to excel - consignment report

Route::post('export_date_wise_normal_consignment_data', 'TransactionReportingController@export_date_wise_normal_consignment_data')->name('export_date_wise_normal_consignment_data');
Route::post('export_party_wise_normal_consignment_data', 'TransactionReportingController@export_party_wise_normal_consignment_data')->name('export_party_wise_normal_consignment_data');
Route::post('export_party_wise_consignment_data', 'TransactionReportingController@export_party_wise_consignment_data')->name('export_party_wise_consignment_data');
Route::post('export_location_date_wise_normal_consignment_data', 'TransactionReportingController@export_location_date_wise_normal_consignment_data')->name('export_location_date_wise_normal_consignment_data');
Route::post('export_truck_date_wise_normal_consignment_data', 'TransactionReportingController@export_truck_date_wise_normal_consignment_data')->name('export_truck_date_wise_normal_consignment_data');
Route::post('export_unbilled_normal_consignment_data', 'TransactionReportingController@export_unbilled_normal_consignment_data')->name('export_unbilled_normal_consignment_data');


// export to excel - challan report


Route::post('export_date_wise_normal_challan_data', 'TransactionReportingController@export_date_wise_normal_challan_data')->name('export_date_wise_normal_challan_data');
Route::post('export_normal_petrol_pump_report', 'TransactionReportingController@export_normal_petrol_pump_report')->name('export_normal_petrol_pump_report');
Route::post('export_truck_date_normal_coke_challan_data', 'TransactionReportingController@export_truck_date_normal_coke_challan_data')->name('export_truck_date_normal_coke_challan_data');
Route::post('export_detailed_normal_challan_data', 'TransactionReportingController@export_detailed_normal_challan_data')->name('export_detailed_normal_challan_data');
Route::post('export_unbilled_normal_challan_acknowledgement_data', 'TransactionReportingController@export_unbilled_normal_challan_acknowledgement_data')->name('export_unbilled_normal_challan_acknowledgement_data');
Route::get('detailed_normal_consignment_report', 'TransactionReportingController@detailed_normal_consignment_report')->name('detailed_normal_consignment_report');
Route::post('export_detailed_normal_consignment_data', 'TransactionReportingController@export_detailed_normal_consignment_data')->name('export_detailed_normal_consignment_data');






