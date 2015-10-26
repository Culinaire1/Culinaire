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

        render("User Created:" + userInstance)
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

        render("User Updated:" + userInstance)
    }

    def login(){
        if (params.username=="admin" && params.password=="pass"){
            flash.message="Login Succeed"
            session.user="admin"
        }else {
            flash.message = "Failed Login"
        }
        redirect(uri: "/ingresar")

    }

    def logout(){
        session.user=null
        redirect(uri: "/ingresar")
    }
}
