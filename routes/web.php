<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\DenunciaController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\PdfController;
use App\Http\Middleware\ChecaTipoUsuario;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/reporte', [DenunciaController::class, 'reporte'])->name('denuncias.reporte');
Route::get('/', [App\Http\Controllers\Auth\LoginController::class, 'showLoginForm'])->name('login');
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->middleware('auth')->name('home');


Route::get('/formulario', function () {
    $dependencias = DB::table('dependencias')
    ->where('cve_dependencia', '>', 0)
    ->orderBy('dependencia', 'asc')
    ->get();

    return view('denuncias.formulario',compact('dependencias'));
});

Auth::routes();
Route::any('/register',[HomeController::class, 'index']); //Para evitar que se autorregistren

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::resource('usuarios', UsuarioController::class)->middleware('auth');

Route::post('/formulario', [DenunciaController::class, 'agregaInfo'])->name('agregaInfo');
Route::get('/formulario', [DenunciaController::class, 'formulario'])->name('formulario');

Route::get('/denuncia_enviada', function () {
    return view('denuncias.denuncia_enviada');
})->name('denuncia_enviada')->middleware('checkDenunciaGuardada');

Route::get('/pdf', [DenunciaController::class, 'pdf'])->name('denuncias.pdf')->middleware('auth');

Route::get('/pdfA/{bandera}', [DenunciaController::class, 'pdfA'])->name('denuncias.pdfA')->middleware('auth');

Route::get('/crystalReports/{docPDF}', [DenunciaController::class, 'crystalReports'])->name('denuncias.crystalReports')->middleware('auth');



Route::get('/edit/{folio}', [DenunciaController::class, 'editar'])->name('denuncias.editar')->middleware('auth');
Route::get('/ver/{folio}', [DenunciaController::class, 'ver'])->name('denuncias.ver')->middleware('auth');
Route::get('/descargar-archivo/{archivo_pruebas}', [DenunciaController::class,'descargarArchivo'])->name('descargar-archivo')->middleware('auth');
Route::get('/denuncia-pdf/{folio}', [PdfController::class, 'denuncia_pdf'])->name('denuncia-pdf')->middleware('auth');


Route::post('/actualiza/{folio}', [DenunciaController::class, 'actualiza'])->name('denuncias.actualiza')->middleware('auth');
Route::post('/actualiza_status/{folio}', [DenunciaController::class, 'actualizaStatus'])->name('denuncias.actualiza-status')->middleware('auth');


//MIDDLEWARE QUE FUNCIONÓ
//Route::get('/edit/{folio}', [DenunciaController::class, 'editar'])->name('denuncias.editar')->middleware(ChecaTipoUsuario::class);

// Route::group(['middleware' => DenunciaController::class], function () {
//     Route::get('/edit/{folio}', [DenunciaController::class, 'editar']);
// });


// Route::get('/reporte', function () {
//     $denuncias = DB::table('denuncias')
//     ->orderBy('folio', 'asc')
//     ->get(); 

//     return view('denuncias.reporte',compact('denuncias'));
// });

// Route::get('/', function () {
//     return view('home');
// });




