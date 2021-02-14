@extends('layouts.adminPanelTable')
@section('title')
    Create Consignment
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

    </style>
@endsection
@section('content')
    <div class="well">
        @if(Session::has('flash_message'))
            <div class="alert alert-success">
                {{ Session::get('flash_message') }}
            </div>
        @endif
        <br>


        <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Advance Voucher Entry</span></h4>
        @if($errors->any())
            <div class="alert alert-danger">
                @foreach($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>
        @endif

        <a href="{{url('home_page')}}" class="btn btn-primary btn-sm">Back</a>
        <hr>
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="panel panel-default">

            <div class="panel-body">


                <?php echo Form::open(array('route' => 'store_consignment_entry','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>

                <div class="row" style="">
                    <div class="col-md-6">
                        <br>
                        <table class="table table-striped">

                            <tr>
                                <td style="width: 30%">Voucher Date<span style="color:red">*</span></td>
                                <td>

                                    <input type="text" name="voucher_date" id="voucher_date"   class="styledate form-control" autofocus  required/>                                    </td>

                            </tr>

                            <tr>
                                <td style="width: 30%">Branch<span style="color: red">*</span></td>
                                <td>

                                    <select name="branch" id="branch" class="form-control" required >
                                        <option value=""> Select Branch</option>
                                        <?php  $datas = App\Branch::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->city}}">{{$data->city}}</option>
                                        @endforeach
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 30%">Mode</td>
                                <td style="padding: 17px">
                                    <label class="radio-inline">
                                        <input class="radio-inline" type="radio" name="pay_type" value="0"> CASH
                                    </label>
                                    <label class="radio-inline">
                                        <input class="radio-inline" type="radio" name="pay_type" value="1"> CHEQUE
                                    </label>
                                    <label class="radio-inline">
                                        <input class="radio-inline" type="radio" name="pay_type" value="2"> RTGS/NEFT
                                    </label>
                                </td>
                            </tr>



                            <tr>
                                <td style="width: 30%">Cheque No.</td>
                                <td>

                                    <input class="form-control" type='text' data-type="narration" id='narration' name='narration' placeholder="Cheque No"  required>

                                </td>
                            </tr>

                        </table>
                        <br>
                    </div>

                    <!-- --------------------end here---------------------- -->

                    <div class="col-md-6">
                        <br>
                        <table class="table table-striped">


                            <tr >
                                <td style="width: 30%">Voucher No.</td>
                                <td>


                                    <input class="form-control " type='text' data-type="voucher_no" id='voucher_no' name='voucher_no' placeholder="Voucher No"  required>

                                </td>
                            </tr>


                            <tr>
                                <td style="width: 30%">Voucher Type <span style="color: red">*</span></td>
                                <td >

                                    <select name="voucher_type" id="voucher_type" class="form-control" required >
                                        <option value=""> Select Voucher Type</option>
                                        <?php  $datas = App\Branch::all(); ?>
                                        @foreach($datas as $data)
                                            <option value="{{$data->city}}">{{$data->city}}</option>
                                        @endforeach
                                    </select>
                                </td>
                            </tr>



                            <tr>
                                <td style="width: 30%">Account Code <span style="color: red">*</span></td>
                                <td>

                                    <input class="form-control" type='text' data-type="account_code" id='account_code' name='account_code' placeholder="Account Code"  required>

                                </td>
                            </tr>

                            <tr>
                                <td  class="text-left" style="width: 30%">Date<span style="color: red">*</span></td>
                                <td>

                                    <input type="text" name="date" id="date"   class="styledate form-control" autofocus  required/>                                    </td>

                                </td>
                            </tr>


                        </table>
                    </div>
                </div>
                    <div class="row" style="">
                        <div class="col-md-6">
                            <br>
                            <table class="table table-striped">

                                <tr>
                                    <td style="width: 30%">Drawn On<span style="color: red">*</span></td>
                                    <td>

                                        <input class="form-control" type='text' data-type="drawn_on" id='drawn_on' name='drawn_on'  placeholder="Drawn On"  required>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 30%">Amount</td>
                                    <td>
                                        <input class="form-control" type='text' data-type="amount" id='amount' name='amount' placeholder="Amount"  required>

                                    </td>
                                </tr>



                                <tr>
                                    <td style="width: 30%">Narration</td>
                                    <td>

                                        <input class="form-control" type='text' data-type="narration" id='narration' name='narration' placeholder="Narration"  required>

                                    </td>
                                </tr>

                            </table>
                            <br>
                        </div>

                        <!-- --------------------end here---------------------- -->

                        <div class="col-md-6">
                            <br>

                            <table class="table table-striped text-center">

                                <tr >
                                    <td style="width: 30%">CN NO<span style="color: red">*</span></td>
                                    <td style="width: 30%">Amount<span style="color: red">*</span></td>
                                </tr>
                                <tr>
                                    <td>SASAD</td>
                                    <td>21313</td>
                                </tr>
                            </table>
                            <table class="table table-striped">

                                <tr>
                                    <td style="width: 30%">Balance Amount</td>
                                    <td>

                                        <input class="form-control" type='text' data-type="balance_amount" id='balance_amount' name='balance_amount' placeholder="Balance Amount"  required>

                                    </td>
                                </tr>

                            </table>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-1 col-md-offset-">
                            <button type="submit" id="submitandprint" class="btn btn-sm" >Save <span class="glyphicon glyphicon-hdd"></span></button>
                        </div>

                        <button type="reset" class="btn btn-info btn-sm" >Cancel <span class="glyphicon glyphicon-refresh"></span></button>
                    </div>
                {{form::close()}}
            </div> <!-- panel body ends here -->
        </div> <!-- invoice details panel ends here -->
    </div>
    <script type="text/javascript">
        //   ----------------date validation--------------------
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

        //   ----------------date validation--------------------

        var customer =  [/* states array*/];
        $("#challan_number").select2({
            data: customer
        });


    </script>


@endsection

