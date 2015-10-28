package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Country)
class CountrySpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test for Country"() {
        when:"test name"
        Country country1=new Country(name:null).save()
        Country country2=new Country(name:"Colombia").save()
        Country country3=new Country(name:"Col").save()
        Country country4=new Country(name:"Co").save()

        then:
        country1==null
        country2!=null
        country3!=null
        country4==null
    }
}
