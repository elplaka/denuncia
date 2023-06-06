<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Session;

class CheckDenunciaGuardada
{
    public function handle($request, Closure $next)
    {
        if (Session::get('denuncia_enviada') === true) {
            Session::forget('denuncia_enviada');
            return $next($request);
        }
        
        return redirect()->route('formulario');
    }
}
