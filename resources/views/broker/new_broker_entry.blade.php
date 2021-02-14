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
        <h2>New Broker Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Broker Entry</span></li>
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

    <?php echo Form::open(array('route' => 'store_broker_entry','files' => true, 'enctype' => 'multipart/form-data')); ?>
    <div class="well">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Name</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus tabindex="1">

                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Address</label>
                    <input type="text" name="address" id="address" class="form-control" placeholder="Address" tabindex="2">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Pan No</label>
                    <input type="text" name="pan_no" id="pan_no" class="form-control" placeholder="Pan No" tabindex="3">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Mobile No</label>
                    <input type="text" name="mobile_no" id="mobile_no" class="form-control" placeholder="Mobile No" tabindex="4">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload Visiting Card (Front)</label>
                    <div id="image-holder">

                    </div>
                    <input type="file" class="form-control" name="file" id="fileUpload" multiple value=""/>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Upload Visiting Card (Back)</label>
                    <div id="image-holder1">

                    </div>
                    {!! Form::file('file1', array('class' => 'form-control', 'id'=>'fileUpload1', 'multiple'=>'multiple')) !!}
                </div>
            </div>
        </div>
        <br>
        <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px">Additional Information</span></h4>
        <div class="table-responsive">
            <table id="items" class="table table-no-more table-bordered mb-none billing_table" style="font-size: 13px!important;">
                <thead>
                <tr style="background-color: #09C6AB;color: #ffffff">
                    <th>Contact No.<span style="color: red">*</span></th>
                    <th>Contact Person<span style="color: red">*</span></th>
                    <th>Action</th>
                </tr>
                </thead>

                <tr class="item-row" style="border-bottom: solid 1px black">

                    <td data-title="Contact No." class="main_td"><input name="rows[0][contact_no]" class="contact_no form-control"></td>
                    <td data-title="Contact Person" class="main_td"><input name="rows[0][contact_person]" class="contact_person form-control" /></td>
                    <td data-title="Action"><a class="btn btn-danger btn-sm addrow updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px">ADD</a></td>
                </tr>

            </table>
        </div><br>
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

                var i = 1;
                var count = 0;
                $('input').click(function () {
                    $(this).select();
                });


                $(document).on('click', '.addrow', function () {

                    $(this).text('x Del');
                    $(this).attr('class', 'btn btn-info btn-sm del');
                    $(".item-row:last").find('.mybtn').hide();
                    i++;

                    count++;
                    var id = count;


                    $(".item-row:last").after('<tr class="item-row" style="border-bottom: solid 1px black">' +
                            '<td data-title="Contact No." class="main_td"><input name="rows[' + id + '][contact_no]" class="contact_no form-control"></td>' +
                            '<td data-title="Contact Person" class="main_td"><input name="rows[' + id + '][contact_person]" id=\"contact_person' + id + '\"  class="contact_person form-control"/></td>' +
                            '<td data-title="Action" class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                            '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>' +
                            '</td></tr>');
                });

                $(document).on('click', '.delete', function(){
//                        $(".del").on('click',function(){
                    $(this).parent().parent().remove();
                    $(".del").eq(-1).text('ADD');
                    $('.del').eq(-1).attr('class','btn btn-danger btn-sm addrow');


//                        });
                });$(document).on('click', '.del', function(){
//                        $(".del").on('click',function(){
                    $(this).parent().parent().remove();

//                        });
                });


            });
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