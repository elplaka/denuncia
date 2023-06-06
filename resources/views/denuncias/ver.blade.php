@extends('layouts.main')

@section('content')
    
<style>
        .mi-input {
        font-size: 13px;
        font-weight: bold;
    }
</style>
    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center mx-auto">
                <div class="col-md-9">
                    <div>
                        @if (session()->has('message'))
                        <div class="alert alert-success">                        
                            <button type="button" class="close" data-dismiss="alert">
                                x
                            </button>                        
                            {{ session()->get('message') }}
                        </div>                
                        @endif                    
                    </div>
                    <div class="row justify-content-end mb-2">
                        <a href="{{ route('denuncias.crystalReports', '0') }}" class="float-right">Atrás</a>
                    </div>    
                    <div class="card" style="font-size: 13px;">
                        <div class="card-body">
                            <form method="POST" action="{{ route('denuncias.actualiza-status', $denuncia->folio) }}"> 
                                @csrf
                                <div class="row justify-content-center mb-3">
                                    <h1 class="h4 mb-2 text-gray-800"> <b> Datos de la Denuncia </b></h1>                                    
                                </div>

                                <div class="row mb-1">
                                    <label for="folio" class="col-md-2 col-form-label text-md-right">{{ __('Folio') }}</label>
                                    <div class="col-md-1">
                                        <input id="folio" type="text" class="form-control @error('folio') is-invalid @enderror mi-input" name="folio" value="{{ old('folio', $denuncia->folio ) }}"  autocomplete="folio" readonly style="background-color: rgb(245, 245, 245) !important; text-align: center;">
                                        @error('folio')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>            

                                    <label for="fecha_denuncia" class="col-md-1 col-form-label text-md-right">{{ __('Fecha') }}</label>
                                    <div class="col-md-2">
                                        <input id="fecha_denuncia" type="text" class="form-control @error('fecha_denuncia') is-invalid @enderror mi-input" name="fecha_denuncia" value="{{ old('fecha_denuncia', $denuncia->created_at->format('d/m/Y') ) }}"  autocomplete="fecha_denuncia" readonly style="background-color: rgb(245, 245, 245) !important; text-align: center;">
                                        @error('fecha_denuncia')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <label for="status" class="col-md-2 col-form-label text-md-right">{{ __('Status') }}</label>
                                    <div class="col-md-4">
                                        <select name="status" class="form-control mi-input" style="background-color: rgb(174, 236, 204) !important;" required aria-label="Default select example">
                                            <option value='1' class="mi-input" {{ $denuncia->status == '1' ? 'selected' : '' }}>RECIBIDA</option>
                                            <option value='2' class="mi-input" {{ $denuncia->status == '2' ? 'selected' : '' }}>TURNADA</option>
                                            <option value='3' class="mi-input" {{ $denuncia->status == '3' ? 'selected' : '' }}>RESUELTA</option>
                                            <option value='0' class="mi-input" {{ $denuncia->status == '0' ? 'selected' : '' }}>BAJA</option>
                                        </select>
                                    
                                        @error('cve_dependencia')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    
                                </div>
                                <br>
                                <div class="row mb-2" @if($denuncia->nombre_denunciante[0] === "-" && $denuncia->nombre_denunciante[strlen($denuncia->nombre_denunciante) - 1] === "-") style="display: none;" @endif>
                                    <label class="h5 col-md-4 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i> {{ __('Denunciante') }} </b></label>
                                </div>
                                <div class="row mb-2" @if($denuncia->nombre_denunciante[0] === "-" && $denuncia->nombre_denunciante[strlen($denuncia->nombre_denunciante) - 1] === "-") style="display: none;" @endif>
                                    <label for="nombre_denunciante" class="col-md-2 col-form-label text-md-right">{{ __('Nombre') }}</label>
        
                                    <div class="col-md-7">
                                        <input id="nombre_denunciante" type="text" class="form-control @error('nombre_denunciante') is-invalid @enderror mi-input" name="nombre_denunciante" value="{{ old('nombre_denunciante', $denuncia->nombre_denunciante ) }}"  autocomplete="nombre_denunciante" style="background-color: rgb(245, 245, 245) !important;">
                                        @error('nombre_denunciante')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                     
                                    <label for="telefono_denunciante" class="col-md-1 col-form-label text-md-right">{{ __('Tel.') }}</label>
        
                                    <div class="col-md-2">
                                        <input id="telefono_denunciante" type="text" class="form-control @error('telefono_denunciante') is-invalid @enderror mi-input" name="telefono_denunciante" value="{{ old('telefono_denunciante', $denuncia->telefono_denunciante ) }}"  autocomplete="telefono_denunciante" style="background-color: rgb(245, 245, 245) !important;">
                                        @error('telefono_denunciante')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="row mb-2" @if($denuncia->nombre_denunciante[0] === "-" && $denuncia->nombre_denunciante[strlen($denuncia->nombre_denunciante) - 1] === "-") style="display: none;" @endif>
                                    <label for="domicilio_denunciante" class="col-md-2 col-form-label text-md-right">{{ __('Domicilio') }}</label>
        
                                    <div class="col-md-10">
                                        <input id="domicilio_denunciante" type="text" class="form-control @error('domicilio_denunciante') is-invalid @enderror mi-input" name="domicilio_denunciante" value="{{ old('domicilio_denunciante', $denuncia->domicilio_denunciante ) }}"  autocomplete="domicilio_denunciante" style="background-color: rgb(245, 245, 245) !important;">
                                        @error('domicilio_denunciante')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div> 
                                
                                <div class="row mb-3" @if($denuncia->nombre_denunciante[0] === "-" && $denuncia->nombre_denunciante[strlen($denuncia->nombre_denunciante) - 1] === "-") style="display: none;" @endif>
                                    <label for="localidad_denunciante" class="col-md-2 col-form-label text-md-right">{{ __('Localidad/Ciudad') }}</label>
        
                                    <div class="col-md-4">
                                        <input id="localidad_denunciante" type="text" class="form-control @error('localidad_denunciante') is-invalid @enderror mi-input" name="localidad_denunciante" value="{{ old('localidad_denunciante', $denuncia->localidad_denunciante ) }}"  autocomplete="localidad_denunciante" readonly style="background-color: rgb(245, 245, 245) !important;">
        
                                        @error('localidad_denunciante')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <label for="email_denunciante" class="col-md-1 col-form-label text-md-right">{{ __('E-mail') }}</label>
        
                                    <div class="col-md-5">
                                        <input id="email_denunciante" type="text" class="form-control @error('email_denunciante') is-invalid @enderror mi-input" name="email_denunciante" value="{{ old('email_denunciante', $denuncia->email_denunciante ) }}"  autocomplete="email_denunciante" readonly style="background-color: rgb(245, 245, 245) !important;">
        
                                        @error('email_denunciante')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div @if($denuncia->nombre_denunciante[0] === "-") style="display: block;" @else style="display: none;" @endif>
                                    <label class="h5 text-white bg-danger"><b>{{ __('DENUNCIA ANÓNIMA') }}</b></label>
                                </div>
                                
                                <br>
                                <div class="row mb-2">
                                    <label class="h5 col-md-6 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i> {{ __('Servidor Público Denunciado') }} </b></label>
                                </div>
                                <div class="row mb-2">
                                    <label for="nombre_denunciado" class="col-md-2 col-form-label text-md-right">{{ __('Nombre') }}</label>
        
                                    <div class="col-md-10">
                                        <input id="nombre_denunciado" type="text" class="form-control @error('nombre_denunciado') is-invalid @enderror mi-input" name="nombre_denunciado" value="{{ old('nombre_denunciado', $denuncia->nombre_denunciado ) }}"  autocomplete="nombre_denunciado" readonly style="background-color: rgb(245, 245, 245) !important;">
                                        @error('nombre_denunciado')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>       
        
                                </div>

                                <div class="row mb-2">
                                    <label for="cve_dependencia" class="col-md-2 col-form-label text-md-right">{{ __('Dependencia') }}</label>
        
                                    <div class="col-md-5">
                                        <select name="cve_dependencia" class="form-control mi-input" required aria-label="Default select example" disabled style="background-color: rgb(245, 245, 245) !important;">
                                            <option value="0" selected> NINGUNA </option>
                                            @foreach ($dependencias as $dependencia)
                                                 <option value="{{ $dependencia->cve_dependencia }}" {{ $dependencia->cve_dependencia == $denuncia->cve_dependencia ? 'selected' : '' }}>{{ $dependencia->dependencia }}</option>
                                            @endforeach
                                          </select>
        
                                        @error('cve_dependencia')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <label for="cargo_denunciado" class="col-md-1 col-form-label text-md-right">{{ __('Cargo') }}</label>
        
                                    <div class="col-md-4">
                                        <input id="cargo_denunciado" type="text" class="form-control @error('cargo_denunciado') is-invalid @enderror mi-input" name="cargo_denunciado" value="{{ old('cargo_denunciado', $denuncia->cargo_denunciado ) }}"  autocomplete="cargo_denunciado" readonly style="background-color: rgb(245, 245, 245) !important;">
        
                                        @error('cargo_denunciado')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <br>
                                <div class="row mb-2">
                                    <label class="h5 col-md-6 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i> {{ __('Hechos') }} </b></label>
                                </div>
                                
                                <div class="row mb-0">
                                    <label for="hechos" class="col-md-2 col-form-label text-md-right">{{ __('¿Cómo ocurrieron?') }}</label>
        
                                    <div class="col-md-10">
                                        <textarea id="hechos" rows=5 class="form-control @error('hechos') is-invalid @enderror mi-input" name="hechos" required autocomplete="hechos" readonly style="background-color: rgb(245, 245, 245) !important;">{{ old('hechos', $denuncia->hechos) }}</textarea>
        
                                        @error('hechos')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div> 

                                <div class="row mb-3 d-flex align-items-center">
                                    <label for="fecha_hechos" class="col-md-2 col-form-label text-md-right">{{ __('¿Cuándo ocurrieron?') }}</label>
                                    <div class="col-md-2">
                                        <input id="fecha_hechos" type="text" class="form-control @error('fecha_hechos') is-invalid @enderror mi-input" name="fecha_hechos" value="{{ old('fecha_hechos', $denuncia->created_at->format('d/m/Y') ) }}"  autocomplete="fecha_hechos" readonly style="background-color: rgb(245, 245, 245) !important; text-align: center;">
                                        @error('fecha_hechos')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <label for="lugar_hechos" class="col-md-2 col-form-label text-md-right">{{ __('¿Dónde ocurrieron?') }}</label>
                                    <div class="col-md-6">
                                        <input id="lugar_hechos" type="text" class="form-control @error('lugar_hechos') is-invalid @enderror mi-input" name="lugar_hechos" value="{{ old('lugar_hechos', $denuncia->lugar_hechos ) }}"  autocomplete="lugar_hechos" readonly style="background-color: rgb(245, 245, 245) !important;">
                                        @error('lugar_hechos')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <br>
                                <div class="row mb-2">
                                    <label class="h5 col-md-6 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i> {{ __('Pruebas') }} </b></label>
                                </div>

                                <div class="row mb-1">
                                    <label for="pruebas" class="col-md-2 col-form-label text-md-right">{{ __('Descripción') }}</label>
        
                                    <div class="col-md-10">
                                        <textarea id="pruebas" rows=5 class="form-control @error('pruebas') is-invalid @enderror mi-input" name="pruebas" required autocomplete="pruebas" readonly style="background-color: rgb(245, 245, 245) !important;">{{ old('pruebas', $denuncia->pruebas) }}</textarea>
        
                                        @error('pruebas')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>  

                                <div class="row mb-3 d-flex align-items-center">
                                    <label for="archivo_pruebas" class="col-md-2 col-form-label text-md-right">{{ __('Archivo') }}</label>
                                    <div class="col-md-5">
                                        @if ($denuncia->archivo_pruebas == "N/A")
                                        <input type="text" class="form-control mi-input" value="Sin Archivo" readonly style="background-color: rgb(245, 245, 245) !important;">
                                        @else
                                        <a href="{{ route('descargar-archivo', $denuncia->archivo_pruebas) }}"  target="_blank">
                                            <i class="fa-solid fa-download"></i> {{ $denuncia->archivo_pruebas }}
                                        </a>
                                        @endif
                                    </div>
                                </div>
                                <div class="row mb-0 justify-content-end mr-1">
                                    <div class="text-md-end">
                                        <button type="submit" class="btn-sm btn-primary"><i class="fa-solid fa-thumbs-up"></i>{{ __(' Actualizar') }}</button>                                        
                                        <a href="{{ route('denuncia-pdf', $denuncia->folio) }}" class="btn-sm btn-danger" style="height: 50px; padding: 8px; text-decoration: none;">
                                            <i class="fa-solid fa-print"></i>{{ __(' Imprimir') }}
                                          </a>
                                          
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <script src="{{ asset('js/jquery.js') }}"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="{{ mix('js/app.js') }}"></script>

    <!-- Custom scripts for all pages-->
    <script src="{{ asset('js/sb-admin.min.js') }}"></script>
@endsection