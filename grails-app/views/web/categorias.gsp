<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Categorías</title>
    <style>
    img {
        padding: 3% 0 0 0;
    }
        .row {
            padding-left: 2%;
            padding-right: 2%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="fill">
        <br>
        <div class="texto row container">
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Aperitivos"])}"><g:img dir="images/iconos" file="aperitivos.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Arroces"])}"><g:img dir="images/iconos" file="arroces.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Aves"])}"><g:img dir="images/iconos" file="aves.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Bebidas"])}"><g:img dir="images/iconos" file="bebidas.png" class="img-responsive"/></a>
            </div>
        </div>
        <br>

        <div class="texto row container">
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Carnes"])}"><g:img dir="images/iconos" file="carnes.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Ensaladas"])}"><g:img dir="images/iconos" file="ensaladas.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Frutas"])}"><g:img dir="images/iconos" file="frutas.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Pan"])}"><g:img dir="images/iconos" file="pan.png" class="img-responsive"/></a>
            </div>
        </div>
        <br>

        <div class="texto row container">
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Pastas"])}"><g:img dir="images/iconos" file="pastas.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Pescados"])}"><g:img dir="images/iconos" file="pescados.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Platos"])}"><g:img dir="images/iconos" file="platos.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Postres"])}"><g:img dir="images/iconos" file="postres.png" class="img-responsive"/></a>
            </div>
        </div>
        <br>

        <div class="texto row container">
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Salsas"])}"><g:img dir="images/iconos" file="salsas.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Sopas"])}"><g:img dir="images/iconos" file="sopas.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <a href="${createLink(controller:'web', action:'findCategory', params: [category: "Vegetales"])}"><g:img dir="images/iconos" file="vegetales.png" class="img-responsive"/></a>
            </div>
            <div class="col-sm-3 col-xs-3">
                <g:img dir="images" file="icono.jpg" class="img-responsive"/>
            </div>
        </div>
        <br>
    </div>
</div>
</body>
</html>