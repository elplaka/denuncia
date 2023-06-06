<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Denuncia;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\DenunciaRequest;
use Carbon\Carbon;
use PDF;
use Dompdf\Dompdf;
use DOMDocument;
use App\Http\Requests\ActualizaDenunciaRequest;
use App\Http\Requests\ActualizaStatusRequest;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class DenunciaController extends Controller
{
    function agregaInfo(DenunciaRequest $request)
    {
        $denuncia = new Denuncia;
        $denuncia->nombre_denunciante = trim(mb_strtoupper($request->nombre_denunciante));
        $denuncia->telefono_denunciante = trim(mb_strtoupper($request->telefono_denunciante));
        $denuncia->domicilio_denunciante = trim(mb_strtoupper($request->domicilio_denunciante));
        $denuncia->localidad_denunciante = trim(mb_strtoupper($request->localidad_denunciante));
        $denuncia->email_denunciante = trim($request->email_denunciante);
        $denuncia->nombre_denunciado = trim(mb_strtoupper($request->nombre_denunciado)) ?: "S/N";
        $denuncia->cve_dependencia = $request->cve_dependencia;
        $denuncia->cargo_denunciado = trim(mb_strtoupper($request->cargo_denunciado)) ?: "S/C";
        $denuncia->hechos = trim(mb_strtoupper($request->hechos));
        $denuncia->fecha_hechos = $request->fecha_hechos;
        $denuncia->lugar_hechos = trim(mb_strtoupper($request->lugar_hechos));
        $denuncia->pruebas = trim(mb_strtoupper($request->pruebas)) ?: "S/P";

        if (is_null($request->file('archivo_pruebas'))) $nombre_archivo = 'N/A';
        else 
        {
            $archivo_pruebas = $request->file('archivo_pruebas');
            //$nombre_archivo = time() . Str::random(2) . '.' . $archivo_pruebas->getClientOriginalExtension();
            $nombre_archivo = time() . '.' . $archivo_pruebas->getClientOriginalExtension();
            $archivo_pruebas->storeAs('archivos', $nombre_archivo);
        }

        $denuncia->archivo_pruebas = $nombre_archivo;
        $denuncia->save();  
        
        // Obtener el ID recién generado
        $id = DB::getPdo()->lastInsertId(); 

        if ($nombre_archivo != "N/A")
        {
            // Actualizar el nombre del archivo con el ID generado
            $nuevo_nombre_archivo = $id . '_' .  time() . '.' . pathinfo($nombre_archivo, PATHINFO_EXTENSION);
            Storage::move('archivos/' . $nombre_archivo, 'archivos/' . $nuevo_nombre_archivo);
            $denuncia->archivo_pruebas = $nuevo_nombre_archivo;
            $denuncia->save();
        }
            
        session(['denuncia_enviada' => true]);
        return redirect()->route('denuncia_enviada');

    }

    public function formulario()
    {
        $dependencias = DB::table('dependencias')
        ->where('cve_dependencia', '>', 0)
        ->orderBy('dependencia', 'asc')
        ->get();   //Que no incluya NINGUNA pues es la opción por default

        return \View::make('denuncias.formulario', compact('dependencias'));

        // $nombre_denunciante = "COSME FULANITO ROSAS";
        // $telefono_denunciante = "6941257368";
        // $domicilio_denunciante = "CALLE PRINCIPAL";
        // $localidad_denunciante = "LA GUASIMA";
        // $email_denunciante = "elplaka@hotmail.com";
        // $nombre_denunciado = "EL DE OBRAS PÚBLICAS";
        // $cve_dependencia = 5;
        // $cargo_denunciado = "DIRECTOR";
        // $hechos = "EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS";
        // $fecha_hechos = Carbon::create(2023, 4, 22);
        // $fecha_hechos = date('Y-m-d', strtotime($fecha_hechos));
        // $lugar_hechos = "EN EL MALECÓN DE CONCORDIA";
        // $pruebas = "TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ";

        // return \View::make('denuncias.formulario', compact('dependencias',
        // 'nombre_denunciante',
        // 'telefono_denunciante',
        // 'domicilio_denunciante',
        // 'localidad_denunciante',
        // 'email_denunciante',
        // 'nombre_denunciado',
        // 'cve_dependencia',
        // 'cargo_denunciado',
        // 'hechos',
        // 'fecha_hechos',
        // 'lugar_hechos',
        // 'pruebas',
        // ));
    }

    public function crystalReports(Request $request, $docPDF)
    {
        $tituloReporte = $request->tituloReporte;

        $fecha_inicial = now()->startOfDay();
        $fecha_inicial->modify ('-7days');

        $fecha_final = now()->endOfDay(); 

           //Variables para que los parámetros de búsqueda se queden tal cual después del submit
        $fecha_finalR = $fecha_final; 
        $fecha_inicialR = $fecha_inicial;
        $localidadR = ''; 
        $cve_dependenciaR = -1;
        $denunciaR = '';
        $groupByR = false;
        $statusR = '1';

        // $denuncias = Denuncia::select('denuncias.folio', 'denuncias.created_at', 'denuncias.nombre_denunciante', 'dependencias.dependencia', 'denuncias.denuncia');


        if (is_null($request->fecha_inicial))  //Cuando se carga la página SÍ DEBE CARGAR (GET) LOS REGISTROS desde el principio
        {
            //$denuncias = $denuncias->join('dependencias', 'denuncias.cve_dependencia', '=', 'dependencias.cve_dependencia');
            $denuncias = Denuncia::whereBetween('created_at', [$fecha_inicial, $fecha_final]);
            $denuncias = $denuncias->where('status', $statusR)->paginate(10);

            

        }

        if (! is_null($request->fecha_inicial))   //Cuando se le da a FILTRAR NO SE CARGAN LOS REGISTROS hasta que se termina de formar el QUERY
        {  
            $fecha_inicial = Carbon::createFromFormat('Y-m-d', $request->fecha_inicial)->startOfDay();
            $fecha_final = Carbon::createFromFormat('Y-m-d', $request->fecha_final)->endOfDay();

            $denuncias = Denuncia::whereBetween('created_at', [$fecha_inicial, $fecha_final]);
            $denuncias = $denuncias->whereBetween('created_at', [$fecha_inicial, $fecha_final]);

            $cve_dependenciaR = $request->cve_dependencia;
            $denunciaR = $request->denuncia;
            $statusR = $request->status;
            $groupByR = $request->has('groupBy');

            $denuncias = $denuncias->where('status', $request->status);

            if (! is_null($request->localidad_denunciante))
            {
                $localidadR = $request->localidad_denunciante;
                $denuncias = $denuncias->where('localidad_denunciante', 'like', '%' . $localidadR . '%');
            }

            if ($request->cve_dependencia != '-1')  //Cuando se selecciona una dependencia (incluso NINGUNA)
            {
                $denuncias = $denuncias->where('cve_dependencia', $request->cve_dependencia);
            }

            if (! is_null($request->denunciante_denuncia))
            {
                $denuncia = $request->denunciante_denuncia;
                $denunciaR = $denuncia;

                $denuncias = $denuncias->where(function($query) use ($denuncia)
                {
                        $query->where('nombre_denunciante', 'like', '%' . $denuncia . '%');                        
                              
                })
                ->orWhere(function($query) use ($denuncia)
                {
                        $query->where('denuncia', 'like', '%' . $denuncia . '%');
                });
            }

            if($request->has('groupBy'))
            {
                $denuncias = $denuncias->orderBy('cve_dependencia');
            }

            $denuncias = $denuncias->paginate(10);  
            
            //dd($denuncias);
        
            $fecha_inicialR = Carbon::createFromFormat('Y-m-d',$request->fecha_inicial);
            $fecha_finalR = Carbon::createFromFormat('Y-m-d', $request->fecha_final);          
        }

        if ($docPDF == 1)   //Si se genera el PDF 
        {
            // $pdf = PDF::loadView('denuncias.pdf',['denuncias'=>$denuncias, 'tituloReporte'=>$tituloReporte, 'groupBy'=>$groupByR]);
            // $pdf->render();
            // $output = $pdf->output();

            // $fileName = 'document.pdf';
            // return file_put_contents('pdf_files/'.$fileName, $output);
      
            $pdf = PDF::loadView('denuncias.pdf',['denuncias'=>$denuncias, 'tituloReporte'=>$tituloReporte, 'groupBy'=>$groupByR]);
            return $pdf->stream();

        }
        else  //Si se muestra la tabla en pantalla
        {
            $dependencias = DB::table('dependencias')
            ->where('cve_dependencia', '>', 0)
            ->orderBy('dependencia', 'asc')
            ->get();   //Que no incluya NINGUNA pues es la opción por default

              // Obtén los parámetros de la solicitud actual
            $params = $request->query();

            return view("denuncias.reporte", compact('denuncias', 'dependencias'))->with('fecha_inicialR',$fecha_inicialR)->with('fecha_finalR',$fecha_finalR)->with('localidadR', $localidadR)->with('cve_dependenciaR', $cve_dependenciaR)->with('denunciaR', $denunciaR)->with('statusR', $statusR)->with('groupByR', $groupByR)->with('params', $params);;
            
        }
    } 

    public function editar($folio)
    {
        $denuncia = Denuncia::findOrFail($folio);

        $dependencias = DB::table('dependencias')
        ->where('cve_dependencia', '>', 0)
        ->orderBy('dependencia', 'asc')
        ->get();   //Que no incluya NINGUNA pues es la opción por default
        
        return view("denuncias.editar", compact('denuncia', 'dependencias'));
    }

    public function descargarArchivo($archivo_pruebas)
    {
        $archivo = storage_path('app/archivos/' . $archivo_pruebas);
        return response()->download($archivo);
    }

    public function ver($folio)
    {
        $denuncia = Denuncia::findOrFail($folio);

        $dependencias = DB::table('dependencias')
        ->where('cve_dependencia', '>', 0)
        ->orderBy('dependencia', 'asc')
        ->get();   //Que no incluya NINGUNA pues es la opción por default
        
        return view("denuncias.ver", compact('denuncia', 'dependencias'));
    }

    public function actualiza(ActualizaDenunciaRequest $request, $folio)
    {
        $denuncia = Denuncia::where('folio', '=', $folio)->first();

        if (is_null($request->file('archivo_pruebas'))) $nombre_archivo = 'N/A';
        else 
        {
            $archivo_pruebas = $request->file('archivo_pruebas');
            $nombre_archivo = time() . '.' . $archivo_pruebas->getClientOriginalExtension();
            $archivo_pruebas->storeAs('archivos', $nombre_archivo);
        }

        $denuncia->archivo_pruebas = $nombre_archivo;

        $denuncia->update([
            'nombre_denunciante' => trim(mb_strtoupper($request->nombre_denunciante)),
            'telefono_denunciante' => trim(mb_strtoupper($request->telefono_denunciante)),
            'domicilio_denunciante' => trim(mb_strtoupper($request->domicilio_denunciante)),
            'localidad_denunciante' => trim(mb_strtoupper($request->localidad_denunciante)),
            'email_denunciante' => trim($request->email_denunciante),
            'nombre_denunciado' => trim(mb_strtoupper($request->nombre_denunciado)),
            'cve_dependencia' => $request->cve_dependencia,
            'cargo_denunciado' => trim(mb_strtoupper($request->cargo_denunciado)),
            'hechos' => trim(mb_strtoupper($request->hechos)),
            'fecha_hechos' => date('Y-m-d', strtotime($request->fecha_hechos)),
            'lugar_hechos' => trim(mb_strtoupper($request->lugar_hechos)),
            'pruebas' => trim(mb_strtoupper($request->pruebas)), 
            'archivo_pruebas' => $nombre_archivo,
            'status' => $request->status,      
        ]);

        return redirect()->route('denuncias.crystalReports', 0)->with('message', 'Denuncia ACTUALIZADA con éxito!');
    }

    public function actualizaStatus(ActualizaStatusRequest $request, $folio)
    {
        $denuncia = Denuncia::where('folio', '=', $folio)->first();

        $denuncia->update([
            'status' => $request->status,         
        ]);

        return redirect()->route('denuncias.crystalReports', 0)->with('message', 'El STATUS de la Denuncia ha sido ACTUALIZADO con éxito!');
    }
}

