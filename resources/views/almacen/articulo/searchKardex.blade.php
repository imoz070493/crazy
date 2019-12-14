{!! Form::open(array('url'=>'articulo/kardex','method'=>'GET', 'autocomplete'=>'off','role'=>'search'))!!}

	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="form-group">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<div class="form-group">
							<label>Articulo</label>
							<select name="pidarticulo" class="form-control selectpicker" id="pidarticulo" data-live-search="true">
								@foreach($articulos as $articulo)
									@if($articulo->idarticulo == $idarticulo)
										<option value="{{$articulo->idarticulo}}" selected>{{$articulo->articulo}}</option>
									@else
										<option value="{{$articulo->idarticulo}}">{{$articulo->articulo}}</option>	
									@endif
									
								@endforeach
							</select>
						</div>
		            </div>
		            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		            	<div class="form-group">
		            		<label>&nbsp;</label>
		            		<br>
			        		<button type="submit" class="btn btn-primary">Listar</button>
			        		<a class="btn btn-danger" href="{{ asset('almacen/articulo') }}">Cancelar</a>
		        		</div>
		            </div>
		        </div>
			</div>
		</div>

	</div>



{{Form::close()}}