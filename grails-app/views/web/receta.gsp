<%@ page import="culinairegrails.Person" contentType="text/html;charset=UTF-8" %>
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
                    <p class="cuerpo">Receta no encontrada con ese nombre.</p>
                </g:if>
                <g:else>
                    <div class="row">
                        <div class="col-sm-6">
                                <img class="img-responsive img-thumbnail" src="${createLink(controller:'recipe',
                                        action:'displayGraph', params: [name:recipe.name]) }" style="max-height: 600px;"/>
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
                    </div>
                    <div class="row" style="margin-bottom: -5%">
                        <div class="row texto cuerpo">
                            <p>Preparación:</p>
                                <g:each var="instruction" in="${recipe.instructions.sort({it.paso})}">
                                    <g:if test="${instruction.photo != null && instruction.photo.size() > 1}">
                                        <div class="row" style="margin-bottom: 15px;">
                                            <div class="col-sm-6">
                                                <p>${instruction.paso}. ${instruction.description}</p><br>
                                            </div>
                                            <div class="col-sm-6">
                                                <img class="img-responsive img-thumbnail" src="${createLink(controller:'instruction',
                                                action:'displayGraph', params: [id:instruction.id])}" style="max-height: 500px;" />
                                            </div>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <p>${instruction.paso}. ${instruction.description}</p><br>
                                    </g:else>
                                </g:each>
                        </div>
                    </div>
                    <g:if test="${recipe.video != null}">
                        <div style="width: 100%; margin: 0 auto;">
                            <iframe style="height:50%;width:100%;border:0;" frameborder="0" src="${recipe.video}" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </g:if>
                    <br>
                    <div class="row">
                        <div class="col-sm-4">
                            <p class="firma" style="text-align: left;">Autor: <a href="${createLink(controller:'web', action:'perfil', params: [username: recipe.person.username])}">
                                ${recipe.person.username}</a></p>
                        </div>
                        <div class="col-sm-4">
                            <g:if test="${session.tu == true}">
                                <g:if test="${recipe.person.username == session.user}">
                                    <a class="btn btn-primary btn-lg center-block botones b1" href="${createLink(controller: 'web',
                                            action: 'editarReceta', params: [id: recipe.id])}" style="margin-right: 2%">Editar receta</a>
                                </g:if>
                                <g:elseif test="${recipe in culinairegrails.Person.findByUsername(session.user).favoriteRecipes}">
                                    <a class="btn btn-primary btn-lg center-block botones b1" href="${createLink(controller: 'person', action:
                                            'removeFavoriteRecipe', params: [id: recipe.id])}" style="margin-left: 14%">Dejar de seguir</a>
                                </g:elseif>
                                <g:else>
                                    <a class="btn btn-primary btn-lg center-block botones b1" href="${createLink(controller: 'person', action:
                                            'addFavoriteRecipe', params: [id: recipe.id])}" style="margin-left: 14%">Seguir</a>
                                </g:else>
                            </g:if>
                        </div>
                        <div class="col-sm-4">
                            <p class="firma">Popularidad: ${recipe.rating}</p>
                        </div>
                    </div>

                    <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                    <p class="tit" style="font-size: 40px" id="comentarios">Comentarios:</p>

                    <g:if test="${recipe.posts.size() > 0}">
                        <div class="row" style="padding-left: 8%">
                        <g:each var="post" in="${recipe.posts}">
                            <p style="font-family: GearedSlab; font-size: 26px; color: black">${post.content}<br> -
                                <a href="${createLink(controller:'web', action:'perfil', params: [username: post.person.username])}">
                                ${post.person.username}</a>, ${String.format("%tB %<td, %<tY", post.dateCreated)}</p><br>
                        </g:each>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="cuerpo" style="margin-top: -5%">No hay comentarios aún.</p>
                    </g:else>
                    <g:if test="${session.tu == true}">
                    <div class="row" style="padding-left: 5%">
                        <g:form controller="recipe" action="addComments" method="post" enctype="multipart/form-data">
                        <div class="col-sm-9">
                            <textarea id="post" rows="2" class="campo textarea" name="post" maxlength="400" required></textarea>
                        </div>
                        <div class="col-sm-3" style="margin-top: -0.6%">
                            <input type="submit" class="btn btn-primary btn-lg botones b2" style="margin-right: 2%; font-size: 30px"
                                   name="submit" value="Comentar" id="submit">
                            <input value="${recipe.id}" id="id" hidden name="id">
                        </div>
                        </g:form>
                    </div>
                    </g:if>
                    <br>
                    <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                    <g:if test="${recipe.person.recipes.size() > 1}">
                        <p class="tit" style="font-size: 40px">Mas recetas del autor: ${recipe.person.username}</p>
                        <g:each var="recipe2" in="${recipe.person.recipes}">
                            <p style="font-family: GearedSlab; font-size: 30px; margin: 0">- <a href="${createLink(controller:'web', action:'abrirReceta',
                                    params: [name: recipe2])}">${recipe2.name}</a></p><br>
                        </g:each>
                    </g:if>
                    <g:else>
                        <g:if test="${session.tu == true && session.user == recipe.person.username}">
                            <p class="cuerpo">No tienes más recetas.</p>
                        </g:if>
                        <g:else>
                            <p class="cuerpo">El autor ${recipe.person.username} no tiene más recetas.</p>
                        </g:else>
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