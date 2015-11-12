package culinairegrails

class PersonController {

    static scaffold = Person

    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (params.birthdate2 != '') {
            def a = params.birthdate2.split("-")
            personInstance.birthdate = new GregorianCalendar(a[0].toInteger(), a[1].toInteger(), a[2].toInteger(), 0, 0)
        }

        if (!personInstance.validate()) {
            TreeSet<String> tree = new TreeSet<String>()
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

    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        def a = params.birthdate2.split("-")
        personInstance.birthdate = new GregorianCalendar(a[0].toInteger(), a[1].toInteger(), a[2].toInteger(), 0, 0)

        if (!personInstance.validate()) {
            respond personInstance.errors, view: 'edit'
            return
        }

        personInstance.save flush: true

        redirect action: 'login', id: personInstance.id
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

