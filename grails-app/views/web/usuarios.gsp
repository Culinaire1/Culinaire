<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Usuarios</title>
</head>
<body>
<div class="container">
    <div class="fill nosotros">
        <br>
        <br>
        <div class="texto">
            <div class="center-block ing" style="width:80%;">
                <g:if test="${person.favoriteUsers.size()<= 0}">
                    <p class="cuerpo">Actualmente no hay usuarios a los que sigues.</p>
                </g:if>
                <g:else>
                    <g:each var="user" in="${person.favoriteUsers}">
                        <p class="tit" id="" style="font-size: 40px;"><a href="${createLink(controller:'web', action:'perfil',
                                params: [username: user.username])}">
                            ${user.username}</a></p>
                        <div class="cuerpo  row" style="padding-top: 0px;">
                            <div class="col-sm-3">
                                <figure>
                                    <g:if test="${user.photo != null}">
                                        <img class="img-responsive img-thumbnail" src="${createLink(controller:'person', action:'displayGraph',
                                                params: [name:user.name])}" />
                                    </g:if>
                                    <g:else>
                                        <g:img dir="images" file="chefPlaceholder.png" class="img-responsive img-thumbnail"/>
                                    </g:else>
                                </figure>
                            </div>
                            <div class="col-sm-9">
                                <g:if test="${user.recipes.size() > 0}">
                                    <p id="titulo">Recetas:</p>
                                    <g:each var="recipe" in="${user.recipes}">
                                        <a href="${createLink(controller:'web', action:'abrirReceta', params: [name: recipe.name])}">
                                            -${recipe.name}</a><br>
                                    </g:each>
                                </g:if>
                                <g:else>
                                    <p id="titulo">No hay recetas para mostrar.</p>
                                </g:else>
                            </div>
                            <div class="row" style="margin-top: 23%;">
                                <div class="col-sm-9">
                                    <p class="firma" style="text-align: left; padding-left: 3%;">Popularidad: ${user.rating}</p>
                                </div>
                                <div class="col-sm-3">
                                    <a class="btn btn-primary btn-lg center-block botones b1" href="${createLink(controller: 'person',
                                            action: 'removeFavoriteUser', params: [username: user.username])}" style="margin-right: 2%">Dejar de Seguir</a>
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