package culinairegrails

import grails.test.mixin.*
import spock.lang.Specification

import java.nio.file.Files

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(PersonController)
@Mock([Person,Country,Difficulty,Ingredient,Quantity,Instruction,Duration,Recipe,Category])
class PersonControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test person controller"() {

        when:"test update"
        File fi2 = new File("web-app/images/coso.jpg");
        byte[] fileContent2 = Files.readAllBytes(fi2.toPath())
        Person a=new Person(name:"Carlos", lastname: "Solorzano", birthdate: new GregorianCalendar(1995, 11, 14), username: "Cosolo",
                password: "Test1234", email:"cosolorzanov@unal.edu.co", description: "Creador", rating: 3, photo: fileContent2).save()

        a.save()
        params.email="cosolorzanov@unal.edu.co"
        params.password="Test1234"
        params.name="Carlos"
        params.lastname="Solorzano"
        params.username="Cosolo"
        params.birthdate2="1995-11-14"
        params.photo=fi2
        session.user = a.username
        controller.update()

        then:
        response.redirectedUrl == '/person/login/1'

    }
}
