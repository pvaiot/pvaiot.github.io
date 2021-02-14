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
        <h2>New Branch Entry</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>New Branch Entry</span></li>
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
    <?php echo Form::open(array('url' =>['update_branch',$bran->id])); ?>

    <div class="row">
        <div class="col-md-8 col-md-offset-2" style="">
            <br>
            <table class="table">

                <tr>
                    <td style="width: 30%">City<span style="font-size: 13px;color: red">*</span></td>
                    <td>
                        <input type="text" name="city" id="city" value="{{$bran->city}}" class="form-control" placeholder="City" required autofocus>

                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">District</td>
                    <td>
                        <input type="text" name="dist" id="dist" value="{{$bran->dist}}" class="form-control" placeholder="Dist">
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">State</td>
                    <td>
                        <input type="text" name="state" id="state" class="form-control" value="{{$bran->state}}" placeholder="State">
                    </td>
                </tr>

                <tr>
                    <td style="width: 30%">Branch Code</td>
                    <td>
                        <input type="text" name="branch_code" id="branch_code" class="form-control" value="{{$bran->branch_code}}" placeholder="Branch Code">
                    </td>
                </tr>

            </table>
            <footer class="col-md-8 col-md-offset-4">
                <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </footer>
            <br>
        </div>

        <br> {{form::close()}}

                <!-- panel body ends here -->


        {{----------------------------------------------------------------------------------- form end here ----------------------------------}}

        <script>


            $(".alert").fadeTo(2000, 500).slideUp(500, function(){
                $(".alert").slideUp(500);
            });

        </script>

        @endsection

