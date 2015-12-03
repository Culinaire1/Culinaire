package culinairegrails

import grails.test.mixin.*
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(IngredientController)
@Mock(Ingredient)
class IngredientControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test Ingredient"() {

        when:
        Ingredient panela = new Ingredient(name: 'panela raspada').save()
        controller.save(panela)
        then:
        response.redirectedUrl=="/ingredient/show/1"
    }
}
