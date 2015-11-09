<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Recetas</title>
</head>
<body>
<div class="container">
    <div class="fill nosotros">
        <br>
        <br>
        <div class="texto">
            <div class="center-block ing" style="width:80%;">
                <g:if test="${recipes == null}">
                    <p class="cuerpo">Recetas no encontradas para esa categoría.</p>
                </g:if>
                <g:else>
                    <g:each var="recipe" in="${recipes}">
                        <div class="row">
                            <div class="col-sm-6">
                                <figure>
                                    <img class="img-responsive img-thumbnail" src="${createLink(controller:'recipe',
                                            action:'displayGraph', params: [name:recipe.name])}" />
                                </figure>
                            </div>
                            <div class="col-sm-6">
                                <p class="tit" style="font-size: 40px">
                                    <a href="${createLink(controller:'web', action:'abrirReceta', params: [name: recipe.name])}">${recipe.name}</a>
                                </p>
                                <div class="texto row">
                                    <div class="cuerpo">
                                        <p>Ingredientes:</p>
                                        <p>
                                            <g:each var="quantity" in="${recipe.quantities}">
                                                - ${quantity.quantity} de ${quantity.ingredient}.<br>
                                            </g:each>

                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <p class="firma">Autor: ${recipe.person.username}</p>
                            </div>
                            <div class="col-sm-4">
                                <button type="button" class="btn btn-primary btn-lg center-block botones b2">Comentarios</button>
                            </div>
                            <div class="col-sm-4">
                                <p class="firma">Popularidad: ${recipe.rating}</p>
                            </div>
                        </div>
                        <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                    </g:each>
                </g:else>
            <!--<div class="row">
                    <div class="col-sm-6">
                        <!g:img dir="images" file="f2.jpg" class="img-responsive img-thumbnail"/>
                        <!img src="Images/f2.jpg" class="img-responsive img-thumbnail" alt="af">
                    </div>
                    <div class="col-sm-6">
                        <p class="tit" style="font-size: 40px">Hamburguesa</p>
                        <div class="texto row">
                            <div class="cuerpo">
                                <p id="titulo">Ingredientes:</p>
                                <p>- Pan<br> </p>
                                <p id="titulo">Preparación:</p>
                                <p>Se cocina la hamburguesa...<br> </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <p class="firma">Autor: elchef15</p>
                    </div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-primary btn-lg center-block botones b2">Comentarios</button>
                    </div>
                    <div class="col-sm-4">
                        <p class="firma">Popularidad: ♦♦♦♦</p>
                    </div>
                </div>
                <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                <div class="row">
                    <div class="col-sm-6">
                        <!g:img dir="images" file="f7.jpg" class="img-responsive img-thumbnail"/>
                        <!img src="Images/f7.jpg" class="img-responsive img-thumbnail" alt="af">
                    </div>
                    <div class="col-sm-6">
                        <p class="tit" id="" style="font-size: 40px">Aperitivos</p>
                        <div class="texto row">
                            <div class="cuerpo">
                                <p id="titulo">Ingredientes:</p>
                                <p>- Camarón<br> </p>
                                <p id="titulo">Preparación:</p>
                                <p>Se cocinan los camarones...<br> </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <p class="firma">Autor: lachef20</p>
                    </div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-primary btn-lg center-block botones b2">Comentarios</button>
                    </div>
                    <div class="col-sm-4">
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