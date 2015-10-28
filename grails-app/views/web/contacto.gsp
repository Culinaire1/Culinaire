<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Contáctenos</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <div class="row">
            <div class="center-block ing" style="width:50%;">
                <div class="input-group">
                    <div class="col-sm-5">
                        <span class="input-group-addon" id="asunto">Asunto:</span>
                    </div>
                    <div class="col-sm-7">
                        <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-5">
                        <span class="input-group-addon" id="descripcion">Descripción:</span>
                    </div>
                    <div class="col-sm-7">
                        <label for="textarea"></label>
                        <textarea id="textarea" rows="2" class="campo textarea"></textarea>
                    </div>
                </div>
                <button type="button" class="btn btn-primary btn-lg center-block botones b2">Enviar</button>
            </div>
            <br>
        </div>
    </div>
</div>
</body>
</html>