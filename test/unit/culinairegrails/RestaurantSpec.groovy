package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Restaurant)
class RestaurantSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test for restaurant"() {
        when:"test name"
        Restaurant usuario1 = new Restaurant(name:null,city:"fusa",address: "Une",username: "Andress", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "que tal",rating: 1,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        Restaurant usuario2= new Restaurant(name:"orlando",city:"Une",address: "Une", username: "Felipee", password: "SpacePhoenix23TheBest",email:"cosolozanov@unal.edu.co",description: "holaa",rating: 2,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario1==null
        usuario2==null

        when:"test city"
        usuario1 = new Restaurant(name:"nosequeponer",city:null,address: "Une",username: "Andress", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "que tal",rating: 1,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario2= new Restaurant(name:"elmejor",city:"newYorUne",address: "Une", username: "Felipee", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 5,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario1==null
        //usuario2!=null

        when:"test address"
        usuario1 = new Restaurant(name:"nosequeponer",city:"Une",address: null,username: "Andress", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "que tal",rating: 1,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()
        usuario2= new Restaurant(name:"elmejor",city:"newYorUne",address: "Une", username: "Felipee", password: "SpacePhoenix23TheBest",email:"cosolorzanov@unal.edu.co",description: "hola",rating: 5,website: "https://www.tripadvisor.co/Restaurant_Review-g294074-d806964-Reviews-Club_Colombia-Bogota.html").save()

        then:
        usuario1==null
        //usuario2!=null
    }
}
