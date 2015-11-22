<%@ page contentType="text/html;charset=UTF-8" import="culinairegrails.Person"%>

<html>
<head>
    <meta name="layout" content="base"/>
    <title>Editar Restaurante</title>
    <asset:javascript src="addCity.js"/>
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
                        <g:form controller="restaurant" action="update"  method="post" enctype="multipart/form-data" >
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Nombre*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="nameR"
                                           maxlength="50" required value="${restaurant.name}" id="nameR" >
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <label for="cuisine" class="input-group-addon">Cocina*</label>
                                </div>
                                <div class="col-sm-7">
                                    <select class="form-control campo" id="cuisine" name="cuisine" required>
                                        <g:each var="cuisine" in="${cuisines}">
                                            <g:if test="${cuisine.name == restaurant.cuisine.name}">
                                                <option selected>${cuisine.name}</option>
                                            </g:if>
                                            <g:else>
                                                <option>${cuisine.name}</option>
                                            </g:else>
                                        </g:each>
                                    </select>
                                </div>
                            </div>

                            <div id="cities" class="direccion">
                                <g:each var="city" in="${restaurant.cities}" status="counter">
                                    <div id="cityDiv${counter+1}">
                                        <div class="input-group">
                                            <div class="col-sm-5">
                                                <span class="input-group-addon">Ciudad*</span>
                                            </div>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control campo" aria-describedby="basic-addon1"
                                                       name="city1" required value="${city.name}" id="city${counter+1}">
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <div class="col-sm-5">
                                                <span class="input-group-addon">Direcciones*</span>
                                            </div>
                                            <div class="col-sm-7 addDir" id="directions${counter+1}">
                                                <g:each var="dir" in="${city.directions.findAll{it.restaurant.id == restaurant.id}}" status="counter2">
                                                    <input type="text" class="form-control campo direccion" aria-describedby="basic-addon1"
                                                       required value="${dir.address}" id="city${counter+1}dir${counter2+1}"
                                                           name="city${counter+1}dir${counter2+1}">
                                                </g:each>
                                            </div>
                                            <div class="row addDir" align="right">
                                                <g:set var="num" value="${city.directions.findAll{it.restaurant.id == restaurant.id}.size()}"/>
                                                <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="add_dir${counter+1}"
                                                        value="${counter+1}" onclick="addDirToDom2(this)">Agregar Direccion</button>

                                                <input value="${num}" id="cityDirNum${counter+1}" name="cityDirNum${counter+1}" hidden>
                                                <g:if test="${num > 1}">
                                                    <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="del${counter+1}"
                                                            value="${counter+1}" onclick="removeDirFromDom2(this)">Quitar</button>
                                                </g:if>
                                            </div>
                                        </div>
                                    </div>
                                </g:each>
                            </div>

                            <div class="row addDir" align="right" id="delDiv">
                                <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="add_city"
                                        value="${restaurant.cities.size()+1}">Agregar Ciudad</button>
                                <input value="${restaurant.cities.size()}" id="citiesNum" name="citiesNum" hidden>
                                <g:if test="${restaurant.cities.size() > 1}">
                                    <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="delcity" name="delcity"
                                    onclick="removeCityFromDom()">Quitar</button>
                                </g:if>
                            </div>

                            <div class="input-group direccion">
                                <div class="col-sm-5">
                                    <label for="description" class="input-group-addon">Descripción*</label>
                                </div>
                                <div class="col-sm-7">
                                    <textarea id="description" rows="2" class="campo textarea" name="description" required>${restaurant.description}</textarea>
                                </div>
                            </div>

                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Usuario*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="usernameR"
                                           maxlength="15" required value="${restaurant.username}" id="usernameR">
                                </div>
                            </div>

                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Contraseña*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1"
                                           name="passwordR" required id="passwordR" value="${restaurant.password}">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Repetir contraseña*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="password2R"
                                           required id="password2R" value="${restaurant.password}">
                                </div>
                            </div>

                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="emailR"
                                           required value="${restaurant.email}" id="emailR">
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Repetir correo*</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="email2R"
                                           required value="${restaurant.email}" id="email2R">
                                </div>
                            </div>

                            <div class="input-group" style="margin-top: -1%">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Imagen</span>
                                </div>
                                <div class="col-sm-7" style="margin-top: 1.5%">
                                    <input type="file" name="photoR" id="photoR" accept="image/*" style="font-family: 'GearedSlab',
                                    sans-serif; font-size: 16px;"/>
                                </div>
                            </div>

                            <div class="input-group">
                                <div class="col-sm-5">
                                    <span class="input-group-addon">Pagina Web</span>
                                </div>
                                <div class="col-sm-7">
                                    <input type="url" class="form-control campo" placeholder="" aria-describedby="basic-addon1" name="websiteR"
                                           id="websiteR" value="${restaurant.website}">
                                </div>
                            </div>

                            <br>
                            <input type="submit" class="btn btn-primary btn-lg center-block botones b2" value="Guardar Cambios" id="create">
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
        <asset:javascript src="passwordValidatorR.js"/>
        <asset:javascript src="emailValidatorR.js"/>
        <br>
        <br>
        <br>
    </div>
</div>
</body>
</html>