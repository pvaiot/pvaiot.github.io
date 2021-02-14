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
        <h2>New Petrol Pump Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Petrol Pump Entry</span></li>
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

    <?php echo Form::open(array('route' => 'store_petrol_pump_entry')); ?>

    <div class="row" style="min-height: 400px;">
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Petrol Pump Name</label>
                        <input type="text" name="petrol_pump_name" id="petrol_pump_name" class="form-control" placeholder="Petrol Pump Name" required autofocus>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Address</label>
                        <input type="text" name="address" id="address" class="form-control" placeholder="Address">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">City</label>
                        <input type="text" name="city" id="city" class="form-control" placeholder="City">
                    </div>
                </div>

            </div><br>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">State</label>
                        <input type="text" name="state" id="state" class="form-control" placeholder="State">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Contact No.</label>
                        <input type="text" name="contact_no" id="contact_no" class="form-control" placeholder="Contact No">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="control-label">Contact Person</label>
                        <input type="text" name="contact_person" id="contact_person" class="form-control" placeholder="Contact Person">
                    </div>
                </div>
            </div><br>
            <footer class="col-md-8 col-md-offset-4">
                <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </footer>
            <br>

        <br> {{form::close()}}
    </div>
    <!-- panel body ends here -->


    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>


        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });

    </script>

@endsection