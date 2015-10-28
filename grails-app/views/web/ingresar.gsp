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
            <div class="center-block ing" style="width:50%;">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#persona">Persona</a></li>
                    <li><a data-toggle="tab" href="#restaurante">Restaurante</a></li>
                </ul>

                <div class="tab-content">
                    <div id="persona" class="tab-pane fade in active">
                        <br>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="name">Nombre:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="apellido">Apellido:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="user">Usuario:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="password">Contraseña:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="password2">Repetir contraseña:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="email">Correo:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="email2">Repetir correo:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="fecha">Cumpleaños:</span>
                            </div>
                            <div class="col-sm-7">
                                <label for="entry_date"></label>
                                <input type="date" name='entry_date' class="form-control campo" id="entry_date" value="2015-12-12">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="foto">Imagen:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="file" name="avatar" id="avatar" />
                            </div>
                        </div>
                        <br>
                        <button type="button" class="btn btn-primary btn-lg center-block botones b2">Registrar</button>
                    </div>
                    <div id="restaurante" class="tab-pane fade">
                        <br>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="name2">Nombre:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="ciudad">Ciudad:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="direccion">Dirección:</span>
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
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="user2">Usuario:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="password3">Contraseña:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="password4">Repetir contraseña:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="email3">Correo:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="email4">Repetir correo:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="foto2">Imagen:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="file" name="avatar" id="avatar2" />
                            </div>
                        </div>

                        <br>
                        <button type="button" class="btn btn-primary btn-lg center-block botones b2">Registrar</button>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <hr style="width: 90%; color: #111160; height: 4px; background-color:#111160;" />
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
                <div class="center-block" style="width:50%;">
                    <g:form controller="user" action="login">
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="user5">Usuario:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="username">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="col-sm-5">
                                <span class="input-group-addon" id="password5">Contraseña:</span>
                            </div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="password">
                            </div>
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