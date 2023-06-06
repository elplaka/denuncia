<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Denuncia;
use Carbon\Carbon;


use Barryvdh\Snappy\Facades\SnappyPdf;

class PdfController extends Controller
{
    public function denuncia_pdf($folio)
    {
        $fechaImpresion = Carbon::now()->format('d/m/Y H:i:s');

        $denuncia = Denuncia::where('folio', '=', $folio)->first();

        switch ($denuncia->status)
        {
            case 0:
                $denuncia_status = "BAJA";
                break;
            case 1:
                $denuncia_status = "RECIBIDA";
                break;
            case 2:
                $denuncia_status = "TURNADA";
                break;
            case 3:
                $denuncia_status = "RESUELTA";
                break;
        }

        $pdf = SnappyPdf::loadView('pdf.denuncia', compact('denuncia', 'denuncia_status', 'fechaImpresion'))
    ->setOption('page-size', 'Letter');
    
        return new Response(
            $pdf->output(),
            200,
            array(
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => 'inline; filename="archivo.pdf"'
            )
        );
    }
}
