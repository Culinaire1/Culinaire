<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><g:layoutTitle default="Page"/></title>

    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon2.ico')}" type="image/x-icon" />

    <!link rel="stylesheet" href="${resource(dir: 'css', file: 'main2.css')}" type="text/css">
    <asset:stylesheet src="bootstrap.css"/>

    <asset:stylesheet src="main2.css"/>
    <asset:stylesheet src="bootstrap-rating.css"/>

    <!link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css.css')}" type="text/css">
    <style>
    @font-face { font-family: Abraham; src: url(${resource(dir: 'fonts', file: 'AbrahamLincoln.ttf')})}
    @font-face { font-family: Cylburn; src: url(${resource(dir: 'fonts', file: 'Cylburn.ttf')})}
    @font-face { font-family: GearedSlab; src: url(${resource(dir: 'fonts', file: 'GearedSlab.ttf')})}
    @font-face { font-family: GrandHotel; src: url(${resource(dir: 'fonts', file: 'GrandHotel-Regular.otf')})}
    @font-face { font-family: Liberator; src: url(${resource(dir: 'fonts', file: 'Liberator-Light.ttf')})}
    </style>

    <style type="text/css">
        .rgt{
            font-size: 20px;
            color: #333387;
        }
        .tooltip.right .tooltip-arrow{
            border-right-color: #fff;
        }
        .tooltip-inner {
            background-color: #fff ;
            font-size: 20px;
            color: #03034c;
        }
        .rgt-st{
            cursor: pointer;
        }

    </style>

    <!-- Bootstrap core JavaScript -->
    <asset:javascript src="jquery-1.11.2.min.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="bootstrap-rating.min.js"/>
    <script>
        $(function () {

            $(".rating-symbol").on('click', function(){

                var validateCase;
                validateCase= $(this).closest('.rgt-st').find('input.rating').data("case");

                if (validateCase != undefined){

                    if (validateCase=="offsession"){
                        $('#modalAlert1').modal('show');
                    }else if (validateCase=="notperson"){
                        $('#modalAlert2').modal('show');
                    }
                    //alert("none");
                }else{
                    var valor, tipo, id, counter, rgt;
                    valor = $(this).closest('.rgt-st').find('input.rating').val();
                    tipo = $(this).closest('.rgt-st').find('input.rating').data("tipo");
                    id= $(this).closest('.rgt-st').find('input.rating').data("id");
                    counter=$(this).closest('.rgt').find('span.rgt-counter');
                    rgt=$(this).closest('.rgt-st').find('input.rating');


                    $.ajax({
                        method: "POST",
                        url: "votacion",
                        data: { valor: valor, tipo:tipo, id:id  }
                    })
                        .done(function(data) {

                            if (data.error == true){
                                if(data.errorcode == -1){
                                    $('#modalAlert3').modal('show');
                                    rgt.val(data.result);
                                }else if (data.errorcode == -2){
                                    alert("system error")
                                }
                                //alert("fallo");
                            }else {
                                var template
                                template='<span class="glyphicon glyphicon-refresh"></span>'
                                counter.text(data.result);
                                counter.tooltip({title: template, html:true, placement : 'right', delay: { "show": 500, "hide": 100 }});
                                counter.tooltip('show');
                                setTimeout(function(){
                                   counter.tooltip('hide');
                                }, 600);
                                //counter.tooltip('hide');
                                //alert("user:"+data.idv+" voter:"+data.idu)
                            }

                        })
                        .fail(function() {
                            alert( "System error" );
                        })
                        .always(function() {
                            //Código que siempre se ejecuta al finalizar sin importar si fue o no un error.
                        });
                }

            });
        });
    </script>

    <g:layoutHead/>
