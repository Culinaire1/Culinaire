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
        <hr style="width: 90%; color: #111160; height: 4px; background-color:#111160;" />

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
                        <g:form controller="Person" action="save" method="post" enctype="multipart/form-data">
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="nombre">Nombre:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="name"
                                    maxlength="50" required value id="name">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="apellido">Apellido:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="lastname"
                                    maxlength="50" required value id="lastname">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="user">Usuario:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="username"
                                           maxlength="15" required value id="username">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="clave">Contraseña:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="password"
                                    required value id="password">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="clave2">Repetir contraseña:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="password2"
                                    required value id="password2">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="correo">Correo:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email"
                                           required value id="email">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="correo2">Repetir correo:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email2"
                                           required value id="email2">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="fecha">Cumpleaños:</span>
                                </div>
                                <div class="col-sm-7">
                                    <label for="birthdate2"></label>
                                    <input type="date" name='birthdate2' class="form-control campo" id="birthdate2" value="2015-12-12">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="foto">Imagen:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="file" name="photo" id="photo" />
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="pagina">Pagina Web:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="url" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="website"
                                           id="website">
                                </div>
                            </div>
                            <br>
                            <input type="submit" class="btn btn-primary btn-lg center-block botones b2" value="Registrar" id="create">
                        </g:form>
                    </div>

                    <div id="restaurante" class="tab-pane fade">
                        <br>
                        <g:form controller="Restaurant" action="save" method="post" enctype="multipart/form-data">
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="name2">Nombre:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="nameR"
                                           maxlength="50" required value id="nameR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="pais">Pais:</span>
                                </div>
                                <div class="col-sm-7">
                                    <label for="countryR"></label>
                                    <select class="form-control campo" id="countryR" name="countryR" required>
                                        <g:each var="country" in="${countries}">
                                            <option>${country.name}</option>
                                        </g:each>
                                    </select>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="ciudad">Ciudad:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" id="city"
                                    required value name="city">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="direccion">Dirección:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="address"
                                    required value id="address">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="descripcion">Descripción:</span>
                                </div>
                                <div class="col-sm-7">
                                    <label for="description"></label>
                                    <textarea id="description" rows="2" class="campo textarea" name="description" required></textarea>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="user2">Usuario:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="usernameR"
                                           maxlength="15" required value id="usernameR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="password3">Contraseña:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="passwordR"
                                           required value id="passwordR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="password4">Repetir contraseña:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="password2R"
                                           required value id="password2R">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="email3">Correo:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="emailR"
                                           required value id="emailR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="email4">Repetir correo:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email2R"
                                           required value id="email2R">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="foto2">Imagen:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="file" name="photoR" id="photoR" />
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="pagina2">Pagina Web:</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="url" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="websiteR"
                                           id="websiteR">
                                </div>
                            </div>
                            <br>
                            <input type="submit" class="btn btn-primary btn-lg center-block botones b2" value="Registrar" id="create2">
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
        <asset:javascript src="passwordValidator.js"/>
        <asset:javascript src="emailValidator.js"/>
        <br>
        <br>
        <br>
    </div>
</div>
</body>
</html>