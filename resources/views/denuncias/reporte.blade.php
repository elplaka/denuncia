@extends('layouts.main')

@php use Illuminate\Support\Str; @endphp

@section('content')
    <!-- Page Heading -->
    {{-- <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Usuarios</h1>
    </div> --}}

  <script language="JavaScript" type="text/javascript">
    $("#exampleModal").modal("show")
 </script>

  <script language="JavaScript" type="text/javascript">
    $(document).ready(function(){
        $('#btnAceptar').click(function(){
            var databack = $("#exampleModal #recipient-name").val().trim();   //Nombre del Reporte
            //$('#tituloReporte').html(databack);
            $('#tituloReporte').val(databack);

            //Abre el formulario con el PDF
            var f = document.getElementById("formReport");
            
            f.action = "{{ route('denuncias.crystalReports', '1') }}";
            //f.action = "{{ route('denuncias.pdfA', '$parray') }}";
          
            f.submit();   

            f.action = "{{ route('denuncias.crystalReports', '0') }}";

            // let url = "{{ route('denuncias.pdfA', '1') }}";
            // document.location.href=url;

         
            $('#exampleModal').modal('hide');    //Cierra la ventana modal
 
        });
    });    
</script> 

{{-- <script language="JavaScript" type="text/javascript">
$(document).ready(function() {
  $("#parent").click(function() {
    $(".child").prop("checked", this.checked);
  });

  $('.child').click(function() {
    if ($('.child:checked').length == $('.child').length) {
      $('#parent').prop('checked', true);
    } else {
      $('#parent').prop('checked', false);
    }
  });
});
</script> --}}

<style>
    .mi-input {
        font-size: 12px;
    }

    .mi-col {
        flex: 0 0 10%;
        max-width: 10%;
        margin-left: 12px;
        margin-right: 12px;
    }
</style>

