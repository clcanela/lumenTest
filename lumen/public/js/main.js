let gmap = null; //variable global para el mapa
let gmarkers = []; //variable global para marcadores del mapa
$(function () {
    //funciones para mostrar/quitar spinner
    $(document).ajaxStart(function () {
        $("body").addClass("loading");
    });
    $(document).ajaxComplete(function () {
        $("body").removeClass("loading");
    });
    //cargamos listado de provincias al inicio
    fetchProvicnas();
    //inicializar funcionalidad de filtros
    initFilters();

})

/**
 * Consume el servicio de provincias y llena el SELECT de provincias con la informacion recibida
 */
function fetchProvicnas() {
    $.ajax({
        url: 'api/entidades/provincias',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            $("form[name='filtros'] select[name='provincia'] option:gt(0)").remove();
            for (p in data) {
                let nu_opc = $("<option>", {value: data[p].id_provincia, text: data[p].provincia});
                $("form[name='filtros'] select[name='provincia']").append(nu_opc);
            }
        }
    })
}

/**
 * Crea un listener para el SELECT de provincias que (des)habilita el campo de municipios
 * Si la opcion elegida es valida, manda a llamar los municipios de la provincia seleccionada
 */
function initProvinciasSelect() {
    $("form[name='filtros'] select[name='provincia']").change(function () {
        if ($(this).val() != "") {
            loadMunicipios($(this).val());
            $("form[name='filtros'] select[name='municipio']").prop('disabled', false)
        } else {
            $("form[name='filtros'] select[name='municipio']").prop('disabled', true)
        }
    })
}

/**
 * Consume el servicio de municipios segun el ID de provincia que reciba
 * Carga los municipios recibidos en el SELECT de municipios
 * @param pid number ID de provincia
 */
function loadMunicipios(pid) {
    $.ajax({
        url: 'api/entidades/municipios/' + pid,
        success: function (data) {
            $("form[name='filtros'] select[name='municipio'] option:gt(0)").remove();
            for (m in data) {
                let nu_opc = $("<option>", {value: data[m].id_municipio, text: data[m].municipio});
                $("form[name='filtros'] select[name='municipio']").append(nu_opc);
            }
        }
    })
}

/**
 * Inicializa el evento onSubmit de la forma para enviarla por ajax al servicio de listado de estaciones
 *
 */
function initFilters() {
    $("form[name='filtros']").on('submit', function (ev) {
        ev.preventDefault();
        let orden = (typeof $("form[name='filtros'] input[name='order']:checked").val() != "undefined" ? $("form[name='filtros'] input[name='order']:checked").val() : '');
        $.ajax({
            url: 'api/carburantes/estaciones/' + orden,
            type: 'POST',
            dataType: 'json',
            data: $("form[name='filtros']").serialize(),
            success: function (data) {
                listStationsDOMAndMap(data.results);//mandamos resultados para su render
                $("#barraFiltros").collapse('hide');//cerramos en mobil menu de filtros
            }
        })
    })
    initProvinciasSelect();
}

/**
 * Recibe un arrglo de objetos con informacion de cada estacion
 * Crea sus objetos HTML y los coloca en el DOM
 * Crea sus marcadores para el mapa
 * @param estaciones
 */
function listStationsDOMAndMap(estaciones) {
    //limpiamos elementos pre-existentes
    $(".gas_item:not(.d-none)").remove(); //del DOM
    for (mk in gmarkers) { //del mapa
        gmarkers[mk].setMap(null);
        gmarkers[mk] = null;
    }
    gmarkers = [];//vaciamos arreglo de marcadores
    let bounds = new google.maps.LatLngBounds();//para centrar el mapa con todos los marcadores
    //por cada estacion recibida, creamos nuevo DOM y marcador en mapa
    for (est in estaciones) {
        //creamos un clon del elemento base HTML para llenarlo con la info recibida
        let canvas = $(".gas_item.d-none").clone();
        canvas.find(".localidad").text(estaciones[est].localidad);
        canvas.find(".direccion").text(estaciones[est].direccion);
        canvas.find(".horario").text(estaciones[est].horario);
        canvas.find(".tr_precios td:eq(0)").html((estaciones[est].precio_gasoleo_A) ? '&euro;' + estaciones[est].precio_gasoleo_A : '--');
        canvas.find(".tr_precios td:eq(1)").html((estaciones[est].precio_gasoleo_B) ? '&euro;' + estaciones[est].precio_gasoleo_B : '--');
        canvas.find(".tr_precios td:eq(2)").html((estaciones[est].precio_gasolina_E10) ? '&euro;' + estaciones[est].precio_gasolina_E10 : '--');
        canvas.find(".tr_precios td:eq(3)").html((estaciones[est].precio_gasolina_E5) ? '&euro;' + estaciones[est].precio_gasolina_E5 : '--');
        canvas.find(".tr_precios tD:eq(4)").html((estaciones[est].precio_gasoleo_maritimo) ? '&euro;' + estaciones[est].precio_gasoleo_maritimo : '--');
        canvas.removeClass('d-none');//quitamos clase que oculta clon
        $(".gas_list").append(canvas);//agregamos a listado
        //mostramos marcadores en el mapa
        //algunas estaciones no traen coordenadas desde el origen, evitamos crear marcadores para estas coordenadas
        if (estaciones[est].latitud == null || estaciones[est].longitud == null) {
            continue;
        }
        //creamos marcador para la estacion
        let nu_marker = new google.maps.Marker({
            position: new google.maps.LatLng(estaciones[est].latitud, estaciones[est].longitud),
            title: estaciones[est].direccion,
            map: gmap
        });
        //agregamos listener para mostrar un infoWindow con datos basicos al clic
        nu_marker.addListener('click', function () {
            new google.maps.InfoWindow({
                content: '<h6>' + estaciones[est].localidad + '</h6><p>' + estaciones[est].direccion + '</p>'
            }).open(gmap, this);
        });
        gmarkers.push(nu_marker);//agregamos referencia al arreglo para limpiar mapa despues
        bounds.extend(nu_marker.position);
    }
    //centramos mapa a todos los marcadores
    gmap.fitBounds(bounds);
}
