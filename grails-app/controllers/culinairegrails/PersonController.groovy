package culinairegrails

class PersonController {

    static scaffold = Person

    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        def a = params.birthdate2.split("-")
        personInstance.birthdate = new GregorianCalendar(a[0].toInteger(), a[1].toInteger(), a[2].toInteger(), 0, 0)

        if (!personInstance.validate()) {
            respond personInstance.errors, view: 'create'
            return
        }

        personInstance.save flush: true

        redirect action: 'login', id: personInstance.id
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
        def perFoto = Person.findByName(params.name)
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
