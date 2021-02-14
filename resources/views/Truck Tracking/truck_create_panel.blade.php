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
        .select2-container .select2-selection--single {
            height: 35px !important;
            border-color:#555555!important;

        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-top: 3px!important;
        }
        select{
            width: 100% !important;
        }
        .btn:focus{
            background-color: #0088cc !important;
            font-size: 15px;
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
        <h2>Truck Tracking</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Truck Tracking</span></li>
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
        {{-- ----------------------------------------inner content here --------------------------------------------------------}}
        <div class="well">

            <div class="row">



                <?php echo Form::open(array('route' => 'store_truck','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>


                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Consignment No.</label>
                                <input type="text" name="consignment_no"  id="consignment_no" class="form-control" placeholder="Consignment No" required>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Truck No.</label>
                                <input type="text" name="truck_no" id="truck_no" placeholder="Truck No"  class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Destination</label>
                                <input type="text" name="destination" id="destination" placeholder="Destination"  class="form-control">
                            </div>
                        </div>
                     
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Status</label>
                                <select  id="branch_code" style="width: 100%;" class="form-control" name="status" required >
                                    <option value=""> Select Status</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Completed">Completed</option>
                
                                </select> 
                            </div>
                        </div>
                        <br>
                       
                       
                    </div>
                
                   <br>
                <div class="table-responsive">
                    <table id="items" class="table table-no-more table-bordered mb-none billing_table" id="datatable-default">
                        <thead>
                        <tr style="background-color: #09C6AB;color: #ffffff">
                            <th class="text-center">Sl No.<span style="color: red">*</span></th>
                            <th class="text-center">Date<span style="color: red">*</span></th>
                            <th class="text-center">Time<span style="color: red">*</span></th>
                            <th class="text-center">Area<span style="color: red">*</span></th>
                           
                            <th class="text-center">Action</th>
                        </tr>
                        </thead>
                        <tr class="item-row" style="border-bottom: solid 1px black">

                            <td data-title="sl_no" class="main_td">1</td>
                            <td data-title="date" class="main_td"><input name="rows[0][date]" id="date" placeholder="__/__/____"  class="styledate form-control" autofocus></td>

                            <td data-title="time" class="main_td"><input type="time" name="rows[0][time]" class="time form-control"required /></td>
                            <td data-title="area" class="main_td"><input type="text" name="rows[0][area]" class="area form-control"required /></td>


                            

                            <td data-title="ACTION"><a class="btn btn-danger btn-sm addrow updateRow0"  href="javascript:;" style="padding-top: 9px!important;padding-bottom: 8px!important;width: 50px" >ADD</a></td>
                        </tr>

                    </table>
                </div>
                <div class="col-sm-3">
                   
                </div>
                <br>
                    <div class="row">
                        <footer class="col-md-8">
                            <button type="submit" class="btn btn-success" id="submit">Submit</button>
                            <button type="reset" class="btn btn-danger">Back</button>
                        </footer>
                    </div>

                <br> {{form::close()}}
            </div>
            <!-- panel body ends here -->
        </div>
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>
       
        //    ----------------------brach code json start-----------------
        $(document).ready(function() {

            var i=1;
            var count=0;
            $(document).on('click', '.addrow', function(){

                $(this).text('x Del');
                $(this).attr('class','btn btn-info btn-sm del');
                $(".item-row:last").find('.mybtn').hide();
                i++;

                count++;
            
                var id=count;
                


                $(".item-row:last").after('<tr class="item-row" style="border-bottom: solid 1px black">' +
                        '<td data-title="sl_no" class="main_td">'+(id+1)+'</td>'+
                            '<td data-title="date" class="main_td"><input name="rows[' + id + '][date]" id=\"date' + id + '\" style="width: 100%!important;" placeholder="__/__/____"  class="styledate form-control"required>'+
                                '<td data-title="time" class="main_td"><input type="time" name="rows[' + id + '][time]" id=\"time' + id + '\" style="width: 100%!important;" class="time form-control"required>'+
                                    '<td data-title="area" class="main_td"><input name="rows[' + id + '][area]" id=\"area' + id + '\" style="width: 100%!important;" class="area form-control"required>'+

                        '<td data-title="ACTION" class="main_td"> <button type="button" class="btn btn-danger btn-sm addrow" id=\"updateRow' + id + '\"   style="padding-top: 9px!important;padding-bottom: 8px!important;width:50px">ADD</button>' +
                        '<a class=" delete mybtn  btn btn-system" href="javascript:;"  title="Remove row">X</a>'+
                        '</td></tr>');
        
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
                        });

        });

        $("input[name='consignment_no']").on('blur', function() {
            var ajax_id = $(this).val();
          

            if(ajax_id) {
                $.ajax({
                    url: '{{ url('/') }}/ajax_truck/'+ajax_id,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {

                        
                        var Vals    =  data;
                        $("input[name='truck_no']").val(Vals.truck_no);
                        $("input[name='destination']").val(Vals.destination);
                    }
                });
            }else{
                $('input[name="truck_no"]').empty();
                $('input[name="destination"]').empty();
            }
        });
        $("input[name='consignment_no']").on('change', function() {
            var ajax_id = $(this).val();


            if(ajax_id) {
                $.ajax({
                    url: '{{ url('/') }}/ajax_truck/'+ajax_id,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {


                        var Vals    =  data;
                        $("input[name='truck_no']").val(Vals.truck_no);
                        $("input[name='destination']").val(Vals.destination);
                    }
                });
            }else{
                $('input[name="truck_no"]').empty();
                $('input[name="destination"]').empty();
            }
        });

        //    ----------------------brach code json end-----------------


        

        //    ----------------------ClorCN only end-----------------

        $(document).on('click', '.del', function(){
//                        $(".del").on('click',function(){
            $(this).parent().parent().remove();
        
//                        });
        });
        $(document).on('click', '.delete', function(){
//                        $(".del").on('click',function(){
            $(this).parent().parent().remove();
            $(".del").eq(-1).text('ADD');
            $('.del').eq(-1).attr('class','btn btn-danger btn-sm addrow');

//                        });
        });
 

        //   ----------------date validation--------------------
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

        //   ----------------date validation--------------------

        

    </script>





@endsection