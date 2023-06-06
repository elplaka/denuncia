<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
    
        <title>Sistema de Denuncia Ciudadana :: Gobierno del Municipio de CONCORDIA</title>
    
      <!-- Custom fonts for this template-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
  
      <!-- Custom styles for this template-->    <link href="{{ asset('css/sb-admin.min.css')}}" rel="stylesheet">    
  
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    {{-- <div>
                        @if (session()->has('message'))
                        <div class="alert alert-success">                        
                            <button type="button" class="close" data-dismiss="alert">
                                &times;
                            </button>                        
                            {{ session()->get('message') }}
                        </div>                
                    @endif                  
                    </div> --}}
                    <div class="row justify-content-center mb-4">
                        <img src="img/Logo_y_Escudo.jpg" alt="Por tiempos mejores" style="width:50%">
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <form id="tuFormulario" method="POST" action="{{ route('agregaInfo') }}" enctype="multipart/form-data">
                                @csrf
                                <div class="row justify-content-center mb-1">
                                    <h3 class="h3 mb-2 text-gray-800"> <b> {{ __('SISTEMA DE DENUNCIA CIUDADANA') }} </b> </h3>
                                </div>
                                <div class="row justify-content-center mb-3">
                                    <h1 class="h2 mb-0 text-gray-800"> <b> Captura de Denuncia </b></h1>
                                </div>
                                <br>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="denuncia_anonima" name="denuncia_anonima" onclick="mostrarOcultar()"
                                                {{ session('denuncia_anonima') ? 'checked' : '' }}>
                                            <label class="form-check-label text-gray-800" for="denuncia_anonima"
                                                style="font-size:17px; font-weight:bold">DENUNCIA ANÓNIMA</label>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_nombre_denunciante">
                                    <div class="row mb-3">
                                        <label class="h4 col-md-4 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i> {{ __('Denunciante') }} </b></label>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="nombre_denunciante" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Nombre') }}</label>
                                        <div class="col-md-8">
                                            <input id="nombre_denunciante" type="text" class="form-control @error('nombre_denunciante') is-invalid @enderror" name="nombre_denunciante"  @if(old('nombre_denunciante') !== '-') 
                                            value="{{ old('nombre_denunciante') }}"
                                             @endif  autocomplete="nombre_denunciante" required autofocus>
            
                                            @error('nombre_denunciante')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="telefono_denunciante" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Teléfono') }}</label>
            
                                        <div class="col-md-8">
                                            <input id="telefono_denunciante" type="text" class="form-control @error('telefono_denunciante') is-invalid @enderror" name="telefono_denunciante"  @if(old('telefono_denunciante') !== '9999999999') 
                                            value="{{ old('telefono_denunciante') }}"
                                             @endif  autocomplete="telefono_denunciante" required autofocus>
            
                                            @error('telefono_denunciante')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div> 

                                    <div class="row mb-3">
                                        <label for="email_denunciante" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('E-mail') }}</label>
            
                                        <div class="col-md-8">
                                            <input id="email_denunciante" type="email" class="form-control @error('email_denunciante') is-invalid @enderror" name="email_denunciante" @if(old('email_denunciante') !== 'anonimo@concordia.gob.mx') 
                                            value="{{ old('email_denunciante') }}"
                                             @endif  autocomplete="email_denunciante" autofocus>
            
                                            @error('email_denunciante')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>l
                                            @enderror
                                        </div>
                                    </div> 
                                    
                                    <div class="row mb-3">
                                        <label for="domicilio_denunciante" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Domicilio') }}</label>
            
                                        <div class="col-md-8">
                                            <input id="domicilio_denunciante" type="text" class="form-control @error('domicilio_denunciante') is-invalid @enderror" name="domicilio_denunciante" @if(old('domicilio_denunciante') !== '-') value="{{ old('domicilio_denunciante') }}"
                                             @endif autocomplete="domicilio_denunciante" autofocus>
            
                                            @error('domicilio_denunciante')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>  

                                    <div class="row mb-3">
                                        <label for="localidad_denunciante" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Localidad/Ciudad') }}</label>
            
                                        <div class="col-md-8">
                                            <input id="localidad_denunciante" type="text" class="form-control @error('localidad_denunciante') is-invalid @enderror" name="localidad_denunciante" @if(old('localidad_denunciante') !== '-')  value="{{ old('localidad_denunciante') }}"
                                             @endif  autocomplete="localidad_denunciante" autofocus>
            
                                            @error('localidad_denunciante')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>  

                                <script>
                                window.onload = function() {
                                    mostrarOcultar(); // Ejecutar la función una vez que la página se haya cargado completamente
                                };
                                    function mostrarOcultar() {
                                    var divNombreDenunciante = document.getElementById("div_nombre_denunciante");
                                    var inputNombreDenunciante = document.getElementById("nombre_denunciante");
                                    var inputTelefonoDenunciante = document.getElementById("telefono_denunciante");
                                    var inputEmailDenunciante = document.getElementById("email_denunciante");
                                    var inputDomicilioDenunciante = document.getElementById("domicilio_denunciante");
                                    var inputLocalidadDenunciante = document.getElementById("localidad_denunciante");

                                    if (document.getElementById("denuncia_anonima").checked) {
                                        divNombreDenunciante.style.display = "none";
                                        inputNombreDenunciante.value = "-";
                                        inputTelefonoDenunciante.value = "9999999999";
                                        inputEmailDenunciante.value = "anonimo@concordia.gob.mx";
                                        inputDomicilioDenunciante.value = "-";
                                        inputLocalidadDenunciante.value = "-";
                                    } else {
                                        divNombreDenunciante.style.display = "block";
                                        inputNombreDenunciante.value = "";
                                        inputTelefonoDenunciante.value = "";
                                        inputEmailDenunciante.value = "";
                                        inputDomicilioDenunciante.value = "";
                                        inputLocalidadDenunciante.value = "";
                                    }
                                }

                                </script>

                                <br>
                                <div class="row mb-3">
                                    <label class="h4 col-md-8 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i>{{ __(' Servidor Público Denunciado') }} </b></label>
                                </div>

                                <div class="row mb-3">
                                    <label for="nombre_denunciante" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Nombre') }}</label>
        
                                    <div class="col-md-8">
                                        <input id="nombre_denunciado" type="text" class="form-control @error('nombre_denunciado') is-invalid @enderror" name="nombre_denunciado" value="{{ old('nombre_denunciado') }}"  autocomplete="nombre_denunciado" autofocus>
        
                                        @error('nombre_denunciado')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                 
                                <div class="row mb-3">
                                    <label for="cve_dependencia" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Dependencia') }}</label>
        
                                    <div class="col-md-8">
                                        <select name="cve_dependencia" class="form-control" aria-label="Default select example">
                                            <option value="0" selected>-- Selecciona una dependencia --</option>
                                            @foreach ($dependencias as $dependencia)
                                                 <option value="{{ $dependencia->cve_dependencia }}"  @if((old('cve_dependencia'))  == $dependencia->cve_dependencia) selected="selected" @endif>{{ $dependencia->dependencia }}</option>
                                            @endforeach
                                          </select>
        
                                        @error('cve_dependencia')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="cargo_denunciado" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Cargo') }} </label>
        
                                    <div class="col-md-8">
                                        <input id="cargo_denunciado" type="text" class="form-control @error('cargo_denunciado') is-invalid @enderror" name="cargo_denunciado" value="{{ old('cargo_denunciado') }}"  autocomplete="cargo_denunciado"  autofocus>
        
                                        @error('cargo_denunciado')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <br>
                                <div class="row mb-3">
                                    <label class="h4 col-md-8 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i>{{ __(' Hechos') }} </b></label>
                                </div>

                                <div class="row mb-3">
                                    <label for="hechos" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('¿Cómo ocurrieron?') }}</label>
        
                                    <div class="col-md-8">
                                        <textarea id="hechos" rows=5 type="text" class="form-control @error('hechos') is-invalid @enderror" name="hechos" required autocomplete="hechos" autofocus> {{ old('hechos') }}</textarea>
        
                                        @error('hechos')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div> 

                                <div class="row mb-3">
                                    <label for="fecha_hechos" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('¿Cuándo ocurrieron?') }}</label>
        
                                    <div class="col-md-8">
                                        <input id="fecha_hechos" type="date" class="form-control @error('fecha_hechos') is-invalid @enderror" name="fecha_hechos" value="{{ old('fecha_hechos') }}"  autocomplete="fecha_hechos" required autofocus>
        
                                        @error('fecha_hechos')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="lugar_hechos" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('¿Dónde ocurrieron') }}</label>
        
                                    <div class="col-md-8">
                                        <input id="lugar_hechos" type="text" class="form-control @error('lugar_hechos') is-invalid @enderror" name="lugar_hechos" value="{{ old('lugar_hechos') }}"  autocomplete="lugar_hechos" required autofocus>
        
                                        @error('lugar_hechos')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>

                                <br>
                                <div class="row mb-3">
                                    <label class="h4 col-md-8 text-gray-800"><b> <i class="fa-solid fa-caret-right"></i>{{ __(' Pruebas') }} </b></label>
                                </div>
                                
                                <div class="row mb-3">
                                    <label for="pruebas" class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Descripción') }}</label>
        
                                    <div class="col-md-8">
                                        <textarea id="pruebas" rows=5 type="text" class="form-control @error('pruebas') is-invalid @enderror" name="pruebas" required autocomplete="pruebas" autofocus> {{ old('pruebas') }}</textarea>
        
                                        @error('pruebas')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div> 
                                
                                <div class="row mb-n2">
                                    <label class="col-md-3 col-form-label text-md-right" style="font-size:14px; font-weight:bold">{{ __('Archivo') }}</label></label>
                                    <div class="col-md-7">
                                        <input style="width:100%;font-size:15px;" type="file" id="archivo_pruebas" name="archivo_pruebas" accept=".png, .jpg, .jpeg, .pdf"> 
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label text-md-right"></label>
                                    <label class="col-md-7 col-form-label text-md-left" style="font-size:12px;">{{ __('* El archivo no debe exceder los 2M. Puede ser en cualquiera de los siguientes formatos: .png, .jpg, .jpeg, .pdf') }}</label>                                    
                                </div>
                                                          

                                <div class="row mb-n3">
                                    <div class="col-md-7 offset-md-4 text-md-right">
                                        <button type="submit" class="btn btn-primary">
                                            {{ __('Enviar') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-11 text-md-center"  style="font-size:12px;">
                            &copy; Por tiempos mejores :: Gobierno Municipal de Concordia
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
</body>
</html>