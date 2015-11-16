<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Platos típicos</title>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <g:form controller="web" action="busquedatipicos" method="post" enctype="multipart/form-data">
            <p class="tit" id="" style="font-size: 40px">Pais</p>
            <div class="center-block ing" style="width:80%">
                <div class="input-group">
                    <label for="sel6"></label>
                    <select class="form-control campo" id="sel6" name="pais">
                        <option>Ninguna</option>
                        <g:each var="country" in="${countries}" >
                            <option>${country.name}</option>
                        </g:each>
                    </select>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <input type="submit" class="btn btn-primary btn-lg center-block botones b2" style="margin-right: 2%" value="Mostrar" id="buscar2">
                    </div>
                </div>
            </div>
        </g:form>
        <br>
    </div>
</div>
</body>
</html>