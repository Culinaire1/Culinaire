package culinairegrails

import grails.test.mixin.*
import spock.lang.Specification

import java.nio.file.Files

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(InstructionController)
@Mock([Recipe,Ingredient,Country,City,Instruction,Duration,Difficulty,Person,Category])
class InstructionControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test  instrution"() {

        /*when:"add instruccion"
        File fotoNatilla = new File("web-app/images/natilla.jpg");
        byte[] fileContent1 = Files.readAllBytes(fotoNatilla.toPath())
        Recipe natilla = new Recipe(name: 'Natilla', rating: 3, description: 'Disfruta de la navidad',
                country: Country.findByName('Colombia'), difficulty: Difficulty.findByLevel("Facil"),
                duration: Duration.findByDuration("Entre 15 y 30 minutos"), category: Category.findByName('Postres'),
                person: Person.get(3), photo: fileContent1, video: "https://www.youtube.com/embed/2ZB-6br3ZHA", typical: true).save()

        Instruction a=new Instruction(description: 'paso 1 luego sigue el paso 2.', recipe: natilla, paso: 1).save()
        controller.save(a)

        then:
        response.redirectedUrl=="/instruction/show"*/
    }
}
