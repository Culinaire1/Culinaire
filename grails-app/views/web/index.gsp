<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Inicio</title>
</head>
<body>
<div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <g:img dir="images" file="f1.jpg" class="first-slide imagen" alt="First slide"/>
                <!img class="first-slide imagen" src="Images/f1.jpg" alt="First slide">
                <div class="container">
                    <div class="carousel-caption intro">
                        <h1>¡Forma parte de Culinaire!</h1>
                        <p>Regístrate y adéntrate en el mundo de la cocina.</p>
                        <p><a class="btn btn-lg btn-primary botones" href="${createLink(action: 'ingresar')}" role="button">Regístrate</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <g:img dir="images" file="f4.jpg" class="second-slide imagen" alt="Second slide"/>
                <!img class="second-slide imagen" src="Images/f4.jpg" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption intro">
                        <h1>Deléitate con los mejores sabores</h1>
                        <p>Dentro del recetario encontrarás los mejores platos.</p>
                        <p><a class="btn btn-lg btn-primary botones" href="${createLink(action: 'favoritos')}" role="button">Favoritos</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <g:img dir="images" file="f3.jpg" class="third-slide imagen" alt="Third slide"/>
                <!img class="third-slide imagen" src="Images/f3.jpg" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption intro">
                        <h1>Visita los mejores restaurantes</h1>
                        <p>En nuestra sección de restaurantes encontrarás todos los restaurantes de tu ciudad.</p>
                        <p><a class="btn btn-lg btn-primary botones" href="#" role="button">Restaurantes</a></p>
                    </div>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div><!-- /.carousel -->
    <div class="texto">
        <div class="cuerpo">
            <p id="titulo">¡El centro de la comida ha llegado!</p>
            <p>Hemos elaborado la página de tus sueños, donde podrás conocer comida internacional, publicar
            y calificar recetas. <br> ¿Qué esperas?, regístrate o accede.<br> </p>
            <p id="firma">Grupo Culinaire</p>
        </div>
    </div>
</div>
</body>
</html>