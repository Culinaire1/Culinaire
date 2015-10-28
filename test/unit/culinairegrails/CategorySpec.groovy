package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Category)
class CategorySpec extends Specification {

    static String s
    def setup() {
        s = ""
        1.upto(20){
            s += "a"
        }
    }

    def cleanup() {
    }

    void "test something"() {
        when:"test name"
        Category Category1=new Category(name:null).save()
        Category Category2=new Category(name:"pasteles").save()
        Category Category3=new Category(name:"Col").save()
        Category Category4=new Category(name:"co").save()
        Category Category5=new Category(name:s).save()
        Category Category6=new Category(name:s+"a").save()

        then:
        Category1==null
        Category2!=null
        Category3!=null
        Category4 ==null
        Category5!=null
        Category6==null
    }
}
