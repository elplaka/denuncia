<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
    
        <title>Sistema de Denuncia Ciudadana :: Gobierno del Municipio de CONCORDIA</title>
    
        <!-- Custom fonts for this template-->
        {{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">  --}}
    
        <!-- Custom styles for this template-->
        <link href="{{ public_path('css/sb-admin.min.pdf.css')}}" rel="stylesheet" type="text/css">  
        <style>
            /** Define the margins of your page **/
            /* @page {
                margin: 100px 25px;
            } */

                @page{
                margin-top: 100px;
                margin-bottom: 10px;
                }

            header {
                position: fixed;
                top: -60px;
                left: 0px;
                right: 0px;
            }

            html body {
                padding-top: 20px;
            }
        </style>           

</head>
<body>
    <script type="text/php">
        if ( isset($pdf) ) {
            $pdf->page_script('
                $font = $fontMetrics->get_font("Montserrat, Helvetica, sans-serif", "normal");
                $pdf->text(270, 820, "Página $PAGE_NUM de $PAGE_COUNT", $font, 7, array(0,0,0));                
            ');
        }
    </script>


    <header>
     <div>
        <h2 class="h3 text-gray-800" style="text-align:center;"> <b> {{ __('GOBIERNO DEL MUNICIPIO DE CONCORDIA 2021-2024') }} </b> </h1>
    </div>
    <div>
            <h1 class="h3 text-gray-800" style="text-align:center;"> <b> {{ __('SISTEMA DE DENUNCIA CIUDADANA') }} </b> </h1>
    </div>
    <div>
            <h1 class="h3 text-gray-800" style="text-align:center;"><b>{{ $tituloReporte }} </b></h1>
    </div>
</header>

    <div class="row">
        <div class="row card-body">
            <table class="table overflow-scroll table-striped table-bordered table-sm">
                <thead>
                <tr>
                    <th scope="col" style="text-align:center;">Folio</th>
                    <th scope="col" style="text-align:center;">Fecha Denuncia</th>
                    <th scope="col" style="text-align:center;">Nombre Denunciante</th>
                    <th scope="col" style="text-align:center;">Localidad Denunciante</th>
                    <th scope="col" style="text-align:center;">Dependencia</th>
                    <th scope="col" style="text-align:center;">Denuncia</th>
                </tr>
                </thead>
                <?php 
                    $salto = false;
                ?>
                @if ($groupBy == true)
                    <?php 
                        $iniDependencia = -9;
                        $actDependencia = $iniDependencia;
                    ?>
                @endif   
                <tbody>
                    @foreach ($denuncias as $denuncia)
                        @if ($groupBy == true)
                            @if ($iniDependencia == -9)
                                <?php
                                    $iniDependencia = $denuncia->cve_dependencia;
                                    $actDependencia = $iniDependencia;
                                ?>
                            @elseif ($actDependencia != $denuncia->cve_dependencia) 
                                <?php $actDependencia = $denuncia->cve_dependencia; 
                                    $salto = true;
                                ?>
                            @endif
                        @endif  
                        @if ($salto == true)   
                            <tr style="page-break-after:always">
                                <td style="display:none">                                 
                                <?php $actDependencia = $denuncia->cve_dependencia; 
                                    $salto = false;
                                ?>     
                                </td>
                            </tr>                         
                        @endif     
                        <tr>
                            <th scope="row" style="vertical-align:middle;">{{ $denuncia->folio }}</th>
                            <td style="vertical-align:middle;">{{ date('d-m-Y', strtotime($denuncia->created_at)) }}</td>
                            <td style="vertical-align:middle;">{{ $denuncia->nombre_denunciante }}</td>
                            <td style="vertical-align:middle;">{{ $denuncia->localidad_denunciante }}</td>
                            <td style="vertical-align:middle;">{{ $denuncia->dependencia->dependencia }}</td>
                            <td style="vertical-align:middle;">{{ $denuncia->denuncia }}</td>
                         </tr>                     
                    @endforeach 
                </tbody>
            </table>  
            {{-- <div style="page-break-after:always">        
            </div>                --}}
        </div>                
    </div>
    

</body>