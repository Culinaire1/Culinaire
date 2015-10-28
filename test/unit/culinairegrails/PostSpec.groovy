package culinairegrails

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Post)
class PostSpec extends Specification {

    def setup() {

    }

    def cleanup() {
    }

    void "test for Post"() {
        when:"test dateCreated"
        Post post1=new Post(dateCreated: new Date()-1, content: "algooo").save()
        Post post2=new Post( content: "algo").save()

        then:
        //post1!=null
        post2==null

        when:"test for content"
        post1=new Post(dateCreated:new Date()-1, content: "algo")
        post2=new Post(dateCreated:new Date(), content: null)

        then:
        post1!=null
        //post2==null

    }
}
