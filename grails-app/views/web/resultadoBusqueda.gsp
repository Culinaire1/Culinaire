<%--
  Created by IntelliJ IDEA.
  User: oscar
  Date: 4/11/15
  Time: 09:27 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="culinairegrails.Person" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Barra Busqueda</title>
    <style>
        .nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus{
            background-color: #333387;
        }
        a{
            color: #333387;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="cuerpo">
        <div id="int" class="row">

            <div class="col-md-9 col-md-offset-3 clearfix">
                <h3>
                    Resultados de la busqueda
                </h3>
            </div>

            <!--
            |--------------------------------------------------------------------------
            | Menu
            |--------------------------------------------------------------------------
            | Esta seccion muestra un menu para desplazarse a traves del contenido de
            | la pagina, se implementa con el uso de tabs, cada tab tiene una seccion
            | de contenido asociada, ocupa un tamaño 4 en la grilla de bootstrap.
            |
            /-->

            <div class="col-md-4 col-md-push-8">
                <!-- Nav tabs -->
                <ul class="nav nav-pills nav nav-stacked" role="tablist">
                    <li class="active">
                        <a href="#personas" role="tab" data-toggle="tab">
                            <i class="glyphicon glyphicon-chevron-left pull-left hidden-xs" style="font-size: 1.4em;"></i>
                            <i class="glyphicon glyphicon-chevron-down pull-left visible-xs" style="font-size: 1.4em;"></i>
                            Personas <span style="font-size: 0.7em" class="badge pull-right">${personas.size()}</span>
                        </a>
                    </li>
                    <li>
                        <a href="#restaurantes" role="tab" data-toggle="tab">
                            <i class="glyphicon glyphicon-chevron-left pull-left hidden-xs" style="font-size: 1.4em;"></i>
                            <i class="glyphicon glyphicon-chevron-down pull-left visible-xs" style="font-size: 1.4em;"></i>
                            Restaurantes <span style="font-size: 0.7em" class="badge pull-right">${restaurantes.size()}</span>
                        </a>
                    </li>
                    <li>
                        <a href="#recetas" role="tab" data-toggle="tab">
                            <i class="glyphicon glyphicon-chevron-left pull-left hidden-xs" style="font-size: 1.4em;"></i>
                            <i class="glyphicon glyphicon-chevron-down pull-left visible-xs" style="font-size: 1.4em;"></i>
                            Recetas <span style="font-size: 0.7em" class="badge pull-right">${recetas.size()}</span>
                        </a>
                    </li>

                </ul>
            </div>


            <!--
            |--------------------------------------------------------------------------
            | Contenidos
            |--------------------------------------------------------------------------
            | En esta seccion se encuenteran los contenidos asociados a los tabs del
            | menu, ocupa un tamaño 8 en la grilla de bootstrap.
            |
            /-->
            <div class="col-md-8 col-md-pull-4">
                <!-- Tab panes -->
                <div class="tab-content">
                    <!--Personas-->
                    <!--Panel de las personas encontradas-->
                    <div class="tab-pane active" id="personas">
                        <h2>Personas</h2>

                        <div class="panel-group" id="accordion1" role="tablist" aria-multiselectable="true">
                            <g:each status="i" var="persona" in="${personas}">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="heading${i+100}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapse${i+100}" aria-expanded="false" aria-controls="collapseOne">
                                                <b>${persona.toString()}</b>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse${i+100}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${i+100}">
                                        <div class="panel-body">
                                            <h5><b>Usuario:</b> ${persona.username}</h5>
                                            <h5><b>Descripción:</b> ${persona.description}</h5>
                                            <h5><b>Edad:</b> ${persona.age}</h5>
                                            <h5><b>Puntuación</b> ${persona.rating}</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                        </div>
                                    </div>
                                </div>
                            </g:each>

                        </div>
                    </div>
                    <!--FIN Personas-->

                    <!--Restaurantes-->
                    <!--Panel de los Restaurantes encontrados-->
                    <div class="tab-pane" id="restaurantes">
                        <h2>Restaurantes</h2>

                        <div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
                            <g:each status="i" var="restaurante" in="${restaurantes}">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="heading${i+200}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse${i+200}" aria-expanded="false" aria-controls="collapseOne">
                                                <b>${restaurante.name}</b>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse${i+200}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${i+200}">
                                        <div class="panel-body">
                                            <h5><b>Pais:</b> ${restaurante.country}</h5>
                                            <h5><b>Ciudad:</b> ${restaurante.city}</h5>
                                            <h5><b>Dirección:</b> ${restaurante.address}</h5>
                                            <h5><b>Descripción:</b> ${restaurante.description}</h5>
                                            <h5><b>Puntuación</b> ${restaurante.rating}</b></h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                        </div>
                                    </div>
                                </div>
                            </g:each>

                        </div>
                    </div>
                    <!--FIN Restaurantes-->

                    <!--Recetas-->
                    <!--Panel de las Recetas encontrados-->
                    <div class="tab-pane" id="recetas">
                        <h2>Recetas</h2>

                        <div class="panel-group" id="accordion3" role="tablist" aria-multiselectable="true">
                            <g:each status="i" var="receta" in="${recetas}">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="heading${i+300}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion3" href="#collapse${i+300}" aria-expanded="false" aria-controls="collapseOne">
                                                <b>${receta.name}</b>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse${i+300}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${i+300}">
                                        <div class="panel-body">
                                            <h5><b>Pais:</b> ${receta.country}</h5>
                                            <h5><b>Descripción:</b> ${receta.description}</h5>
                                            <h5><b>Intrucciones:</b> ${receta.instructions}</h5>
                                            <h5><b>Puntuación</b> ${receta.rating}</b></h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
                                        </div>
                                    </div>
                                </div>
                            </g:each>

                        </div>
                    </div>
                    <!--FIN Recetas-->
                </div>
            </div>

        </div>

    </div>


</div>


</body>
</html>