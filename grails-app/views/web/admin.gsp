<%@ page import="culinairegrails.Admin; culinairegrails.Contact; culinairegrails.Opinion" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Administrador: ${admin.username}</title>
</head>
<body>
<div class="container">
    <div class="texto">
        <div class="cuerpo">
            <p class="tit" id="" style="font-size: 40px">Bienvenido: ${admin.username}</p>
            <div class="row">
                <div class="col-sm-5">
                    <div class="col-sm-9" align="center">
                        ${admin.name} ${admin.lastname}<br><br>
                        <p class="firma" style="text-align: center; padding-left: 3%;">Popularidad: ${admin.rating}</p>
                    </div>
                    <div class="" align="center">
                        <a class="btn btn-primary btn-lg botones b1" href="${createLink(uri: '/conf')}" style="margin-left: 4%; width: 80%">
                            Conf</a>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="row">
                        <g:if test="${Contact.list().size() > 0}">
                            <p id="titulo">Contactos:</p>
                            <g:each var="contacto" in="${Contact.list()}">
                                - ${contacto.issue}: ${contacto.description}<br>
                            </g:each>
                        </g:if>
                        <g:else>
                            <p id="titulo">No hay mensajes pendientes.</p>
                        </g:else>
                    </div>
                    <br>
                    <div class="row">
                        <g:if test="${Opinion.list().size() > 0}">
                            <p id="titulo">Comentarios y sugerencias:</p>
                            <g:each var="comentario" in="${Opinion.list()}">
                                - ${comentario.description}<br>
                            </g:each>
                        </g:if>
                        <g:else>
                            <p id="titulo">No hay comentarios ni sugerencias.</p>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>