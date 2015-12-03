package culinairegrails

import grails.converters.JSON

class WebController {

    def index() {

    }
    def busqueda() {
        [categories:Category.list(), countries:Country.list(), difficulties:Difficulty.list(), ingredients:Ingredient.list(),
         durations: Duration.list(), cuisines: Cuisine.list()]
    }
    def busquedaf() {
        def ingrediente = params.ingredienteB
        def categoria = params.categoriaB
        def duracion = params.duracionB
        def dificultad = params.dificultadB
        def boton = params.bsubmit

        List<Recipe> f1, f2, f3, f4
        def resul = []
        if(ingrediente == "Ninguna")
            f1 = Recipe.list()
        else{
            //f1 = Recipe.findAll{quantities.findAll{it.ingredient.name==ingrediente}}
            f1=Recipe.list().findAll {it.quantities.findAll{it.ingredient.name==ingrediente}}
        }
        if (categoria=="Ninguna")
            f2 = f1
        else
            f2 = f1.findAll{it.category.name == categoria}

        if (duracion=="Ninguna")
            f3 = f2
        else
            f3 = f2.findAll{it.duration.duration == duracion}

        if(dificultad == "Ninguna")
            f4 = f3
        else
            f4 = f3.findAll {it.difficulty.level == dificultad}

        int numeroAleatorio = (int) (Math.random() * (f4.size() - 1)+0.3)
        resul.add(f4[numeroAleatorio])

        if(boton == "Buscar")
            render(view: "recetas",model:[categories: Category.list(), recipes: f4])
        if (boton == "Aleatorio"){
            if(f4.size()> 1) {
                render(view: "recetas", model: [categories: Category.list(), recipes: resul])
            }
            else
                render(view: "recetas", model: [categories: Category.list(), recipes: f4])
        }
    }
    def busquedaRestaurantes(){
        def pais=params.paisR
        def cocina=params.cocinaR
        List<Restaurant> f1,f2

        if(pais=="Ninguna")
            f1=Restaurant.list()
        else
            f1=Restaurant.list().findAll{it.country.name==pais}

        if(cocina=="Ninguna")
            f2=f1
        else
            f2=f1.findAll{it.cuisine.name==cocina}
        //render "hola"
        render(view: 'restaurantes',  model:[restaurants: f2])
    }
    def busquedatipicos(){
        def country2=params.pais
        def f
        if (country2 != "Ninguna")
            f = Recipe.findAll{country.name == country2 && typical == true}
        else
            f = Recipe.findAll{typical == true}
        println f
        render(view: "recetas", model: [categories: Category.list(), recipes: f])
    }
    def categorias() {
        [categories:Category.list()]
    }

    def perfil() {
    }

    def editarperfilpersona(){
        Person person = Person.findByUsername(session.user);
        render(view:"editarperfil", model: [person:person])
    }

    def carta(){
        Restaurant restaurant = Restaurant.findByUsername(session.user)
        [restaurant: restaurant]
    }

    def usuarios(){
        [person: Person.findByUsername(session.user)]
    }

    def recetas_favoritas(){
        [person: Person.findByUsername(session.user)]
    }

    def comentarios() {
    }

    def comentar(){
        new Opinion(description: params.comentario).save()
        redirect action:'index'
    }
    def contactar(){
        new Contact(issue: params.asunto, description: params.descripcion).save()
        redirect action:'index'
    }
    def faq() {
    }
    def nosotros() {
    }
    def contacto() {
    }
    def acerca() {
    }
    def ingresar() {
        [countries:Country.list(), cuisines:Cuisine.list()]
    }
    def publicar() {
        [categories:Category.list(), countries:Country.list(), difficulties: Difficulty.list(), durations: Duration.list()]
    }
    def editarReceta(){
        [categories:Category.list(), countries:Country.list(), difficulties: Difficulty.list(), durations: Duration.list(), recipe: Recipe.findById(params.id)]
    }
    def restaurantes() {
        [restaurants:Restaurant.findAll{approved == true}]
    }

    def editarRestaurante(){
        [cuisines:Cuisine.list(), restaurant: Restaurant.findByUsername(session.user)]
    }
    def recetas() {
        [recipes: Recipe.list()]
    }

