<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Dependencia;

class Denuncia extends Model
{
    use HasFactory;

    protected $primaryKey = 'folio';

    protected $fillable = [
        'nombre_denunciante',
        'telefono_denunciante',
        'domicilio_denunciante',
        'localidad_denunciante',
        'email_denunciante',
        'nombre_denunciado',
        'cve_dependencia',
        'cargo_denunciado',
        'hechos',
        'fecha_hechos',
        'lugar_hechos',
        'pruebas',
        'archivo_pruebas'
    ];

    public function dependencia()
    {
        return $this->belongsTo(Dependencia::class, 'cve_dependencia');
    }
}
