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
        <div class="row">
            <div class="center-block" style="width:50%;">
                <g:form controller="user" action="login" method="post" enctype="multipart/form-data">
                    <div class="input-group">
                        <g:if test="${flash.message}">
                            ${flash.message} <br>
                        </g:if>
                        <div class="col-sm-5">
                            <span class="input-group-addon">Usuario:</span>
                        </div>
                        <div class="col-sm-7">
                            <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" id="usernameL"
                                   name="usernameL" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-5">
                            <span class="input-group-addon">Contraseña:</span>
                        </div>
                        <div class="col-sm-7">
                            <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="passwordL"
                            required id="passwordL">
                        </div>
                    </div>
                    <br>
                    <input type="submit" class="btn btn-primary btn-lg center-block botones b2" value="Ingresar"><br/>
                </g:form>
            </div>
        </div>

        <br>
        <hr style="width: 90%; color: #111160; height: 4px; background-color:#111160;" />

        <p class="tit" id="registro">Registro:</p>
        <br>
        <div class="row">
            <div class="center-block ing" style="width:50%;">
                <g:if test="${flash.error}">
                    <ul class="message">
                        <g:each in="${flash.error}" var="message">
                            <li>The ${message} is not valid</li>
                        </g:each>
                    </ul>
                </g:if>
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
                                    <span class="input-group-addon">Nombre*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="name"
                                    maxlength="50" required value id="name">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Apellido*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="lastname"
                                    maxlength="50" required value id="lastname">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Usuario*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="username"
                                           maxlength="15" required value id="username">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="password" class="input-group-addon">Contraseña*</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" aria-describedby="basic-addon1" name="password"
                                    required value id="password">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="password2" class="input-group-addon">Repetir contraseña*</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" aria-describedby="basic-addon1" name="password2"
                                    required value id="password2">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email"
                                           required value id="email">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Repetir correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email2"
                                           required value id="email2">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="birthdate2" class="input-group-addon" id="fecha">Cumpleaños*</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="date" name='birthdate2' required class="form-control campo" id="birthdate2">
                                </div>
                            </div>
                            <div class="input-group" style="margin-top: -1%">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Imagen</span>
                                </div>
                                <div class="col-sm-7" style="margin-top: 1.5%">
                                    <input type="file" name="photo" id="photo" accept="image/*" style="font-family: 'GearedSlab', sans-serif; font-size: 16px;"/>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="pagina">Pagina Web</span>
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
                                    <span class="input-group-addon">Nombre*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="nameR"
                                           maxlength="50" required value id="nameR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="countryR" class="input-group-addon">Pais*</label>
                                </div>
                                <div class="col-sm-7">
                                    <select class="form-control campo" id="countryR" name="countryR" required>
                                        <g:each var="country" in="${countries}">
                                            <option>${country.name}</option>
                                        </g:each>
                                    </select>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Ciudad*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" id="city"
                                    required value name="city">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Dirección*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="address"
                                    required value id="address">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="description" class="input-group-addon">Descripción*</label>
                                </div>
                                <div class="col-sm-7">
                                    <textarea id="description" rows="2" class="campo textarea" name="description" required></textarea>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Usuario*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="usernameR"
                                           maxlength="15" required value id="usernameR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Contraseña*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1"
                                           name="passwordR" required value id="passwordR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Repetir contraseña*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="password2R"
                                           required value id="password2R">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="emailR"
                                           required value id="emailR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Repetir correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email2R"
                                           required value id="email2R">
                                </div>
                            </div>
                            <div class="input-group" style="margin-top: -1%">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Imagen*</span>
                                </div>
                                <div class="col-sm-7" style="margin-top: 1.5%">
                                    <input type="file" name="photoR" id="photoR" required accept="image/*" style="font-family: 'GearedSlab', sans-serif; font-size: 16px;"/>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Pagina Web</span>
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