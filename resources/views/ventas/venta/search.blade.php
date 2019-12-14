<!-- {!! Form::open(array('url'=>'ventas/venta','method'=>'GET', 'autocomplete'=>'off','role'=>'search'))!!}
<div class="form-group">
	<div class="input-group">
		<input type="text" class="form-control" name="searchText" placeholder="Buscar..." value="{{--$searchText--}}">
		<span class="input-group-btn">
			<button type="submit" class="btn btn-primary">Buscar</button>
		</span>
	</div>
</div>

{{Form::close()}} -->
{!! Form::open(array('url'=>'ventas/venta','method'=>'GET', 'autocomplete'=>'off','role'=>'search'))!!}

	<div class="row">
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			<div class="form-group">
				<label>Fecha Inicio</label>
				<div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control" id="fecha_inicio" name="fecha_inicio" value="{{ $fecha_inicio }}" >
                </div>
			</div>
		</div>

		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="form-group">
				<label>Fecha Fin</label>
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<div class="input-group date">
		                  <div class="input-group-addon">
		                    <i class="fa fa-calendar"></i>
		                  </div>
		                  <input type="text" class="form-control" id="fecha_fin" name="fecha_fin" value="{{$fecha_fin}}" >
		                </div>
	                </div>
	                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
	            		<button type="submit" class="btn btn-primary">Buscar</button>
	                </div>
                </div>
			</div>
		</div>

	</div>

{{Form::close()}}