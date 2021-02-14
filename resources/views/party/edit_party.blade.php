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
        <h2>New Party Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Party Entry</span></li>
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

    <?php echo Form::open(array('url' =>['update_party',$part->id])); ?>

    <div class="well">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Name</label>
                    <input type="text" name="name" id="name" value="{{$part->name}}" class="form-control" placeholder="Name" required autofocus >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Party Code</label>
                    <input type="text" name="party_code" id="party_code" value="{{$part->party_code}}" class="form-control" placeholder="Party Code" >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Pan No</label>
                    <input type="text" name="pan_no" id="pan_no" value="{{$part->pan_no}}" class="form-control" placeholder="Pan No" >
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Gst No</label>
                    <input type="text" name="gst_no" id="gst_no" value="{{$part->gst_no}}" class="form-control" placeholder="gst_no" >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Address</label>
                    <input type="text" name="address" id="address" value="{{$part->address}}" class="form-control" placeholder="address" >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Mobile No</label>
                    <input type="text" name="mobile_no" id="mobile_no" value="{{$part->mobile_no}}" class="form-control" placeholder="Mobile No" >
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Contact No</label>
                    <input type="text" name="contact_no" id="contact_no" value="{{$part->contact_no}}" class="form-control" placeholder="Contact No" >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Land Line No</label>
                    <input type="text" name="land_line_no" id="land_line_no" value="{{$part->land_line_no}}" class="form-control" placeholder="Land Line No" >
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Email Id</label>
                    <input type="text" name="email_id" id="email_id" value="{{$part->email_id}}" class="form-control" placeholder="Email Id" >
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

