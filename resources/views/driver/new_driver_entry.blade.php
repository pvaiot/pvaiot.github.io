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
        <h2>New Driver Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Driver Entry</span></li>
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

    <?php echo Form::open(array('route' => 'store_driver_entry','files' => true, 'enctype' => 'multipart/form-data')); ?>
    <div class="well">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Driver Name</label>
                    <input type="text" name="truck_driver_name" id="truck_driver_name" class="form-control" placeholder="Driver Name" required autofocus>

                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">License No</label>
                    <input type="text" name="truck_driver_license_no" id="truck_driver_license_no" class="form-control" placeholder="License No" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Palce Of Issue</label>
                    <input type="text" name="truck_driver_license_palce_of_issue" id="truck_driver_license_palce_of_issue" class="form-control" placeholder="Palce Of Issue">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Address</label>
                    <input type="text" name="truck_driver_address" id="truck_driver_address" class="form-control" placeholder="Address">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Mobile No</label>
                    <input type="text" name="truck_driver_mob_no" id="truck_driver_mob_no" class="form-control" placeholder="Mob No">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Contact No</label>
                    <input type="text" name="truck_driver_contact_no" id="truck_driver_contact_no" class="form-control" placeholder="Contact No">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Land Line No</label>
                    <input type="text" name="truck_driver_land_line_no" id="truck_driver_land_line_no" class="form-control" placeholder="Land Line No">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload License Image (Front)</label>
                    <div id="image-holder">

                    </div>
                    <input type="file" class="form-control" name="file" id="fileUpload" multiple value=""/>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload License Image (Back)</label>
                    <div id="image-holder1">

                    </div>
                    {!! Form::file('file1', array('class' => 'form-control', 'id'=>'fileUpload1', 'multiple'=>'multiple')) !!}
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
            $(document).ready(function() {
                $("#fileUpload").on('change', function() {
                    //Get count of selected files
                    var countFiles = $(this)[0].files.length;
                    var imgPath = $(this)[0].value;
                    var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
                    var image_holder = $("#image-holder");
                    image_holder.empty();
                    if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
                        if (typeof(FileReader) != "undefined") {
                            //loop for each file selected for uploaded.
                            for (var i = 0; i < countFiles; i++)
                            {
                                var reader = new FileReader();
                                reader.onload = function(e) {
                                    $("<img />", {
                                        "src": e.target.result,
                                        "class": "img img-thumbnail"
                                    }).appendTo(image_holder);
                                }
                                image_holder.show();
                                reader.readAsDataURL($(this)[0].files[i]);
                            }
                        } else {
                            alert("This browser does not support FileReader.");
                        }
                    } else {
                        alert("Pls select only images");
                    }
                });
            });
            $(document).ready(function() {
                $("#fileUpload1").on('change', function() {
                    //Get count of selected files
                    var countFiles = $(this)[0].files.length;
                    var imgPath = $(this)[0].value;
                    var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
                    var image_holder = $("#image-holder1");
                    image_holder.empty();
                    if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
                        if (typeof(FileReader) != "undefined") {
                            //loop for each file selected for uploaded.
                            for (var i = 0; i < countFiles; i++)
                            {
                                var reader = new FileReader();
                                reader.onload = function(e) {
                                    $("<img />", {
                                        "src": e.target.result,
                                        "class": "img img-thumbnail"
                                    }).appendTo(image_holder);
                                }
                                image_holder.show();
                                reader.readAsDataURL($(this)[0].files[i]);
                            }
                        } else {
                            alert("This browser does not support FileReader.");
                        }
                    } else {
                        alert("Pls select only images");
                    }
                });
            });

            $(".alert").fadeTo(2000, 500).slideUp(500, function(){
                $(".alert").slideUp(500);
            });

        </script>

@endsection