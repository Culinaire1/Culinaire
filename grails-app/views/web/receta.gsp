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
                <g:if test="${recipe == null}">
                    <p class="cuerpo">Recetas no encontrada con ese nombre.</p>
                </g:if>
                <g:else>
                    <div class="row">
                        <div class="col-sm-6">
                            <figure>
                                <img class="img-responsive img-thumbnail" src="${createLink(controller:'recipe',
                                        action:'displayGraph', params: [name:recipe.name])}" />
                            </figure>
                        </div>
                        <div class="col-sm-6">
                            <p class="tit" style="font-size: 40px">${recipe.name}</p>
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
                        <div class="row texto cuerpo">
                            <p>Preparación:</p>
                            <p>
                                <g:each var="instruction" in="${recipe.instructions.sort({it.paso})}">
                                    ${instruction.paso}. ${instruction.description}<br>
                                </g:each>
                            </p>
                        </div>
                    </div>
                    <div style="width: 60%; margin: 0px auto;">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/m8l78LWyF4k" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-sm-4">
                            <p class="firma">Autor: ${recipe.person.username}</p>
                        </div>
                        <div class="col-sm-4">

                        </div>
                        <div class="col-sm-4">
                            <p class="firma">Popularidad: ${recipe.rating}</p>
                        </div>
                    </div>

                    <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                    <p class="tit" style="font-size: 40px">Comentarios:</p>
                    <g:if test="${recipe.posts.size() > 0}">
                        <g:each var="post" in="${recipe.posts}">
                            ${post.content}<br>
                        </g:each>
                    </g:if>
                    <g:else>
                        <p class="cuerpo">No hay comentarios aún.</p>
                    </g:else>
                    <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                    <g:if test="${recipe.person.recipes.size() > 1}">
                        <p class="tit" style="font-size: 40px">Mas recetas del autor: ${recipe.person.username}</p>
                        <g:each var="recipe2" in="${recipe.person.recipes}">
                            <p class="cuerpo">- <a href="${createLink(controller:'web', action:'abrirReceta', params: [name: recipe2])}">${recipe2.name}</a></p><br>
                        </g:each>
                    </g:if>
                    <g:else>
                        <p class="cuerpo">El autor ${recipe.person.username} no tiene más recetas.</p>
                    </g:else>
                </g:else>
            </div>
        </div>
        <br>
        <br>
    </div>
</div>
</body>
</html>