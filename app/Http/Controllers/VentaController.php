<?php

namespace sisVentas\Http\Controllers;

use Illuminate\Http\Request;

use sisVentas\Http\Requests;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use sisVentas\Http\Requests\VentaFormRequest;
use sisVentas\Venta;
use sisVentas\Persona;
use sisVentas\Permiso;
use sisVentas\DetalleVenta;
use DB;

use sisVentas\Http\Controllers\Core;
use sisVentas\Http\Controllers\Util;

use Carbon\Carbon;
use Response;
use Illuminate\Support\Collection;

class VentaController extends Controller
{

    protected $documento;

    public function __construct()
    {
    	$this->middleware('auth');
        $this->middleware('permisoVentas');
        $this->documento = '';
    }

    public function index(Request $request)
    {
        if($request)
    	{
            $fecha_inicio = '';
            $fecha_fin = '';
            if($request->get('fecha_inicio') != '' AND  $request->get('fecha_fin')!=''){
                $fecha_inicio = $request->get('fecha_inicio');
                $fecha_fin = $request->get('fecha_fin');

                $diaUltimo = date('Y-m-d',strtotime($fecha_fin))." ".date('23:59:00');
                $diaPrimero = date('Y-m-d',strtotime($fecha_inicio))." ".date('00:00:00');
                LOG::info($diaPrimero."-".$diaUltimo);
            }else{
                $month = date('m');
                $year = date('Y');
                $day = date("d", mktime(0,0,0, $month+1, 0, $year));
                $diaUltimo = $year."-".$month."-".$day." ".date('23:59:00');

                $month = date('m');
                $year = date('Y');
                $diaPrimero = date('Y-m-d', mktime(0,0,0, $month, 1, $year))." ".date('00:00:00');
                LOG::info($diaPrimero."-".$diaUltimo);
            }
            $f='01';$b='03';
    		$query = trim($request->get('searchText'));
    		$ventas = DB::table('venta as v')
    			->join('persona as p','v.idcliente','=','p.idpersona')
    			->join('detalle_venta as dv','v.idventa','=','dv.idventa')
    			->select('v.idventa','v.fecha_hora','p.nombre','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.response_code','p.email')
    			// ->where('v.num_comprobante','LIKE','%'.$query.'%')
                ->whereBetween('v.fecha_hora',[$diaPrimero,$diaUltimo])
                // ->where('v.tipo_comprobante','=','01')
                ->where(function($query) use ($f, $b)
                    {
                        $query->where('v.tipo_comprobante', $f)
                              ->orWhere('v.tipo_comprobante',$b);
                    })
                // ->orWhere('v.tipo_comprobante','=','03')
    			->orderBy('v.idventa','des')
    			->groupBy('v.idventa','v.fecha_hora','p.nombre','v.tipo_comprobante','v.serie_comprobante','v.impuesto','v.estado')
    			->get();

            LOG::info("---------------------------------");
            LOG::info("RESPUESTA DESDE EL METODO INDEX");
            LOG::info("---------------------------------");
            // dd($ventas);

            $empresa = DB::table('config')
            ->where('estado','=','1')
            ->first();

            $permiso = DB::table('permiso')
                ->where('idrol','=',\Auth::user()->idrol)
                ->orderBy('idrol','desc')
                ->get();

            $request->session()->put('permiso',$permiso);
            $request->session()->put('nombre_comercial',$empresa->nombre_comercial);

    		// return view('ventas.venta.index',["ventas"=>$ventas,"searchText"=>$query, "ruc" => $empresa->ruc]);
            return view('ventas.venta.index',["ventas"=>$ventas,"ruc"=>$empresa->ruc ,"fecha_inicio" =>date('Y/m/d',strtotime($diaPrimero)) , "fecha_fin" => date('Y/m/d',strtotime($diaUltimo))]);
    	}

    }

