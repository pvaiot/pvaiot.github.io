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
        <h2>Edit Courier</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Edit Courier</span></li>
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

    <?php echo Form::open(array('route' => ['update_courier',$get_courier->id],'onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>
    <div class="well">
        <div class="row">

            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Branch Code</label>
                   <select name="branch_code" style="width: 100%;" id="branch_code" class="form-control" required  >
                        <option value=""> Select Branch Code</option>
                        <?php  $datas = App\Branch::all(); ?>
                        @foreach($datas as $data)
                            <option value="{{$data->branch_code}}" selected="{{ $get_courier->branch }}" >{{$data->branch_code}}-{{$data->city}}</option>
                        @endforeach
                    </select>

                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">Date</label>
                    <input type="text" name="date" id="date" placeholder="__/__/____" value="<?php echo date("d-m-Y", strtotime($get_courier->date)); ?>"  class="styledate form-control" required/>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">From</label>
                    <select name="from" id="from" class="form-control" style="width: 100%"  required>

                        <?php  $datas = App\Location::all(); ?>
                        @foreach($datas as $data)
                            <option value="{{$data->city}}" <?php if($data->city==$get_courier->from){ echo'selected'; } ?>>{{$data->city}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                    <label class="control-label">To</label>
                    <select name="to" id="to" class="form-control" style="width:  100%"  required>

                        <?php  $datas = App\Location::all(); ?>
                        @foreach($datas as $data)
                            <option value="{{$data->city}}" <?php if($data->city==$get_courier->to){ echo'selected'; } ?>>{{$data->city}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
                        <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label">Party Name</label>
                    <input type="text" name="party_name" id="party_name"  value="{{$get_courier->party}}" class="form-control" placeholder="Party Name" />
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label">Party Address</label>
                    <textarea  type="text" style="height: 58px !important; overflow: hidden; overflow-wrap: break-word; resize: none;" data-plugin-textarea-autosize name="party_address" id="party_address" class="form-control" placeholder="Party Address">{{$get_courier->party_address}}</textarea>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label">Docket No</label>
                    <input type="text" name="docket_no" id="docket_no"  class="form-control" value="{{$get_courier->docket_no}}" placeholder="Docket No" />
                </div>
            </div>
        </div><br>
        <div class="row">

            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label">Courier Name</label>
                    <input type="text" name="courier_name" id="courier_name"  value="{{$get_courier->courier_name}}" class="form-control" placeholder="Courier Name" />
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="control-label">Document Details</label>
                    <input type="text" name="document_details" id="document_details"  value="{{$get_courier->document_detail}}" class="form-control" placeholder="Document Details" />
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


    <div class="modal fade" id="myModal2"  role="dialog" aria-labelledby="myModalLabel">
        <form id="testform125">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Create New Location <span style="font-size: 12px;color:#EB3E28;">* You Can Fill Full Details Later In Location Master</span></h4>

                    </div>
                    <div class="modal-body">

                        {{---------try-------------}}
                        <tr>


                            <td>
                                <input type="hidden" name="doctor_code"  id="doctor_code" class="form-control"  readonly>
                            </td>
                        </tr>
                        {{---------try-------------}}



                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-sm-6">
                                <div class="form-group has-success has-feedback">
                                    <label for="inputSuccess2">City<span style="color:#EB3E28;">*</span></label>
                                    <input  type="text" name="city-area" class="form-control" id="city-area" placeholder="City's Name" required>
                                    <span style="font-size: 12px;color:#EB3E28;" id="error_location">This Location Already Exist!!!</span>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-6">
                                <div class="form-group has-success has-feedback">District</label>
                                    <input  type="text" name="district-area" class="form-control" id="district-area" placeholder="District">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-sm-6">
                                <div class="form-group has-success has-feedback">
                                    <label for="inputSuccess2">State</label>

                                    <input  type="text" name="state-area" class="form-control" id="inputSuccess2" placeholder="State">
                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                </div>
                            </div>
                        </div>


                    </div>



                    <div class="modal-footer clearfix">
                        <div class="row">
                            {{--<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 col-md-offset-3">--}}
                            {{--<button type="reset" class="btn btn-success" data-dismiss="modal"><i class="fa fa-refresh"></i> Clear</button>--}}
                            {{--</div>--}}
                            <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                <button type="button" class="btn btn-danger" data-dismiss="modal"> Close</button>
                            </div>
                            <div class="col-lg-2 col-md-2 col-xs-4 col-sm-4">
                                <button type="submit" id="addnewlocation"  class="btn btn-primary"> Save</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
                <!-- panel body ends here -->


        {{----------------------------------------------------------------------------------- form end here ----------------------------------}}
    <script>

        var destination =  [/* states array*/];
        $("#truck_no").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $("#truck_type").select2({
            data: destination
        });
        var destination =  [/* states array*/];
        $(".category").select2({
            data: destination
        });

        var product_type =  [/* states array*/];
        $("#from").select2({
            data: product_type
        });
        var product_type =  [/* states array*/];
        $("#to").select2({
            data: product_type
        });


        var country =  [/* states array*/];
        $("#product_name").select({
            data: country
        });
        var customer =  [/* states array*/];
        $("#customer").select({
            data: customer
        });
        $('#customer').select('open').select('close');
        var payment_type =  [/* states array*/];
        $("#payment_type").select({
            data: payment_type
        });


    </script>
        <script>
            $("#testform125").submit(function(e){
                e.preventDefault();
            });
            $('#addnewlocation').click(function() {
//            alert("Hi")
                $.ajax({

                    url: '{{url('')}}/AjaxNewLocation',

                    type: "post",
                    dataType: "json",
                    data: {
                        '_token':$('input[name=_token]').val(),
                        'city':$('input[name=city-area]').val(),
                        'district':$('input[name=district-area]').val(),
                        'state':$('input[name=state-area]').val(),
                    },

                    success:function(data) {
//                $(data, function(key, value) {
                        var Vals    =  data;
                        $('select[name="from"]').append('<option value="'+ Vals.city+'">'+ Vals.city +'</option>');
                        $('select[name="to"]').append('<option value="'+ Vals.city+'">'+ Vals.city +'</option>');
//                });


                        $('#myModal2').modal('hide')
                    }

                });

            });
            $('#party_code').on('change', function() {
                var stateID = $('#party_code').val();


                if (stateID) {

                    $.ajax({

                        url: '{{ url('/') }}/AjaxGet_party_code/' + stateID,

                        type: "GET",

                        dataType: "json",

                        success: function(data) {

                            var Vals = data;

                            $("input[name='party_name']").val(Vals.name);
                            $("textarea[name='party_address']").val(Vals.address);
                        }

                    });

                } else {
                    $("input[name='party_name']").empty();
                    $("input[name='party_address']").empty();
                }

            });
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
        </script>

@endsection
