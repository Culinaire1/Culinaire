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

    def displayGraph = {
        def recPhoto = Recipe.findByName((String) params.name)
        if (!recPhoto || !recPhoto.photo) {
            response.sendError(404)
            return
        }
        response.contentType = recPhoto.photo
        response.contentLength = recPhoto.photo.size()
        OutputStream out = response.outputStream
        out.write(recPhoto.photo)
        out.close()
    }
}
