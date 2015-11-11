package culinairegrails

class WebController {
    def index() {

    }
    def busqueda() {
        [categories:Category.list(), countries:Country.list(), difficulties:Difficulty.list(), ingredients:Ingredient.list(),
         durations: Duration.list()]
    }
    def busquedaf() {
        def ingrediente= params.ingredienteB
        def categoria= params.categoriaB
        def duracion=params.duracionB
        def dificultad=params.dificultadB
        def boton=params.bsubmit

        def f1,f2,f3,f4

        if(ingrediente=="Ninguna")
            f1=Recipe.list()
        else
            f1 = Recipe.list().findAll{it.quantities.findAll{it.ingredient.name==ingrediente}}

        if (categoria=="Ninguna")
            f2=f1
        else
            f2=f1.findAll {it.category.name==categoria}

        if (duracion=="Ninguna")
            f3=f2
        else
            f3=f2.findAll {it.duration.duration==duracion}

        if(dificultad=="Ninguna")
            f4=f3
        else
            f4=f3.findAll {it.difficulty.level==dificultad}

        int numeroAleatorio = (int) (Math.random() * (f4.size() - 1)+0.2)
        def resul = f4[numeroAleatorio]

        if(boton=="Buscar")
            render(view: "Recetas",model:[categories: Category.list(), recipes: f4])
        if (boton=="Aleatorio"){
            if(f4.size()> 1) {
                render(view: "Recetas", model: [categories: Category.list(), recipes: resul])
            }
            else
                render(view: "Recetas", model: [categories: Category.list(), recipes: f4])
        }
    }

    def categorias() {
        [categories:Category.list()]
    }
    def favoritos() {
    }

    def perfil() {
        if(session.user == null) {
            redirect(action: 'ingresar')
        }
        render(view: 'perfil', model:[person:Person.findByUsername(session.user)])
    }

    def perfil2() {
    }
    def comentarios() {
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
        [countries:Country.list()]
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
        render(view: 'resultadoBusqueda',  model:[personas:Person.getAll(), restaurantes:Restaurant.getAll(), recetas:Recipe.getAll(), categories: Category.list()])
    }

    def findCategory(){
        def category2 = Category.findByName(params.category)
        def lis = Recipe.findAll{category == category2}
        render(view: 'recetas',  model:[recipes: lis, categories: Category.list()])
    }

    def abrirReceta(){
        render(view: 'receta',  model:[recipe: Recipe.findByName(params.name)])
    }
}
