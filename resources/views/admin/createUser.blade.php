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
        <h2>New Employee Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Employee Entry</span></li>
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

    <?php echo Form::open(array('route' => 'storeUser','onsubmit'=> "return confirm('Do you really want to submit the form?');")); ?>
    <div class="well">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Name<span style="color: red; font-size: 15px"> *</span></label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Designation<span style="color: red"> *</span></label>
                    <select  class="form-control" style="width:100%" name="role" required>
                        <option value="">Select Designation</option>
                        <option value="Admin">Admin</option>
                        <option value="User">User</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Employee ID<span style="color: red"> *</span></label>
                    <input type="text" name="emp_id" id="emp_id" class="form-control" placeholder="Employee ID" required>
                </div>
            </div>

        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Address<span style="color: red"> *</span></label>
                    <input type="text" name="address" id="address" class="form-control" placeholder="Address" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Mobile No<span style="color: red"> *</span></label>
                    <input type="text" name="mobile_no" id="mobile_no" class="form-control" placeholder="Mobile No." required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Aadhar No.</label>
                    <input type="text" name="aadhar" id="aadhar" class="form-control" placeholder="Aadhar No." required>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">City<span style="color: red"> *</span></label>
                    <input type="text" name="city" id="city" class="form-control" placeholder="City" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">State<span style="color: red"> *</span></label>
                    <input type="text" name="state" id="state" class="form-control" placeholder="State" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Zip Code<span style="color: red"> *</span></label>
                    <input type="text" name="zip" id="zip" class="form-control" placeholder="Zip Code" required>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Email<span style="color: red"> *</span></label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Account password<span style="color: red"> *</span></label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Confirm Password<span style="color: red"> *</span></label>
                    <input type="password" class="form-control" name="password_confirmation" id="password_confirmation" placeholder="Enter Password" required>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <footer class="col-md-8">
                <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </footer>
        </div>
    </div>

    {{form::close()}}

            <!-- panel body ends here -->

    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>

        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });

    </script>

@endsection

