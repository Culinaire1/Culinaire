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
                        </div>
                        <div class="col-sm-6">
                            <p class="tit" style="font-size: 40px">${restaurant.name}</p>
                            <p class="firma">${restaurant.country}</p>
                            <div class="texto">
                                <div class="cuerpo">
                                    <p id="titulo">Dirección:</p>
                                    <p>${restaurant.city} - ${restaurant.address}<br> </p>
                                    <p id="titulo">Descripción:</p>
                                    <p>${restaurant.description}<br> </p>
                                </div>
                            </div>
                            <div class="carousel-caption" style="font-family: 'Liberator', sans-serif;font-size: 20px;color: #03034c; margin-bottom: 5px; text-align: left">
                                <a href="#">${restaurant.website}</a>
                            </div>
                            <p class="firma">Popularidad: ${restaurant.rating}</p>
                        </div>
                    </div>
                    <hr style="width: 100%; color: #111160; height: 10px; background-color:#111160;" />
                </g:each>
                <!--
                <div class="row">
                    <div class="col-sm-6">
                        <!g:img dir="images" file="f4.jpg" class="img-responsive img-thumbnail"/>
                    </div>
                    <div class="col-sm-6">
                        <p class="tit" style="font-size: 40px">WOK</p>
                        <p class="firma">Colombia</p>
                        <div class="texto">
                            <div class="cuerpo">
                                <p id="titulo">Dirección:</p>
                                <p>Bogotá - Calle 123 #20-30<br> </p>
                                <p id="titulo">Descripción:</p>
                                <p>Somos un restaurante blah blah...<br> </p>
                            </div>
                        </div>
                        <div class="carousel-caption" style="font-family: 'Liberator', sans-serif;font-size: 20px;color: #03034c; margin-bottom: 5px; text-align: left">
                            <a href="#">www.wok.com.co</a>
                        </div>
                        <p class="firma">Popularidad: ♦♦♦♦</p>
                    </div>
                </div>
                <hr style="width: 100%; color: #111160; height: 10px; background-color:#111160;" />
                <div class="row">
                    <div class="col-sm-6">
                        <!g:img dir="images" file="f5.jpg" class="img-responsive img-thumbnail"/>
                    </div>
                    <div class="col-sm-6">
                        <p class="tit" id="" style="font-size: 40px">Archies Trattoria</p>
                        <p class="firma">Colombia</p>
                        <div class="texto">
                            <div class="cuerpo">
                                <p id="titulo">Dirección:</p>
                                <p>Bogotá - Calle 10 #20-30<br> </p>
                                <p id="titulo">Descripción:</p>
                                <p>Comida italiana<br> </p>
                            </div>
                        </div>
                        <div class="carousel-caption" style="font-family: 'Liberator', sans-serif;font-size: 20px;color: #03034c; margin-bottom: 5px; text-align: left">
                            <a href="#">www.archies.co</a>
                        </div>
                        <p class="firma">Popularidad: ♦♦♦♦♦</p>
                    </div>
                </div>-->
            </div>
        </div>
        <br>
        <br>
    </div>
</div>
</body>
</html>