<%@ page import="culinairegrails.Person" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Perfil: ${person.username}</title>
    <script type="text/javascript">
        $(function (){
            $(".img-bg").on('click', function() {

                $(this).toggleClass('select');
                if ($(this).hasClass('select')) {
                    $(this).attr('src', 'images/start.png');
                } else {
                    $(this).attr('src', 'images/start_off.png');
                }
            });
        });
    </script>
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
                    <div class="col-sm-9">
                        <p class="firma" style="text-align: left; padding-left: 3%;">Popularidad: ${person.rating}</p>
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

                    <g:if test="${session.tu == true}">
                        <g:if test="${voto == 1}">
                            <div class="col-sm-12 col-md-offset-1">
                                <img style="cursor:pointer"  class="img-bg pull-left select" src="images/start.png"/>
                                <p class="firma pull-left">+</p>
                            </div>

                        </g:if>
                        <g:else>
                            <div class="col-sm-12 col-md-offset-1">
                                <img style="cursor:pointer"  class="img-bg pull-left" src="images/start_off.png"/>
                                <p class="firma pull-left">+</p>
                            </div>
                        </g:else>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>