// public function pdfA(Request $request, $bandera)
// {
//     $tituloReporte = $request->tituloReporte;

//     $fecha_inicial = now()->startOfDay();
//     $fecha_inicial->modify ('-7days');

//     $fecha_final = now()->endOfDay(); 

//     //Variables para que los parámetros de búsqueda se queden tal cual después del submit
//     $fecha_finalR = $fecha_final; 
//     $fecha_inicialR = $fecha_inicial; 
//     $cve_dependenciaR = -1;
//     $denunciaR = '';

//     $dependencias = DB::table('dependencias')
//     ->where('cve_dependencia', '>', 0)
//     ->orderBy('dependencia', 'asc')
//     ->get();   //Que no incluya NINGUNA pues es la opción por default

//     $denuncias = Denuncia::select('denuncias.folio', 'denuncias.created_at', 'denuncias.nombre_denunciante', 'dependencias.dependencia', 'denuncias.denuncia');


//     if (is_null($request->fecha_inicial))  //Cuando se carga la página SÍ DEBE CARGAR (GET) LOS REGISTROS desde el principio
//     {
//         $denuncias = $denuncias->join('dependencias', 'denuncias.cve_dependencia', '=', 'dependencias.cve_dependencia');
//         $denuncias = $denuncias->whereBetween('denuncias.created_at', [$fecha_inicial, $fecha_final])->get();
//     }

