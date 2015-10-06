<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Categorías</title>
    <link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />

    <!link rel="stylesheet" href="${resource(dir: 'css', file: 'main2.css')}" type="text/css">
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="main2.css"/>
    <!link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css.css')}" type="text/css">
    <style>
    @font-face { font-family: Abraham; src: url('../fonts/AbrahamLincoln.ttf'); }
    @font-face { font-family: Cylburn; src: url('../fonts/Cylburn.ttf'); }
    @font-face { font-family: GearedSlab; src: url('../fonts/GearedSlab.ttf'); }
    @font-face { font-family: GrandHotel; src: url('../fonts/GrandHotel-Regular.otf'); }
    @font-face { font-family: Liberator; src: url('../fonts/Liberator-Light.ttf'); }
    </style>
</head>
<body>
<div class="masthead container">

    <nav>
        <ul class="nav nav-justified logo">
            <li><g:img dir="images" file="Logo.png"/></li>
            <li>
                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar..." name="srch-term" id="srch-term">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit" id="lupa"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </li>
        </ul>
    </nav>

    <nav>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar" id="boton">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div id="navbar" class="navbar-collapse collapse lista">
            <ul class="nav nav-justified ">
                <li><a href="${createLink(action: 'index')}" role="button">Inicio</a></li>
                <li class="dropdown active"><a href="${createLink(action: 'busqueda')}" class="dropdown-toggle">Búsqueda</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Restaurantes</a></li>
                        <li><a href="#">Platos típicos</a></li>
                    </ul>
                </li>
                <li class="dropdown active"><a href="${createLink(action: 'categorias')}" class="dropdown-toggle">Categorías</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Aperitivos</a></li>
                        <li><a href="#">Bebidas</a></li>
                        <li><a href="#">Carnes</a></li>
                        <li><a href="#">Vegetariano</a></li>
                        <li><a href="#">Postres</a></li>
                        <li><a href="#">Pasabocas</a></li>
                    </ul>
                </li>
                <li class="dropdown active"><a href="${createLink(action: 'favoritos')}" class="dropdown-toggle">Favoritos</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Recetas</a></li>
                        <li><a href="#">Usuarios</a></li>
                    </ul>
                </li>
                <li class="dropdown active"><a href="${createLink(action: 'perfil')}" class="dropdown-toggle">Acceder</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Registro</a></li>
                        <li><a href="#">Ingreso</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

</div>

<div class="container">
    <div id="mycarousel0" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="item active">
                <g:img dir="images" file="f7.jpg" class="img imagen" alt=""/>
                <!img src="Images/f7.jpg" alt="" class="img imagen">
                <div class="carousel-caption intro intro2">
                    <a href="#">Aperitivos</a>
                </div>
            </div>
        </div>
    </div>
    <div id="mycarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="item active">
                <g:img dir="images" file="f8.jpg" class="img imagen" alt=""/>
                <!img src="Images/f8.jpg" alt="" class="img imagen">
                <div class="carousel-caption intro intro2">
                    <a href="#">Postres</a>
                </div>
            </div>
        </div>
    </div>
    <div id="mycarouse2" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="item active">
                <g:img dir="images" file="f2.jpg" class="img imagen" alt=""/>
                <!img src="Images/f2.jpg" alt="" class="img imagen">
                <div class="carousel-caption intro intro2">
                    <a href="#">Carnes</a>
                </div>
            </div>
        </div>
    </div>
    <div class="masthead">
        <nav>
            <ul class="nav nav-justified">
                <li><a href="${createLink(action: 'index')}" role="button" class="foot">Inicio</a></li>
                <li><a href="#" role="button" class="foot">Comentarios y sugerencias</a></li>
                <li><a href="#" role="button" class="foot">FAQ</a></li>
            </ul>
        </nav>
        <nav>
            <ul class="nav nav-justified">
                <li><a href="#" role="button" class="foot">¿Quiénes somos?</a></li>
                <li><a href="#" role="button" class="foot">Contáctenos</a></li>
                <li><a href="#" role="button" class="foot">Acerca de...</a></li>
            </ul>
        </nav>
    </div>
</div>

<footer class="footer" id="foot3">
    <div class="container">
        <p class="text">Culinaire - 2015</p>
    </div>
</footer>

<!-- Bootstrap core JavaScript -->
<asset:javascript src="bootstrap.js"/>
<asset:javascript src="jquery-1.11.2.min.js"/>
<!g:javascript src="bootstrap.js" />
<!g:javascript src="jquery-1.11.2.min.js" />
</body>
</html>