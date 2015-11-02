package culinairegrails

class WebController {
    def index() {
        [categories:Category.list()]
    }
    def busqueda() {
        [categories:Category.list(), countries:Country.list()]
    }
    def categorias() {
        [categories:Category.list()]
    }
    def favoritos() {
        [categories:Category.list()]
    }
    def perfil() {
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
