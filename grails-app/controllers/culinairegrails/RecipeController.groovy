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

        if(recipe.validate()){
            recipe.save flush: true
            return
        }

        recipe = new Recipe(name: params.name, description: params.description,
                country: Country.findByName(params.country), difficulty: Difficulty.findByLevel(params.difficulty),
                duration: Duration.findByDuration(params.duration), category: Category.findByName(params.category),
                person: Person.findByUsername(session.user), photo: params.photo.getBytes())

        if (!recipe.validate()) {
            TreeSet<String> tree = new TreeSet<String>()
            for( i in recipe.errors.fieldErrors.field){
                tree.add(i)
            }
            redirect(controller: 'web', action: 'publicar')
            flash.error = tree
            return
        }

        recipe.save flush: true

        for(int i = 1; i <= params.ingNum.toInteger(); i++){
            String a = params.getProperty("ing"+i)
            Ingredient ingredient = Ingredient.findByName(a)
            if(ingredient  == null){
                ingredient  = new Ingredient(name: params.getProperty("ing"+i)).save flush: true
                new Quantity(quantity: params.getProperty("quantity"+i), ingredient: ingredient, recipe: recipe).save flush: true
            }
            else{
                String aux = params.getProperty("quantity"+i)
                new Quantity(quantity: aux, ingredient: ingredient, recipe: recipe).save flush: true
            }
        }

        for(int i = 1; i <= params.insNum.toInteger(); i++){
            Instruction instruction = new Instruction(description: params.getProperty("des"+i), recipe: recipe, paso: i)
            if(params.getProperty("photo"+i).getBytes().size() > 1){
                instruction.photo = params.getProperty("photo"+i).getBytes()
            }
            instruction.save flush: true
        }

        redirect controller:'web', action:'abrirReceta', params: [name: recipe.name]
    }

    def addComments(){
        Person person = Person.findByUsername(session.user);
        Recipe recipe = Recipe.get(params.id.toInteger())
        Post post = new Post(person: person, recipe: recipe, content: params.post)
        post.save flush: true
        redirect(controller:'web', action:'abrirReceta', params: [name: recipe.name])
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