//     if (! is_null($request->fecha_inicial))   //Cuando se le da a FILTRAR NO SE CARGAN LOS REGISTROS hasta que se termina de formar el QUERY
//     {  
//         $fecha_inicial = Carbon::createFromFormat('Y-m-d', $request->fecha_inicial)->startOfDay();
//         $fecha_final = Carbon::createFromFormat('Y-m-d', $request->fecha_final)->endOfDay();

//         $denuncias = $denuncias->whereBetween('denuncias.created_at', [$fecha_inicial, $fecha_final]);

//         $cve_dependenciaR = $request->cve_dependencia;
//         $denunciaR = $request->denuncia;

//         if ($request->cve_dependencia != '-1')  //Cuando se selecciona una dependencia (incluso NINGUNA)
//         {
//             $denuncias = $denuncias->where('denuncias.cve_dependencia', $request->cve_dependencia);
//         }

//         if (! is_null($request->denunciante_denuncia))
//         {
//             $denuncia = $request->denunciante_denuncia;
//             $denunciaR = $denuncia;

//             $denuncias = $denuncias->where(function($query) use ($denuncia)
//             {
//                     $query->where('nombre_denunciante', 'like', '%' . $denuncia . '%');                        
                          
//             })
//             ->orWhere(function($query) use ($denuncia)
//             {
//                     $query->where('denuncia', 'like', '%' . $denuncia . '%');
//             });
//         }
//         $denuncias = $denuncias->join('dependencias', 'denuncias.cve_dependencia', '=', 'dependencias.cve_dependencia');

