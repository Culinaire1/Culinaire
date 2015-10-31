package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

import java.time.LocalDate

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Person)
class PersonSpec extends Specification {
    static String s,p
    def setup() {
        s = ""
        1.upto(15){
            s += "a"
        }
        p = ""
        1.upto(50){
            p += "a"
        }

    }

    def cleanup() {
    }

    void "test something"() {
        when:"test name"
        Person usuario1 = new Person(name:"jua",lastname: "Pulido",dateofbirth: new Date(),username: "Bon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        Person usuario2 = new Person(name:p,lastname: "Pulido",dateofbirth: new Date(),username: "Bonn", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        Person usuario3 = new Person(name:p+"a",lastname: "Pulido",dateofbirth: new Date(),username: "Boon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        Person usuario4 = new Person(name:"ju",lastname: "Pulido",dateofbirth: new Date(),username: "Bbon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario1!=null
        usuario2!=null
        usuario3==null
        usuario4==null

        when:"test lastname"
        usuario1 = new Person(name:"pepeito",lastname: "jua",dateofbirth: new Date(),username: "Bon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario2 = new Person(name:"laurita",lastname: p,dateofbirth: new Date(),username: "Bonn", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario3 = new Person(name:"vane",lastname: p+"a",dateofbirth: new Date(),username: "Boon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario4 = new Person(name:"Julio",lastname: "ju",dateofbirth: new Date(),username: "Bbon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario1!=null
        usuario2!=null
        usuario3==null
        usuario4==null

        /*when:"test age"
        usuario1 = new Person(name:"pepeito",lastname: "Ardila",dateofbirth: LocalDate.now().plusYears(-4),username: "Bon", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario2 = new Person(name:"laurita",lastname: "suarez",dateofbirth: LocalDate.now().plusYears(-5),username: "Bonn", password: "SpacePhoenix2TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario1==null
        usuario2!=null*/

    }
}
