<%@ page import="culinairegrails.Person" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Perfil: ${person.username}</title>
</head>
<body>
<div class="container">
    <div class="texto">
        <div class="cuerpo">
            <p class="tit" id="" style="font-size: 40px">${person.username}</p>
            <div class="row">
                <div class="col-sm-3">
                    <figure>
                        <g:if test="${person.photo != null && person.photo.size() > 2}">
                            <img class="img-responsive img-thumbnail" src="${createLink(controller:'person', action:'displayGraph',
                                    params: [name:person.name])}" />
                        </g:if>
                        <g:else>
                            <g:img dir="images" file="chefPlaceholder.png" class="img-responsive img-thumbnail"/>
                        </g:else>
                    </figure>
                </div>
                <div class="col-sm-9">
                    <g:if test="${person.recipes.size() > 0}">
                        <p id="titulo">Recetas:</p>
                        <g:each var="recipe" in="${person.recipes}">
                            <a href="${createLink(controller:'web', action:'abrirReceta', params: [name: recipe.name])}">-${recipe.name}</a><br>
                        </g:each>
                    </g:if>
                    <g:else>
                        <p id="titulo">No hay recetas para mostrar.</p>
                    </g:else>
                </div>
                <div class="row" style="margin-top: 23%;">
                    <div class="col-sm-9 rgt">
                        <div class="col-sm-12">
                            <span class="firma" style="text-align: left">Popularidad: </span>
                            <span class="rgt-st"><input type="hidden" class="rating" value="${person.rating}" data-tipo="person" data-id="${person.id}"/></span>
                        </div>
                        <div class="col-sm-12">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            <span class="rgt-counter">${person.votes.size()}</span>
                        </div>
                    </div>
                    <g:if test="${session.tu == true}">
                        <div class="col-sm-3">
                        <g:if test="${person in user.favoriteUsers}">
                            <a class="btn btn-primary btn-lg center-block botones b1" href="${createLink(controller: 'person', action: 'removeFavoriteUser',
                                    params: [username: person.username])}" style="margin-right: 2%">Dejar de seguir</a>
                        </g:if>
                        <g:else>
                            <a class="btn btn-primary btn-lg center-block botones b2" href="${createLink(controller: 'person', action: 'addFavoritesUsers',
                            params: [username: person.username])}" style="margin-right: 2%"> Seguir</a>
                        </g:else>
                        </div>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>