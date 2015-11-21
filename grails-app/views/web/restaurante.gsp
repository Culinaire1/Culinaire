<%@ page import="culinairegrails.Person" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Restaurante</title>
</head>
<body>
<div class="container">
    <div class="fill nosotros">
        <br>
        <br>
        <div class="texto">
            <div class="center-block ing" style="width:80%;">
                <g:if test="${restaurante == null}">
                    <p class="cuerpo">Restaurante no encontrado con ese nombre.</p>
                </g:if>
                <g:else>
                    <div class="row">
                        <div class="col-sm-6">
                            <img class="img-responsive img-thumbnail" src="${createLink(controller:'restaurant',
                                    action:'displayGraph', params: [name:restaurante.name]) }" style="max-height: 600px;"/>
                        </div>
                        <div class="col-sm-6">
                            <p class="tit" style="font-size: 40px"><a href="${restaurante.website}">${restaurante.name}</a></p>
                            <div class="texto row">
                                <div class="cuerpo" style="padding-bottom: 0; padding-top: 0">
                                    <p>
                                        ${restaurante.description}
                                    </p>
                                </div>
                            </div>
                            <div class="texto row">
                                <div class="cuerpo" style="padding-bottom: 0; padding-top: 0">
                                    <p>
                                    <p>Menú de comidas:</p>
                                    <g:each var="comida" in="${restaurante.menu.plates}">
                                        - ${comida.name}<br>
                                    </g:each>
                                </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <g:each var="ciudad" in="${restaurante.cities}">
                        <p class="cuerpo" style="padding-bottom: 0">${ciudad}</p>
                        <ul class="nav nav-tabs">
                            <g:each var="direccion" in="${ciudad.directions.findAll{it.restaurant == restaurante}}" status="counter">
                                <g:if test="${counter == 0}">
                                    <li class="active">
                                        <a data-toggle="tab" href="#${ciudad}${counter+1}">${direccion}</a>
                                    </li>
                                </g:if>
                                <g:else>
                                    <li>
                                        <a data-toggle="tab" href="#${ciudad}${counter+1}">${direccion}</a>
                                    </li>
                                </g:else>
                            </g:each>
                        </ul>
                    </g:each>

                    <g:each var="ciudad" in="${restaurante.cities}">
                        <div class="tab-content">
                        <g:each var="direccion" in="${ciudad.directions.findAll{it.restaurant == restaurante}}" status="counter">
                            <g:if test="${counter == 0}">
                                <div id="${ciudad}${counter+1}" class="tab-pane fade in active">

                            </g:if>
                            <g:else>
                                <div id="${ciudad}${counter+1}" class="tab-pane fade">
                            </g:else>
                            <div style="max-height:400px;width:100%;max-width:100%;list-style:none; transition: none;overflow:hidden;">
                                <div id="gmap-display" style="height:100%; width:100%;max-width:100%;">
                                    <iframe style="height:100%;width:100%;border:0;" frameborder="0"
                                            src="https://www.google.com/maps/embed/v1/place?q=${direccion.address.split(" ").join("+").replace("#", "%23")},
                                                +${ciudad},+${restaurante.country}&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU">
                                    </iframe>
                                </div>
                                <a class="google-map-code" href="https://www.treat-lice.com" id="grab-map-data">treatlice</a>
                                <style>#gmap-display .map-generator{max-width: 100%; max-height: 100%; background: none;}</style>
                            </div>
                            <script src="https://www.treat-lice.com/google-maps-authorization.js?id=49ffb604-6213-883d-5331-4a8993c1576f&c=google-map-code&u=1448065595"
                                    defer="defer" async="async">
                            </script>
                            </div>
                        </g:each>
                        </div>
                    </g:each>
                    <br>

                    <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                    <p class="tit" style="font-size: 40px" id="comentarios">Comentarios:</p>

                    <g:if test="${restaurante.posts.size() > 0}">
                        <div class="row" style="padding-left: 8%">
                            <g:each var="post" in="${restaurante.posts}">
                                <p style="font-family: GearedSlab; font-size: 26px; color: black">${post.content}<br> -
                                    <a href="${createLink(controller:'web', action:'perfil', params: [username: post.person.username])}">
                                        ${post.person.username}</a>, ${String.format("%tB %<td, %<tY", post.dateCreated)}
                                </p>
                                <br>
                            </g:each>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="cuerpo" style="margin-top: -5%">No hay comentarios aún.</p>
                    </g:else>
                    <g:if test="${session.tu == true}">
                    <div class="row" style="padding-left: 5%">
                        <g:form controller="restaurant" action="addComments" method="post" enctype="multipart/form-data">
                            <div class="col-sm-9">
                                <textarea id="post" rows="2" class="campo textarea" name="post" maxlength="400" required></textarea>
                            </div>
                            <div class="col-sm-3" style="margin-top: -0.6%">
                                <input type="submit" class="btn btn-primary btn-lg botones b2" style="margin-right: 2%; font-size: 30px"
                                       name="submit" value="Comentar" id="submit">
                                <input value="${restaurante.id}" id="id" hidden name="id">
                            </div>
                        </g:form>
                    </div>
                    </g:if>
                </g:else>
            </div>
            </div>
            <br>
            <br>
        </div>
    </div>
</body>
</html>