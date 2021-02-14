@extends('layouts.newAdminPanalTable')
@section('custom_css')
<style>
    .table tbody tr td{
        padding: 10px !important;
    }
</style>

@endsection
@section('content')
    <br>
    @if(Session::has('flash_message1'))
        <div class="alert alert-danger">
            <span class="glyphicon glyphicon-ban-circle"></span> {{ Session::get('flash_message1') }}
        </div>
    @endif
    <header class="page-header">
        <h2>Coke Acknowledgement Details</h2>

        <div class="right-wrapper pull-right">
            <ol class="breadcrumbs">
                <li>
                    <a href="{{url('home')}}">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li><span>Coke Acknowledgement Details</span></li>
            </ol>

            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
        </div>
    </header>
    <?php echo Form::open(array('route' => 'export_unbilled_coke_acknowledgement_data', 'method'=>'get')); ?>

            <button type="submit" class="btn btn-md btn-success" id="submit"> Send to Exel </button>


        

        <div class="panel-body">
                <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
                    <thead>
                    <tr>
                        <th class="text-center">Challan Number</th>
                        <th class="text-center">Date</th>
                        <th class="text-center">From</th>
                        <th class="text-center">To</th>
                       
                    </tr>
                    </thead>
                    <tbody>
                            <?php $challan = \App\CokeChallan::all();
                            foreach ($challan as $challan) {
                            $cock_ack = \App\Coke_acknowledgement::where('challan_number','=',$challan->challan_no)->count();
                            if($cock_ack<=0){
        
                                echo "<tr>
                                    
                                    <td>$challan->challan_no</td>
                                    <td>$challan->date</td>
                                    <td>$challan->from</td>
                                    <td>$challan->to</td>
                                    </tr>";
                              }
                            } 
                        
                       
                    ?>
                    
                    </tbody>
                </table>
            </div>
    </section>
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
        //    delete commande
        function ConfirmDelete() {
            var x = confirm("Are you sure you want to delete?");
            if (x)
                return true;
            else
                return false;
        }
        $(".alert").fadeTo(2000, 500).slideUp(500, function() {
            $(".alert").slideUp(500);
        });
    </script>
@endsection
