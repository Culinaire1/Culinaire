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
        def person = Person.findByUsername(params.usernameL)
        if (person) {
            if(person.password == params.passwordL){
                session.user = person.username
                session.tu = true
                redirect controller: 'web', action: 'perfil'
                return
            }else{
                redirect controller: 'web', action: 'ingresar'
                flash.message = "Contraseña incorrecta"
                return
            }
        }

        def restaurant = Restaurant.findByUsername(params.usernameL)
        if (restaurant) {
            if(restaurant.password == params.passwordL){
                session.user = restaurant.username
                session.tu = false
                redirect controller: 'web', action: 'index'
                return
            }
            else{
                redirect controller: 'web', action: 'ingresar'
                flash.message = "Contraseña incorrecta"
                return
            }
        }
        else {
            redirect controller: 'web', action: 'ingresar'
            flash.message = "No existe el usuario"
            return
        }
    }

    def logout(){
        session.user = null
        redirect controller: 'web', action: 'index'
    }
}
