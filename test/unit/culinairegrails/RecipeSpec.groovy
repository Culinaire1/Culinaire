package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Recipe)
class RecipeSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test for recipe"() {

        when:"test name"
        Recipe recipe1 =new Recipe(name:"aalg",rating: 2,dateCreated: new Date()-1,lastUpdate: new Date()).save()
        Recipe recipe2 =new Recipe(name:"a",rating: 2,dateCreated: new Date(),lastUpdate: new Date()).save()

        then:
        //recipe1!=null
        recipe2==null

        when:"test rating"
        recipe1 =new Recipe(name:"allg",rating: 1,dateCreated: new Date(),lastUpdate: new Date()).save()
        recipe2 =new Recipe(name:"pollo",rating: 5,dateCreated: new Date(),lastUpdate: new Date()).save()
        Recipe recipe3 =new Recipe(name:"algo",rating: 0,dateCreated: new Date(),lastUpdate: new Date()).save()
        Recipe recipe4 =new Recipe(name:"antesqe",rating: 6,dateCreated: new Date(),lastUpdate: new Date()).save()

        then:
        //recipe1!=null
        //recipe2!=null
        recipe3==null
        recipe4==null

        when:"test dates"
        recipe1 =new Recipe(name:"allg",rating: 1,dateCreated: null,lastUpdate: new Date()).save()
        recipe2 =new Recipe(name:"pollo",rating: 5,dateCreated: new Date(),lastUpdate: null).save()
        recipe3 =new Recipe(name:"algo",rating: 2,dateCreated: new Date(),lastUpdate: new Date()).save()
        recipe4 =new Recipe(name:"antesqe",rating: 4,dateCreated: new Date(),lastUpdate: new Date()).save()

        then:
        recipe1==null
        recipe2==null
        //recipe3!=null
        //recipe4!=null
    }
}
