package culinairegrails

import grails.test.mixin.*
import spock.lang.Specification
import java.nio.file.Files;
/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(WebController)
@Mock([Recipe,Restaurant,Contact,Category,Person])

class WebControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test web controller"() {

        when:"test abrir receta"
        controller.abrirReceta()

        then:
        view == '/web/receta'
        model.recipes==Recipe.findByName(params.name)

        when:"test abrir Restaurante"
        controller.abrirRestaurante()

        then:
        view == '/web/restaurante'
        model.restaurante==Restaurant.findByUsername(params.user)

        /*when:"eliminar contacto"
        Contact contac=new Contact(issue: "eee",description: "tetet")
        params.contacto=contac
        controller.eliminarContacto()

        then:
        response.redirectedUrl == '/web/admin'*/

        when:"busqueda restaurante"
        params.paisR="Ninguna"
        params.cocinaR="Ninguna"
        controller.busquedaRestaurantes()

        then:
        view=='/web/restaurantes'

        when:"test busqueda f"
        params.ingredienteB="Ninguna"
        params.categoriaB="Ninguna"
        params.duracionB="Ninguna"
        params.dificultadB="Ninguna"
        params.bsubmit="Buscar"
        controller.busquedaf()

        then:
        view=="/web/recetas"
        model.categories== Category.list()

        when:"editar perfil"
        File fi2 = new File("web-app/images/coso.jpg");
        byte[] fileContent2 = Files.readAllBytes(fi2.toPath())
        Person a=new Person(name:"Carlos", lastname: "Solorzano", birthdate: new GregorianCalendar(1995, 11, 14), username: "Cosolo",
                password: "Test1234", email:"cosolorzanov@unal.edu.co", description: "Creador", rating: 3, photo: fileContent2).save()
        session.user = a.username
        controller.editarperfilpersona()

        then:
        view=='/web/editarperfil'
        model.person==a
    }
}