    public function create()
    {
        if(\Session::has('venta') && \Session::get('venta')=='1'){
            \Session::forget('venta');
        }

    	$personas = DB::table('persona')->where('tipo_persona','=','Cliente')->get();

    	$articulos = DB::table('articulo as art')
    		->join('detalle_ingreso as di','art.idarticulo','=','di.idarticulo')
    		->select(DB::raw('CONCAT(art.stock," - ",art.codigo," - ",art.nombre) AS articulo'),'art.idarticulo','art.stock',DB::raw('avg(di.precio_venta) as precio_promedio'))
    		->where('art.estado','=','Activo')
    		->where('art.stock','>','0')
    		->groupBy('articulo','art.idarticulo','art.stock')
    		->get();
    	return view("ventas.venta.create",["personas"=>$personas,'articulos'=>$articulos]);
    }

    public function store(VentaFormRequest $request)
    {

        $idcliente = $request->get('idcliente');
        $tipo_comprobante = $request->get('tipo_comprobante');
        $serie_comprobante = $request->get('serie_comprobante');
        $num_comprobante = $request->get('num_comprobante');

        $ventasTemp = DB::table('venta')
                ->select('idventa')
                ->where('serie_comprobante','LIKE','%'.$serie_comprobante.'%')
                ->where('num_comprobante','=',$num_comprobante)
                ->where('tipo_comprobante','=',$tipo_comprobante)
                ->orderBy('idventa','desc')
                ->first();

        if(!empty($ventasTemp)){
            $ventasTemp = DB::table('venta')
                ->select('idventa', 'num_comprobante')
                ->where('serie_comprobante','LIKE','%'.$serie_comprobante.'%')
                ->where('tipo_comprobante','=',$tipo_comprobante)
                ->orderBy('idventa','desc')
                ->first();
            // dd($ventasTemp->num_comprobante+1);
            $num_comprobante = str_pad($ventasTemp->num_comprobante + 1,  8, "0", STR_PAD_LEFT);
        }

    	try{
    		DB::beginTransaction();
    			$venta = new Venta;
    			$venta->idcliente = $idcliente;
    			$venta->tipo_comprobante = $tipo_comprobante;
    			$venta->serie_comprobante = $serie_comprobante;
    			$venta->num_comprobante = $num_comprobante;
    			$venta->total_venta = $request->get('total_venta');

    			// $mytime = Carbon::now('America/Lima');
    			// $venta->fecha_hora = $mytime->toDateTimeString();
                
                $time = strtotime($request->get('fecha').date("H:i:s"));
                $fecha = date('Y-m-d H:i:s',$time);
                
                $venta->fecha_hora = $fecha;
    			$venta->impuesto = '18';
    			$venta->estado = 'A';
    			$venta->save();

    			$idarticulo = $request->get('idarticulo');
    			$cantidad = $request->get('cantidad');
    			$descuento = $request->get('descuento');
    			$precio_venta = $request->get('precio_venta');
                $stock = $request->get('stockA');

    			$cont = 0;
    			while($cont < count($idarticulo)){
    				$detalle = new DetalleVenta();
    				$detalle->idventa = $venta->idventa;
    				$detalle->idarticulo = $idarticulo[$cont];
    				$detalle->cantidad = $cantidad[$cont];
    				$detalle->descuento = $descuento[$cont];
    				$detalle->precio_venta = $precio_venta[$cont];
                    $detalle->stockTemporal = $stock[$cont] - $cantidad[$cont];
    				$detalle->save();
    				$cont = $cont + 1;
    			}

    		DB::commit();
    	}catch(\Exception $e){
    		DB::rollback();
            LOG::info($e);
    	}

        $empresa = DB::table('config')
                ->where('estado','=','1')
                ->first();

        $invoice = new Core\Invoice();

        $util = new Util\UtilHelper();

        $total_venta = $request->get('total_venta');
        $leyenda = $util->numtoletras($total_venta);

        $factura = $empresa->ruc."-".$tipo_comprobante."-".$serie_comprobante."-".$num_comprobante;

        $mytime = Carbon::now('America/Lima');
        $fecha = $mytime->toDateString();
        $hora = $mytime->toTimeString();

        $idarticulo = $request->get('idarticulo');
        $cantidad = $request->get('cantidad');
        $descuento = $request->get('descuento');
        $precio_venta = $request->get('precio_venta');

        if($request->get('tipo_comprobante')=='01'){
            
            $invoice->buildInvoiceXml($idcliente,$tipo_comprobante,$serie_comprobante,$num_comprobante,$total_venta,$leyenda,$fecha,$hora,$idarticulo,$cantidad,$precio_venta, $empresa);
        }

        if($request->get('tipo_comprobante')=='03'){

            $invoice->buildInvoiceXmlB($idcliente,$tipo_comprobante,$serie_comprobante,$num_comprobante,$total_venta,$leyenda,$fecha,$hora,$idarticulo,$cantidad,$precio_venta, $empresa);

            $v = Venta::findOrFail($venta->idventa);
            $v->estado = '0';
            $v->update();
        }

        

        $cliente = DB::table('persona as per')
            ->join('venta as v','per.idpersona','=','v.idcliente')
            ->select('per.nombre','per.direccion','per.num_documento','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.fecha_hora')
            ->where('v.idventa','=',$venta->idventa)
            ->first();

        $items = DB::table('venta as v')
            ->join('detalle_venta as dv','dv.idventa','=','v.idventa')
            ->join('articulo as art','art.idarticulo','=','dv.idarticulo')
            ->select('art.codigo','art.nombre','dv.cantidad','dv.precio_venta',DB::raw('dv.cantidad * dv.precio_venta AS total'))
            ->where('v.idventa','=',$venta->idventa)
            ->get();
        
        $response = $invoice->readSignDocument(public_path().'\cdn\document\prueba21\\'.$factura.'.ZIP');

        if($request->get('tipo_comprobante')=='01'){
            $invoice->crearPDF($empresa,$cliente,$items, $leyenda,$response['sign']);
        }
        if($request->get('tipo_comprobante')=='03'){
            $invoice->crearPDFA7($empresa,$cliente,$items, $leyenda,$response['sign']);
        }

        if($request->get('tipo_comprobante')=='01'){

            $invoice->enviarFactura($factura);
            // $respuesta = $invoice->enviarFactura($factura);
            // // dd($respuesta);
            if(\Session::get('fallo')){
                \Session::put('msg','FALLO LA CONEXION CON LA SUNAT');
                return Redirect::to('ventas/venta');
            }
            
            $path = public_path('cdn/cdr\R-'.$factura.'.ZIP');
            LOG::info($path);
            $responseCdr = $invoice->readCdr('',$path,$tipo_comprobante);

            if($responseCdr['code']=='0'){
                $estado = '2';
                \Session::put('msgB','LA FACTURA FUE ENVIADA CORRECTAMENTE');
            }else{
                $estado = '1';
            }

            $v = Venta::findOrFail($venta->idventa);
            $v->response_code=$responseCdr['code'];
            $v->descripcion_code=$responseCdr['message'];
            $v->estado = $estado;
            $v->update();
        }

        
        


    	return Redirect::to('ventas/venta');
    }

