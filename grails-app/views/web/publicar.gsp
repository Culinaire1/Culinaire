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
                        <span class="input-group-addon tit" id="ingredientes">Ingredientes:</span>
                    </div>
                    <div class="col-sm-9">
                        <div class="row">
                            <li class="nada">
                                <ul>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                                    </div>
                                </ul>
                            </li>
                        </div>
                        <div class="row">
                            <button type="button" class="btn btn-primary btn-xs center-block botones b2" style="margin-right: 2%; font-size: 20px; margin-top: 2px">Agregar</button>
                        </div>
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon tit" id="descripcion">Preparacion:</span>
                    </div>
                    <div class="col-sm-9">
                        <div class="row">
                            <li class="nada">
                                <ul>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                                    </div>
                                </ul>
                            </li>
                        </div>
                        <div class="row">
                            <button type="button" class="btn btn-primary btn-xs center-block botones b2" style="margin-right: 2%; font-size: 20px; margin-top: 2px; margin-bottom: 4px">Agregar</button>
                        </div>
                    </div>
                </div>
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
</div>
</body>
</html>