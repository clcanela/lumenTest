<?php


namespace App;

/**
 * Class Estacion
 * Extiende de Eloquent para el manejo de la entidad a DB por medio de sus campos en la tabla definida
 * @package App
 */
class Estacion extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'estaciones';
}