    public function crearPDF(){
        $invoice = new Core\Invoice();
        $invoice->crearPDF();
    }

    public function show($id)
    {
    	$venta =DB::table('venta as v')
			->join('persona as p','v.idcliente','=','p.idpersona')
			->join('detalle_venta as dv','v.idventa','=','dv.idventa')
			->select('v.idventa','v.fecha_hora','p.nombre','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta')
			->where('v.idventa','=',$id)
			->first();

    	$detalles = DB::table('detalle_venta as d')
			->join('articulo as a','d.idarticulo','=','a.idarticulo')
			->select('a.nombre as articulo','d.cantidad','d.descuento','d.precio_venta')
			->where('d.idventa','=',$id)
			->get();

    	return view("ventas.venta.show",["venta"=>$venta,"detalles"=>$detalles]);
    }

    public function destroy($id){
    	$venta = Venta::findOrFail($id);
    	$venta->Estado='4';
    	$venta->update();
    	return Redirect::to('ventas/venta');
    }

    public function peticion(Request $request){
        $tipo_comprobante = $_POST['tipoComprobante'];
        if($tipo_comprobante=='01'){
            $serie = "F001";   
            $tipo_documento = "02";
        }
        if($tipo_comprobante=='03'){
            $serie = "B001";    
            $tipo_documento = "01";
        }        

        $ventas = DB::table('venta')
                ->select('*')
                ->where('serie_comprobante','LIKE','%'.$serie.'%')
                ->where('tipo_comprobante','=',$tipo_comprobante)
                ->orderBy('idventa','desc')
                ->first();
        $clientes = DB::table('persona')
                ->select('idpersona','nombre')
                ->where('tipo_persona','=','Cliente')
                ->where('tipo_documento','=',$tipo_documento)
                ->orderBy('nombre','asc')
                ->get();
        // dd($clientes);
        if(is_null($ventas)){
            $num_comprobante=0;
        }else{
            $num_comprobante = $ventas->num_comprobante;
        }
        return response()->json([
            'serie' => $serie,
            'correlativo' => str_pad($num_comprobante + 1,  8, "0", STR_PAD_LEFT),
            'clientes' => $clientes,
            // 'ventas'=>$ventas
        ]);
    }

