<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Publicar receta</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <p class="tit" id="" style="font-size: 40px">PUBLICAR NUEVA RECETA:</p>
        <div class="row">
            <div class="center-block ing" style="width:80%">
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon tit" id="nombre">Titulo:</span>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon tit" id="categoria">Categoria:</span>
                    </div>
                    <div class="col-sm-9">
                        <label for="sel"></label>
                        <select class="form-control campo" id="sel">
                            <g:each var="category" in="${categories}">
                                <option>${category.name}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon tit">Ingredientes:</span>
                    </div>
                    <div class="col-sm-9">
                        <div class="row">
                            <ul class="nada" id="ingredientes">
                                <li>
                                    <div class="col-sm-6">
                                        <span class="input-group-addon tit">Nombre:</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <span class="input-group-addon tit">Cantidad:</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo publicar" placeholder="" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo publicar" placeholder="100 gramos de ..." aria-describedby="basic-addon1">
                                    </div>
                                </li>
                                <li>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo publicar" placeholder="" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo publicar" placeholder="100 gramos de ..." aria-describedby="basic-addon1">
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <br>
                        <div class="row">
                            <button type="button" class="btn btn-primary btn-xs center-block botones b2" id="add" style="margin-right: 2%;
                            font-size: 20px; margin-top: 2px" value="agregar">Agregar</button>
                        </div>
                    </div>
                </div>
                <br>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon tit" id="descripcion">Preparacion:</span>
                    </div>
                    <div class="col-sm-9">
                        <div class="row">
                            <ul class="nada">
                                <li>
                                    <div class="col-sm-6">
                                        <span class="input-group-addon tit">Paso 1:</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <span class="input-group-addon tit">Foto:</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="col-sm-6">
                                        <label for="description"></label>
                                        <textarea id="description" rows="2" class="campo textarea" name="description" required></textarea>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="file" name="photoR" id="photoR" accept="image/*"/>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <br>
                        <div class="row">
                            <button type="button" class="btn btn-primary btn-xs center-block botones b2" style="margin-right: 2%;
                            font-size: 20px; margin-top: 2px; margin-bottom: 4px">Agregar</button>
                        </div>
                    </div>
                </div>
                <br>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon tit" id="pais">Pais:</span>
                    </div>
                    <div class="col-sm-9">
                        <label for="sel2"></label>
                        <select class="form-control campo" id="sel2">
                            <g:each var="country" in="${countries}">
                                <option>${country.name}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon tit" id="foto">Imagen:</span>
                    </div>
                    <div class="col-sm-9">
                        <input type="file" name="avatar" id="avatar" />
                    </div>
                </div>
                <button type="button" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%">Publicar</button>
            </div>
        </div>
        <br>
    </div>
    <asset:javascript src="AgregarIngrediente.js"></asset:javascript>
</div>
</body>
</html>