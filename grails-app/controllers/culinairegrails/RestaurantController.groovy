package culinairegrails

import com.novell.ldap.LDAPAttribute
import com.novell.ldap.LDAPAttributeSet
import com.novell.ldap.LDAPConnection
import com.novell.ldap.LDAPEntry
import com.novell.ldap.LDAPException
import org.apache.commons.codec.digest.DigestUtils

import java.lang.reflect.Array

class RestaurantController {

    static scaffold = Restaurant

    def simpleCaptchaService

    def save() {
        Restaurant restaurant = new Restaurant(name: params.nameR, username: params.usernameR, password: md5(params.passwordR),
                email: params.emailR, photo: params.photoR.getBytes(), website: params.websiteR, country: Country.findByName(params.countryR),
                cuisine: Cuisine.findByName(params.cuisine), description: params.description, approved: false)

        if (!restaurant.validate()  || !simpleCaptchaService.validateCaptcha(params.captcha2)) {
            TreeSet<String> tree = new TreeSet<String>()
            if (!simpleCaptchaService.validateCaptcha(params.captcha2))
                tree.add("captcha")
            for( i in restaurant.errors.fieldErrors.field){
                tree.add(i)
            }
            redirect(controller: 'web', action: 'ingresar')
            flash.error = tree
            return
        }
        restaurant.save flush: true

        for(int i = 1; i <= params.citiesNum.toInteger(); i++ ){
            String a = params.getProperty("city"+i);
            City city = City.findByName(a);
            if (city == null){
                city = new City(country: Country.findByName(params.countryR), name: a).save flush: true
            }
            restaurant.addToCities(city)
            restaurant.save flush: true

            String b = params.getProperty("cityDirNum"+i)
            int n = b.toInteger();
            for(int j = 1; j <= n; j++){
                new Direction(address: params.getProperty("city"+i+"dir"+j), city: city, restaurant: restaurant).save flush: true
            }
        }

        String aux = create(params.usernameR, params.passwordR, params.nameR, "Restaurante", (Math.random()*10000000000).toInteger().toString())

        if(aux.equals("creado")) {
            new Menu(restaurant: restaurant).save()
            redirect action: 'login', id: restaurant.id
        } else {
            redirect(controller: 'web', action: 'ingresar')
            flash.error = "Error al crear restaurante"
        }

    }

    def addComments(){
        Person person = Person.findByUsername(session.user);
        Restaurant restaurant = Restaurant.get(params.id.toInteger())
        RestaurantPost post = new RestaurantPost(person: person, restaurant: restaurant, content: params.post)
        post.save flush: true
        redirect(controller:'web', action:'abrirRestaurante', params: [user: restaurant.username])
    }

    def saveMenu(){
        Restaurant restaurant = Restaurant.findByUsername(session.user)
        int n = params.platesNum.toInteger()
        def plates = restaurant.menu.plates
        ArrayList<Plate> plates2 = new ArrayList<>()
        plates.each {
            plates2.add(it)
        }
        plates2.each {
            restaurant.menu.removeFromPlates(it)
            it.delete(flush: true)
        }
        for(int i = 1; i <= n; i++){
            String name = params.getProperty("plate"+i)
            if(name != null) {
                new Plate(name: params.getProperty("plate" + i), menu: restaurant.menu).save flush: true
            }
        }
        restaurant.save(flush: true)
        redirect(controller:'web', action:'abrirRestaurante', params: [user: restaurant.username])
    }

    def displayGraph = {
        def resPhoto = Restaurant.findByName((String) params.name)
        if (!resPhoto || !resPhoto.photo) {
            response.sendError(404)
            return
        }
        response.contentType = resPhoto.photo
        response.contentLength = resPhoto.photo.size()
        OutputStream out = response.outputStream
        out.write(resPhoto.photo)
        out.close()
    }

    def login(long id){
        def restaurant = Restaurant.get(id)
        session.user = restaurant.username
        session.tu = false
        redirect controller: 'web', action: 'abrirRestaurante', params: [user: restaurant.username]
    }

    def update() {
        Restaurant restaurant = Restaurant.findByUsername(session.user)
        restaurant.cuisine = Cuisine.findByName(params.cuisine)
        restaurant.name = params.nameR
        restaurant.username = params.usernameR
        restaurant.password = params.passwordR
        restaurant.email = params.emailR
        if(params.photoR.getBytes().size() > 10) {
            restaurant.photo = params.photoR.getBytes()
        }
        if(params.websiteR != null) {
            restaurant.website = params.websiteR
        }
        restaurant.description = params.description

        if (!restaurant.validate()) {
            TreeSet<String> tree = new TreeSet<String>()
            for( i in restaurant.errors.fieldErrors.field){
                tree.add(i)
            }
            redirect(controller: 'web', action: 'editarRestaurante')
            flash.error = tree
            return
        }
        restaurant.save flush: true

        def cities = restaurant.cities

        ArrayList<City> tmp = new ArrayList<>()

        cities.each {
            tmp.add(it)
        }

        tmp.each {
            restaurant.removeFromCities(it)
        }

        for(int i = 1; i <= params.citiesNum.toInteger(); i++ ){
            String a = params.getProperty("city"+i);
            City city = City.findByName(a);
            if (city == null){
                city = new City(country: restaurant.country, name: a).save flush: true
                restaurant.addToCities(city)
            }
            else {
                restaurant.addToCities(city)
            }

            restaurant.save flush: true

            def directions = city.directions.findAll{it.restaurant.id == restaurant.id}

            ArrayList<Direction> tmp2 = new ArrayList<>()

            directions.each {
                tmp2.add(it)
            }

            tmp2.each {
                city.removeFromDirections(it)
                it.delete(flush: true)
            }

            String b = params.getProperty("cityDirNum"+i)
            int n = b.toInteger();
            for(int j = 1; j <= n; j++){
                new Direction(address: params.getProperty("city" + i + "dir" + j), city: city, restaurant: restaurant).save flush: true
            }
        }
        redirect action: 'login', id: restaurant.id
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
        attributeSet.add( new LDAPAttribute("gidNumber", "502"))
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

    String md5(String s){
        return DigestUtils.md5Hex( s )
    }

}
