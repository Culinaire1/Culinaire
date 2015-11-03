package culinairegrails

class WebController {
    def index() {
        [categories:Category.list()]
    }
    def busqueda() {
        [categories:Category.list(), countries:Country.list(), difficulties:Difficulty.list(), ingredients:Ingredient.list(), durations: Duration.list()]
    }
    def categorias() {
        [categories:Category.list()]
    }
    def favoritos() {
        [categories:Category.list()]
    }
    def perfil() {
        if(session.user == null) {
            redirect(action: 'ingresar')
        }
        render(view: 'perfil',model:[person:Person.findByUsername((String) session.user), categories:Category.list()])
    }
    def perfil2() {
        [categories:Category.list()]
    }
    def comentarios() {
        [categories:Category.list()]
    }
    def faq() {
        [categories:Category.list()]
    }
    def nosotros() {
        [categories:Category.list()]
    }
    def contacto() {
        [categories:Category.list()]
    }
    def acerca() {
        [categories:Category.list()]
    }
    def ingresar() {
        [categories:Category.list(), countries:Country.list()]
    }
    def publicar() {
        [categories:Category.list(), countries:Country.list()]
    }
    def restaurantes() {
        [categories:Category.list(), restaurants:Restaurant.list()]
    }
    def recetas() {
        [categories:Category.list(), recipes:Recipe.list()]
    }
}