    def barraBusqueda(){

        def parametros= params.srch_term.toLowerCase().split(" ")
        def personas=[] as Set
        def restaurantes=[] as Set
        def recetas=[] as Set
        def criterio=""
        def cadena=""

        parametros.each {
            cadena= '.*'+it+'.*'
            criterio= ~ "${cadena}"

            personas.addAll(Person.list().findAll {it.name.toLowerCase()==~criterio||it.lastname.toLowerCase()==~criterio||it.username.toLowerCase()==~criterio})

            restaurantes.addAll(Restaurant.list().findAll {it.name.toLowerCase()==~criterio||it.username.toLowerCase()==~criterio||it.description==~criterio})

            recetas.addAll(Recipe.list().findAll {it.name.toLowerCase()==~criterio||it.description.toLowerCase()==~criterio})
            recetas.addAll(Recipe.list().findAll {it.quantities.findAll{it.ingredient.name.toLowerCase() ==~ criterio}})
        }

        render(view: 'resultadoBusqueda',  model:[personas:personas, restaurantes:restaurantes, recetas:recetas, categories: Category.list(), parametro: params.srch_term])
    }

    def findCategory(){
        def category2 = Category.findByName(params.category)
        def lis = Recipe.findAll{category == category2}
        render(view: 'recetas',  model:[recipes: lis, categories: Category.list()])
    }

    def abrirReceta(){
        render(view: 'receta',  model:[recipe: Recipe.findByName(params.name)])
    }

    def abrirRestaurante(){
        render(view: 'restaurante',  model:[restaurante: Restaurant.findByUsername(params.user)])
    }

    def tipicos(){
        [countries: Country.list()]
    }

    def favoritos(){}

    def admin(){
    }

    def eliminarComentario(){
        Opinion.findById(params.comentario).delete(flush: true)
        redirect controller: 'web', action: 'admin'
    }

    def eliminarContacto(){
        Contact.findById(params.contacto).delete(flush: true)
        redirect controller: 'web', action: 'admin'
    }

    def aprobarRestaurante(){
        Restaurant restaurant = Restaurant.findById(params.restaurante)
        restaurant.approved = true
        restaurant.save(flush: true)
        redirect controller: 'web', action: 'admin'
    }

    def votacion(){

        def tipo= params.tipo
        def valor= params.valor.toInteger()
        def id=params.id.toInteger()

        if (session.user){

            def user_id= User.findByUsername(session.user).id

            if (tipo=="person"){

                def person= Person.findById(id)
                def voto= person.votes.find {it.voter==user_id}

                if (voto != null){
                    voto.value=valor
                    voto.save(flush: true, failOnError:true )

                    def suma= person.votes.sum {it.value}
                    def num= person.votes.size()
                    person.rating= suma/num

                    person.save(flush: true, failOnError:true )

                    def data=[tipo:tipo, valor:valor, id:id, votos:num]
                    render data as JSON
                }else{

                    person.addToVotes(voter: user_id, value: valor)

                    def suma= person.votes.sum {it.value}
                    def num= person.votes.size()
                    person.rating= suma/num
                    person.save(flush: true, failOnError:true )
                    def data=[tipo:tipo, valor:valor, id:id, votos:num]
                    render data as JSON
                }

            }else if (tipo=="restaurant"){

                def restaurant= Restaurant.findById(id)
                def voto= restaurant.votes.find {it.voter==user_id}

                if (voto != null){
                    voto.value=valor
                    voto.save(flush: true, failOnError:true )

                    def suma= restaurant.votes.sum {it.value}
                    def num= restaurant.votes.size()
                    restaurant.rating= suma/num

                    restaurant.save(flush: true, failOnError:true )

                    def data=[tipo:tipo, valor:valor, id:id, votos:num]
                    render data as JSON
                }else{

                    restaurant.addToVotes(voter: user_id, value: valor)

                    def suma= restaurant.votes.sum {it.value}
                    def num= restaurant.votes.size()
                    restaurant.rating= suma/num
                    restaurant.save(flush: true, failOnError:true )
                    def data=[tipo:tipo, valor:valor, id:id, votos:num]
                    render data as JSON
                }

            }else if(tipo=="recipe"){

                def recipe= Recipe.findById(id)
                def voto= recipe.votes.find {it.voter==user_id}

                if (voto != null){
                    voto.value=valor
                    voto.save(flush: true, failOnError:true )

                    def suma= recipe.votes.sum {it.value}
                    def num= recipe.votes.size()
                    recipe.rating= suma/num

                    recipe.save(flush: true, failOnError:true )

                    def data=[tipo:tipo, valor:valor, id:id, votos:num]
                    render data as JSON
                }else{

                    recipe.addToVotes(voter: user_id, value: valor)

                    def suma= recipe.votes.sum {it.value}
                    def num= recipe.votes.size()
                    recipe.rating= suma/num
                    recipe.save(flush: true, failOnError:true )
                    def data=[tipo:tipo, valor:valor, id:id, votos:num]
                    render data as JSON
                }

            }

        }else{
            def data=[tipo:tipo, valor:valor, id:id, votos:-1]
            render data as JSON
        }

    }
}