</head>
<body>
<div class="masthead container">
    <nav>
        <ul class="nav nav-justified logo">
            <li><g:img dir="images" file="Logo.png"/>
            <!img src="../../../web-app/images/Logo.png"></li>
            <li>
                <form class="navbar-form" role="search" controller="web" action="barraBusqueda" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar..." name="srch_term">
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
                        <li><a href="${createLink(action: 'restaurantes')}">Restaurantes</a></li>
                        <li><a href="${createLink(action: 'recetas')}">Recetas</a></li>
                        <li><a href="${createLink(controller: 'web', action: 'tipicos')}">Platos típicos</a></li>
                    </ul>
                </li>
                <li class="dropdown active"><a href="${createLink(action: 'categorias')}" class="dropdown-toggle">Categorías</a>
                </li>
                <li class="dropdown active">
                    <g:if test="${session.tu == true}">
                        <a class="dropdown-toggle">Favoritos</a>
                    </g:if>
                    <g:else><a href="${createLink(action: 'favoritos')}" class="dropdown-toggle">Favoritos</a></g:else>
                    <ul class="dropdown-menu">
                        <g:if test="${session.tu == true}">
                            <li><a href="${createLink(action: 'recetas_favoritas')}">Recetas</a></li>
                            <li><a href="${createLink(controller: 'web', action: 'usuarios')}">Usuarios</a></li>
                        </g:if>
                    </ul>
                </li>
                <g:if test="${session.user}">
                    <li class="dropdown active"><a class="dropdown-toggle">${session.user}</a>
                        <ul class="dropdown-menu">
                            <g:if test="${session.tu == 'admin'}">
                                <li><a href="${createLink(action: 'admin')}">Admin</a></li>
                                <li><g:link controller="user" action="logout">Salir</g:link></li>
                            </g:if>
                            <g:elseif test="${session.tu}">
                                <li><a href="${createLink(action: 'perfil')}">Perfil</a></li>
                                <li><a href="${createLink(action: 'publicar')}">Publicar</a></li>
                                <li><g:link controller="user" action="logout">Salir</g:link></li>
                            </g:elseif>
                            <g:else>
                                <li><a href="${createLink(action:'abrirRestaurante', params: [user: session.user])}">Perfil</a></li>
                                <li><a href="${createLink(action:'carta')}">Carta</a></li>
                                <li><g:link controller="user" action="logout">Salir</g:link></li>
                            </g:else>
                        </ul>
                    </li>
                </g:if>
                <g:else>
                    <li><a href="${createLink(controller: 'web', action: 'ingresar')}" class="dropdown-toggle">Acceder</a></li>
                </g:else>
            </ul>
        </div>
    </nav>
</div>
<g:layoutBody/>
<div class="masthead container">
    <div class="masthead">
        <nav>
            <ul class="nav nav-justified">
                <li><a href="${createLink(action: 'index')}" role="button" class="foot">Inicio</a></li>
                <li><a href="${createLink(action: 'comentarios')}" role="button" class="foot">Comentarios y sugerencias</a></li>
                <li><a href="${createLink(action: 'faq')}" role="button" class="foot">FAQ</a></li>
            </ul>
        </nav>
        <nav>
            <ul class="nav nav-justified">
                <li><a href="${createLink(action: 'nosotros')}" role="button" class="foot">¿Quiénes somos?</a></li>
                <li><a href="${createLink(action: 'contacto')}" role="button" class="foot">Contáctenos</a></li>
                <li><a href="${createLink(action: 'acerca')}" role="button" class="foot">Acerca de...</a></li>
            </ul>
        </nav>
    </div>
</div>

<div class="modal fade" id="modalAlert1" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title tit">¡Ups!</h3>
            </div>
            <div class="modal-body">
                <div class="cuerpo">
                    <h3 class="text-center">Para registrar su voto es necesario iniciar sesión como Persona</h3>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary botones b1" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>&nbsp;
                    Cerrar
                </button>
                <a href="${createLink(controller: 'web', action: 'ingresar')}" class="btn btn-primary botones b1">
                    <span class="glyphicon glyphicon-user"></span>&nbsp
                    Acceder
                </a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modalAlert2" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title tit">¡Ups!</h3>
            </div>
            <div class="modal-body">
                <div class="cuerpo">
                    <h3 class="text-center">Por políticas de éste sitio, pueden ejercer el voto de puntuación solo los usuarios registrados como Persona</h3>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary botones b1" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>&nbsp;
                    Cerrar
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modalAlert3" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title tit">Opps!!!</h3>
            </div>
            <div class="modal-body">
                <div class="cuerpo">
                    <h3 class="text-center">Por políticas de este sitio, NO puede ejercer el voto de puntuación en su perfil o en sus recetas asociadas </h3>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary botones b1" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>&nbsp;
                Cerrar
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<footer class="footer" id="foot3">
    <div class="container">
        <p class="text">Culinaire - 2015</p>
    </div>
</footer>


</body>
</html>
