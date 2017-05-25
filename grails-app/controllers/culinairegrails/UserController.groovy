package culinairegrails

import com.novell.ldap.LDAPConnection
import com.novell.ldap.LDAPException
import org.apache.commons.codec.digest.DigestUtils

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
        String aux = login2(params.usernameL, params.passwordL)
        println("Login " + aux)
        if(aux.equals("Usuario")) {
            def person = Person.findByUsername(params.usernameL)
            if (person) {
                if (person.password == md5(params.passwordL)) {
                    session.user = person.username
                    session.tu = true
                    redirect controller: 'web', action: 'perfil'
                    return
                } else {
                    redirect controller: 'web', action: 'ingresar'
                    flash.message = "Contraseña incorrecta"
                    return
                }
            }
        }
        else if(aux.equals("Administrador")) {
            def admin = Admin.findByUsername(params.usernameL)
            if (admin) {
                if (admin.password == md5(params.passwordL)) {
                    session.user = admin.username
                    session.tu = 'admin'
                    redirect controller: 'web', action: 'admin'
                    return
                } else {
                    redirect controller: 'web', action: 'ingresar'
                    flash.message = "Contraseña incorrecta"
                    return
                }
            }
        }
        else if(aux.equals("Restaurante")) {
            def restaurant = Restaurant.findByUsername(params.usernameL)
            if (restaurant) {
                if (restaurant.password == md5(params.passwordL)) {
                    session.user = restaurant.username
                    session.tu = false
                    redirect controller: 'web', action: 'index'
                    return
                } else {
                    redirect controller: 'web', action: 'ingresar'
                    flash.message = "Contraseña incorrecta"
                    return
                }
            }
        }
        else {
            redirect controller: 'web', action: 'ingresar'
            flash.message = "No existe el usuario o la contraseña está mal escrita"
            return
        }
    }

    def logout(){
        session.user = null
        session.tu = null
        redirect controller: 'web', action: 'index'
    }

    private LDAPConnection lc = new LDAPConnection();

    String login2(String nombreUsuario, String contrasena){

        System.out.println("DATOS ---> " + nombreUsuario + " - " + contrasena);

        if(conectar()){
            String aux = validarContrasena(nombreUsuario, contrasena);
            if(!"error".equals(aux)){
                return aux;
            }else{
                return "error";
            }
        }else{
            return "Conexion al Servidor LDAP fallida";
        }

    }

    Boolean conectar(){

        String ldapHost = "25.7.218.17"
        String dn = "cn=admin,dc=culinaire,dc=com"
        String password = "culinaire"

        int ldapPort =  LDAPConnection.DEFAULT_PORT
        int ldapVersion = LDAPConnection.LDAP_V3

        try {
            lc.connect(ldapHost, ldapPort);
            System.out.println("====Conectado al Servidor LDAP====")
            lc.bind(ldapVersion, dn, password.getBytes("UTF8"))
            System.out.println("====Autenticado en el servidor====")
            return true
        } catch (LDAPException | UnsupportedEncodingException ex) {
            System.out.println("====ERROR al conectarse al Servidor LDAP====")
            return false
        }

    }

    String validarContrasena(String nombreUsuario, String contrasena){

        String dn = "cn="+nombreUsuario+",ou=Usuarios,dc=culinaire,dc=com"
        try {
            lc.bind(dn, contrasena)
            System.out.println("====Contrasena Validada====")
            String aux = lc.read(dn).toString()
            System.out.println(aux)
            if(aux.contains("value='500'"))
                return "Administrador"
            if(aux.contains("value='501'"))
                return "Usuario"
            else
                return "Restaurante"
        } catch (LDAPException ex) {
            System.out.println("====ERROR al validar la contrasena====");
            return "error"
        }

    }

    String md5(String s){
        return DigestUtils.md5Hex( s )
    }
}
