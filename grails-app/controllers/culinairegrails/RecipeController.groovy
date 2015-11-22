package culinairegrails

class RecipeController {

    static scaffold = Recipe

    def save(Recipe recipe){

        if (recipe == null) {
            notFound()
            return
        }

        if(recipe.validate()){
            recipe.save flush: true
            return
        }

        boolean typical = false
        if (params.typical)
            typical = true


        recipe = new Recipe(name: params.name, description: params.description,
                country: Country.findByName(params.country), difficulty: Difficulty.findByLevel(params.difficulty),
                duration: Duration.findByDuration(params.duration), category: Category.findByName(params.category),
                person: Person.findByUsername(session.user), photo: params.photo.getBytes(), typical: typical)

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

    def update(){

        Recipe recipe = Recipe.findById(params.id.toInteger())

        boolean typical = false
        if (params.typical)
            typical = true

        recipe.name = params.name
        recipe.description = params.description
        recipe.country = Country.findByName(params.country)
        recipe.difficulty = Difficulty.findByLevel(params.difficulty)
        recipe.duration = Duration.findByDuration(params.duration)
        recipe.category = Category.findByName(params.category)
        recipe.person = Person.findByUsername(session.user)
        if(params.photo.getBytes().size() > 10){
            recipe.photo = params.photo.getBytes()
        }
        recipe.typical = typical

        if (!recipe.validate()) {
            TreeSet<String> tree = new TreeSet<String>()
            for( i in recipe.errors.fieldErrors.field){
                tree.add(i)
            }
            redirect(controller: 'web', action: 'editarReceta')
            flash.error = tree
            return
        }

        recipe.save flush: true

        def quantities = recipe.quantities
        ArrayList<Quantity> tmp = new ArrayList<>()

        quantities.each {
            tmp.add(it)
        }

        tmp.each {
            recipe.removeFromQuantities(it)
            it.delete(flush: true)
        }

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

        def instructions = recipe.instructions.sort({it.paso})

        ArrayList<Instruction> tmp2 = new ArrayList<>()

        instructions.each {
            tmp2.add(it)
        }

        for(int i = 1; i <= params.insNum.toInteger(); i++){
            Instruction instruction = new Instruction(description: params.getProperty("des"+i), recipe: recipe, paso: i)
            if(params.getProperty("photo"+i).getBytes().size() > 1){
                instruction.photo = params.getProperty("photo"+i).getBytes()
            }
            else if(i-1 < tmp2.size()){
                if(tmp2.getAt(i-1).photo != null && tmp2.getAt(i-1).photo.size() > 10){
                    instruction.photo = tmp2.getAt(i-1).photo
                }
            }
            instruction.save flush: true
        }

        tmp2.each {
            recipe.removeFromInstructions(it)
            it.delete(flush: true)
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
