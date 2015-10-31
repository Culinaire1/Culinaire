package culinairegrails

class IngredientController {

    static scaffold = Ingredient

    def save(Ingredient ingredient){

        if (ingredient == null) {
            notFound()
            return
        }

        if (ingredient.hasErrors()) {
            respond ingredient.errors, view: 'create'
            return
        }

        ingredient.save flush: true

        redirect action: 'show', id: ingredient.id
    }

    def Update(Ingredient ingredient){

        if (ingredient == null) {
            notFound()
            return
        }

        if (ingredient.hasErrors()) {
            respond ingredient.errors, view: 'create'
            return
        }

        ingredient.save flush: true

        redirect action: 'show', id: ingredient.id
    }
}
