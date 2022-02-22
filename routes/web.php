<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes(['register' => false]);

Route::middleware('role:superadmin')->group(function () {
    Route::resource('/products', 'ProductController');
    Route::resource('/operators', 'OperatorController');
    Route::get('/transcation/history', 'TransactionController@history');
    Route::get('/transcation/edit/{id}', 'TransactionController@edit')->name('edit');
    Route::post('/transcation/update-tanggal/', 'TransactionController@updateTanggal')->name('update.tanggal');
});

Route::middleware('role:superadmin|kasir')->group(function () {
    Route::get('/home', 'HomeController@index')->name('home');
    Route::resource('/customer', 'CustomerController');
    //sorry kalau ada typo penggunaan bahasa inggris krn saya orang indonesia yang mencoba belajar b.inggris
    Route::get('/transcation', 'TransactionController@index');
    Route::post('/transcation/addproduct/{id}', 'TransactionController@addProductCart');
    Route::post('/transcation/removeproduct/{id}', 'TransactionController@removeProductCart');
    Route::post('/transcation/clear', 'TransactionController@clear');
    Route::post('/transcation/increasecart/{id}', 'TransactionController@increasecart');
    Route::post('/transcation/decreasecart/{id}', 'TransactionController@decreasecart');
    Route::post('/transcation/bayar', 'TransactionController@bayar');
    Route::get('/transcation/laporan/{id}', 'TransactionController@laporan')->name('laporan');
    Route::get('/transcation/cetak/laporan/{id}', 'TransactionController@cetakLaporan')->name('cetak.laporan');
});
