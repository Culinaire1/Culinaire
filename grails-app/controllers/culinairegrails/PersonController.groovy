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
