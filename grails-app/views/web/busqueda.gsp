<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Busqueda</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <p class="tit" id="" style="font-size: 40px">BUSCADOR</p>
        <g:form controller="web" action="busquedaf" method="post" enctype="multipart/form-data" style="margin-bottom: 0">

        <div class="row">
            <div class="center-block ing" style="width:80%">
            <p class="tit" id="" style="font-size: 40px">Receta</p>
            <br>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon" id="ingredientes">Ingrediente:</span>
                    </div>
                    <div class="col-sm-9">
                        <!input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                        <label for="sel6"></label>
                        <select class="form-control campo" id="sel6" name="ingredienteB">
                            <option>Ninguna</option>
                            <g:each var="ingredient" in="${ingredients}">
                                <option>${ingredient}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon" id="categoria">Categoría:</span>
                    </div>
                    <div class="col-sm-9">
                        <!input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                        <label for="sel"></label>
                        <select class="form-control campo" id="sel" name="categoriaB">
                            <option>Ninguna</option>
                            <g:each var="category" in="${categories}">
                                <option>${category.name}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon" id="tiempo">Duración:</span>
                    </div>
                    <div class="col-sm-9">
                        <!input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                        <label for="sel4"></label>
                        <select class="form-control campo" id="sel4" name="duracionB">
                            <option>Ninguna</option>
                            <g:each var="duration" in="${durations}">
                                <option>${duration.duration}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon" id="dificultad">Dificultad:</span>
                    </div>
                    <div class="col-sm-9">
                        <!input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                        <label for="sel5"></label>
                        <select class="form-control campo" id="sel5" name="dificultadB">
                            <option>Ninguna</option>
                            <g:each var="difficult" in="${difficulties}">
                                <option>${difficult.level}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-6">
                        <!--button type="button" class="btn btn-primary btn-lg center-block botones b2" style="margin-left: 2%">Aleatorio</button-->
                        <input type="submit" class="btn btn-primary btn-lg center-block botones b2" style="margin-left: 2%" name="bsubmit" value="Aleatorio" id="buscar1">
                    </div>
                    <div class="col-sm-6">
                        <!--button type="button" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%">Buscar</button-->
                        <input type="submit" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%" name="bsubmit" value="Buscar" id="buscar2">
                    </div>
                </div>
                </g:form>
                <br>
                <hr style="width: 100%; color: #111160; height: 4px; background-color:#111160;" />
                <br>
                <p class="tit" id="" style="font-size: 40px">Restaurantes</p>
                <br>
                <g:form controller="web" action="busquedaRestaurantes" method="post" enctype="multipart/form-data" style="margin-bottom: 0">
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon" id="pais">País:</span>
                    </div>
                    <div class="col-sm-9">
                        <label for="sel2"></label>
                        <select class="form-control campo" id="sel2" name="paisR">
                            <option>Ninguna</option>
                            <g:each var="country" in="${countries}">
                                <option>${country.name}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <div class="col-sm-3">
                        <span class="input-group-addon" id="categoria2">Cocina:</span>
                    </div>
                    <div class="col-sm-9">
                        <!input type="text" class="form-control campo" placeholder="" aria-describedby="basic-addon1">
                        <label for="sel3"></label>
                        <select class="form-control campo" id="sel3" name="cocinaR">
                            <option>Ninguna</option>
                            <g:each var="cuisine" in="${cuisines}">
                                <option>${cuisine.name}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6">
                        <input type="submit" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%"  value="Buscar" id="buscar3">                    </div>
                </div>
                </g:form>
                <br>
                <br>
            </div>
        </div>
    </div>
</div>
</body>
</html>