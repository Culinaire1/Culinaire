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
            <p class="tit" id="" style="font-size: 40px">Bienvenido: ${person.username}</p>
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
                        <p id="titulo">Tus recetas:</p>
                        <g:each var="recipe" in="${person.recipes}">
                            - <a href="${createLink(controller:'web', action:'abrirReceta', params: [name: recipe.name])}">${recipe.name}</a><br>
                        </g:each>
                    </g:if>
                    <g:else>
                        <p id="titulo">No tienes recetas.</p>
                    </g:else>
                </div>
                <div class="row" style="margin-top: 23%;">

                    <div class="col-sm-9 rgt">
                        <div class="col-sm-12">
                            <span class="firma" style="text-align: left">Popularidad: </span>
                            <g:if test="${session.user}">
                                <g:if test="${session.tu==true}">
                                    <span class="rgt-st"><input type="hidden" class="rating" value="${person.rating}" data-tipo="person" data-id="${person.id}"/></span>
                                </g:if>
                                <g:else>
                                    <span class="rgt-st"><input type="hidden" class="rating" value="${person.rating}" data-readonly data-case="notperson"/></span>
                                </g:else>
                            </g:if>
                            <g:else>
                                <span class="rgt-st"><input type="hidden" class="rating" value="${person.rating}" data-readonly data-case="offsession"/></span>
                            </g:else>
                        </div>
                        <div class="col-sm-12">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            <span class="rgt-counter">${person.votes.size()}</span>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <a class="btn btn-primary btn-lg botones b1" href="${createLink(action: 'publicar')}" style="margin-left: 4%">
                            Publicar</a>
                        <a class="btn btn-primary btn-lg botones b1" href="${createLink(action: 'editarperfilpersona' ) }" style="margin-right: 2%">
                            Editar perfil</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>