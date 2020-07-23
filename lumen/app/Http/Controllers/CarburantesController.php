<?php


namespace App\Http\Controllers;


use App\Estacion;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class CarburantesController
 * Se encarga de obtener y almacenar todos los datos devueltos por el servicio de carburantes de minetur.gob.es
 * @package App\Http\Controllers
 */
class CarburantesController extends Controller
{
    /**
     * Metodo para el endpoint carburantes/update
     * Consulta las estaciones maritimas y reemplaza la informacion existente en DB con la que obtiene actualizada del servicio
     * @throws \Exception
     */
    public function fetchAndParseData()
    {
        //consultamos servicio con CURL
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/PostesMaritimos/");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);
        if (empty($output)) {
            throw new \Exception("Servicio minetur no disponbile");
        }
        $data = json_decode($output);
        //revisamos si tenemos datos antes de iniciar a procesar
        if (!isset($data->ResultadoConsulta) || $data->ResultadoConsulta != "OK" || !isset($data->ListaEESSPrecio) || empty($data->ListaEESSPrecio)) {
            throw new \Exception('Sin datos devueltos por el servicio minetur');
        }
        //vaciamos datos previos en tablas entidades y estaciones
        DB::statement('TRUNCATE entidades');
        DB::statement('TRUNCATE estaciones');
        $entidades = [];
        //El catalogo de estaciones de gasolina viene en el atributo ListaEESSPrecio del servicio
        //ciclamos por los resultados para armar una estructura del tipo provincia->[]municipios->[]cps
        foreach ($data->ListaEESSPrecio as $estacion) {
            if (!isset($entidades[$estacion->IDProvincia])) {
                //si no existe el ID de la provincia, lo creamos primero en el arreglo $entidades
                //como un objeto STD con sus datos basicos y un arreglo de municipios
                $entidades[$estacion->IDProvincia] = new \stdClass();
                $entidades[$estacion->IDProvincia]->idProvincia = $estacion->IDProvincia;
                $entidades[$estacion->IDProvincia]->provincia = $estacion->Provincia;
                $entidades[$estacion->IDProvincia]->municipios = array();
            }
            //En este punto, ya se creo o ya existia la provincia en el arreglo
            //ahora revisamos exista en la provincia, el municipio de esta estacion
            if (!isset($entidades[$estacion->IDProvincia]->municipios[$estacion->IDMunicipio])) {
                //no existe el municipio en el arreglo de provincia->municipios[], creamos su
                //objeto STD con datos basicos y un arreglo de CPs
                $entidades[$estacion->IDProvincia]->municipios[$estacion->IDMunicipio] = new \stdClass();
                $entidades[$estacion->IDProvincia]->municipios[$estacion->IDMunicipio]->idMunicipio = $estacion->IDMunicipio;
                $entidades[$estacion->IDProvincia]->municipios[$estacion->IDMunicipio]->municipio = $estacion->Municipio;
                $entidades[$estacion->IDProvincia]->municipios[$estacion->IDMunicipio]->cps = array();
            }
            //En este punto ya se creo o ya existia el municipio dentro de su provincia
            //revisamos ahora existencia del CP en el arreglo de CPs del municipio
            if (!isset($entidades[$estacion->IDProvincia]->municipios[$estacion->IDMunicipio]->cps[$estacion->{'C.P.'}])) {
                $entidades[$estacion->IDProvincia]->municipios[$estacion->IDMunicipio]->cps[] = $estacion->{'C.P.'};
            }
            //Provincia, municipio, CPs existen en en arreglo entidades, procedemos a agregar la estacion
            //el servicio web devuelve un unico registro por estacion, por lo que se asume no hay duplicidad
            $tmp_estacion = new Estacion();
            $tmp_estacion->direccion = $estacion->{'Dirección'};
            $tmp_estacion->latitud = self::limpiaCifra($estacion->Latitud);
            $tmp_estacion->longitud = self::limpiaCifra($estacion->{'Longitud (WGS84)'});
            $tmp_estacion->id_municipio = $estacion->IDMunicipio;
            $tmp_estacion->horario = $estacion->Horario;
            $tmp_estacion->localidad = $estacion->Localidad;
            $tmp_estacion->precio_gasoleo_A = self::limpiaCifra($estacion->{'Precio Gasoleo A habitual'});
            $tmp_estacion->precio_gasoleo_B = self::limpiaCifra($estacion->{'Precio Gasoleo B'});
            $tmp_estacion->precio_gasolina_E10 = self::limpiaCifra($estacion->{'Precio Gasolina 95 E10'});
            $tmp_estacion->precio_gasolina_E5 = self::limpiaCifra($estacion->{'Precio Gasolina 95 E5'});
            $tmp_estacion->precio_gasoleo_maritimo = self::limpiaCifra($estacion->{'Precio Gasóleo para uso marítimo'});
            $tmp_estacion->save(); //usamos el metodo save de Eloquent para guardar la entidad en BD
        }
        //Finalizado el ciclo de datos del WS, repasamos arreglo de $entidades para almacenarlas en DB
        $numeralia = ["p" => 0, "m" => 0, "cp" => 0, "e" => sizeof($data->ListaEESSPrecio)];//contador para mostrar resultado de actualizacion
        foreach ($entidades as $entidad) {
            foreach ($entidad->municipios as $municipio) {
                foreach ($municipio->cps as $cp) {
                    //la unidad mas pequena de las entidades es el CP, por cada provincia->estado, almacenamos el dato completo del CP
                    DB::insert('INSERT into entidades SET municipio = :municipio, id_municipio = :id_municipio, provincia = :provincia, id_provincia = :id_provincia, cp = :cp',
                        [
                            'municipio' => $municipio->municipio,
                            'id_municipio' => $municipio->idMunicipio,
                            'provincia' => $entidad->provincia,
                            'id_provincia' => $entidad->idProvincia,
                            'cp' => $cp,
                        ]);
                    $numeralia['cp']++;
                }
                $numeralia['m']++;
            }
            $numeralia['p']++;
        }
        return response()->json(['Msg' => 'Datos actualizados', 'Provincias' => $numeralia['p'], 'Municipios' => $numeralia['m'], 'CP\'s' => $numeralia['cp'], 'Estaciones' => $numeralia['e']]);
    }

