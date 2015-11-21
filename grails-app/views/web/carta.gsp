<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <asset:javascript src="addPlate.js"/>
    <title>Carta</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>

        <hr style="width: 90%; color: #111160; height: 4px; background-color:#111160;" />

        <p class="tit" id="registro">Carta:</p>
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
                        <g:form controller="restaurant" action="saveMenu"  method="post" enctype="multipart/form-data">
                            <div id="form">
                            <g:each var="plate" in="${restaurant.menu.plates}" status="counter">
                                <div id="plateDiv${counter+1}">
                                    <div class="input-group">
                                        <div class="col-sm-5">
                                            <span class="input-group-addon">Nombre*</span>
                                        </div>
                                        <div class="col-sm-7 addDir">
                                            <input type="text" class="form-control campo" aria-describedby="basic-addon1" name="plate${counter+1}"
                                                   maxlength="50" required value="${plate.name}" id="plate${counter+1}">
                                        </div>
                                        <div class="row addDir" align="right">
                                            <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="del${counter+1}"
                                            value="plateDiv${counter+1}">
                                                Quitar</button>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                            </div>
                            <div class="row addDir" align="right" id="addDiv">
                                <button type="button" class="btn btn-primary btn-xs botones b2 publicarB" id="add"
                                        value="${restaurant.menu.plates.size()+ 1}">
                                    Agregar Plato</button>
                                <input value="${restaurant.menu.plates.size()}" id="platesNum" name="platesNum" hidden>
                            </div>
                            <br>
                            <input type="submit" class="btn btn-primary btn-lg center-block botones b2" value="Guardar Cambios" id="create">
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
    </div>
</div>
</body>
</html>