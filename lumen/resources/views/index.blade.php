<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstratheme.min.css"></head>
    <link rel="stylesheet" href="css/main.css"/>
    <title>Precios Carburantes Marítimos</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark text-white">
    <a class="navbar-brand" href="#">Carburantes</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#barraFiltros" aria-controls="barraFiltros" aria-expanded="false" aria-label="Mostrar/Ocultar filtros">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="barraFiltros">
        <form class="form-inline my-2 my-lg-0" name="filtros">
            <select class="form-control mr-md-2 mb-2 mb-md-0" name="provincia">
                <option value="">Provincia</option>
            </select>
            <select class="form-control mr-md-2 mb-2 mb-md-0" name="municipio" disabled>
                <option value="">Municipio</option>
            </select>
            <div class="form-group">
                <label class="mr-md-1">Precios</label>
                <div class="custom-control custom-radio mr-md-1">
                    <input type="radio" name="order" id="input_order_asc" class="custom-control-input" value="asc">
                    <label class="custom-control-label" for="input_order_asc">Ascendente</label>
                </div>
                <div class="custom-control custom-radio">
                    <input type="radio" id="input_order_des" name="order" class="custom-control-input" value="desc">
                    <label class="custom-control-label" for="input_order_des">Descendente</label>
                </div>
            </div>
            <div class="w-100 d-block d-md-none"></div>
            <button class="btn btn-primary my-2 my-sm-0 ml-md-2" type="submit">Buscar</button>
        </form>
    </div>
</nav>
<div id="mapa"></div>
<div class="container my-2">
    <div class="row">
        <div class="col-12 col-md-10 offset-md-1 col-lg-8 offset-lg-2">
            <h2 class="text-center">Estaciones de carga</h2>
            <div class="gas_list list-group">
                <div class="gas_item list-group-item text-center"><p>Seleccione una Provincia/Municipio para mostrar las estaciones</p></div>
            </div>
            <a href="#" class="gas_item bg-white text-dark list-group-item list-group-item-action d-none">
                <div class="gas_card">
                    <img
                        src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjxzdmcgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4IiB3aWR0aD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTAgMGg0OHY0OGgtNDh6IiBmaWxsPSJub25lIi8+PHBhdGggZD0iTTM5LjU0IDE0LjQ2bC4wMy0uMDMtNy40NS03LjQzLTIuMTIgMi4xMiA0LjIyIDQuMjJjLTEuODguNzItMy4yMiAyLjUzLTMuMjIgNC42NiAwIDIuNzYgMi4yNCA1IDUgNSAuNzEgMCAxLjM5LS4xNSAyLS40MnYxNC40MmMwIDEuMS0uOSAyLTIgMnMtMi0uOS0yLTJ2LTljMC0yLjIxLTEuNzktNC00LTRoLTJ2LTE0YzAtMi4yMS0xLjc5LTQtNC00aC0xMmMtMi4yMSAwLTQgMS43OS00IDR2MzJoMjB2LTE1aDN2MTBjMCAyLjc2IDIuMjQgNSA1IDVzNS0yLjI0IDUtNXYtMTljMC0xLjM4LS41Ni0yLjYzLTEuNDYtMy41NHptLTE1LjU0IDUuNTRoLTEydi0xMGgxMnYxMHptMTIgMGMtMS4xIDAtMi0uOS0yLTJzLjktMiAyLTIgMiAuOSAyIDItLjkgMi0yIDJ6Ii8+PC9zdmc+"
                        class="icon"/>
                    <div class="datos">
                        <h4 class="localidad">Localidad</h4>
                        <h5 class="direccion">Direccion Lorem ipsum dolor.</h5>
                        <small class="horario">Horario 23:33 /32323</small>
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col" class="bg-secondary">A</th>
                                    <th scope="col" class="bg-secondary">B</th>
                                    <th scope="col" class="bg-info">E10</th>
                                    <th scope="col" class="bg-info">E5</th>
                                    <th scope="col" class="bg-primary">Mar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="tr_precios">
                                    <td>345.0&euro;</td>
                                    <td></td>
                                    <td></td>
                                    <td>1.045&euro;</td>
                                    <td>345.0&euro;</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<div id="loader">
    <div class="spinner-border text-light" role="status">
        <span class="sr-only">Cargando...</span>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/main.js"></script>
<script>
    // Initialize and add the map
    function initMap() {
        gmap = new google.maps.Map(
            document.getElementById('mapa'), {zoom: 8, center: {lat: 39.46003924597246, lng: 2.990688123298386}});
    }
</script>
<!--Load the API from the specified URL
* The async attribute allows the browser to render the page while the API loads
* The key parameter will contain your own API key (which is not needed for this tutorial)
* The callback parameter executes the initMap() function
-->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5CAmZ8quNpcPYFMfPafFWnxy4-fjP0aM&callback=initMap">
</script>
</body>
</html>
