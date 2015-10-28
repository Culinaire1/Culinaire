package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {

    static String s
    def setup() {
        s = ""
        1.upto(15){
            s += "a"
        }
    }

    def cleanup() {
    }

    void "test user"() {
        when: 'Nombres entre 3 y 15 caracteres'
        User usuario = new User(username: "Bo", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        User usuario1 = new User(username: "Bon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        User usuario2 = new User(username: s+"a", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        User usuario3 = new User(username: s, password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario == null
        usuario1 != null
        usuario2 == null
        usuario3 != null

        when: 'password'
        usuario = new User(username: "Juan Camilo", password: "hola",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario1 = new User(username: "culinaire", password: "123463634735",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario2= new User(username: "culiculi", password: "HOLAAcomomesehd",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario3 = new User(username: "Andres", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario == null
        usuario1 == null
        usuario2 == null
        usuario3!= null

        when: 'email'
        usuario = new User(username: "Andres", password: "SpacePhoenix23TheBest",email:"cosolorzanovunal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario1 = new User(username: "Felipe", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario == null
        usuario1 != null

        when: 'description'
        usuario = new User(username: "Andres", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: null,rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario1 = new User(username: "Felipe", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario == null
        usuario1 != null

        when: 'rating'
        usuario = new User(username: "Andres", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "que tal",rating: 0,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario1 = new User(username: "Felipe", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 6,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario2 = new User(username: "Andress", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "que tal",rating: 1,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario3 = new User(username: "Felipee", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 5,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario == null
        usuario1 == null
        usuario2 != null
        usuario3 != null

        when: 'Username not Unique'
        usuario = new User(username: "Andres", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "que tal",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario1 = new User(username: "Andres", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        mockForConstraintsTests( User,[usuario,usuario1])
        def flag = usuario1.validate()

        then:
        !flag
    }
}
