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
        <h2>New Bank Account Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Bank Account Entry</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    <?php echo Form::open(array('route' => 'store_bank_account_entry')); ?>

    <div class="row">
        <div class="col-md-8 col-md-offset-2" style="">
            <br>
            <table class="table">

                <tr>
                    <td style="width: 30%">Bank Name<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <select data-plugin-selectTwo name="bank_name" id="bank_name" class="form-control" required tabindex="1" autofocus>
                            <option value=""> Select Bank Name</option>
                            <?php  $datas = App\BankName::all(); ?>
                            @foreach($datas as $data)
                                <option value="{{$data->id}}">{{$data->bank_name}}</option>
                            @endforeach
                        </select>



                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Account Holder Name<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <input type="text" name="account_holder_name" id="account_holder_name" class="form-control" placeholder="Account Holder Name" required tabindex="2">

                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Bank A/C No<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <input type="text" name="bank_account_no" id="bank_account_no" class="form-control" placeholder="Bank Account No" required tabindex="3">

                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">IFSC Code</td>
                    <td>
                        <input type="text" name="ifsc_code" id="ifsc_code" class="form-control" placeholder="IFSC Code" tabindex="4">

                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Bank Address</td>
                    <td>
                        <input type="text" name="bank_address" id="bank_address" class="form-control" placeholder="Bank Address" tabindex="5">

                    </td>
                </tr>

            </table>
            <footer class="col-md-8 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </footer>
            <br>
        </div>

        <br> {{form::close()}}

                <!-- panel body ends here -->


        {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

        <script>

            var product_type =  [/* states array*/];
            $("#bank_name").select2({
                data: product_type
            });

            $(".alert").fadeTo(2000, 500).slideUp(500, function(){
                $(".alert").slideUp(500);
            });

        </script>

@endsection