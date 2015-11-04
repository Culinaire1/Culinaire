import culinairegrails.Category
import culinairegrails.Country
import culinairegrails.Difficulty
import culinairegrails.Duration

import culinairegrails.Ingredient
import culinairegrails.Instruction
import culinairegrails.Person
import culinairegrails.Plate
import culinairegrails.Quantity
import culinairegrails.Recipe
import culinairegrails.Restaurant
import java.nio.file.Files;

class BootStrap {

    def init = { servletContext ->
        if( Duration.count() == 0){
            new Duration(duration: "Menos de 15 minutos").save()
            new Duration(duration: "Entre 15 y 30 minutos").save()
            new Duration(duration: "Entre 30 y 60 minutos").save()
            new Duration(duration: "Entre 1 y 2 horas").save()
            new Duration(duration: "Mas de 2 horas").save()
        }
        if( Person.count() == 0){
            File fi = new File("web-app/images/jc.jpg");
            byte[] fileContent = Files.readAllBytes(fi.toPath())
            new Person(name:"Juan Camilo", lastname: "Calero", birthdate: new GregorianCalendar(1996, 11, 14), username: "SpaceCode4",
                    password: "Test1234", email:"jccaleroe@unal.edu.co", description: "Creador", rating: 3, photo: fileContent).save()

            File fi2 = new File("web-app/images/coso.jpg");
            byte[] fileContent2 = Files.readAllBytes(fi2.toPath())
            new Person(name:"Carlos", lastname: "Solorzano", birthdate: new GregorianCalendar(1995, 11, 14), username: "Cosolo",
                    password: "Test1234", email:"cosolorzanov@unal.edu.co", description: "Creador", rating: 3, photo: fileContent2).save()

            File fi3 = new File("web-app/images/af.jpg");
            byte[] fileContent3 = Files.readAllBytes(fi3.toPath())
            new Person(name:"Andres Felipe", lastname: "De Orcajo", birthdate: new GregorianCalendar(1996, 05, 02), username: "afdev",
                    password: "Test1234", email:"afdev@unal.edu.co", description: "Creador", rating: 3, photo: fileContent3).save()
        }

        if( Difficulty.count() == 0){
            new Difficulty(level: "Facil").save()
            new Difficulty(level: "Medio").save()
            new Difficulty(level: "Dificil").save()
            new Difficulty(level: "Master Chef").save()
        }
        if ( Category.count() == 0 ) {
            new Category(name:'Aperitivos').save()
            new Category(name:'Arroces').save()
            new Category(name:'Aves').save()
            new Category(name:'Bebidas').save()
            new Category(name:'Carnes').save()
            new Category(name:'Ensaladas').save()
            new Category(name:'Frutas').save()
            new Category(name:'Verduras').save()
            new Category(name:'Pan').save()
            new Category(name:'Pastas').save()
            new Category(name:'Pescados').save()
            new Category(name:'Platos principales').save()
            new Category(name:'Postres').save()
            new Category(name:'Salsas').save()
            new Category(name:'Sopas').save()
        }
        if ( Country.count() == 0 ) {
            new Country(name:'Afganistan').save()
            new Country(name:'Africa del Sur').save()
            new Country(name:'Albania').save()
            new Country(name:'Alemania').save()
            new Country(name:'Andorra').save()
            new Country(name:'Angola').save()
            new Country(name:'Antigua y Barbuda').save()
            new Country(name:'Antillas Holandesas').save()
            new Country(name:'Arabia Saudita').save()
            new Country(name:'Argelia').save()
            new Country(name:'Argentina').save()
            new Country(name:'Armenia').save()
            new Country(name:'Aruba').save()
            new Country(name:'Australia').save()
            new Country(name:'Austria').save()
            new Country(name:'Azerbaijan').save()
            new Country(name:'Bahamas').save()
            new Country(name:'Bahrain').save()
            new Country(name:'Bangladesh').save()
            new Country(name:'Barbados').save()
            new Country(name:'Belarusia').save()
            new Country(name:'Belgica').save()
            new Country(name:'Belice').save()
            new Country(name:'Benin').save()
            new Country(name:'Bermudas').save()
            new Country(name:'Bolivia').save()
            new Country(name:'Bosnia').save()
            new Country(name:'Botswana').save()
            new Country(name:'Brasil').save()
            new Country(name:'Brunei Darussulam').save()
            new Country(name:'Bulgaria').save()
            new Country(name:'Burkina Faso').save()
            new Country(name:'Burundi').save()
            new Country(name:'Butan').save()
            new Country(name:'Camboya').save()
            new Country(name:'Camerun').save()
            new Country(name:'Canada').save()
            new Country(name:'Cape Verde').save()
            new Country(name:'Chad').save()
            new Country(name:'Chile').save()
            new Country(name:'China').save()
            new Country(name:'Chipre').save()
            new Country(name:'Colombia').save()
            new Country(name:'Comoros').save()
            new Country(name:'Congo').save()
            new Country(name:'Corea del Norte').save()
            new Country(name:'Corea del Sur').save()
            new Country(name:'Costa de Marfil').save()
            new Country(name:'Costa Rica').save()
            new Country(name:'Croasia').save()
            new Country(name:'Cuba').save()
            new Country(name:'Dinamarca').save()
            new Country(name:'Djibouti').save()
            new Country(name:'Dominica').save()
            new Country(name:'Ecuador').save()
            new Country(name:'Egipto').save()
            new Country(name:'El Salvador').save()
            new Country(name:'Emiratos Arabes Unidos').save()
            new Country(name:'Eritrea').save()
            new Country(name:'Eslovenia').save()
            new Country(name:'Espana').save()
            new Country(name:'Estados Unidos').save()
            new Country(name:'Estonia').save()
            new Country(name:'Etiopia').save()
            new Country(name:'Fiji').save()
            new Country(name:'Filipinas').save()
            new Country(name:'Finlandia').save()
            new Country(name:'Francia').save()
            new Country(name:'Gabon').save()
            new Country(name:'Gambia').save()
            new Country(name:'Georgia').save()
            new Country(name:'Ghana').save()
            new Country(name:'Granada').save()
            new Country(name:'Grecia').save()
            new Country(name:'Groenlandia').save()
            new Country(name:'Guadalupe').save()
            new Country(name:'Guam').save()
            new Country(name:'Guatemala').save()
            new Country(name:'Guayana Francesa').save()
            new Country(name:'Guerney').save()
            new Country(name:'Guinea').save()
            new Country(name:'Guinea-Bissau').save()
            new Country(name:'Guinea Equatorial').save()
            new Country(name:'Guyana').save()
            new Country(name:'Haiti').save()
            new Country(name:'Holanda').save()
            new Country(name:'Honduras').save()
            new Country(name:'Hong Kong').save()
            new Country(name:'Hungria').save()
            new Country(name:'India').save()
            new Country(name:'Indonesia').save()
            new Country(name:'Irak').save()
            new Country(name:'Iran').save()
            new Country(name:'Irlanda').save()
            new Country(name:'Islandia').save()
            new Country(name:'Islas Caiman').save()
            new Country(name:'Islas Faroe').save()
            new Country(name:'Islas Malvinas').save()
            new Country(name:'Islas Marshall').save()
            new Country(name:'Islas Solomon').save()
            new Country(name:'Islas Virgenes Britanicas').save()
            new Country(name:'Islas Virgenes (U.S.)').save()
            new Country(name:'Israel').save()
            new Country(name:'Italia').save()
            new Country(name:'Jamaica').save()
            new Country(name:'Japon').save()
            new Country(name:'Jersey').save()
            new Country(name:'Jordania').save()
            new Country(name:'Kazakhstan').save()
            new Country(name:'Kenia').save()
            new Country(name:'Kiribati').save()
            new Country(name:'Kuwait').save()
            new Country(name:'Kyrgyzstan').save()
            new Country(name:'Laos').save()
            new Country(name:'Latvia').save()
            new Country(name:'Lesotho').save()
            new Country(name:'Libano').save()
            new Country(name:'Liberia').save()
            new Country(name:'Libia').save()
            new Country(name:'Liechtenstein').save()
            new Country(name:'Lituania').save()
            new Country(name:'Luxemburgo').save()
            new Country(name:'Macao').save()
            new Country(name:'Macedonia').save()
            new Country(name:'Madagascar').save()
            new Country(name:'Malasia').save()
            new Country(name:'Malawi').save()
            new Country(name:'Maldivas').save()
            new Country(name:'Mali').save()
            new Country(name:'Malta').save()
            new Country(name:'Marruecos').save()
            new Country(name:'Martinica').save()
            new Country(name:'Mauricio').save()
            new Country(name:'Mauritania').save()
            new Country(name:'Mexico').save()
            new Country(name:'Micronesia').save()
            new Country(name:'Moldova').save()
            new Country(name:'Monaco').save()
            new Country(name:'Mongolia').save()
            new Country(name:'Mozambique').save()
            new Country(name:'Myanmar (Burma)').save()
            new Country(name:'Namibia').save()
            new Country(name:'Nepal').save()
            new Country(name:'Nicaragua').save()
            new Country(name:'Niger').save()
            new Country(name:'Nigeria').save()
            new Country(name:'Noruega').save()
            new Country(name:'Nueva Caledonia').save()
            new Country(name:'Nueva Zealandia').save()
            new Country(name:'Oman').save()
            new Country(name:'Pakistan').save()
            new Country(name:'Palestina').save()
            new Country(name:'Panama').save()
            new Country(name:'Papua Nueva Guinea').save()
            new Country(name:'Paraguay').save()
            new Country(name:'Peru').save()
            new Country(name:'Polinesia Francesa').save()
            new Country(name:'Polonia').save()
            new Country(name:'Portugal').save()
            new Country(name:'Puerto Rico').save()
            new Country(name:'Qatar').save()
            new Country(name:'Reino Unido').save()
            new Country(name:'Republica Centroafricana').save()
            new Country(name:'Republica Checa').save()
            new Country(name:'Republica Democratica del Congo').save()
            new Country(name:'Republica Dominicana').save()
            new Country(name:'Republica Eslovaca').save()
            new Country(name:'Reunion').save()
            new Country(name:'Ruanda').save()
            new Country(name:'Rumania').save()
            new Country(name:'Rusia').save()
            new Country(name:'Sahara').save()
            new Country(name:'Samoa').save()
            new Country(name:'San Cristobal-Nevis (St. Kitts)').save()
            new Country(name:'San Marino').save()
            new Country(name:'San Vincente y las Granadinas').save()
            new Country(name:'Santa Helena').save()
            new Country(name:'Santa Lucia').save()
            new Country(name:'Santa Sede (Vaticano)').save()
            new Country(name:'Sao Tome & Principe').save()
            new Country(name:'Senegal').save()
            new Country(name:'Seychelles').save()
            new Country(name:'Sierra Leona').save()
            new Country(name:'Singapur').save()
            new Country(name:'Siria').save()
            new Country(name:'Somalia').save()
            new Country(name:'Sri Lanka (Ceilan)').save()
            new Country(name:'Sudan').save()
            new Country(name:'Sudan del Sur').save()
            new Country(name:'Suecia').save()
            new Country(name:'Suiza').save()
            new Country(name:'Sur Africa').save()
            new Country(name:'Surinam').save()
            new Country(name:'Swaziland').save()
            new Country(name:'Tailandia').save()
            new Country(name:'Taiwan').save()
            new Country(name:'Tajikistan').save()
            new Country(name:'Tanzania').save()
            new Country(name:'Timor Oriental').save()
            new Country(name:'Togo').save()
            new Country(name:'Tokelau').save()
            new Country(name:'Tonga').save()
            new Country(name:'Trinidad & Tobago').save()
            new Country(name:'Tunisia').save()
            new Country(name:'Turkmenistan').save()
            new Country(name:'Turquia').save()
            new Country(name:'Ucrania').save()
            new Country(name:'Uganda').save()
            new Country(name:'Union Europea').save()
            new Country(name:'Uruguay').save()
            new Country(name:'Uzbekistan').save()
            new Country(name:'Vanuatu').save()
            new Country(name:'Venezuela').save()
            new Country(name:'Vietnam').save()
            new Country(name:'Yemen').save()
            new Country(name:'Zambia').save()
            new Country(name:'Zimbabwe').save()
        }

        if(Restaurant.count() == 0){
            File fi = new File("web-app/images/f3.jpg");
            byte[] fileContent = Files.readAllBytes(fi.toPath())

            new Restaurant(name: "Culinaire's", city: "Bogota", address: "Cll 52 #45-16", username: "culinaire", password: "Test1234",
                    email:"culinaire@culinaire.com.co", description: "Comida italiana", rating: 5, country: Country.findByName('Colombia'),
                    photo: fileContent).save()
            File fi2 = new File("web-app/images/f4.jpg");
            byte[] fileContent2 = Files.readAllBytes(fi2.toPath())

            new Restaurant(name: "Wok", city: "Bogota", address: "Cll 96 #28-67", username: "wokfood", password: "Test1234",
                    email:"wok@wok.com.co", description: "Comida asiatica", rating: 2, country: Country.findByName('Colombia'),
                    photo: fileContent2).save()
            File fi3 = new File("web-app/images/f5.jpg");
            byte[] fileContent3 = Files.readAllBytes(fi3.toPath())

            new Restaurant(name: "Archie's", city: "Bogota", address: "Cll 123 #45-67", username: "archies", password: "Test1234",
                    email:"archies@archies.com.co", description: "Comida italiana", rating: 2, country: Country.findByName('Colombia'),
                    photo: fileContent3).save()
        }

        if( Plate.count() == 0){
            new Plate(description: 'Ravioli de la casa', photo: [0,0,0,0], category: Category.findByName('Pastas'),
                    restaurant: Restaurant.findByName("Culinaire's")).save()
            new Plate(description: 'Pizza casera', photo: [0,0,0,0], category: Category.findByName('Pastas'),
                    restaurant: Restaurant.findByName("Archie's")).save()
        }

        if(Recipe.count() == 0){
            File fi = new File("web-app/images/rav.jpg");
            byte[] fileContent = Files.readAllBytes(fi.toPath())
            Recipe recipe = new Recipe(name: 'Ravioli con pollo', rating: 2, description: 'Muy rico y rapido',
                    country: Country.findByName('Colombia'), difficulty: Difficulty.findByLevel("Facil"),
                    duration: Duration.findByDuration("Menos de 15 minutos"), category: Category.findByName('Pastas'),
                    person: Person.get(1), photo: fileContent).save()

            Ingredient ingredient1 = new Ingredient(name: 'Pasta').save()
            new Quantity(quantity: "100 gramos", recipe: recipe, ingredient: ingredient1).save()
            new Instruction(description: 'Calentar 15 minutos la pasta', recipe: recipe, paso: 1).save()

            File fi2 = new File("web-app/images/pi.jpg");
            byte[] fileContent2 = Files.readAllBytes(fi2.toPath())
            Recipe recipe2 = new Recipe(name: 'Pizza de queso', rating: 4, description: 'Exquisito!',
                    country: Country.findByName('Italia'), difficulty: Difficulty.findByLevel("Medio"),
                    duration: Duration.findByDuration("Entre 15 y 30 minutos"), category: Category.findByName('Aperitivos'),
                    person: Person.get(3), photo: fileContent2).save()

            Ingredient ingredient = new Ingredient(name: 'Queso').save()
            new Quantity(quantity: "500 gramos", recipe: recipe2, ingredient: ingredient).save()
            new Instruction(description: 'Hornear a fuego medio', recipe: recipe2, paso: 1).save()
        }
    }
    def destroy = {
    }
}