    //METODOS DE PRUEBA

    public function pdf(){
        $invoice = new Core\Invoice();
        $invoice->pdfPrueba();
    }

    public function leerFirma(){
        $invoice = new Core\Invoice();
        // $invoice->readSignDocument('C:\xampp1\htdocs\sisVentas\public\cdn\cdr\R-20100066603-01-F001-00000017.ZIP');
        $response = $invoice->readSignDocument('C:\xampp1\htdocs\sisVentas\public\cdn\document\prueba21\20100066603-01-F001-00000017.ZIP');
        LOG::info('Desde leerFirma'.$response['sign']);
    }

    public function crearPdfA7(){
        $items = DB::table('venta as v')
            ->join('detalle_venta as dv','dv.idventa','=','v.idventa')
            ->join('articulo as art','art.idarticulo','=','dv.idarticulo')
            ->select('art.codigo','art.nombre','dv.cantidad','dv.precio_venta',DB::raw('dv.cantidad * dv.precio_venta AS total'))
            ->where('v.idventa','=',236)
            ->get();
        $empresa = DB::table('config')
                ->where('estado','=','1')
                ->first();
        $cliente = DB::table('persona as per')
            ->join('venta as v','per.idpersona','=','v.idcliente')
            ->select('per.nombre','per.direccion','per.num_documento','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.fecha_hora')
            ->where('v.idventa','=',236)
            ->first();
        $invoice = new Core\Invoice();
        $invoice->crearPDFA7($empresa,$cliente,$items);
    }

