<?php

use App\Http\Controllers\admin\CartAdminController;
use App\Http\Controllers\MainController;
use App\Http\Controllers\admin\MainAdminController;
use App\Http\Controllers\admin\Phanquyen;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\admin\MenuAdminController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\UploadController;
use App\Http\Controllers\Admin\users\LoginController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProductController as ControllersProductController;
use App\Http\Controllers\ProductUserController;
use App\Http\Services\UploadService;
use Illuminate\Support\Facades\Route;
// use App\Http\Middleware\RoleMiddleware;

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


Route::get('/login',[LoginController::class,'index'])->name('login');
Route::post('/store',[LoginController::class, 'store']);

Route::get('logout',[Phanquyen::class,'getOut']);




Route::middleware(['auth'])->group(function(){  
Route::prefix('admin')->group(function(){
    Route::get('/',[MainAdminController::class, 'index'])->name('admin');
    Route::get('/main',[MainAdminController::class, 'index']);
    Route::prefix('menus')->group(function(){
         Route::get('add',[MenuAdminController::class,'create']);
         Route::post('add',[MenuAdminController::class,'store']);
         Route::get('list',[MenuAdminController::class,'index']);
         Route::get('edit/{menu}',[MenuAdminController::class,'show']); 
         Route::post('edit/{menu}',[MenuAdminController::class,'update']);
         Route::delete('destroy',[MenuAdminController::class,'destroy']);
    });

    Route::prefix('products')->group(function(){
        Route::get('add', [ProductController::class, 'create']);
        Route::post('add', [ProductController::class, 'store']);
        Route::get('list', [ProductController::class, 'index']);
        Route::get('edit/{product}', [ProductController::class, 'show']);
        Route::post('edit/{product}', [ProductController::class, 'update']);
        Route::DELETE('destroy', [ProductController::class, 'destroy']);
    });

    Route::post('upload/services',[UploadController::class,'store']);

    Route::get('customers',[CartAdminController::class,'index']);
    });
});
// Route::get('/',[MainController::class, 'index']);
Route::get('home',[MainController::class, 'index'])->name('home');
 
Route::post('/services/load-product', [MainController::class, 'loadProduct']);
Route::get('danh-muc/{id}-{slug}.html',[MenuController::class,'index']);
Route::get('san-pham/{id}-{slug}.html',[ProductUserController::class,'index']);
Route::post('add-cart',[CartController::class,'index']);
Route::get('carts',[CartController::class,'show']);
Route::post('update-cart',[CartController::class,'update']);
Route::get('carts/delete/{id}',[CartController::class,'remove']);
// Route::post('carts',[CartController::class,'addCart']);
Route::post('/carts', [CartController::class ,'addCart'])->name('process.payment');



// Route::middleware([
//     'auth:sanctum',
//     config('jetstream.auth_session'),
//     'verified',
// ])->group(function () {
//     Route::get('/home', function () {
//         return view('home');
//     })->name('home');
// });
