@extends('layouts.adminPanel')
@section('title')
    Admin Panel
@endsection
@section('custom_css')

    <style>
        table, tr,td{
            border-top: none!important;
        }
        .btn{
            padding-top: 8px;
            padding-bottom: 8px;

        }
        .table{
            box-shadow: 0 0 20px #ccc
        }
        .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
            background-color:  #eeeff1;
        }

        .select2-container .select2-selection--single {
            height: 38px !important;
            border-color:#09C6AB!important;

        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-top: 3px!important;
        }
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .cndata .form-control{
            font-size: 12px;padding: 0px;font-weight: 400;
        }
    </style>
@endsection


@section('content')


    <div class="well" style="border: 0px;">
        @if(Session::has('flash_message'))
            <div class="alert alert-success">
                {{ Session::get('flash_message') }}
            </div>
        @endif
        <br>

        <h4 class="text-center"><span style="border-bottom: dotted 2px green;padding-bottom: 2px">New Freight Bill</span></h4>

        @if($errors->any())
            <div class="alert alert-danger">
                @foreach($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>
        @endif

        <hr>
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="panel panel-default" style="border: 0px">
            <?php echo Form::open(array('route' => 'exel'))?>

                <input type="date" name="date1" id="date1" value="{{$from_date}}" hidden/>
                <input type="date" name="date2" id="date2" value="{{$upto_date}}" hidden/>

                <button type="submit" id="submit_date" value="Export to Exel">Export to Exel</button>

            {{form::close()}}

            <?php echo Form::open(array('route' => 'save_freight_bill_entry_test','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>


                <div class="table-responsive" id="cndetails">
                <table class="table table-striped table-condensed table-bordered" id="saved_data">

                    <thead>
                    <tr style="font-size: 12px;">
                        <th class="text-center">consignment id</th>
                        <th class="text-center">category</th>
                        <th class="text-center">package</th>
                        <th class="text-center">net_weight</th>
                    </tr>
                    </thead>
                    <tbody class="cndata">
                    @foreach($final_bill as $final_bill)
                    <tr>
                        <td>{{$final_bill->consignment_no}}</td>
                        <td>{{$final_bill->con_date}}</td>
                        <td>{{$final_bill->party_code}}</td>
                        <td>{{$final_bill->billed_at}}</td>
                    </tr>
                        @endforeach
                    </tbody>

                </table>

            </div>
            {{form::close()}}
                    <!-- panel body ends here -->
        </div> <!-- invoice details panel ends here -->
    </div>

    {{----------------------------------------------------------------------------------- end of bill here ----------------------------------}}


@endsection

