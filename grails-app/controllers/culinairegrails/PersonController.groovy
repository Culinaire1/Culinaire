package culinairegrails

import com.novell.ldap.LDAPAttribute
import com.novell.ldap.LDAPAttributeSet
import com.novell.ldap.LDAPConnection
import com.novell.ldap.LDAPEntry
import com.novell.ldap.LDAPException
import org.apache.commons.codec.digest.DigestUtils

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

        personInstance.password = md5(personInstance.password)

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

        String aux = create(params.username, params.password, params.name, params.lastname, (Math.random()*10000000000).toInteger().toString())

        if(aux.equals("creado")) {
            personInstance.save flush: true

            redirect action: 'login', id: personInstance.id
        } else {
            redirect(controller: 'web', action: 'ingresar')
            flash.error = "Error al crear usuario"
        }
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

    private LDAPConnection lc = new LDAPConnection();

    String create(String username, String password, String name, String lastname, String uid){
        conectar()

        LDAPAttribute attribute = null
        LDAPAttributeSet attributeSet = new LDAPAttributeSet()
        attributeSet.add( new LDAPAttribute( "objectclass", (String[])['inetOrgPerson', 'posixAccount', 'top'].toArray()))
        attributeSet.add( new LDAPAttribute("cn", name))
        attributeSet.add( new LDAPAttribute("givenname", name))
        attributeSet.add( new LDAPAttribute("uidNumber", uid))
        attributeSet.add( new LDAPAttribute("uid", username))
        attributeSet.add( new LDAPAttribute("gidNumber", "501"))
        attributeSet.add( new LDAPAttribute("homeDirectory", "/home/users/"+username+name))
        attributeSet.add( new LDAPAttribute("sn", lastname))
        attributeSet.add( new LDAPAttribute("userpassword", password))

        String  dn  = "cn="+username+",ou=Usuarios,dc=culinaire,dc=com"

        LDAPEntry newEntry = new LDAPEntry( dn, attributeSet )

        try {
            lc.add( newEntry )
            System.out.println( "\nAdded object: " + dn + " successfully." )
            lc.disconnect()
            return "creado"
        }

        catch( LDAPException e ) {
            System.out.println( "Error:  " + e.toString())
        }
        return ""
    }

    Boolean conectar(){

        String ldapHost = "192.168.0.5"
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

    String md5(String s){
        return DigestUtils.md5Hex( s )
    }
}

