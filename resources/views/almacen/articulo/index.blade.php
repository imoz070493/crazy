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
	Articulos
@endsection
@section('contenido')
<div class="row">
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
		<h3>Listado de Articulos <a href="articulo/create"><button class="btn btn-success">Nuevo</button></a> <a href="{{asset('articulo/kardex')}}"><button class="btn btn-primary"><i class="fa fa-list"></i> Kardex</button></a></h3>
		@include('almacen.articulo.search')
	</div>
</div>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead>
					<th>Id</th>
					<th>Nombre</th>
					<th>Codigo</th>
					<th>Categoria</th>
					<th>Stock</th>
					<!-- <th>Imagen</th> -->
					<th>Estado</th>
					<th>Opciones</th>
				</thead>
				@foreach($articulos as $art)
				<tr>
					<td>{{$art->idarticulo}}</td>
					<td>{{$art->nombre}}</td>
					<td>{{$art->codigo}}</td>
					<td>{{$art->categoria}}</td>
					<td>{{$art->stock}}</td>
					<!-- <td>
						<img src="{{asset('imagenes/articulos/'.$art->imagen)}}" alt="{{$art->nombre}}" height="100px" width="100px" class="img-thumbnail">
					</td> -->
					<td>{{$art->estado}}</td>
					<td>
						<a href="{{URL::action('ArticuloController@edit',$art->idarticulo)}}">
							<button class="btn btn-info" title="Editar"><i class="fa fa-edit"></i></button>
						</a>
						<a href="" data-target="#modal-delete-{{$art->idarticulo}}" data-toggle="modal"><button class="btn btn-danger" title="Eliminar"><i class="fa fa-close"></i></button></a>
					</td>
				</tr>
				@include('almacen.articulo.modal')
				@endforeach
			</table>
		</div>
		{{$articulos->render()}}
	</div>
</div>
@endsection