@extends ('layouts.admin')
@section('modulo')
	Almacén
@endsection
@section('ruta')
	<li><a href="#"><i class="fa fa-dashboard"></i> Almacen</a></li>
    <li class="">Articulos</li>
    <li class="Active">Listado</li>
@endsection
@section('submodulo')
	Kardex
@endsection
@section('contenido')
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		@include('almacen.articulo.searchKardex')
	</div>
</div>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead>
					<th>Tipo</th>	
					<th>Comprobante</th>
					<th>Serie</th>
					<th>Numero Comprobante</th>
					<th>Fecha - Hora</th>
					<th>Cantidad V/C</th>
					<th>Stock Actual</th>
				</thead>
				@foreach($kardexx as $art)
				<tr>
					<td>{{$art->tipo}}</td>
					<td>{{$art->tipo_comprobante}}</td>
					<td>{{$art->serie_comprobante}}</td>
					<td>{{$art->num_comprobante}}</td>
					<td>{{$art->fecha_hora}}</td>
					<td>{{$art->cantidad}}</td>
					<td>{{$art->stockTemporal}}</td>
				</tr>
				@endforeach
			</table>
		</div>
	</div>
</div>
@endsection
