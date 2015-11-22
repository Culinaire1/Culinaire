<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Editar receta</title>
    <asset:javascript src="AgregarIngrediente.js"/>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <p class="tit" id="" style="font-size: 40px">EDITAR RECETA:</p>
        <div class="row">
            <div class="center-block ing" style="width:80%">
                <g:if test="${flash.error}">
                    <ul class="message">
                        <g:each in="${flash.error}" var="message">
                            <li>The ${message} is not valid</li>
                        </g:each>
                    </ul>
                </g:if>
                <g:form controller="recipe" action="update" method="post" enctype="multipart/form-data">
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="name" class="input-group-addon tit">Nombre*</label>
                        </div>
                        <div class="col-sm-9">
                            <input type="text" class="form-control campo" aria-describedby="basic-addon1" name="name" required id="name"
                                   value="${recipe.name}">
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="category" class="input-group-addon tit">Categoria*</label>
                        </div>
                        <div class="col-sm-9">
                            <select class="form-control campo" id="category" name="category" required>
                                <g:each var="category" in="${categories}">
                                    <g:if test="${recipe.category.id == category.id}">
                                        <option selected>${category.name}</option>
                                    </g:if>
                                    <g:else>
                                        <option>${category.name}</option>
                                    </g:else>
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
                                    <g:if test="${recipe.country.id == country.id}">
                                        <option selected>${country.name}</option>
                                    </g:if>
                                    <g:else>
                                        <option>${country.name}</option>
                                    </g:else>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="input-group">
                        <div class="col-sm-3">
                            <label for="country" class="input-group-addon tit">Plato Tipico*</label>
                        </div>
                        <div class="col-sm-9">
                            <input type="checkbox" id="typical" name="typical" style="transform: scale(1.5); margin-top: 2%; margin-left: 1%">
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
                                    <g:if test="${recipe.difficulty.id == dificultad.id}">
                                        <option selected>${dificultad.level}</option>
                                    </g:if>
                                    <g:else>
                                        <option>${dificultad.level}</option>
                                    </g:else>
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
                                    <g:if test="${recipe.duration.id == duracion.id}">
                                        <option selected>${duracion.duration}</option>
                                    </g:if>
                                    <g:else>
                                        <option>${duracion.duration}</option>
                                    </g:else>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="input-group" style="padding-top: 1%; padding-bottom: 1%">
                        <div class="col-sm-3">
                            <span class="input-group-addon tit">Imagen*</span>
                        </div>
                        <div class="col-sm-9">
                            <input type="file" accept="image/*" id="photo" name="photo" style="font-family: 'GearedSlab', sans-serif; font-size: 19px;"/>
                        </div>
                    </div>
                    <div class="input-group" style="padding-bottom: 2%">
                        <div class="col-sm-3">
                            <label for="description" class="input-group-addon tit">Descripcion*</label>
                        </div>
                        <div class="col-sm-9">
                            <textarea id="description" rows="2" class="campo textarea" maxlength="400" name="description"
                                      required>${recipe.description}</textarea>
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
                                    <g:each var="quantity" in="${recipe.quantities}" status="counter">
                                        <li id="ingLi${counter+1}">
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control campo publicar" placeholder="" aria-describedby="basic-addon1"
                                                       id="ing${counter+1}" name="ing${counter+1}" required value="${quantity.ingredient}">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control campo publicar" aria-describedby="basic-addon1"
                                                       id="quantity${counter+1}" name="quantity${counter+1}" required value="${quantity.quantity}">
                                            </div>
                                        </li>
                                    </g:each>
                                </ul>
                            </div>
                            <br>
                            <div class="row" id="ingDiv" align="right">
                                <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="add_ingredient"
                                        value="${recipe.quantities.size()+1}">Agregar</button>
                                <input value="${recipe.quantities.size()}" id="ingNum" name="ingNum" hidden>
                                <g:if test="${recipe.quantities.size() > 1}">
                                    <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="del1" name="del1"
                                            onclick="addButtonD(this)">Quitar</button>
                                </g:if>
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
                                            <span class="input-group-addon tit" style="text-align: left">Pasos*</span>
                                        </div>
                                        <div class="col-sm-6">
                                            <span class="input-group-addon tit" style="text-align: left">Foto</span>
                                        </div>
                                    </li>
                                    <g:each in="${recipe.instructions.sort({it.paso})}" var="instruction" status="counter">
                                        <li id="insLi${counter+1}">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <textarea id="des${counter+1}" rows="2" class="campo textarea publicar" name="des${counter+1}"
                                                              maxlength="400" required>${instruction.description}</textarea>
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="file" class="publicar" id="photo${counter+1}" name="photo${counter+1}"
                                                           accept="image/*"/>
                                                </div>
                                            </div>
                                        </li>
                                    </g:each>
                                </ul>
                            </div>
                            <br>
                            <div class="row" id="insDiv" align="right">
                                <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="add_instruction"
                                        value="${recipe.instructions.size()+1}">Agregar</button>
                                <input value="${recipe.instructions.size()}" id="insNum" hidden name="insNum">
                                <g:if test="${recipe.instructions.size() > 1}">
                                    <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="del2" name="del2"
                                            onclick="addButtonD2(this)">Quitar</button>
                                </g:if>
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
                    <input value="${recipe.id}" id="id" hidden name="id"/>
                    <input type="submit" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%" value="Publicar" id="publish">
                </g:form>
            </div>
        </div>
        <br>
    </div>
</div>
</body>
</html>
