package culinairegrails

class UserController {

    static scaffold = User

    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.save flush: true

        redirect action: 'show', id: userInstance.id
    }

    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        redirect action: 'show', id: userInstance.id
    }

    def login(){
        def person = Person.findByUsername((String) params.username)
        def restaurant = Restaurant.findByUsername((String) params.username)
        if (person){
            redirect(controller: 'person', action: 'login', params: params)
        }
        else if (restaurant) {
            redirect(controller: 'restaurant', action: 'login', params: params)
        }
        else {
            flash.message = "No existe el usuario"
            redirect(controller: 'web', action: 'ingresar')
        }
    }

    def logout(){
        session.user = null
        redirect(uri: "/ingresar")
    }
}
