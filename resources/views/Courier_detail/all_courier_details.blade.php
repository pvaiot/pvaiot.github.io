@extends('layouts.newAdminPanalTable')
@section('custom_css')

@endsection

@section('content')
  <br>
  @if(Session::has('flash_message1'))
      <div class="alert alert-danger">
          <span class="glyphicon glyphicon-ban-circle"></span> {{ Session::get('flash_message1') }}
      </div>
  @endif
  <header class="page-header">
      <h2>Courier Details</h2>

      <div class="right-wrapper pull-right">
          <ol class="breadcrumbs">
              <li>
                  <a href="{{url('home')}}">
                      <i class="fa fa-home"></i>
                  </a>
              </li>
              <li><span>Courier Details</span></li>
          </ol>

          <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
      </div>
  </header>
  <section class="panel">
      <header class="panel-heading">
          <div class="panel-actions">
              <a href="#" class="fa fa-caret-down"></a>
          </div>
          <h3 class="panel-title">Courier Details</h3>
      </header>
      <div class="panel-body">
          <table class="table table-no-more table-bordered mb-none" id="datatable-default" data-swf-path="{{asset('newadminDesign/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf')}}">
              <thead>
              <tr>
                  <th class="text-center">SL No</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">From </th>
                  <th class="text-center">To</th>
                  <th class="text-center">Docket No</th>
                  <th class="text-center">ACTION</th>
              </tr>
              </thead>
              <tbody>
              <?php $sl_no=1; ?>
              @foreach($get_courier as $consign)
                  <tr>
                      <td data-title="SL No">{{$sl_no}}</td>
                      @if($consign->date!="")
                          <td data-title="TRUCK NO" class="text-left">{{$consign->date}}</td>
                      @else
                          <td data-title="TRUCK NO" class="text-left">-</td>
                      @endif
                      @if($consign->from!="")
                          <td data-title="ENGINE NO" class="text-left">{{$consign->from}}</td>
                      @else
                          <td data-title="ENGINE NO" class="text-left">-</td>
                      @endif
                      @if($consign->to!="")
                          <td data-title="CHASSIS NO" class="text-left">{{$consign->to}}</td>
                      @else
                          <td data-title="CHASSIS NO" class="text-left">-</td>
                      @endif
                      @if($consign->docket_no!="")
                          <td data-title="MAKE" class="text-left">{{$consign->docket_no}}</td>
                      @else
                          <td data-title="MAKE" class="text-left">-</td>
                      @endif
                      <td data-title="ACTION" class="text-left">
                          <a href="{{url('view_courier')}}/{{$consign->id}}" class="on-default"><i class="fa fa-eye" style="width: 15px !important;padding-left: 5px;"></i></a>&nbsp;&nbsp;
                          <a href="{{url('edit_courier')}}/{{$consign->id}}" class="on-default"><i class="fa fa-pencil" style="width: 15px !important;padding-left: 5px;"></i></a>&nbsp;&nbsp;
                          <a href="delete_courier/{{$consign->id}}" class="on-default" onclick="return ConfirmDelete()"><i class="fa fa-trash-o" style="width: 15px !important;padding-left: 5px;"></i></a>
                      </td>
                  </tr>
                  <?php $sl_no +=1; ?>
              @endforeach

              </tbody>
          </table>
      </div>
  </section>
  <script>
      $(document).ready(function() {
          $('#table').DataTable();
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