//         $denuncias = $denuncias->get();   

//         $arrDenuncias = $denuncias->toArray();
//         //dd($arrDenuncias);
        
//         $fecha_inicialR = Carbon::createFromFormat('Y-m-d',$request->fecha_inicial);
//         $fecha_finalR = Carbon::createFromFormat('Y-m-d', $request->fecha_final);          
//     }

       // if ($bandera == 0)   //Si se muestra la tabla en pantalla
    // {
    //     return view("denuncias.reporte", compact('denuncias', 'dependencias'))->with('fecha_inicialR',$fecha_inicialR)->with('fecha_finalR',$fecha_finalR)->with('cve_dependenciaR', $cve_dependenciaR)->with('denunciaR', $denunciaR);
    // }
    // else  //Si se imprime la tabla
    // {
        // $pdf = PDF::loadView('denuncias.pdf',['denuncias'=>$arrDenuncias, 'tituloReporte'=>$tituloReporte]);
        // return $pdf->stream();
    // }
// }

// public function reporte(Request $request)
// { 
//     $fecha_inicial = now()->startOfDay();
//     $fecha_inicial->modify ('-7days');

//     $fecha_final = now()->endOfDay(); 

//     //Variables para que los parámetros de búsqueda se queden tal cual después del submit
//     $fecha_finalR = $fecha_final; 
//     $fecha_inicialR = $fecha_inicial; 
//     $cve_dependenciaR = -1;
//     $denunciaR = '';


//     $denuncias = Denuncia::select('denuncias.folio', 'denuncias.created_at', 'denuncias.nombre_denunciante', 'dependencias.dependencia', 'denuncias.denuncia');

