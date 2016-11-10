<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('laporan',  'LaporanController@index');
Route::get('dasboard',  'DasboardController@index');
Route::get('pokok',  'PokokController@index');
Route::get('jurnal_umum',  'JurnalController@jurnal_umum');
Route::post('cari_akun',  'JurnalController@cari_akun');
Route::post('jurnal_umum/submit',  'JurnalController@tampil_jurnal');