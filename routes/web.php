<?php

use App\Http\Controllers\Controller;
use App\Http\Controllers\UserSectorController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [Controller::class, 'showForm'])->name('form');

Route::post('/user_sector', [UserSectorController::class, 'store'])->name('user_sector.store');
Route::put('/user_sector', [UserSectorController::class, 'update'])->name('user_sector.update');

