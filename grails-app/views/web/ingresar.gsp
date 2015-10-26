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
        <g:if test="${flash.message}">
            <div class="col-md-4 col-md-offset-4 ">
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>${flash.message}</strong>
                </div>
            </div>
        </g:if>
        <g:if test="${session.user}">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="alert alert-success" role="alert">Login as: ${session.user}</div>
                    <g:link controller="user" action="logout">Logout</g:link>
                </div>
            </div>
        </g:if>
        <g:else>
            <div class="row">
                <div class="center-block" style="width:400px;">
                    <g:form controller="User" action="login">
                        <div class="input-group">
                            <span class="input-group-addon" id="user3">Usuario:</span>
                            <input type="text" class="form-control campo" placeholder="Usuario" aria-describedby="basic-addon1" name="username">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon" id="password3">Contraseña:</span>
                            <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="password">
                        </div>
                        <br>
                        <input type="submit" class="btn btn-primary btn-lg center-block botones b2" value="Ingresar"><br/>
                    </g:form>
                </div>
            </div>
        </g:else>

        <br>
        <br>
    </div>
</div>
</body>
</html>