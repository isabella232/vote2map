<!DOCTYPE html>
<html>
<head>

    <title>Elections map</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- CSS -->
    <link rel="stylesheet" href="${request.static_url('nextgis_elections:static/css/map.css')}" type="text/css">
    <link rel="stylesheet" href="${request.static_url('nextgis_elections:static/jquery/css/overcast/jquery-ui-1.8.16.custom.css')}" type="text/css">
 
    <!-- jQuery Tools library -->
    <script src="${request.static_url('nextgis_elections:static/jquery/js/jquery-1.6.2.min.js')}"></script>
    <script src="${request.static_url('nextgis_elections:static/jquery/js/jquery-ui-1.8.16.custom.min.js')}"></script>
    <script src="${request.static_url('nextgis_elections:static/jquery/js/jquery.tools.min.js')}"></script>

    <!-- OpenLayers library -->
    <script src="${request.static_url('nextgis_elections:static/openlayers/OpenLayers.js')}"></script>
    <script src="http://www.openstreetmap.org/openlayers/OpenStreetMap.js" type="text/javascript"></script>

    <!-- geostats library -->
    <script src="${request.static_url('nextgis_elections:static/geostat/geostats.js')}"></script>

    <!-- Main section -->
    <script src="${request.static_url('nextgis_elections:static/js/main.js')}" type="text/javascript"></script>
    <script src="${request.static_url('nextgis_elections:static/js/render.js')}" type="text/javascript"></script>
    <script src="${request.route_url('setup_js')}" type="text/javascript"></script>


</head>
<body onload="init()">
    %for i in range(4):
        <a class="breadcrumb" id="bc_${i+1}" href="#" onClick="NGe.selectBreadcrumb(${i+1});"></a>
    %endfor
    <div id="mapcont">
        <div id="map"></div>
        <div id="panel">
            <ul class="menu">
                <li class="sel">
                    <input onChange="NGe.setRenderer('presence', {});"
                        type="radio" name="p_select" id="p_votes" checked="yes">
                        <label for="p_votes">Явка и распределение голосов</label>
                </li>
                %for party in parties:
                    <li class="icon p_party_${party.id}">
                        <input onChange="NGe.setRenderer('partyVote', {party_id: ${party.id}});"
                            type="radio" name="p_select" id="p_party_${party.id}">
                        <label for="p_party_${party.id}">${party.name}</label>
                    </li>
                %endfor
            </ul>
                
        </div>
        <input id="search" />
    </div>

    <div id="legend"></div>

    <div id="holder"></div> 
    <div class="tooltip"></div>

    <div id="help">
        <p>Щелкайте по объектам для перехода на другой уровень. Наведите мышь, чтобы увидеть сводные результаты. Используйте панель навигации над картой чтобы переходить на предыдущие уровни.</p>

        <p>
        Результаты выборов: <a href="http://www.moscow_city.vybory.izbirkom.ru/">Мосизбирком</a><br/>
        Протоколы наблюдателей: <a href="http://nabludatel.org/">Гражданин-наблюдатель</a>, <a href="http://forbes.ru">Forbes</a><br/>
        Картоснова: Участники <a href="http://osm.org/">OpenStreetMap<a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA 2.0</a>
        </p>

        <p><b>Внимание:</b> данные из протоколов наблюдателей в процессе ввода!</p>
    </div>


</body>
