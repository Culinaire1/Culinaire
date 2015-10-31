package culinairegrails

class RecipeController {

    static scaffold = Recipe

    def update(Recipe recipe){

        if (recipe == null) {
            notFound()
            return
        }

        if (recipe.hasErrors()) {
            respond recipe.errors, view: 'create'
            return
        }

        recipe.save flush: true

        redirect action: 'show', id: recipe.id
    }

    def save(Recipe recipe){

        if (recipe == null) {
            notFound()
            return
        }

        if (recipe.hasErrors()) {
            respond recipe.errors, view: 'create'
            return
        }

        recipe.save flush: true
        redirect action: 'show', id: recipe.id
    }
}
