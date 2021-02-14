@extends('layouts.adminPanelTable')
@section('title')
    Update Broker
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
    </style>
@endsection
@section('content')
    <br>
    <br>
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px;">Update Broker Entry</span></h4>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    <?php echo Form::open(array('url' =>['update_broker',$brok->id],'files' => true,'enctype' => 'multipart/form-data')); ?>

    <div class="row">
        <div class="col-md-8 col-md-offset-2" style="">
            <br>
            <table class="table">

                <tr>
                    <td style="width: 30%">Name<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <input type="text" name="name" id="name" value="{{$brok->name}}" class="form-control" placeholder="Name" required autofocus tabindex="1">

                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Address</td>
                    <td>
                        <input type="text" name="address" id="address" value="{{$brok->address}}" class="form-control" placeholder="Address" tabindex="2">
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Pan No</td>
                    <td>
                        <input type="text" name="pan_no" id="pan_no" value="{{$brok->pan_no}}" class="form-control" placeholder="Pan No" tabindex="3">
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Mobile No</td>
                    <td>
                        <input type="text" name="mobile_no" id="mobile_no" value="{{$brok->mobile_no}}" class="form-control" placeholder="Mobile No" tabindex="4">
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Contact No</td>
                    <td>
                        <input type="text" name="contact_no" id="contact_no" value="{{$brok->contact_no}}" class="form-control" placeholder="Contact No" tabindex="5">
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Land Line No</td>
                    <td>
                        <input type="text" name="land_line_no" id="land_line_no" value="{{$brok->land_line_no}}" class="form-control" placeholder="Land Line No" tabindex="6">
                    </td>
                </tr>

            </table>
            <table class="table">
                <tr>

                    <td style="width: 30%">Upload License Image (Front)</td>
                    <td>
                        <div class="img-thumbnail">
                            <?php $broker_image = DB::table('broker_image')->where('broker_id',$brok->id )->get();  ?>
                            @foreach($broker_image as $image)
                                <img src="{{ asset('uploads/broker')}}/{{$image->broker_front}}" width="100" >
                            @endforeach
                        </div>
                        <div id="image-holder">

                        </div>

                        {!! Form::file('file', array('class' => 'form-control', 'id'=>'fileUpload', 'multiple'=>'multiple')) !!}
                    </td>
                </tr>
                <tr>
                    <?php $broker_image = DB::table('broker_image')->where('broker_id',$brok->id )->get();  ?>
                    @foreach($broker_image as $image)
                        <input name="broker_id" type="hidden" value="{{$image->broker_id}}">
                    @endforeach
                    <td style="width: 30%">Upload License Image (Back)</td>
                    <td>
                        <div class="img-thumbnail">
                            <?php $broker_image = DB::table('broker_image')->where('broker_id',$brok->id )->get();  ?>
                            @foreach($broker_image as $image)
                                <img src="{{ asset('uploads/broker')}}/{{$image->broker_back}}" width="100" >
                            @endforeach
                        </div>
                        <div id="image-holder1">

                        </div>
                        {!! Form::file('file1', array('class' => 'form-control', 'id'=>'fileUpload1', 'multiple'=>'multiple')) !!}
                    </td>

                </tr>
            </table>
            <br>
            <div class="row text-left">
                <div class="col-sm-1 col-xm-4 col-sm-offset-4 mymedia">
                    <button type="submit" id="submit" class="btn btn-warning btn-sm" tabindex="7">Save <span class="glyphicon glyphicon-hdd"></span></button>
                </div>
                <div class="col-sm-1 col-xm-4 mymedia"> <button type="reset" class="btn btn-info btn-sm">Reset <span class="glyphicon glyphicon-refresh"></span></button></div>
                <div class="col-sm-1 col-xm-4 mymedia"><a class="btn btn-success btn-sm" href="{{url('broker')}}">Back</a></div>
            </div>
            <br>
        </div>

        <br> {{form::close()}}
    </div>
                <!-- panel body ends here -->


        {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

        <script>


            $(".alert").fadeTo(2000, 500).slideUp(500, function(){
                $(".alert").slideUp(500);
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
        </script>

@endsection