    public function reenviar(Request $request){
        $idVenta = $_POST['idVenta'];
        $serie_comprobante = $_POST['serie'];
        $num_comprobante = $_POST['num_comprobante'];
        $tipo_comprobante = $_POST['tipo_comprobante'];



        $empresa = DB::table('config')
                ->where('estado','=','1')
                ->first();

        $factura = $empresa->ruc."-".$tipo_comprobante."-".$serie_comprobante."-".$num_comprobante;
        $invoice = new Core\Invoice();
        $invoice->enviarFactura($factura);
        // $respuesta = $invoice->enviarFactura($factura);
        // // dd($respuesta);
        if(\Session::get('fallo')){
            \Session::put('msg','FALLO LA CONEXION CON LA SUNAT');
            // return Redirect::to('ventas/venta');
            return response()->json([
                'msg' => "FALLO LA CONEXION CON LA SUNAT",
            ]);
        }
        
        $path = public_path('cdn/cdr\R-'.$factura.'.ZIP');
        LOG::info($path);
        $responseCdr = $invoice->readCdr('',$path,$tipo_comprobante);

        if($responseCdr['code']=='0'){
            $estado = '2';
        }else{
            $estado = '1';
        }

        $v = Venta::findOrFail($idVenta);
        $v->response_code=$responseCdr['code'];
        $v->descripcion_code=$responseCdr['message'];
        $v->estado = $estado;
        $v->update();

        // $cliente = DB::table('persona as per')
        //     ->join('venta as v','per.idpersona','=','v.idcliente')
        //     ->select('per.nombre','per.direccion','per.num_documento','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.fecha_hora')
        //     ->where('v.idventa','=',$idVenta)
        //     ->first();

        // $items = DB::table('venta as v')
        //     ->join('detalle_venta as dv','dv.idventa','=','v.idventa')
        //     ->join('articulo as art','art.idarticulo','=','dv.idarticulo')
        //     ->select('art.codigo','art.nombre','dv.cantidad','dv.precio_venta',DB::raw('dv.cantidad * dv.precio_venta AS total'))
        //     ->where('v.idventa','=',$idVenta)
        //     ->get();
        
        // $response = $invoice->readSignDocument(public_path().'\cdn\document\prueba21\\'.$factura.'.ZIP');

        // if($request->get('tipo_comprobante')=='01'){
        //     $invoice->crearPDF($empresa,$cliente,$items, $leyenda,$response['sign']);
        // }
        // if($request->get('tipo_comprobante')=='03'){
        //     $invoice->crearPDFA7($empresa,$cliente,$items, $leyenda,$response['sign']);
        // }
        
        // return response()->json([
        //     'msg' => "LA FACTURA SE ENVIO CORRECTAMENTE",
        //     // 'correlativo' => str_pad($num_comprobante + 1,  8, "0", STR_PAD_LEFT),
        //     // 'ventas'=>$ventas
        // ]);   


        \Session::put('msgB','ENVIO CORRECTO');
        // return Redirect::to('ventas/venta');
            return response()->json([
            'msg' => "SE ENVIO CORRECTAMENTE LA FACTURA",
            // 'correlativo' => str_pad($num_comprobante + 1,  8, "0", STR_PAD_LEFT),
            // 'ventas'=>$ventas
            ]);
        

        // return Redirect::to('ventas/venta');
    }


    public function enviarCorreo(){

        $tipo_comprobante = $_GET['tc'];
        $serie = $_GET['s'];
        $correlativo = $_GET['c'];
        $destinatario = $_GET['m'];

        $empresa = DB::table('config')
            ->where('estado','=','1')
            ->first();

        $this->documento = array(
            'documento' => $empresa->ruc."-".$tipo_comprobante."-".$serie."-".$correlativo,
            'empresa' => $empresa,
            'destinatario' => $destinatario,
        );

        $data = array(
            'name' => "Curso Laraveldsadasdasd",
        );
        \Mail::send('ventas.venta.prueba',$data,function($message){
            $objetoEmpresa = $this->documento['empresa'];
            $message->from('imoz070493@gmail.com',$objetoEmpresa->razon_social);
            $message->to($this->documento['destinatario'])->subject('DOCUMENTOS ELECTRONICOS '.$this->documento['documento']);

            $pdf = public_path()."\cdn/pdf/".$this->documento['documento'].".pdf";
            $xml = public_path()."\cdn/document/prueba21/".$this->documento['documento'].".ZIP";
            $cdr = public_path()."\cdn/cdr/R-".$this->documento['documento'].".ZIP";
            chmod($xml,0777);
            chmod($cdr,0777);
            $message->attach($pdf);
            $message->attach($xml);
            $message->attach($cdr);
        });

        \Session::put('msgB','Correo Enviado Satisfactoriamente');

        return Redirect::back();
        // return "Tu email ha sido enviado satisfactoriamente";
    }
}
