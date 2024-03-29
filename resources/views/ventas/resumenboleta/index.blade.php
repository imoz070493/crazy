@extends ('layouts.admin')
@section('modulo')
	Facturacion Electronica
@endsection
@section('ruta')
	<li><a href="#"><i class="fa fa-dashboard"></i> Facturacion Electronica</a></li>
    <li class="">Resumen de Boletas</li>
    <li class="Active">Listado</li>
@endsection
@section('submodulo')
	Resumen de Boletas
@endsection
@section('contenido')
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Resumen Diario</h3>
		@if($errors->any())
			<div class="alert alert-info alert-dismissible fade in">
			  <a href="#" class="close" data-dismiss="alert" aria-label="close">X</a>
			  <strong>{{$errors->first()}}</strong> 
			</div>
		@endif
		@if(\Session::has('msg'))
			<div class="alert alert-danger alert-dismissible fade in">
			  <a href="#" class="close" data-dismiss="alert" aria-label="close">X</a>
			  <strong>{{\Session::get('msg')}}</strong>
			  {{\Session::forget('msg')}}
			</div>
		@endif
		@if(\Session::has('msgB'))
			<div class="alert alert-success alert-dismissible fade in">
			  <a href="#" class="close" data-dismiss="alert" aria-label="close">X</a>
			  <strong>{{\Session::get('msgB')}}</strong>
			  {{\Session::forget('msgB')}}
			</div>
		@endif
		@include('ventas.resumenboleta.search')
	</div>
</div>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table id="example2" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<th>ID</th>
					<th>Codigo Hash</th>
					<th>N° Ticket</th>
					<th>Estado</th>
					<th>Fecha Doc</th>
					<th>Fech Env</th>
					<th>Opciones</th>
				</thead>
				@foreach($resumen as $res)
				<tr>
					<td>{{$res->idresumen}}</td>
					<td>{{$res->hash}}</td>
					<td>{{$res->serie}}-{{$res->numero}}</td>
					<td>
						@if($res->estado=='2')
							<a class="btn btn-success btn-xs">&nbsp;&nbsp;Aceptado&nbsp;&nbsp;</a>
						@else
							<a class="btn btn-danger btn-xs">Rechazado</a>
						@endif
					</td>
					<td>{{$res->fecha_documento}}</td>
					<td>{{$res->fecha}}</td>
					<td>
						<button class="btn btn-success" type="button"><i class="fa fa-check"></i></button>
					</td>
				</tr>
				@include('ventas.resumenboleta.modal')
				@endforeach
			</table>
		</div>
	</div>
</div>


@push('scripts')
<script>

	

	$(document).on("click", "#cerrar2", function(){
        $('#error').modal('hide');
    });


</script>
@endpush

@endsection