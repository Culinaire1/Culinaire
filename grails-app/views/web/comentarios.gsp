<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Comentarios</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <div class="row">
            <div class="center-block ing" style="width:50%;">
                <g:form controller="web" action="comentar" method="post" enctype="multipart/form-data">
                    <div class="input-group">
                        <div class="col-sm-5">
                            <span class="input-group-addon" id="descripcion">Comentario:</span>
                        </div>
                        <div class="col-sm-7">
                            <label for="textarea"></label>
                            <textarea id="textarea" rows="2" class="campo textarea" name="comentario" required></textarea>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%" value="Enviar" id="enviar">
                </g:form>
            </div>
            <br>
        </div>
    </div>
</div>
</body>
</html>