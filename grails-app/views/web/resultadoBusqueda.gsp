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
        font-size: 24px;
    }
    </style>
</head>
<body>
<div class="container">
    <div class="cuerpo">
        <div id="int" class="row">

            <div class="col-md-9 col-md-offset-3 clearfix">
                <h2>
                    Resultados de la búsqueda:  ${parametro}
                </h2>
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
                                    <div class="panel-heading" role="tab" id="headingPersona${i}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapsePersona${i}" aria-expanded="false" aria-controls="collapseOne">
                                                <b>${persona.toString()}</b>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapsePersona${i}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPersona${i}">
                                        <div class="panel-body">

                                            <div class="row">

                                                <div class="col-md-3 col-lg-3 " align="center">
                                                    <g:if test="${persona.photo != null && persona.photo.size() > 2}">
                                                        <img alt="User Pic" src="${createLink(controller:'person', action:'displayGraph', params: [name:persona.name])}" class="img-rounded img-responsive">
                                                    </g:if>
                                                    <g:else>
                                                        <g:img dir="images" file="chefPlaceholder.png" class="img-responsive img-rounded"/>
                                                    </g:else>
                                                </div>
                                                <div class=" col-md-9 col-lg-9 ">
                                                    <table class="table table-user-information">
                                                        <tbody>
                                                            <tr>
                                                                <td>Usuario:</td>
                                                                <td>${persona.username}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Puntuación:</td>
                                                                <td>${persona.rating}</td>
                                                            </tr>
                                                            <tr><td></td><td></td></tr>
                                                        </tbody>
                                                    </table>

                                                    <p class="firma"><a class="firma" href="${createLink(controller:'web', action:'perfil', params: [username: persona.username])}">ver perfil</a></p>
                                                </div>
                                            </div>
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
                                    <div class="panel-heading" role="tab" id="headingRestaurante${i}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseRestaurante${i}" aria-expanded="false" aria-controls="collapseOne">
                                                <b>${restaurante.name}</b>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseRestaurante${i}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingRestaurante${i}">
                                        <div class="panel-body">

                                            <div class="row">

                                                <div class="col-md-3 col-lg-3 " align="center">

                                                    <g:img dir="images" file="chefPlaceholder.png" class="img-responsive img-rounded"/>

                                                </div>
                                                <div class=" col-md-9 col-lg-9 ">
                                                    <table class="table table-user-information">
                                                        <tbody>
                                                        <tr>
                                                            <td>Descripción:</td>
                                                            <td>${restaurante.description}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Puntuación:</td>
                                                            <td>${restaurante.rating}</td>
                                                        </tr>
                                                        <tr><td></td><td></td></tr>
                                                        </tbody>
                                                    </table>

                                                    <p class="firma"><a class="firma" href="#">ver más</a></p>
                                                </div>
                                            </div>
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
                                    <div class="panel-heading" role="tab" id="headingReceta${i}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion3" href="#collapseReceta${i}" aria-expanded="false" aria-controls="collapseOne">
                                                <b>${receta.name}</b>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseReceta${i}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingReceta${i}">
                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-md-3 col-lg-3 " align="center">
                                                    <g:if test="${receta.photo != null && receta.photo.size() > 2}">
                                                        <img alt="User Pic" src="${createLink(controller:'recipe', action:'displayGraph', params: [name:receta.name])}" class="img-rounded img-responsive">
                                                    </g:if>
                                                    <g:else>
                                                        <g:img dir="images" file="chefPlaceholder.png" class="img-responsive img-rounded"/>
                                                    </g:else>
                                                </div>
                                                <div class=" col-md-9 col-lg-9 ">
                                                    <table class="table table-user-information">
                                                        <tbody>
                                                        <tr>
                                                            <td>Pais:</td>
                                                            <td>${receta.country}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Descripción:</td>
                                                            <td>${receta.description}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Puntuación:</td>
                                                            <td>${receta.rating}</td>
                                                        </tr>
                                                        <tr><td></td><td></td></tr>
                                                        </tbody>
                                                    </table>

                                                    <p class="firma"><a class="firma" href="${createLink(controller:'web', action:'abrirReceta', params: [name: receta.name])}">ver más</a></p>
                                                </div>
                                            </div>
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