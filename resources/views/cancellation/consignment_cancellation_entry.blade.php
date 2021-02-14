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

    <?php echo Form::open(array('route' => 'store_consignment_cancel','onsubmit'=>'return confirm("Do you really want to submit the form?");'))?>

    <div class="well">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Consignment No.</label>
                    <input type="text" name="consignment_no" id="consignment_no" class="form-control" placeholder="Consignment No." required autofocus>

                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Cancellation Date</label>
                    <input type="text" name="cancellation_date" id="cancellation_date" class="styledate form-control" placeholder="DD/MM/YYYY" required>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label">Remarks</label>
                    <input type="text" name="remarks" id="remarks" class="form-control" placeholder="Remarks">
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