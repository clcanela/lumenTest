<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

/*$router->get('/', function () use ($router) {
    return $router->app->version();
});*/
$router->get('/', function () {
    return view('index', ['name' => 'James']);
});

$router->group(['prefix' => 'api'], function () use ($router) {
    $router->get('carburantes/update',  ['uses' => 'CarburantesController@fetchAndParseData']);
    $router->get('carburantes/estaciones[/{ord}]',  ['uses' => 'CarburantesController@listarEstaciones']);
    $router->post('carburantes/estaciones[/{ord}]',  ['uses' => 'CarburantesController@listarEstaciones']);
    $router->get('entidades/provincias',  ['uses' => 'SEPOMEXController@listarProvincias']);
    $router->get('entidades/municipios/{pid}',  ['uses' => 'SEPOMEXController@listarMunicipios']);
});