//     if (is_null($request->fecha_inicial))  //Cuando se carga la página SÍ DEBE CARGAR (GET) LOS REGISTROS desde el principio
//     {
//         $denuncias = $denuncias->whereBetween('denuncias.created_at', [$fecha_inicial, $fecha_final]);
//         $denuncias = $denuncias->leftjoin('dependencias', 'denuncias.cve_dependencia', '=', 'dependencias.cve_dependencia')->get();
//     }

//     if (! is_null($request->fecha_inicial))   //Cuando se le da a FILTRAR NO SE CARGAN LOS REGISTROS hasta que se termina de formar el QUERY
//     {  
//         $denuncias = $denuncias->leftjoin('dependencias', 'denuncias.cve_dependencia', '=', 'dependencias.cve_dependencia');

//         $fecha_inicial = Carbon::createFromFormat('Y-m-d', $request->fecha_inicial)->startOfDay();
//         $fecha_final = Carbon::createFromFormat('Y-m-d', $request->fecha_final)->endOfDay();

//         $denuncias = $denuncias->whereBetween('denuncias.created_at', [$fecha_inicial, $fecha_final]);  

//         $cve_dependenciaR = $request->cve_dependencia;
//         $denunciaR = $request->denuncia;

//         if ($request->cve_dependencia != '-1')  //Cuando se selecciona una dependencia (incluso NINGUNA)
//         {
//             $denuncias = $denuncias->where('denuncias.cve_dependencia', $request->cve_dependencia);
//         }

//         if (! is_null($request->denunciante_denuncia))
//         {
//             $denuncia = $request->denunciante_denuncia;
//             $denunciaR = $denuncia;

//             $denuncias = $denuncias->where(function($query) use ($denuncia)
//             {
//                     $query->where('nombre_denunciante', 'like', '%' . $denuncia . '%');                        
                          
//             })
//             ->orWhere(function($query) use ($denuncia)
//             {
//                     $query->where('denuncia', 'like', '%' . $denuncia . '%');
//             });
//         }

//         $denuncias = $denuncias->get();      
        
//         $fecha_inicialR = Carbon::createFromFormat('Y-m-d',$request->fecha_inicial);
//         $fecha_finalR = Carbon::createFromFormat('Y-m-d', $request->fecha_final);          
//     }


//     $dependencias = DB::table('dependencias')
//     ->where('cve_dependencia', '>', 0)
//     ->orderBy('dependencia', 'asc')
//     ->get();   //Que no incluya NINGUNA pues es la opción por default

//     return view("denuncias.reporte", compact('denuncias', 'dependencias'))->with('fecha_inicialR',$fecha_inicialR)->with('fecha_finalR',$fecha_finalR)->with('cve_dependenciaR', $cve_dependenciaR)->with('denunciaR', $denunciaR);
// }

// public function pdf(Request $request)
// {       
//     $tituloReporte = $request->tituloReporte;

//     $fecha_inicial = Carbon::createFromFormat('Y-m-d', $request->fecha_inicial)->startOfDay();
//     $fecha_final = Carbon::createFromFormat('Y-m-d', $request->fecha_final)->endOfDay();

//     $denuncias = Denuncia::whereBetween('created_at', [$fecha_inicial, $fecha_final]); 

//     if ($request->cve_dependencia != '-1')  //Cuando se selecciona una dependencia (incluso NINGUNA)
//     {
//         $denuncias = $denuncias->where('cve_dependencia', $request->cve_dependencia);
//     }

//     if (! is_null($request->denunciante_denuncia))
//         {
//             $denuncia = $request->denunciante_denuncia;
//             $denuncias = $denuncias->where(function($query) use ($denuncia)
//             {
//                     $query->where('nombre_denunciante', 'like', '%' . $denuncia . '%');                        
                          
//             })
//             ->orWhere(function($query) use ($denuncia)
//             {
//                     $query->where('denuncia', 'like', '%' . $denuncia . '%');
//             });
//         }
   
//     $denuncias = $denuncias->get();  
    
//     $pdf = PDF::loadView('denuncias.pdf',['denuncias'=>$denuncias, 'tituloReporte'=>$tituloReporte]);
//     //return $pdf->download('SDC_');
//     //$pdf->setOptions(['isPhpEnabled', 'true']);

//     //$pdf->render();

//     return $pdf->stream();
// }



       

        //dd($request->all());
        //dd($request->input('fecha_final'));


