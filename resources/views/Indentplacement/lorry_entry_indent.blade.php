@extends('layouts.newAdminPanal')
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
        <h2>New Lorry Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Lorry  Entry</span></li>
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

    <?php echo Form::open(array('route' => 'store_lorry_entry','files' => true, 'enctype' => 'multipart/form-data')); ?>
    <div class="well">
        <div class="row">
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Truck No</label>
                    <input type="text" name="truck_no" value="{{$bata->truck_no}}" id="truck_no" class="form-control" placeholder="Truck No" required autofocus tabindex="1">
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Engine No</label>
                    <input type="text" name="engin_no" id="engin_no" class="form-control" placeholder="Engine No" tabindex="2">
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Chassis No</label>
                    <input type="text" name="chassis_no" id="chassis_no" class="form-control" placeholder="Chassis No" tabindex="3">
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Make</label>
                    <input type="text" name="make" id="make" class="form-control" placeholder="Make" tabindex="4">
                </div>
            </div>
        </div>
        <br>
        <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px;">Truck Owner Details</span></h4>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Truck Owner Name</label>
                    <input type="text" name="truck_owner_name"  id="truck_owner_name" class="form-control" placeholder="Truck Owner Name" tabindex="5">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Owner Address</label>
                    <textarea type="text" data-plugin-textarea-autosize name="truck_owner_address" id="truck_owner_address" class="form-control" placeholder="Owner Address" tabindex="6"></textarea>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Mobile No</label>
                    <input type="text" name="truck_owner_mob_no" id="truck_owner_mob_no" class="form-control" placeholder="Mobile No" tabindex="7">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Land Line No</label>
                    <input type="text" name="truck_owner_land_line_no" id="truck_owner_land_line_no" class="form-control" placeholder="Land Line No" tabindex="9">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Contact No</label>
                    <input type="text" name="truck_owner_contact_no" id="truck_owner_contact_no" class="form-control" placeholder="Contact No" tabindex="8">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Pan No</label>
                    <input type="text" name="truck_owner_pan_no" id="truck_owner_pan_no" class="form-control" placeholder="Pan No" tabindex="10">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">GST No</label>
                    <input type="text" name="truck_owner_gst_no" id="truck_owner_gst_no" class="form-control" placeholder="GST No" tabindex="11">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Bank Name</label>
                    <select data-plugin-selectTwo style="width: 100% !important;" name="truck_owner_bank_name" id="truck_owner_bank_name" class="form-control" tabindex="12">
                        <option value=""> Select Bank Name</option>
                        <?php  $datas = App\BankName::all(); ?>
                        @foreach($datas as $data)
                            <option value="{{$data->id}}">{{$data->bank_name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Bank A/C No</label>
                    <input type="text" name="truck_owner_bank_ac_no" id="truck_owner_bank_ac_no" class="form-control" placeholder="Bank A/C No" tabindex="13">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">IFSC Code</label>
                    <input type="text" name="truck_owner_ifsc_code" id="truck_owner_ifsc_code" class="form-control" placeholder="IFSC Code" tabindex="14">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload RC</label>
                    <div id="image-holder">

                    </div>
                    <input type="file" class="form-control" name="file" id="fileUpload" multiple value=""/>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload Permit</label>
                    <div id="image-holder1">

                    </div>
                    {!! Form::file('file1', array('class' => 'form-control', 'id'=>'fileUpload1', 'multiple'=>'multiple')) !!}
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload Insurance</label>
                    <div id="image-holder2">

                    </div>
                    {!! Form::file('file2', array('class' => 'form-control', 'id'=>'fileUpload2', 'multiple'=>'multiple')) !!}
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload Fitness</label>
                    <div id="image-holder3">

                    </div>
                    {!! Form::file('file3', array('class' => 'form-control', 'id'=>'fileUpload3', 'multiple'=>'multiple')) !!}
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload Pan Card</label>
                    <div id="image-holder4">

                    </div>
                    {!! Form::file('file4', array('class' => 'form-control', 'id'=>'fileUpload4', 'multiple'=>'multiple')) !!}
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
        $(document).ready(function() {
            $("#fileUpload2").on('change', function() {
                //Get count of selected files
                var countFiles = $(this)[0].files.length;
                var imgPath = $(this)[0].value;
                var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
                var image_holder = $("#image-holder2");
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
            $("#fileUpload3").on('change', function() {
                //Get count of selected files
                var countFiles = $(this)[0].files.length;
                var imgPath = $(this)[0].value;
                var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
                var image_holder = $("#image-holder3");
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
            $("#fileUpload4").on('change', function() {
                //Get count of selected files
                var countFiles = $(this)[0].files.length;
                var imgPath = $(this)[0].value;
                var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
                var image_holder = $("#image-holder4");
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


