package culinairegrails

class PersonController {

    static scaffold = Person

    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        String a = params.birthdate2.split("-")
        personInstance.birthdate = new Date(a[0].toInteger(), a[1].toInteger(), a[2].toInteger())

        if (!personInstance.validate()) {
            respond personInstance.errors, view: 'create'
            return
        }

        personInstance.save flush: true

        redirect action: 'show', id: personInstance.id
    }

    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'edit'
            return
        }

        personInstance.save flush: true

        redirect action: 'show', id: personInstance.id
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

    def login(){
        def person = Person.findByUsername((String) params.username)
        if(person.password == params.password){
            session.user = person.username
            redirect(controller: 'web', action: 'perfil', params: [username: person.username])
        }else{
            flash.message = "Contraseña incorrecta"
            redirect(controller: 'web', action: 'ingresar')
        }
    }
}
