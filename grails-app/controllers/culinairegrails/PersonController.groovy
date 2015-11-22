package culinairegrails

class PersonController {

    static scaffold = Person

    def simpleCaptchaService

    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (params.birthdate2 != '') {
            def a = params.birthdate2.split("-")
            personInstance.birthdate = new GregorianCalendar(a[0].toInteger(), a[1].toInteger(), a[2].toInteger(), 0, 0)
        }

        if (!personInstance.validate() || !simpleCaptchaService.validateCaptcha(params.captcha)) {
            TreeSet<String> tree = new TreeSet<String>()
            if (!simpleCaptchaService.validateCaptcha(params.captcha))
                tree.add("captcha")
            for( i in personInstance.errors.fieldErrors.field){
                tree.add(i)
            }
            redirect(controller: 'web', action: 'ingresar')
            flash.error = tree
            return
        }

        personInstance.save flush: true

        redirect action: 'login', id: personInstance.id
    }

    def update() {
        Person person = Person.findByUsername(session.user)

        if (params.birthdate2 != '') {
            def a = params.birthdate2.split("-")
            person.birthdate = new GregorianCalendar(a[0].toInteger(), a[1].toInteger(), a[2].toInteger(), 0, 0)
        }

        person.email = params.email
        person.password = params.password
        person.name = params.name
        person.lastname = params.lastname
        person.username = params.username
        if(params.photo.getBytes().size() > 2)
            person.photo = params.photo.getBytes()
        person.website = params.website

        if (!person.validate()) {
            TreeSet<String> tree = new TreeSet<String>()
            for( i in personInstance.errors.fieldErrors.field){
                tree.add(i)
            }
            redirect(controller: 'web', action: 'editarperfilpersona')
            flash.error = tree
            return
        }
        person.save flush: true

        redirect action: 'login', id: person.id
    }

    def addFavoriteRecipe(){
        Person person = Person.findByUsername(session.user);
        Recipe recipe = Recipe.get(params.id.toInteger());
        if(person != null && recipe!= null) {
            person.addToFavoriteRecipes(recipe)
            person.save flush: true
        }
        redirect(controller: 'web', action: 'recetas_favoritas')
    }

    def removeFavoriteRecipe(){
        Person person = Person.findByUsername(session.user);
        Recipe recipe = Recipe.get(params.id.toInteger());
        if(person != null && recipe!= null) {
            person.removeFromFavoriteRecipes(recipe)
            person.save flush: true
        }
        redirect(controller: 'web', action: 'recetas_favoritas')
    }

    def addFavoritesUsers(){
        Person person = Person.findByUsername(session.user);
        Person person2 = Person.findByUsername(params.username);
        if(person != null && person2!= null) {
            person.addToFavoriteUsers(person2)
            person.save flush: true
        }
        redirect(controller: 'web', action: 'usuarios')
    }

    def removeFavoriteUser(){
        Person person = Person.findByUsername(session.user);
        Person person2 = Person.findByUsername(params.username);
        if(person != null && person2!= null) {
            person.removeFromFavoriteUsers(person2)
            person.save flush: true
        }
        redirect(controller: 'web', action: 'usuarios')

    }

    def displayGraph = {
        def perFoto = Person.findByName((String) params.name)
        if (!perFoto || !perFoto.photo) {
            response.sendError(404)
            return
        }
        response.contentType = perFoto.photo
        response.contentLength = perFoto.photo.size()
        OutputStream out = response.outputStream
        out.write(perFoto.photo)
        out.close()
    }

    def login(long id){
        def person = Person.get(id)
        session.user = person.username
        session.tu = true
        redirect controller: 'web', action: 'perfil'
    }
}

