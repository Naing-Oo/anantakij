@extends('layouts.main')
@section('content')
@if($errors->has('name'))
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('name') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
        <a href="#" data-toggle="modal" data-target="#createModal" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('file.Add Agent')}}</a>
       {{-- <a href="#" data-toggle="modal" data-target="#importagents" class="btn btn-primary"><i class="dripicons-copy"></i> {{trans('file.Import Agent')}}</a> --}}
    </div>
    <div class="table-responsive">
        <table id="agent-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('file.name')}}</th>
                    <th>{{ trans('file.Description') }}</th>
                    <th>{{ trans('file.Agent Commission Rate') }}</th>
                    <th>{{trans('file.Percentage')}}</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($agents as $key=>$agent)
                <tr data-id="{{$agent->id}}">
                    <td>{{$key}}</td>
                    <td>{{ $agent->name }}</td>
                    <td>{{ $agent->description }}</td>
                    <td>{{ $agent->commission_rate }}</td>
                    <td>{{ $agent->percentage}}</td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('file.action')}}
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" data-id="{{$agent->id}}" class="open-EditAgentDialog btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i> {{trans('file.edit')}}
                                    </button>
                                </li>
                                <li class="divider"></li>
                                {{ Form::open(['route' => ['agents.destroy', $agent->id], 'method' => 'DELETE'] ) }}
                                <li>
                                    <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> {{trans('file.delete')}}</button>
                                </li>
                                {{ Form::close() }}
                            </ul>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>


<!-- Add Agent -->
<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
<div role="document" class="modal-dialog">
  <div class="modal-content">
    {!! Form::open(['route' => 'agents.store', 'method' => 'post']) !!}
    <div class="modal-header">
      <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Add Agent Team')}}</h5>
      <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
    </div>
    <div class="modal-body">
      <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
      <form>
        <div class="row">
            <div class="form-group col-md-6">
              <label>{{trans('file.name')}} *</label>
              <input type="text" name="name" required="required" class="form-control">
            </div>
            <div class="form-group col-md-6">
              <label>{{trans('file.Description')}} </label>
              <input type="text" name="description" class="form-control">
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
              <label>{{trans('file.Agent Commission Rate')}} </label>
              <input type="text" name="commission_rate" class="form-control">
            </div>
            <div class="form-group col-md-6">
              <label>{{trans('file.Percentage')}}(%) </label>
              <input type="text" name="percentage" class="form-control">
            </div>
        </div>
        <div class="form-group">
          <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
        </div>
      </form>
    </div>

    {{ Form::close() }}
  </div>
</div>
</div>

<!-- Edit Agent -->
<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
<div role="document" class="modal-dialog">
  <div class="modal-content">
    {!! Form::open(['route' => ['agents.update',1], 'method' => 'put']) !!}
    <div class="modal-header">
      <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Update Agent')}}</h5>
      <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
    </div>
    <div class="modal-body">
      <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
        <div class="row">
            <div class="form-group col-md-6">
                <input type="hidden" name="agent_id">
                <label>{{trans('file.name')}} *</label>
                <input type="text" name="name" required="required" class="form-control">
            </div>
            <div class="form-group col-md-6">
                <label>{{trans('file.Description')}} </label>
                <input type="text" name="description" class="form-control">
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label>{{trans('file.Agent Commission Rate')}} </label>
                <input type="text" name="commission_rate" class="form-control">
            </div>
            <div class="form-group col-md-6">
                <label>{{trans('file.Percentage')}}(%) </label>
                <input type="text" name="percentage" class="form-control">
            </div>
        </div>
        <div class="form-group">
          <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
        </div>
    </div>
    {{ Form::close() }}
  </div>
</div>
</div>


@endsection

@push('scripts')
<script type="text/javascript">
    $("ul#setting").siblings('a').attr('aria-expanded','true');
    $("ul#setting").addClass("show");
    $("ul#setting #agent-menu").addClass("active");

    var agent_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function confirmDelete() {
      if (confirm("Are you sure want to delete?")) {
          return true;
      }
      return false;
  }
    $(document).ready(function() {

        $(document).on('click', '.open-EditAgentDialog', function() {
            var url = "agents/"
            var id = $(this).data('id').toString();
            url = url.concat(id).concat("/edit");

            $.get(url, function(data) {
                $("input[name='name']").val(data['name']);
                $("input[name='description']").val(data['description']);
                $("input[name='commission_rate']").val(data['commission_rate']);
                $("input[name='percentage']").val(data['percentage']);
                $("input[name='agent_id']").val(data['id']);
            });
        });
    });

    $('#agent-table').DataTable( {
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
                'targets': [0, 3]
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
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
            },
            {
                text: '<i title="delete" class="dripicons-cross"></i>',
                className: 'buttons-delete',
                action: function ( e, dt, node, config ) {
                    if(user_verified == '1') {
                        agent_id.length = 0;
                        $(':checkbox:checked').each(function(i){
                            if(i){
                                agent_id[i-1] = $(this).closest('tr').data('id');
                            }
                        });
                        if(agent_id.length && confirm("Are you sure want to delete?")) {
                            $.ajax({
                                type:'POST',
                                url:'agents/deletebyselection',
                                data:{
                                    agentsIdArray: agent_id
                                },
                                success:function(data){
                                    alert(data);
                                }
                            });
                            dt.rows({ page: 'current', selected: true }).remove().draw(false);
                        }
                        else if(!agent_id.length)
                            alert('No agent is selected!');
                    }
                    else
                        alert('This feature is disable for demo!');
                }
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
    } );

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $( "#select_all" ).on( "change", function() {
        if ($(this).is(':checked')) {
            $("tbody input[type='checkbox']").prop('checked', true);
        }
        else {
            $("tbody input[type='checkbox']").prop('checked', false);
        }
    });

    $("#export").on("click", function(e){
    e.preventDefault();
    var agents = [];
    $(':checkbox:checked').each(function(i){
      agents[i] = $(this).val();
    });
    $.ajax({
       type:'POST',
       url:'/exportagents',
       data:{
            agentsArray: agents
        },
       success:function(data){
         alert('Exported to CSV file successfully! Click Ok to download file');
         window.location.href = data;
       }
    });
});
</script>

@endpush
