@extends('layouts.adminPanelTable')
@section('title')
    View Broker
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
    <h4 class="text-center"><span style="border-bottom: solid 2px green;padding-bottom: 2px;">View Broker Entry</span></h4>

    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    <?php echo Form::open(array('url' =>['update_broker',$brok->id])); ?>

    <div class="row">
        <div class="col-md-8 col-md-offset-2" style="">
            <br>
            <table class="table">

                <tr>
                    <td style="width: 30%">Name<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <input type="text" name="name" id="name" value="{{$brok->name}}" class="form-control" placeholder="Name" required autofocus tabindex="1" readonly>

                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Address</td>
                    <td>
                        <input type="text" name="address" id="address" value="{{$brok->address}}" class="form-control" placeholder="Address" tabindex="2" readonly>
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Pan No</td>
                    <td>
                        <input type="text" name="pan_no" id="pan_no" value="{{$brok->pan_no}}" class="form-control" placeholder="Pan No" tabindex="3" readonly>
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Mobile No</td>
                    <td>
                        <input type="text" name="mobile_no" id="mobile_no" value="{{$brok->mobile_no}}" class="form-control" placeholder="Mobile No" tabindex="4" readonly>
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Contact No</td>
                    <td>
                        <input type="text" name="contact_no" id="contact_no" value="{{$brok->contact_no}}" class="form-control" placeholder="Contact No" tabindex="5" readonly>
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Land Line No</td>
                    <td>
                        <input type="text" name="land_line_no" id="land_line_no" value="{{$brok->land_line_no}}" class="form-control" placeholder="Land Line No" tabindex="6" readonly>
                    </td>
                </tr>

            </table>
            <table class="table">
                <tr>
                    <?php $broker_image = DB::table('broker_image')->where('broker_id',$brok->id )->get();  ?>
                    @foreach($broker_image as $image)
                        <td>

                        </td>
                        <td>
                            <img width="200" class="img" src="{{ asset('uploads/broker')}}/{{$image->broker_front}}" data-toggle="modal" data-target="#myModal">
                        </td>
                        <td>
                            <img width="200" class="img" src="{{ asset('uploads/broker')}}/{{$image->broker_back}}" data-toggle="modal" data-target="#myModal">
                        </td>
                    @endforeach
                </tr>
            </table>

            <br>
            <div class="row text-left">

                <div class="col-sm-1 col-xm-4 mymedia"><a class="btn btn-success btn-sm" href="{{url('broker')}}">Back</a></div>
            </div>
            <br>
        </div>
    </div>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <img class="showimage img-responsive" id="model_imgage" src="" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="printimg" onclick="PrintImage();return false;">Print</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
        </div>

        <br> {{form::close()}}

                <!-- panel body ends here -->


        {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>

        $(document).ready(function () {
            $('img').on('click', function () {
                var image = $(this).attr('src');
                //alert(image);
                $('#myModal').on('show.bs.modal', function () {
                    $(".showimage").attr("src", image);
                });
            });
        });

        function ImagetoPrint(img)
        {
            var source = $('#model_imgage').attr('src');
            return "<html><head><script>function step1(){window.print()}" +
                "</scri" + "pt></head><body onload='step1()'>" +
                "<img src='" + source + "' /></body></html>";
        }

        function PrintImage(img)
        {
            Pagelink = "about:blank";
            var pwa = window.open(Pagelink, "_new");
            pwa.document.open();
            pwa.document.write(ImagetoPrint(img));
            pwa.document.close();
        }


        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });

    </script>

@endsection