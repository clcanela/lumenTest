<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class SEPOMEXController
 * Catalogos de provincias y municipios
 * @package App\Http\Controllers
 */
class SEPOMEXController extends Controller
{
    /**
     * Metodo para el endpoint entidades/provincias
     * devuelve todas las provincias y su ID
     * @return \Illuminate\Http\JsonResponse
     */
    public function listarProvincias()
    {
        $edos = DB::select('select distinct(id_provincia),provincia FROM entidades ORDER BY provincia ASC');
        return response()->json($edos);
    }

    /**
     * Metodo para el endpoint entidades/municipios/{pid}
     * devuelve todos los municipios correspondientes al ID de provincia recibido en la ruta
     * @param $pid
     * @return \Illuminate\Http\JsonResponse
     */
    public function listarMunicipios($pid)
    {
        $munis = DB::select('select distinct(id_municipio),municipio FROM entidades WHERE id_provincia = :pid ORDER BY municipio ASC', ['pid' => $pid]);
        return response()->json($munis);
    }
}
