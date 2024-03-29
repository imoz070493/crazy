<?php

namespace sisVentas\Http\Controllers;

use Illuminate\Http\Request;

use sisVentas\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use sisVentas\Http\Requests\ArticuloFormRequest;
use sisVentas\Articulo;
use DB;

class ArticuloController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permisoAlmacen');
    }

    public function index(Request $request)
    {
    	if($request)
    	{
    		$query = trim($request->get('searchText'));
    		$articulos = DB::table('articulo as a')
    			->join('categoria as c','a.idcategoria','=','c.idcategoria')
    			->select('a.idarticulo','a.nombre','a.codigo','a.stock','c.nombre as categoria','a.descripcion','a.imagen','a.estado')
    			->where('a.nombre','LIKE','%'.$query.'%')
    			->orwhere('a.codigo','LIKE','%'.$query.'%')
    			->orderBy('idarticulo','desc')
                // ->get();
    			->paginate(10);

            $permiso = DB::table('permiso')
                ->where('idrol','=',\Auth::user()->idrol)
                ->orderBy('idrol','desc')
                ->get();

            $request->session()->put('permiso',$permiso);

    		return view('almacen.articulo.index',["articulos"=>$articulos,"searchText"=>$query]);
    	}

    }

    public function create()
    {
    	$categorias = DB::table('categoria')->where('condicion','=','1')->get();
        $marcas = DB::table('marca')->where('condicion','=','1')->get();
        $unidades = DB::table('unidad_medida')->get();
    	return view("almacen.articulo.create",["categorias"=>$categorias,"marcas"=>$marcas,"unidades"=>$unidades]);
    }

    public function store(ArticuloFormRequest $request)
    {
    	$articulo = new Articulo;
    	$articulo->idcategoria = $request->get('idcategoria');
    	$articulo->codigo = $request->get('codigo');
    	$articulo->nombre = $request->get('nombre');
    	// $articulo->stock = $request->get('stock');
    	$articulo->descripcion = $request->get('descripcion');
        $articulo->unidad_medida = $request->get('idunidad');
    	$articulo->estado = 'Activo';
    	
    	if(Input::hasFile('imagen')){
    		$file = Input::File('imagen');
    		$file->move(public_path().'/imagenes/articulos/',$file->getClientOriginalName());
    		$articulo->imagen=$file->getClientOriginalName();
    	}

    	$articulo->save();
    	return Redirect::to('almacen/articulo');
    }

    public function show($id)
    {
    	return view("almacen.articulo.show",["articulo"=>Articulo::findOrFail($id)]);
    }

    public function edit($id)
    {
    	$articulo = Articulo::findOrFail($id);
    	$categorias = DB::table('categoria')->where('condicion','=','1')->get();
    	return view("almacen.articulo.edit",["articulo"=>$articulo,"categorias"=>$categorias]);	
    }

    public function update(ArticuloFormRequest $request, $id)
    {
    	$articulo = Articulo::findOrFail($id);
    	$articulo->idcategoria = $request->get('idcategoria');
    	$articulo->codigo = $request->get('codigo');
    	$articulo->nombre = $request->get('nombre');
    	$articulo->stock = $request->get('stock');
    	$articulo->descripcion = $request->get('descripcion');    	
    	if(Input::hasFile('imagen')){
    		$file = Input::File('imagen');
    		$file->move(public_path().'/imagenes/articulos/',$file->getClientOriginalName());
    		$articulo->imagen=$file->getClientOriginalName();
    	}
    	$articulo->update();
    	return Redirect::to('almacen/articulo');
    }

    public function destroy($id)
    {
    	$articulo = Articulo::findOrFail($id);
    	$articulo->estado = 'Inactivo';
    	$articulo->update();
    	return Redirect::to('almacen/articulo');

    }

    public function kardex(Request $request)
    {
        if($request)
        {
            if($request->get('pidarticulo') != ''){
                $idarticulo = $request->get('pidarticulo');
            }else{
                $idarticulo = '';
            }
            $query = trim($request->get('searchText'));
            $articulos = DB::table('articulo as art')
                ->join('detalle_ingreso as di','art.idarticulo','=','di.idarticulo')
                ->select(DB::raw('CONCAT(art.codigo," ",art.nombre) AS articulo'),'art.idarticulo','art.stock')
                ->where('art.estado','=','Activo')
                ->groupBy('articulo','art.idarticulo','art.stock')
                ->get();

            $kardex = DB::table('venta as v')
                ->join('detalle_venta as dv','v.idventa','=','dv.idventa')
                ->join('articulo as a','dv.idarticulo','=','a.idarticulo')
                ->select(DB::raw('CONCAT("Venta") AS tipo'),'v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.fecha_hora','dv.cantidad','dv.stockTemporal')
                ->where('a.idarticulo','=',$idarticulo)
                ->orderBy('v.fecha_hora','desc')
                ->get();

            // $kardex = DB::table('venta as v')
            //     ->join('detalle_venta as dv','v.idventa','=','dv.idventa')
            //     ->join('articulo as a','dv.idarticulo','=','a.idarticulo')
            //     ->select(DB::raw('CONCAT("Venta") AS tipo'),'v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.fecha_hora','dv.cantidad','dv.stockTemporal')
            //     ->where('a.idarticulo','=',$idarticulo)
            //     ->orderBy('v.fecha_hora','desc')
            //     ->get();

            $kardex = DB::select('CALL paKardex(?)',array($idarticulo));
            // $users = DB::connection('mysql2')->select('CALL paKardex(?)',array('2090'));
            // dd($users);           

            // dd($kardex);

            $permiso = DB::table('permiso')
                ->where('idrol','=',\Auth::user()->idrol)
                ->orderBy('idrol','desc')
                ->get();

            $request->session()->put('permiso',$permiso);

            return view('almacen.articulo.kardex',["articulos"=>$articulos,"kardexx"=>$kardex,"idarticulo"=>$idarticulo]);
        }

    }
}
