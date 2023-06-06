<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Denuncia;

class Dependencia extends Model
{
    use HasFactory;

    protected $primaryKey = 'cve_dependencia';

    public function denuncias()
    {
        return $this->hasMany(Denuncia::class);
    }
}
