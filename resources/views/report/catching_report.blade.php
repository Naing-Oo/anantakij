@extends('layouts.main') @section('content')

@if(empty($product_name))
<div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{'No Data exist between this date range!'}}</div>
@endif

<section class="forms">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center">{{trans('file.Catching Report')}}</h3>
            </div>
            {!! Form::open(['route' => 'report.catching', 'method' => 'post']) !!}
            <div class="row mb-3">
                <div class="col-md-4 offset-md-2 mt-3">
                    <div class="input-group row">
                        <label class="d-tc mt-2"><strong>{{trans('file.Purchase Date')}}</strong> &nbsp;</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="dripicons-calendar"></i></div>
                        </div>
                        <input type="text" name="start_date" class="form-control" value="{{$start_date}}" />

                        <label class="d-tc mt-2">&nbsp;&nbsp;<strong>{{trans('file.To')}}</strong> &nbsp;</label>
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="dripicons-calendar"></i></div>
                        </div>
                        <input type="text" name="end_date" class="form-control" value="{{$end_date}}" />
                    </div>
                </div>
                <div class="col-md-4 mt-3">
                    <div class="form-group row">
                        <label class="d-tc mt-2"><strong>{{trans('file.Choose Supplier')}}</strong> &nbsp;</label>
                        <div class="d-tc">
                            <input type="hidden" name="supplier_id_hidden" value="{{$supplier_id}}" />
                            <select id="supplier_id" name="supplier_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" >
                                <option value="0">{{trans('file.All Supplier')}}</option>
                                @foreach($lims_supplier_list as $supplier)
                                <option value="{{$supplier->id}}">{{$supplier->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 mt-3">
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">{{trans('file.submit')}}</button>
                    </div>
                </div>
            </div>
            {!! Form::close() !!}
        </div>
    </div>
    <div class="table-responsive mb-4">
        <table id="report-table" class="table table-hover">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('file.Purchase Date')}}</th>
                    <th>{{trans('file.Supplier')}}</th>
                    <th>{{trans('file.Address')}}</th>
                    <th>{{trans('file.Product Name')}}</th>
                    <th>{{trans('file.Unit Price')}}</th>
                    <th>{{trans('file.Total')}} {{trans('file.Qty')}}</th>
                    <th>{{trans('file.Agent Name')}}</th>
                    <th>{{trans('file.Catcher')}}</th>
                    <th>{{trans('file.Driver')}}</th>
                    <th>{{trans('file.Car Reg No')}}</th>
                </tr>
            </thead>
            <tbody>
                @if(!empty($purchases))
                @foreach($purchases as $key => $purchase)
                <tr>
                    <td>{{$key}}</td>
                    <td>{{$purchase->purchase_date}}</td>
                    <td>{{$purchase->name}}</td>
                    <td>{{$purchase->address}}</td>
                    <td>{{$purchase->product_name}}</td>
                    <td>{{number_format((float)$purchase->purchase_price, 2, '.', '')}}</td>
                    <td>{{number_format((float)$purchase->total, 2, '.', '')}}</td>
                    <td>{{$purchase->agent_name}}</td>
                    <td>{{$purchase->catcher_name}}</td>
                    <td></td>
                    <td></td>
                </tr>
                @endforeach
                @endif
            </tbody>
            <tfoot>
                <th></th>
                <th></th>
                <th>Total</th>
                <th></th>
                <th></th>
                <th></th> 
                <th>0.00</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tfoot>
        </table>
    </div>
</section>

@endsection

@push('scripts')
<script type="text/javascript">
    $("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #catching-report-menu").addClass("active");

    $('#supplier_id').val($('input[name="supplier_id_hidden"]').val());
    $('.selectpicker').selectpicker('refresh');

    $('#report-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
             "info":      '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
            "search":  '{{trans("file.Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': 0
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum(api, false);
        }
    } );

    function datatable_sum(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
        }
    }

// $(".daterangepicker-field").daterangepicker({
//     callback: function(startDate, endDate, period){
//         var start_date = startDate.format('YYYY-MM-DD');
//         var end_date = endDate.format('YYYY-MM-DD');
//         var title = start_date + ' To ' + end_date;
//         $(this).val(title);
//         $('input[name="start_date"]').val(start_date);
//         $('input[name="end_date"]').val(end_date);
//     }
// });

    var start_date = $('input[name="start_date"]');
            start_date.datepicker({
                format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true
        });

    var end_date = $('input[name="end_date"]');
        end_date.datepicker({
        format: "dd-mm-yyyy",
        autoclose: true,
        todayHighlight: true
    });

</script>
@endpush
