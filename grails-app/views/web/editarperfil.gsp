<%@ page contentType="text/html;charset=UTF-8" import="culinairegrails.Person"%>

<html>
<head>
    <meta name="layout" content="base"/>
    <title>Editar Perfil</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>

        <p class="tit" id="registro">Editar Perfil:</p>
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

                <div class="tab-content">
                    <div id="persona" class="tab-pane fade in active">
                        <br>
                        <g:form controller="Person" action="update"  method="post" enctype="multipart/form-data" >
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Nombre*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="name"
                                           maxlength="50" required value="${person.name}" id="name" >
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Apellido*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="lastname"
                                           maxlength="50" required value="${person.lastname}" id="lastname">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Usuario*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="username"
                                           maxlength="15" required value="${person.username}" id="username">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="password" class="input-group-addon">Contraseña*</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" aria-describedby="basic-addon1" name="password"
                                           required value="${person.password}" id="password">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="password2" class="input-group-addon">Repetir contraseña*</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" aria-describedby="basic-addon1" name="password2"
                                           required value="${person.password}" id="password2">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email"
                                           required value="${person.email}" id="email">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Repetir correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email2"
                                           required value="${person.email}" id="email2">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="birthdate2" class="input-group-addon" id="fecha">Cumpleaños*</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="date" name='birthdate2' class="form-control campo" id="birthdate2">
                                </div>
                            </div>
                            <div class="input-group" style="margin-top: -1%">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Imagen</span>
                                </div>
                                <div class="col-sm-7" style="margin-top: 1.5%">
                                    <input type="file" name="photo"  value="${person.photo}" id="photo" accept="image/*"  style="font-family: 'GearedSlab', sans-serif; font-size: 16px;"/>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon" id="pagina">Pagina Web</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="url" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="website"
                                            value="${person.website}" id="website">
                                </div>
                            </div>
                            <br>
                            <input type="submit" class="btn btn-primary btn-lg center-block botones b2" value="Guardar Cambios" id="create">
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