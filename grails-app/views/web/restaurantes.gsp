<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Restaurantes</title>
</head>
<body>
<div class="container">
    <div class="fill nosotros">
        <br>
        <br>
        <div class="texto">
            <div class="center-block ing" style="width:80%;">
                <g:each var="restaurant" in="${restaurants}">
                    <div class="row">
                        <div class="col-sm-6">
                            <figure>
                                <img class="img-responsive img-thumbnail" src="${createLink(controller:'restaurant', action:'displayGraph', params: [name:restaurant.name])}" />
                            </figure>
                            <p class="texto cuerpo"><span class="titulo">Tipo: </span>${restaurant.cuisine}<br> </p>
                        </div>
                        <div class="col-sm-6">
                            <p class="tit" style="font-size: 40px">
                                <a href="${createLink(controller:'web', action:'abrirRestaurante', params: [name: restaurant.name])}">${restaurant.name}</a>
                            </p>
                            <p class="firma">${restaurant.country}</p>
                            <div class="texto">
                                <div class="cuerpo">
                                    <p style="padding-top: 0; margin-top: 0">Direcciones:</p>
                                    <div class="container">
                                    <g:each var="ciudad" in="${restaurant.cities}">
                                        <p>${ciudad}</p>
                                        <g:each var="direccion" in="${ciudad.directions.findAll{it.restaurant == restaurant}}">
                                            <p>- ${direccion}</p>
                                        </g:each>
                                    </g:each>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <p class="firma"><a href="${restaurant.website}">${restaurant.website}</a></p>
                        </div>
                        <div class="col-sm-4">
                            <a style="margin-left: 20%;" class="btn btn-primary btn-lg center-block botones b1" href="${createLink(controller:'web', action:'abrirRestaurante',
                                    params: [name: restaurant.name])}#comentarios">Comentarios</a>
                        </div>
                        <div class="col-sm-4">
                            <p class="firma">Popularidad: ${restaurant.rating}</p>
                        </div>
                    </div>
                    <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                </g:each>
            </div>
        </div>
        <br>
        <br>
    </div>
</div>
</body>
</html>