    /**
     * Metodo para el endpoint carburantes/estaciones[/{ord}]
     * Maneja las peticiones para listar todas las estaciones.
     * Revisa si en POST se tiene delimitado por provincia o municipio
     * Si se recibe el parametro 'ord' en la peticion, se ordenan los resultados acorde
     * @param $mid
     * @return \Illuminate\Http\JsonResponse
     */
    public function listarEstaciones(Request $request, $ord = null)
    {
        //revisamos si solicitan ordenamiento
        if (!empty($ord)) {
            if (strtoupper($ord) != "ASC" && strtoupper($ord) != "DESC") {
                return reponse('El parametro de ordenamiento en la URL solo puede ser [ASC,DESC]', 400);
            }
        }
        //Revision de POST para ver limitante por municipio
        if (!empty($request->post('municipio'))) {
            if (!empty($ord)) {
                //solicitud con ordenamiento
                return response()->json(['success'=>true,'results'=>Estacion::where('id_municipio', $request->post('municipio'))
                    ->orderByRaw('precio_gasoleo_A '.$ord.', precio_gasoleo_B '.$ord.', precio_gasolina_E10 '.$ord.', precio_gasolina_E5 '.$ord.', precio_gasoleo_maritimo ' . $ord)
                    ->get()]);
            } else {
                //solicitud sin ordenamiento
                return response()->json(['success'=>true,'results'=>Estacion::where('id_municipio', $request->post('municipio'))->get()]);
            }
        }
        //el filtro por municipio siempre va a tener preferencia sobre provincia pues es un subconjunto de la misma
        //Revision de POST para ver limitante por provincia
        if (!empty($request->post('provincia'))) {
            //sentencia para ordenamiento, como no todos los precios existen, ordenamos por todos segun lo solicitado, si no se solicito un ordenamiento $ordqry es vacio tambien
            $ordqry = (empty($ord) ? '' : ' ORDER BY precio_gasoleo_A '.$ord.', precio_gasoleo_B '.$ord.', precio_gasolina_E10 '.$ord.', precio_gasolina_E5 '.$ord.', precio_gasoleo_maritimo ' . $ord);
            //se usa DB::select en lugar de Estacion::where para permitir la ejecucion de un raw query que contempla el JOIN entre ambas tablas via el id_municipio para llegar desde id_provincia
            $estacionesData = DB::select('SELECT es.* FROM estaciones es LEFT JOIN entidades en ON en.id_municipio=es.id_municipio WHERE en.id_provincia = :provincia ' . $ordqry, ['provincia' => $request->post('provincia')]);
            //metodo hydrate para devolver instancias a partir de los resultados de la consulta raw anterior
            return response()->json(['success'=>true,'results'=>Estacion::hydrate($estacionesData)]);
        }
        //si no recibi provincia ni municipio, devuelvo todas las estaciones
        if (empty($request->post('provincia')) && empty($request->post('municipio'))) {
            //sentencia para ordenamiento, como no todos los precios existen, ordenamos por todos segun lo solicitado, si no se solicito un ordenamiento $ordqry es vacio tambien
            $ordqry = (empty($ord) ? '' : ' ORDER BY precio_gasoleo_A '.$ord.', precio_gasoleo_B '.$ord.', precio_gasolina_E10 '.$ord.', precio_gasolina_E5 '.$ord.', precio_gasoleo_maritimo ' . $ord);
            //se usa DB::select en lugar de Estacion::where para permitir la ejecucion de un raw query que contempla el JOIN entre ambas tablas via el id_municipio para llegar desde id_provincia
            $estacionesData = DB::select('SELECT es.* FROM estaciones es LEFT JOIN entidades en ON en.id_municipio=es.id_municipio ' . $ordqry, []);
            //metodo hydrate para devolver instancias a partir de los resultados de la consulta raw anterior
            return response()->json(['success'=>true,'results'=>Estacion::hydrate($estacionesData)]);
        }

    }

    /**
     * Se encarga de modificar los separadores de decimales y los de millares para formato numerico de BD
     * @param $cifra
     * @return string|string[]|null
     */
    public static function limpiaCifra($cifra)
    {
        if (empty($cifra)) {
            return null;
        } else {
            return str_replace(['.', ','], ['', '.'], $cifra);
        }
    }
}
