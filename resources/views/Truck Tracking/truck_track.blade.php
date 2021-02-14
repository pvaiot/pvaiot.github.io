@extends('layouts.newAdminPanal_select')
@section('custom_css')
@endsection
@section('content')



    <br>
    @if(Session::has('flash_message'))
        <div class="alert alert-success">
            {{ Session::get('flash_message') }}
        </div>
    @endif
    <header class="page-header">
        <h2>Current Location</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Current Location</span></li>
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
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label">Consignment No.</label>
                                <input type="text" name="consignment_no"  id="consignment_no" class="form-control" placeholder="Consignment No" required>
                            </div>
                            
                        </div>
                        <br>
            </div>
            <br>
            <div class="row">
            <div class="table-responsive">
                <table class="table table-bordered" style="border: 1px solid lightgrey!important;">
                    <thead>
                        <tr>
                            <th>Sl</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Destination</th>
                        </tr>
                    </thead>
                    <tbody class="table_body"></tbody>
                </table>
            </div>
            <!-- panel body ends here -->
        </div>
        </div>
    {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

    <script>
       
        //    ----------------------brach code json start-----------------
        $("input[name='consignment_no']").on('change', function() {
            var ajax_id = $(this).val();
            if(ajax_id) {
                $.ajax({
                    url: '{{ url('/') }}/ajax_truck_track/'+ajax_id,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {
                        var Vals    =  data;
                        for (var i = 0; i < Vals.length; i++) {
                            $(".table_body").append('<tr>'+
                                    '<td data-title="SL No" class="main_td">'+(i+1)+'</td>'+
                                    '<td data-title="Date" class="main_td">'+Vals[i]['date']+'</td>'+
                                    '<td data-title="Time" class="main_td">'+Vals[i]['time']+'</td>'+
                                    '<td data-title="Destination" class="main_td">'+Vals[i]['area']+'<td></tr>');
                        }
                    }
                });
            }
        });
    </script>





@endsection