{{-- ***********************************  Ventana MODAL  ************************************************* --}}
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><b>Opciones del Reporte</b></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"> &times; </button>
        </div>
            <div class="modal-body">
                <div class="mb-3">
                <label for="recipient-name" class="col-form-label">Título del Reporte</label>
                <input type="text" value="Reporte de Denuncias" class="form-control" id="recipient-name">
                </div>
                {{-- <div>
                    <input type="checkbox" id="groupBy"> Agrupar por DEPENDENCIAS
                </div> --}}
            </div>
            <div class="modal-footer">
                <button type="button" id="btnAceptar" type="submit" class="btn btn-success action-complete-task">Imprimir REPORTE</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            </div>
      </div>
    </div>
  </div>

    <div class="row-md-10">
        <div class="card mx-auto">
            <div>
                @if (session()->has('message'))
                <div class="alert alert-success">
                    
                    <button type="button" class="close" data-dismiss="alert">
                        &times;
                    </button>    
                    
                    {{ session()->get('message') }}
                </div>                
                @endif                
            </div>
            <div class="row justify-content-center mt-3">
                <h1 class="h3 mb-2 text-gray-800"> <b> {{ __('SISTEMA DE DENUNCIA CIUDADANA') }} </b> </h1>
            </div>
            <div class="row justify-content-center mb-3">
                <h1 class="h3 mb-0 text-gray-800"><b> Reporte de Denuncias </b></h1>
            </div>

            <div class="card-header" style="font-size: 12px;">
                <div class="row">
                    <div class="col">
                        <form id="formReport" method="GET" action="{{ route('denuncias.crystalReports', '0') }}">
                            {{-- <div class="form-row align-items-center"> --}}
                                {{-- <div id="tituloReporte" name="tituloReporte"> --}}
                                <div>    
                                    <input id="tituloReporte" name="tituloReporte" type="hidden"  value="" class="form-control" autocomplete="denunciante_denuncia" autofocus>
                                </div>
                                <div class="row">
                                    <div class="mi-col text-md-center">
                                        <label for="fecha_inicial"  class="col-form-label "><b>{{ __('Fecha Inicial') }}</b></label>        
                                            <input name="fecha_inicial" value="{{ old('fecha_inicial', $fecha_inicialR->format('Y-m-d')) }}" type="date" class="form-control mi-input" required autocomplete="fecha_inicial" autofocus>
                                    </div>
                                    <div class="mi-col text-md-center">
                                        <label for="fecha_final" class="col-form-label text-md-center"><b>{{ __('Fecha Final') }} </b></label>        
                                            <input name="fecha_final" value="{{ old('fecha_final', $fecha_finalR->format('Y-m-d')) }}" type="date" class="form-control mi-input" required autocomplete="fecha_final" autofocus>
                                    </div>
                                    <div class="col-md-3 text-md-center">
                                        <label for="dependencia" class="col-form-label text-md-center"> <b>{{ __('Dependencia') }} </b></label>  
                                        <select name="cve_dependencia" class="form-control mi-input" aria-label="Default select example">
                                            <option value="-1" selected>-- TODAS --</option>
                                            <option value='0' {{ $cve_dependenciaR == 0? 'selected' : '' }}> NINGUNA </option>
                                            @foreach ($dependencias as $dependencia)
                                                 <option value="{{ $dependencia->cve_dependencia }}"  {{ $dependencia->cve_dependencia == $cve_dependenciaR ? 'selected' : '' }}>  {{ $dependencia->dependencia }}</option>
                                            @endforeach                                            
                                          </select>
                                    </div>
                                    <div class="col-md-3 text-md-center">
                                        <label for="denunciante" class="col-form-label text-md-center"><b> {{ __('Hechos') }} </b></label>        
                                            <input name="hechos" type="text"  value="{{ old('hechos',$denunciaR) }}" class="form-control mi-input" autocomplete="hechos" autofocus>
                                    </div>
                                    <div class="mi-col text-md-center">
                                        <label for="status" class="col-form-label text-md-center"><b> {{ __('Status') }} </b></label>
                                            <select name="status" class="form-control mi-input" required aria-label="Default select example">
                                                <option value='1' {{ $statusR == '1' ? 'selected' : '' }}>RECIBIDA</option>
                                                <option value='2' {{ $statusR == '2' ? 'selected' : '' }}>TURNADA</option>
                                                <option value='3' {{ $statusR == '3' ? 'selected' : '' }}>RESUELTA</option>
                                                <option value='0' {{ $statusR == '0' ? 'selected' : '' }}>BAJA</option>
                                              </select>                                      
                                    </div>
                                    <div class="text-md-center">
                                        <div>
                                            <label class="col-form-label"> &nbsp; &nbsp; &nbsp; </label> <br>
                                            <label class="col-form-label text-md-right">&nbsp; &nbsp; &nbsp;</label>     
                                            <button type="submit" class="btn-sm btn-primary btn-icon" style="font-size:12px"> <i class="fas fa-filter"></i> Filtrar   </button>  
                                        </div>
                                    </div>
                                </div>    
                                <div class="row mt-2">
                                    <div>
                                        <label class="col-form-label text-md-right">&nbsp; &nbsp; &nbsp;</label>        
                                        <input name="groupBy" id="groupBy" type="checkbox" value="" {{ $groupByR == true ? 'checked' : '' }} autofocus> <label for="groupBy"> <b> Agrupar por DEPENDENCIAS </b></label> 
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>            
            </div>
        
            <div class="card-body p-2" style="font-size: 12px;">
                {{-- <table class="table-striped  table-bordered table-sm" style="display: block; height: 250px; overflow-y: auto;"> --}}
                <table class="table-striped  table-bordered table-sm">
                    <thead>
                    <tr>
                        <th scope="col" style="text-align:center;">Folio</th>
                        <th style="width:9%;" style="text-align:center;">Fecha Denuncia</th>
                        <th scope="col" style="text-align:center;">Nombre Denunciado</th>
                         <th scope="col" style="text-align:center;">Dependencia</th>
                         <th scope="col" style="text-align:center;">Cargo</th>
                        <th style="width:35%; text-align:center;">Denuncia</th>
                        @if (auth()->user()->usertype == 1)
                        <th scope="col" style="text-align:center;"></th>
                        @endif
                    </tr>
                    </thead>
                    {{-- <tbody style="height: 250px; overflow-y: auto"> --}}
                    <tbody>
                        @foreach ($denuncias as $denuncia)
                            <tr>
                                {{-- <th scope="row"><input type="checkbox" name="checkbox" id="checkbox" class="child"> {{ $denuncia->folio }}</th> --}}
                                <th scope="row"> {{ $denuncia->folio }}</th>
                                <td>{{ date('d-m-Y', strtotime($denuncia->created_at)) }}</td>
                                <td>{{ $denuncia->nombre_denunciado  }}</td>
                                <td>{{ $denuncia->dependencia->dependencia  }}</td>
                                <td>{{ $denuncia->cargo_denunciado  }}</td>
                                <td style="width:35%;">{{ implode(' ', array_slice(explode(' ', $denuncia->hechos), 0, 20)) . '...' }}</td>
                                <td style="text-align:center;">
                                    @if (auth()->user()->usertype == 1)
                                    {{-- <a href="{{ route('denuncias.editar', $denuncia->folio) }}" class="btn-sm btn-danger">
                                        <i class="fas fa-edit"></i> 
                                    </a> --}}
                                    <a href="{{ route('denuncias.editar', $denuncia->folio) }}" class="btn-sm btn-danger"><i class="fas fa-edit"></i></a>  
                                    @endif
                                    <a href="{{ route('denuncias.ver', $denuncia->folio) }}" class="btn-sm btn-success" style="margin-left: 1px;"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>                                   
                                </td>
                            </tr>                            
                        @endforeach 
                    </tbody>
                </table>
            </div>
            <div class="card-body p-2" style="font-size: 13px;">
            <!-- Links de paginación -->
            {{ $denuncias->appends($params)->links('pagination::bootstrap-4') }}  

            <p>Total de denuncias: <b> {{ $denuncias->total() }} </b></p>
            </div>
        </div>
        {{-- <div>
            <label class="col-form-label">&nbsp; &nbsp; &nbsp;</label>        
            <a class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">Imprimir</a>
        </div> --}}
    </div>  


      {{-- <div class="container">
        <br>
        <div class="row justify-content-md-center">
            <div class="col-lg-4">
                <input type="checkbox" id="parent"> Marcar/Desmarcar TODAS
            </div>
            <div class="col-md-auto">
                Cambiar estatus a:
            </div>
            <div class="col col-lg-4">
                <select name="status" class="form-control">
                    <option value='1' {{ $statusR == '1' ? 'selected' : '' }}>RECIBIDA</option>
                    <option value='2' {{ $statusR == '2' ? 'selected' : '' }}>REVISADA</option>
                    <option value='3' {{ $statusR == '3' ? 'selected' : '' }}>TURNADA</option>
                    <option value='4' {{ $statusR == '4' ? 'selected' : '' }}>ATENDIDA</option>
                    <option value='5' {{ $statusR == '5' ? 'selected' : '' }}>PENDIENTE DE RESOLUCIÓN</option>
                    <option value='6' {{ $statusR == '6' ? 'selected' : '' }}>RESUELTA</option>
                  </select>
            </div>
            <div>
            <label class="col-form-label">&nbsp; &nbsp; &nbsp;</label>        
                <a class="btn btn-success" data-toggle="modal">Aplicar</a>
            </div>
          </div>
      </div> --}}
    


@endsection