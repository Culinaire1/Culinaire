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
                <g:if test="${!recipes}">
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
                                <div class="texto row" style="padding-top: 0">
                                    <div class="cuerpo" style="padding-top: 0">
                                        <p>${recipe.description}</p>
                                        <p><span class="titulo">País: </span>
                                        <g:if test="${recipe.typical}">Plato típico de </g:if>${recipe.country.name}</p>
                                        <p><span class="titulo">Tiempo de preparación: </span>${recipe.duration.duration}</p>
                                        <p><span class="titulo">Dificultad:</span> ${recipe.difficulty.level}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-4">
                                <p class="firma">Autor: <a href="${createLink(controller:'web', action:'perfil', params: [username: recipe.person.username])}">
                                ${recipe.person.username}</a></p>
                            </div>
                            <div class="col-sm-4">
                                <a style="margin-left: 20%;" class="btn btn-primary btn-lg center-block botones b1" href="${createLink(controller:'web', action:'abrirReceta',
                                        params: [name: recipe.name])}#comentarios">Comentarios</a>
                            </div>
                            <div class="col-sm-4 rgt">
                                <div class="col-sm-12">
                                    <span class="firma" style="text-align: left">Popularidad: </span>
                                    <span class="rgt-st"><input type="hidden" class="rating" value="${recipe.rating}" data-tipo="recipe" data-id="${recipe.id}"/></span>
                                </div>
                                <div class="col-sm-12">
                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                    <span class="rgt-counter">${recipe.votes.size()}</span>
                                </div>
                            </div>
                        </div>
                        <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                    </g:each>
                </g:else>
            </div>
        </div>
        <br>
        <br>
    </div>
</div>
</body>
</html>