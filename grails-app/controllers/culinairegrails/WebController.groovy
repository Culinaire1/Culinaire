package culinairegrails


class WebController {
    def elasticSearchService
    def index() {

    }
    def busqueda() {
        [categories:Category.list(), countries:Country.list(), difficulties:Difficulty.list(), ingredients:Ingredient.list(),
         durations: Duration.list()]
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
        else
            f1 = Recipe.findAll{quantities.findAll{it.ingredient.name==ingrediente}}

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
    def restaurantes() {
        [restaurants:Restaurant.list()]
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
        def aux

        parametros.each {
            criterio= '%'+it+'%'
            aux= Person.where {
                (lower(name) ==~ criterio || lower(lastname)==~ criterio || lower(username)==~ criterio)
            }
            personas += aux

            aux= Restaurant.where {
                (lower(name) ==~ criterio || lower(description)==~ criterio || lower(username)==~ criterio)
            }
            restaurantes +=aux

            aux= Recipe.where {
                (lower(name) ==~ criterio || lower(description)==~ criterio)
            }
            recetas +=aux
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

    def tipicos(){
        [countries: Country.list()]
    }

    def favoritos(){}

    def admin(){
    }
}
