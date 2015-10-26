<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Ingresar</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <p class="tit" id="registro">Registro:</p>
        <br>
        <div class="row">
            <div class="center-block ing" style="width:400px;">
                <div class="input-group">
                    <span class="input-group-addon" id="name">Nombre:</span>
                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="apellido">Apellido:</span>
                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="user">Usuario:</span>
                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="password">Contraseña:</span>
                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="password2">Repetir contraseña:</span>
                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="email">Correo:</span>
                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="email2">Repetir correo:</span>
                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <br>
                <button type="button" class="btn btn-primary btn-lg center-block botones b2">Registrar</button>
            </div>
        </div>
        <br>
        <hr style="width: 90%; color: #111160; height: 4px; background-color:#111160;" />
        <br>
        <p class="tit" id="acceso">Acceso:</p>
        <br>
        <div class="row">
            <div class="center-block" style="width:400px;">
                <div class="input-group">
                    <span class="input-group-addon" id="user3">Usuario:</span>
                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="password3">Contraseña:</span>
                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                </div>
                <br>
                <button type="button" class="btn btn-primary btn-lg center-block botones b2">Ingresar</button>
            </div>
        </div>
        <br>
        <br>
    </div>
</div>
</body>
</html>