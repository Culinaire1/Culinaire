<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Publicar receta</title>
    <asset:javascript src="AgregarIngrediente.js"/>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <p class="tit" id="" style="font-size: 40px">PUBLICAR NUEVA RECETA:</p>
        <div class="row">
            <div class="center-block ing" style="width:80%">
                <g:if test="${flash.error}">
                    <ul class="message">
                        <g:each in="${flash.error}" var="message">
                            <li>The ${message} is not valid</li>
                        </g:each>
                    </ul>
                </g:if>
                <g:form controller="recipe" action="save" method="post" enctype="multipart/form-data">
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="name" class="input-group-addon tit">Nombre*</label>
                        </div>
                        <div class="col-sm-9">
                            <input type="text" class="form-control campo" aria-describedby="basic-addon1" name="name" required id="name">
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="category" class="input-group-addon tit">Categoria*</label>
                        </div>
                        <div class="col-sm-9">
                            <select class="form-control campo" id="category" name="category" required>
                                <g:each var="category" in="${categories}">
                                    <option>${category.name}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="country" class="input-group-addon tit">Pais*</label>
                        </div>
                        <div class="col-sm-9">
                            <select class="form-control campo" id="country" name="country" required>
                                <g:each var="country" in="${countries}">
                                    <option>${country.name}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="country" class="input-group-addon tit">Plato Tipico*</label>
                        </div>
                        <div class="col-sm-9">
                            <input type="checkbox" style="transform: scale(1.5); margin-top: 2%; margin-left: 1%">
                            <span class="campo" style="padding-left: 1%">¿Ésta receta es de un plato típico?</span>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="difficulty" class="input-group-addon tit">Dificultad*</label>
                        </div>
                        <div class="col-sm-9">
                            <select class="form-control campo" id="difficulty" name="difficulty" required>
                                <g:each var="dificultad" in="${difficulties}">
                                    <option>${dificultad.level}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="duration" class="input-group-addon tit">Duracion*</label>
                        </div>
                        <div class="col-sm-9">
                            <select class="form-control campo" id="duration" name="duration" required>
                                <g:each var="duracion" in="${durations}">
                                    <option>${duracion.duration}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="input-group" style="padding-top: 1%; padding-bottom: 1%">
                        <div class="col-sm-3">
                            <span class="input-group-addon tit">Imagen*</span>
                        </div>
                        <div class="col-sm-9">
                            <input type="file" accept="image/*" id="photo" name="photo" required style="font-family: 'GearedSlab', sans-serif; font-size: 19px;"/>
                        </div>
                    </div>
                    <div class="input-group" style="padding-bottom: 2%">
                        <div class="col-sm-3">
                            <label for="description" class="input-group-addon tit">Descripcion*</label>
                        </div>
                        <div class="col-sm-9">
                            <textarea id="description" rows="2" class="campo textarea" maxlength="400" name="description" required></textarea>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="ingredientes" class="input-group-addon tit">Ingredientes*</label>
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <ul class="nada" id="ingredientes">
                                    <li>
                                        <div class="col-sm-6">
                                            <span class="input-group-addon tit" style="text-align: left">Nombre*</span>
                                        </div>
                                        <div class="col-sm-6">
                                            <span class="input-group-addon tit" style="text-align: left">Cantidad*</span>
                                        </div>
                                    </li>
                                    <li id="ingLi1">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control campo publicar" placeholder="" aria-describedby="basic-addon1"
                                            id="ing1" name="ing1" required>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control campo publicar" placeholder="100 gramos"
                                                   aria-describedby="basic-addon1" id="quantity1" name="quantity1" required>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <br>
                            <div class="row" id="ingDiv" align="right">
                                <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="add_ingredient" value="2">
                                    Agregar</button>
                                <input value="1" id="ingNum" name="ingNum" hidden>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="instructions" class="input-group-addon tit">Preparacion*</label>
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <ul class="nada" id="instructions">
                                    <li>
                                        <div class="col-sm-6">
                                            <label for="des1" class="input-group-addon tit" style="text-align: left">Pasos*</label>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="photo1" class="input-group-addon tit" style="text-align: left">Foto</label>
                                        </div>
                                    </li>
                                    <li id="insLi1">
                                        <div class="row">
                                        <div class="col-sm-6">
                                            <textarea id="des1" rows="2" class="campo textarea" name="des1" maxlength="400" required></textarea>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="file" id="photo1" name="photo1" accept="image/*"/>
                                        </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <br>
                            <div class="row" id="insDiv" align="right">
                                <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="add_instruction" value="2">
                                    Agregar</button>
                                <input value="1" id="insNum" hidden name="insNum">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <span class="input-group-addon tit">Video</span>
                        </div>
                        <div class="col-sm-9">
                            <input type="url" class="form-control campo" placeholder="URL" aria-describedby="basic-addon1" id="video" name="video">
                        </div>
                    </div>
                    <br>
                    <input type="submit" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%" value="Publicar" id="publish">
                </g:form>
            </div>
        </div>
        <br>
    </div>
</div>
</body>
</html>
