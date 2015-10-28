package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Food)
class FoodSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        when:"test name"
        Food food1=new Food(name:"algo").save()
        Food food2=new Food(name:"al").save()
        Food food3=new Food(name:null).save()

        then:
        food1!=null
        food2==null
        food3==null

        when:"name not unique"
        food1=new Food(name:"algo").save()
        food2=new Food(name:"algo").save()
        mockForConstraintsTests( User,[food1,food2])
        def flag = food2.validate()

        then:
        flag==true
    }
}
