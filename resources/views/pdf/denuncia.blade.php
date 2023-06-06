<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title> Denuncia </title>
    
   {{-- <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet"> --}}

    <style>
    


    body {
        font-family: 'Montserrat', sans-serif;
        font-size: 10pt;
    }

     .bold-text {
        font-weight: 900;
    }




        /* Estilos para las tablas */
table {
  border: 1px solid #dee2e6;
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 1rem;
  background-color: #fff;
  color: #333;
}

table th,
table td {
  border: 1px solid #dee2e6;
  padding: .75rem;
  vertical-align: top;
  border-top: 1px solid #dee2e6;
}

table th {
  font-weight: 500;
  border-bottom: 2px solid #dee2e6;
  background-color: #e9ecef;
  text-align: inherit;
}

table tbody tr:nth-of-type(odd) {
  background-color: rgba(0,0,0,.05);
}

table td {
  text-align: left;
}

/* Estilos para los encabezados */
h1, h2, h3, h4, h5, h6 {
  margin-top: 0;
  margin-bottom: .5rem;
  font-family: Montserrat, sans-serif;
  font-weight: bold;
} 

/* Estilos para los párrafos */
p {
  margin-top: 0;
  margin-bottom: 1rem;
  font-family: Montserrat, sans-serif;
} 

/* Estilos para los enlaces */
a {
  color: #007bff;
  text-decoration: none;
  background-color: transparent;
}

a:hover {
  color: #0056b3;
  text-decoration: underline;
}

input {
  height: 0.75cm;
  line-height: 0.75cm;
  vertical-align: middle;
  margin-left: 0.25cm;
  border: none; /* quita el borde */
  background-color: #eeeeee; /* aplica el color de fondo deseado */
}

textarea{
  padding: 0.25cm;
  margin-left: 0.25cm;
  border: none; /* quita el borde */
  background-color: #eeeeee; /* aplica el color de fondo deseado */
}

label {
  display: inline-block;
  height: 0.75cm; /* o cualquier altura deseada */
  line-height: 0.75cm; /* igual a la altura */
  vertical-align: middle;
}

footer {
            position: fixed;
            bottom: -5cm;
            width: 100%;
            text-align: center;
        }
        

</style>
</head>

<body>
  <div>
    <div style="text-align: center;">
      <img src="{{'data:image/jpg;base64,'.base64_encode(file_get_contents(public_path('img/Logo_y_Escudo.jpg')))}}" width="50%"/>
      <label style="margin-left:1cm; margin-bottom:1.5cm"><h2> SISTEMA DE DENUNCIA CIUDADANA </h2></label>
    </div>
<div style="text-align: center;">
    <h1 class="bold-text">Datos de la Denuncia</h1>
</div>

    <hr>
    <br>
    <div>
        <label>{{ __('Folio') }}</label>
        <input value="{{ $denuncia->folio }}" style="width:1.25cm; text-align: center;font-weight: bold; margin-right:5.6cm" readonly>

        <label>{{ __('Fecha') }}</label>
        <input value="{{ $denuncia->created_at->format('d/m/Y') }}" style="width:3cm; text-align: center;font-weight: bold; margin-right:5.6cm" readonly>

        <label>{{ __('Status') }}</label>
        <input value="{{ $denuncia_status }}" style="width:3.75cm; text-indent:0.25cm; font-weight: bold;" readonly>
    </div>
    <br>
    <br>
    <div style="border: 1px solid #ccc; padding: 0.5cm; width: max-content;@if($denuncia->nombre_denunciante[0] === "-" && $denuncia->nombre_denunciante[strlen($denuncia->nombre_denunciante) - 1] === "-") display: none; @endif">
      <h2 style="text-align: center; margin-top: -35px; background-color: white; width: 4.5cm; ">Denunciante</h2>
      
      <div style="margin-bottom: 1%;">
        <label style="display: inline-block; width:17%; text-align:right">{{ __('Nombre') }}</label>
        <input value="{{ $denuncia->nombre_denunciante }}" style="width:62%; text-indent:0.25cm; font-weight: bold;" readonly>

        <label style="display: inline-block; width:4.9%; text-align:right">{{ __('Tel.') }}</label>
        <input value="{{ $denuncia->telefono_denunciante }}" style="width:12%; font-weight: bold; text-align: center;" readonly> 
      </div>

      <div style="margin-bottom: 1%;">
        <label style="display: inline-block; width:17%; text-align:right">{{ __('Domicilio') }}</label>
        <input value="{{ $denuncia->domicilio_denunciante }}" style="width:81%; text-indent:0.25cm; font-weight: bold;" readonly>
      </div>

      <div>
        <label style="display: inline-block; width:17%; text-align:right">{{ __('Localidad/Ciudad') }}</label>
        <input value="{{ $denuncia->localidad_denunciante }}" style="width:30%; text-indent:0.25cm; font-weight: bold;" readonly>

        <label style="display: inline-block; width:7%; text-align:right">{{ __('E-mail') }}</label>
        <input value="{{ $denuncia->email_denunciante }}" style="width:42.25%; text-indent:0.25cm; font-weight: bold;" readonly>
      </div>  
    </div>
    <div @if($denuncia->nombre_denunciante[0] == "-") style="display: block;" @else style="display: none;" @endif>
      <h2><b>{{ __('DENUNCIA ANÓNIMA') }}</b></h2> 
    </div>  
    <br>
    <br>
    <div style="border: 1px solid #ccc; padding: 0.5cm; width: max-content;">
      <h2 style="text-align: center; margin-top: -35px; background-color: white; width: 9cm;">Servidor Público Denunciado</h2>  
    
      <div style="margin-bottom: 1%;">
        <label style="display: inline-block; width: 17%; text-align: right;">{{ __('Nombre') }}</label>
        <input value="{{ $denuncia->nombre_denunciado }}" style="width: 81%; text-indent: 0.25cm; font-weight: bold;" readonly> 
      </div>  

      <div>
        <label style="display: inline-block; width:17%; text-align:right">{{ __('Dependencia') }}</label>
        <input value="{{ $denuncia->dependencia->dependencia }}" style="width:35%; text-indent:0.25cm; font-weight: bold;" readonly> 

        <label style="display: inline-block; width:7%; text-align:right">{{ __('Cargo') }}</label>
        <input value="{{ $denuncia->cargo_denunciado }}" style="width:37.25%; text-indent:0.25cm; font-weight: bold;" readonly> 
      </div>
    </div>
    <br>
    <br>
    <div style="border: 1px solid #ccc; padding: 0.5cm; width: max-content;">
      <h2 style="text-align: center; margin-top: -35px; background-color: white; width: 2.95cm;">Hechos</h2>
    
      <div style="margin-bottom: 0.25%;">
        <label style="display: inline-block; width: 17%; text-align: right; vertical-align: top; line-height: 1.2;">{{ __('¿Cómo ocurrieron?') }}</label>
          <textarea rows="10" style="width: 79%; font-weight: bold;">{{ $denuncia->hechos }}</textarea>
      </div>

      <div>
        <label style="display: inline-block; width: 17%; text-align: right;">{{ __('¿Cuándo ocurrieron?') }}</label>
        <input value="{{ date('d/m/Y', strtotime($denuncia->fecha_hechos)) }}" style="width:3cm; text-align: center;font-weight: bold;" readonly>
        <label style="display: inline-block; width:15%; text-align:right;">{{ __('¿Dónde ocurrieron?') }}</label>
        <input value="{{ $denuncia->lugar_hechos }}" style="width:50.5%; text-indent:0.25cm; font-weight: bold;" readonly>
      </div>
    </div>
    <br>
    <br>
    <div style="border: 1px solid #ccc; padding: 0.5cm; width: max-content;">
      <h2 style="text-align: center; margin-top: -35px; background-color: white; width: 2.95cm;">Pruebas</h2>
    
      <div style="margin-bottom: 0.25%;">
        <label style="display: inline-block; width: 17%; text-align: right; vertical-align: top; line-height: 1.2;">{{ __('Descripción') }}</label>
          <textarea rows="10" style="width: 79%; font-weight: bold;">{{ $denuncia->pruebas }}</textarea>
      </div>
    </div>
  </div>
  <br>
  <p style="font-size:8pt;text-align: right;">Fecha y hora de impresión: {{ $fechaImpresion }}</p>
</body>
</html>
