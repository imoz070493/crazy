<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
	if(Auth::guest()){
		return view('auth/login');
	}else{
		return redirect('ventas/venta');;
	}    
});

Route::resource('almacen/categoria','CategoriaController');

// Route::match(['get', 'post'], 'venta/peticion', 'VentaController@peticion');

Route::post('venta/peticion', 'VentaController@peticion');

Route::post('notas/peticion', 'NotasController@peticion');

Route::post('notas/detalle', 'NotasController@detalle');

Route::post('resumen/enviar', 'ResumenBoletaController@enviar');

Route::post('resumenbaja/enviar', 'ResumenBajaController@enviar');

Route::post('venta/reenviar', 'VentaController@reenviar');

Route::post('nota/reenviar', 'NotasController@reenviar');

Route::get('reporte/xls-compras', 'ReporteController@exportarExcelCompras');

Route::get('reporte/xls-ventas', 'ReporteController@exportarExcelVentas');

Route::get('articulo/kardex', 'ArticuloController@kardex');

Route::resource('reporte/compras', 'ReporteController@obtenerCompras');

Route::resource('reporte/ventas', 'ReporteController@obtenerVentas');

Route::resource('venta/pdf', 'VentaController@crearPDF');

Route::resource('almacen/articulo','ArticuloController');

Route::resource('ventas/cliente','ClienteController');

Route::resource('compras/proveedor','ProveedorController');

Route::resource('compras/ingreso','IngresoController');

Route::resource('ventas/venta','VentaController');

Route::resource('ventas/notas','NotasController');

Route::resource('ventas/resumenbo','ResumenBoletaController');

Route::resource('ventas/resumenba','ResumenBajaController');

Route::resource('seguridad/usuario','UsuarioController');

Route::resource('seguridad/configuracion','ConfiguracionController');

Route::resource('venta/pdfPrueba', 'VentaController@pdf');

Route::get('/export-users-excel','ExcelController@exportUsersExcel');

Route::get('/export-users-pdf','ExcelController@exportUsersPdf');

Route::get('/enviar-correo','VentaController@enviarCorreo');

Route::get('/leerfirma','VentaController@leerfirma');

Route::get('/crear-pdf-a7','VentaController@crearPdfA7');

Route::auth();

Route::resource('almacen/marca','MarcaController');


Route::get('/home', 'HomeController@index');

Route::get('/{slug?}', 'HomeController@index');


