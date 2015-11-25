import culinairegrails.Admin
import culinairegrails.Category
import culinairegrails.City
import culinairegrails.Country
import culinairegrails.Cuisine
import culinairegrails.Difficulty
import culinairegrails.Direction
import culinairegrails.Duration

import culinairegrails.Ingredient
import culinairegrails.Instruction
import culinairegrails.Menu
import culinairegrails.Person
import culinairegrails.Plate
import culinairegrails.Quantity
import culinairegrails.Recipe
import culinairegrails.Restaurant
import culinairegrails.Vote

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

            File fi4 = new File("web-app/images/od.jpg");
            byte[] fileContent4 = Files.readAllBytes(fi4.toPath())
            new Person(name:"Oscar Dario", lastname: "Parra", birthdate: new GregorianCalendar(1994, 12, 19), username: "odparraj",
                    password: "Test1234", email:"odparraj@unal.edu.co", description: "Creador", rating: 3, photo: fileContent4).save()
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

        if(Cuisine.count() == 0){
            new Cuisine(name: 'Cocina Italina').save()
            new Cuisine(name: 'Cocina Colombiana').save()
            new Cuisine(name: 'Cocina Tailandesa').save()
            new Cuisine(name: 'Cocina Asiatica').save()
        }

        if(Restaurant.count() == 0){
            File fi = new File("web-app/images/f3.jpg");
            byte[] fileContent = Files.readAllBytes(fi.toPath())

            Restaurant tmp = new Restaurant(name: "Culinaire's", username: "culinaire", password: "Test1234",
                    email:"culinaire@culinaire.com.co", description: "Comida italiana", rating: 5, country: Country.findByName('Colombia'),
                    photo: fileContent, cuisine: Cuisine.findByName('Cocina Colombiana'), website: "https://culinaire.herokuapp.com/", approved: true).save()

            City city = new City(country: Country.findByName('Colombia'), name: 'Bogotá').save()
            new Direction(address: 'Carrera 163 #49-12', city: city, restaurant: tmp).save()
            tmp.addToCities(city)

            tmp.save()

            new Menu(restaurant: tmp).save()

            File fi2 = new File("web-app/images/f4.jpg");
            byte[] fileContent2 = Files.readAllBytes(fi2.toPath())

            tmp = new Restaurant(name: "Wok", username: "wokfood", password: "Test1234",
                    email:"wok@wok.com.co", description: "Comida asiatica", rating: 2, country: Country.findByName('Colombia'),
                    photo: fileContent2, cuisine: Cuisine.findByName('Cocina Asiatica'), website: "http://wok.com.co/wps/portal/wok", approved: true).save()

            new Direction(address: 'Kr 19 #118-75', city: city, restaurant: tmp).save()
            tmp.addToCities(city)
            tmp.save()

            new Menu(restaurant: tmp).save()

            File fi3 = new File("web-app/images/f5.jpg");
            byte[] fileContent3 = Files.readAllBytes(fi3.toPath())

            tmp = new Restaurant(name: "Archie's", username: "archies", password: "Test1234",
                    email:"archies@archies.com.co", description: "Comida italiana", rating: 2, country: Country.findByName('Colombia'),
                    photo: fileContent3, cuisine: Cuisine.findByName('Cocina Italiana'), website: "http://www.archies.co/", approved: true).save()

            new Direction(address: 'Cl 134 #55-30', city: city, restaurant: tmp).save()
            tmp.addToCities(city)
            tmp.save()

            new Menu(restaurant: tmp).save()

            File fi4 = new File("web-app/images/f9.jpg");
            byte[] fileContent4 = Files.readAllBytes(fi4.toPath())

            tmp = new Restaurant(name: "T-Bone", username: "tbone", password: "Test1234",
                    email:"t-bone@tbone.com.co", description: "La especialidad son las carnes maduradas hechas al carbón, de donde proviene el nombre del restaurante", rating: 2, country: Country.findByName('Colombia'),
                    photo: fileContent4, cuisine: Cuisine.findByName('Cocina Colombiana'), website: "http://restaurante-tbone.com.co/", approved: true).save()

            new Direction(address: 'Cra. 4 No. 12c-34', city: city, restaurant: tmp).save()
            tmp.addToCities(city)
            tmp.save()

            new Menu(restaurant: tmp).save()
        }

        if( Plate.count() == 0){
            Menu tmp = Restaurant.findByName("Culinaire's").menu
            new Plate(name: 'Ravioli de la casa', menu: tmp).save()

            tmp = Restaurant.findByName("Archie's").menu
            new Plate(name: 'Pizza casera', menu: tmp).save()

            tmp = Restaurant.findByName("Wok").menu
            new Plate(name: 'Ropa vieja', menu: tmp).save()

            tmp = Restaurant.findByName("T-Bone").menu
            new Plate(name: ' corte de lomo ancho y lomo fino con hueso', menu: tmp).save()
        }

        if(Recipe.count() == 0){
            File fotoNatilla = new File("web-app/images/natilla.jpg");
            byte[] fileContent1 = Files.readAllBytes(fotoNatilla.toPath())
            Recipe natilla = new Recipe(name: 'Natilla', rating: 3, description: 'Disfruta de la navidad',
                    country: Country.findByName('Colombia'), difficulty: Difficulty.findByLevel("Facil"),
                    duration: Duration.findByDuration("Entre 15 y 30 minutos"), category: Category.findByName('Postres'),
                    person: Person.get(3), photo: fileContent1, video: "https://www.youtube.com/embed/2ZB-6br3ZHA", typical: true).save()

            new Instruction(description: 'Se pone a hervir un litro y medio de leche con la canela en astillas y la panela, sacandole la espuma que vaya formando.', recipe: natilla, paso: 1).save()
            new Instruction(description: 'Se aniade la fecula de maiz (que se ha disuelto previamente en medio litro de leche) y la mantequilla.', recipe: natilla, paso: 2).save()
            new Instruction(description: 'Se va revolviendo lentamente y se cocina a fuego lento por diez minutos o hasta que de su punto (que se reconoce poniendo una cucharada de la mezcla en un plato, se deja enfriar, pudiendo despegarlo facilmente).', recipe: natilla, paso: 3).save()
            new Instruction(description: 'Justo antes de bajarla del fuego se le aniade el coco, se revuelve y se vierte en los moldes.', recipe: natilla, paso: 4).save()
            new Instruction(description: 'En el momento de servir la porcion individual, se espolvorea un poco de canela en polvo.', recipe: natilla, paso: 5).save()
            new Instruction(description: 'Como opcional se puede agregar a cada porcion una cucharada de dulce de mora.', recipe: natilla, paso: 6).save()

            Ingredient leche = new Ingredient(name: 'leche').save()
            Ingredient Fecula = new Ingredient(name: 'fecula de maiz').save()
            Ingredient panela = new Ingredient(name: 'panela raspada').save()
            Ingredient mantequilla = new Ingredient(name: 'mantequilla').save()
            Ingredient coco = new Ingredient(name: 'coco fresco rallado').save()
            Ingredient canela = new Ingredient(name: 'canela').save()
            Ingredient canela1 = new Ingredient(name: 'canela en polvo').save()

            new Quantity(quantity: '2 litros', recipe: natilla, ingredient: leche).save()
            new Quantity(quantity: '2 tazas', recipe: natilla, ingredient: Fecula).save()
            new Quantity(quantity: "1 libra", recipe: natilla, ingredient: panela).save()
            new Quantity(quantity: '4 astillas', recipe: natilla, ingredient: canela).save()
            new Quantity(quantity: '2 cucharadas', recipe: natilla, ingredient: mantequilla).save()
            new Quantity(quantity: "1", recipe: natilla, ingredient: coco).save()
            new Quantity(quantity: "1 cucharada", recipe: natilla, ingredient: canela1).save()
            //--------------------------------------------------------------------------------------------------------
            File fotodonburi = new File("web-app/images/donburi.jpg");
            byte[] fileContent3 = Files.readAllBytes(fotodonburi.toPath())
            Recipe donburi = new Recipe(name: 'Donburi de pollo y lomo', rating: 4, description: 'El donburi es un plato típico de Japon. ' +
                    'Consiste en un cuenco que contiene pescado, carne, vegetales, u otros ingredientes cocinados juntos y servidos sobre arroz.',
                    country: Country.findByName('Japon'), difficulty: Difficulty.findByLevel("Medio"),
                    duration: Duration.findByDuration("Entre 30 y 60 minutos"), category: Category.findByName('Carnes'),
                    person: Person.get(1), photo: fileContent3, video: "https://www.youtube.com/embed/i9v8FO9Q1QY", typical: false).save()

            new Instruction(description: 'En una olla precalentamos el aceite. Cuando este caliente ponemos a sofreir la ralladura de limon y el jengibre para darle sabor al aceite.', recipe: donburi, paso: 1).save()
            new Instruction(description: 'Ponemos en la olla el arroz, mezclandolo con la ralladura de limon y el jengibre por 2 minutos, colocamos la sal y el agua. Dejamos hervir y tapamos por 12 minutos.', recipe: donburi, paso: 2).save()
            new Instruction(description: 'Colocamos una sartan a calentar, cuando tenga buena temperatura colocamos un poco de aceite y sellamos la carne y el pollo en cubos, ponemos un poco de sal, pimienta y togarashi.', recipe: donburi, paso: 3).save()
            new Instruction(description: 'Cuando esten bien sellados los cubos, colocamos la salsa teriyaki y dejamos caramelizar las piezas.', recipe: donburi, paso: 4).save()

            Ingredient pechuga = new Ingredient(name: 'pechuga de pollo').save()
            Ingredient lomo = new Ingredient(name: 'lomo fino de res').save()
            Ingredient cebollin = new Ingredient(name: 'cebollin').save()
            Ingredient ajonjoli = new Ingredient(name: 'ajonjoli').save()
            Ingredient togarashi = new Ingredient(name: 'togarashi').save()
            Ingredient pimienta = new Ingredient(name: 'pimienta').save()
            Ingredient salsa = new Ingredient(name: 'salsa teriyaki').save()
            Ingredient arroz = new Ingredient(name: 'arroz blanco').save()
            Ingredient aceite = new Ingredient(name: 'aceite').save()

            new Quantity(quantity: '180 gramos', recipe: donburi, ingredient: pechuga).save()
            new Quantity(quantity: '180 gramos', recipe: donburi, ingredient: lomo).save()
            new Quantity(quantity: "8 gramos", recipe: donburi, ingredient: cebollin).save()
            new Quantity(quantity: '5 gramos', recipe: donburi, ingredient: ajonjoli).save()
            new Quantity(quantity: '3 gramos', recipe: donburi, ingredient: togarashi).save()
            new Quantity(quantity: "1 gramo", recipe: donburi, ingredient: pimienta).save()
            new Quantity(quantity: "70 onzas", recipe: donburi, ingredient: salsa).save()
            new Quantity(quantity: "250 gramos", recipe: donburi, ingredient: arroz).save()
            new Quantity(quantity: "3 onzas", recipe: donburi, ingredient: aceite).save()

            //---------------------------------------------------------------------------------------------------------
            File fotosorbete = new File("web-app/images/sorbete.jpg");
            byte[] fileContent4 = Files.readAllBytes(fotosorbete.toPath())
            Recipe sorbete = new Recipe(name: 'Sorbete de Uva', rating: 4, description: 'Delicioso y facil de preparar...',
                    country: Country.findByName('Colombia'), difficulty: Difficulty.findByLevel("Facil"),
                    duration: Duration.findByDuration("Entre 30 y 60 minutos"), category: Category.findByName('Postres'),
                    person: Person.get(2), photo: fileContent4, typical: false).save()

            new Instruction(description: 'Despulpar las uvas, licuando de forma intermitente.', recipe: sorbete, paso: 1).save()
            new Instruction(description: 'Colar, y asi sacar el zumo, reservar.', recipe: sorbete, paso: 2).save()
            new Instruction(description: 'En una olla calentar el agua junto al azucar hasta que se forme un sirope, enfriar.', recipe: sorbete, paso: 3).save()
            new Instruction(description: 'Luego verter el sirope al zumo de uva, endulzar a gusto, mezclar y congelar.', recipe: sorbete, paso: 4).save()
            new Instruction(description: 'Servir en copa.', recipe: sorbete, paso: 5).save()

            Ingredient uva = new Ingredient(name: 'uva isabelina').save()
            Ingredient azucar = new Ingredient(name: 'azucar blanco').save()
            Ingredient agua = new Ingredient(name: 'agua').save()
            Ingredient crema = new Ingredient(name: 'crema de leche espesa').save()
            Ingredient lechee = new Ingredient(name: 'leche entera').save()
            Ingredient vainilla= new Ingredient(name: 'extracto de vainilla').save()
            Ingredient glucosa = new Ingredient(name: 'glucosa').save()
            Ingredient lechepolvo = new Ingredient(name: 'leche en polvo').save()
            Ingredient estabilizante = new Ingredient(name: 'estabilizante').save()
            Ingredient chocolate = new Ingredient(name: 'chocolate semi amargo').save()

            new Quantity(quantity: '500 gramos', recipe: sorbete, ingredient: uva).save()
            new Quantity(quantity: '100 gramos', recipe: sorbete, ingredient: azucar).save()
            new Quantity(quantity: "200 ml", recipe: sorbete, ingredient: agua).save()
            new Quantity(quantity: '2 tazas', recipe: sorbete, ingredient: crema).save()
            new Quantity(quantity: '1 taza', recipe: sorbete, ingredient: lechee).save()
            new Quantity(quantity: "2/3 taza", recipe: sorbete, ingredient: azucar).save()
            new Quantity(quantity: "1 cucharadita", recipe: sorbete, ingredient: vainilla).save()
            new Quantity(quantity: "1 cucharada", recipe: sorbete, ingredient: glucosa).save()
            new Quantity(quantity: "2 cucharadas", recipe: sorbete, ingredient: lechepolvo).save()
            new Quantity(quantity: "1 cucharada", recipe: sorbete, ingredient: estabilizante).save()
            new Quantity(quantity: "40 gramos", recipe: sorbete, ingredient: chocolate).save()

            //---------------------------------------------------------------------------------------------------------
            File filete = new File("web-app/images/filete.jpg");
            byte[] fileContent5 = Files.readAllBytes(filete.toPath())
            Recipe filetepescado = new Recipe(name: 'Filete de Pescado con manzana', rating: 4, description: 'Esta receta con fruta y pescado es muy fácil de preparar',
                    country: Country.findByName('Colombia'), difficulty: Difficulty.findByLevel("Facil"),
                    duration: Duration.findByDuration("Entre 30 y 60 minutos"), category: Category.findByName('Frutas'),
                    person: Person.get(2), photo: fileContent5, typical: false).save()

            new Instruction(description: 'Lavaremos la fruta y la cortamos en láminas finas.', recipe: filetepescado, paso: 1).save()
            new Instruction(description: 'Tomamos una fuente apta para horno, y la untamos con un poco de aceite o mantequilla. Repartimos la mitad de las manzanas sobre el fondo del recipiente y ponemos encima los filetes de pescado sazonados y salpimentados.', recipe: filetepescado, paso: 2).save()
            new Instruction(description: 'Regamos zumo de limón y colocamos encima el resto de las manzanas laminadas. Precalentar el horno entre 200 y 225ºC.', recipe: filetepescado, paso: 3).save()
            new Instruction(description: 'Rociamos el pescado y las manzanas con vino blanco, cubrimos la fuente con papel de aluminio, para que no se vaya a resecar, y metemos al horno cuando esté caliente.', recipe: filetepescado, paso: 4).save()
            new Instruction(description: 'Pasado 10 minutos, incorporamos a la cazuela de los filetes de pescado, los guisantes y los langostinos, lavados, pero con piel y cabezas, y volvemos a tapar. Dejamos hornear otros 10 minutos.', recipe: filetepescado, paso: 5).save()

            Ingredient filetes = new Ingredient(name: 'filetes de pescado').save()
            Ingredient langostinos = new Ingredient(name: 'langostinos').save()
            Ingredient manzanas = new Ingredient(name: 'manzanas').save()
            Ingredient Limon = new Ingredient(name: 'limon').save()
            Ingredient guisantes = new Ingredient(name: 'guisantes').save()
            Ingredient vino= new Ingredient(name: 'vino blanco').save()
            Ingredient aceiteo = new Ingredient(name: 'aceite de Oliva').save()
            Ingredient sal = new Ingredient(name: 'sal').save()
            

            new Quantity(quantity: '1 Kg', recipe: filetepescado, ingredient: filetes).save()
            new Quantity(quantity: '12', recipe: filetepescado, ingredient: langostinos).save()
            new Quantity(quantity: "4", recipe: filetepescado, ingredient: manzanas).save()
            new Quantity(quantity: '1', recipe: filetepescado, ingredient: Limon).save()
            new Quantity(quantity: '200 gramos', recipe: filetepescado, ingredient: guisantes).save()
            new Quantity(quantity: "250 ml", recipe: filetepescado, ingredient: vino).save()
            new Quantity(quantity: "1 litro", recipe: filetepescado, ingredient: aceiteo).save()
            new Quantity(quantity: "1 cucharada", recipe: filetepescado, ingredient: sal).save()
            new Quantity(quantity: "5 gramos", recipe: filetepescado, ingredient: pimienta).save()

            File pan = new File("web-app/images/pan.jpg");
            byte[] panf = Files.readAllBytes(pan.toPath())
            Recipe panfrances = new Recipe(name: 'Pan frances', rating: 4, description: 'Una receta de pan francés tan fácil que cualquiera puede prepararla. ',
                    country: Country.findByName('Colombia'), difficulty: Difficulty.findByLevel("Facil"),
                    duration: Duration.findByDuration("Entre 15 y 30 minutos"), category: Category.findByName('Pan'),
                    person: Person.get(2), photo: panf, typical: false).save()

            new Instruction(description: 'Bate los huevos en un tazón mediano. Agrega la leche, azúcar y nuez moscada. Revuelve para mezclar.', recipe: panfrances, paso: 1).save()
            new Instruction(description: 'Remoja las rebanadas de pan en la mezcla de huevo hasta que estén bien empapadas.', recipe: panfrances, paso: 2).save()
            new Instruction(description: 'Engrasa un comal o sartén grande y calienta a fuego medio-alto. Dora las rebanadas de pan por ambos lados, espolvorea con canela y sirve calientes.', recipe: panfrances, paso: 3).save()

            Ingredient huevos = new Ingredient(name: 'huevos').save()
            Ingredient azucarm = new Ingredient(name: 'azúcar mascabado').save()
            Ingredient nuez = new Ingredient(name: 'nuez moscada, molida').save()
            Ingredient panb = new Ingredient(name: 'pan blanco').save()
            Ingredient canelam = new Ingredient(name: 'canela molida').save()


            new Quantity(quantity: '4', recipe: panfrances, ingredient: huevos).save()
            new Quantity(quantity: '3/4 taza', recipe: panfrances, ingredient: leche).save()
            new Quantity(quantity: "2 cucharadas", recipe: panfrances, ingredient: azucarm).save()
            new Quantity(quantity: '1 cucharadita', recipe: panfrances, ingredient: nuez).save()
            new Quantity(quantity: '12 rebanadas', recipe: panfrances, ingredient: panb).save()
            new Quantity(quantity: "1 cucharada", recipe: panfrances, ingredient: canelam).save()

            File pavof = new File("web-app/images/pavo.jpg");
            byte[] pavoff = Files.readAllBytes(pavof.toPath())
            Recipe pavo = new Recipe(name: 'Pavo al horno', rating: 4, description: 'Dicen que la elegancia está en la sencillez y esta receta no es la excepción.',
                    country: Country.findByName('Colombia'), difficulty: Difficulty.findByLevel("Master Chef"),
                    duration: Duration.findByDuration("Mas de 2 horas"), category: Category.findByName('Carnes'),
                    person: Person.get(2), photo: pavoff, typical: false).save()

            new Instruction(description: 'Precalienta el horno a 175° centígrados. Lava y enjuaga el pavo, desecha las vísceras o agrégalas a la charola y te gustan.', recipe: pavo, paso: 1).save()
            new Instruction(description: 'Coloca el pavo en una rosticera o cacerola de hierro fundido. Jala la piel de la pechuga del pavo para que se desprenda un poco. Coloca 3 cucharadas de mantequilla en ambos sobre y debajo de la piel de la pechuga. Esto hace que la pechuga salga más jugosa.', recipe: pavo, paso: 2).save()
            new Instruction(description: 'Mezcla el agua tibia con el consomé de pollo, perejil y cebolla. Vierte sobre el pavo. Salpimienta bien.', recipe: pavo, paso: 3).save()
            new Instruction(description: 'Tapa con papel aluminio y hornea de 3 1/2 a 4 horas, hasta que la temperadura interna del pavo alcance los 80° centígrados (180° F). Destapa durante los últimos 45 minutos para que la poel del pavo se dore.', recipe: pavo, paso: 4).save()


            Ingredient pavoi = new Ingredient(name: 'pavo entero').save()
            Ingredient aguat = new Ingredient(name: 'agua tibia').save()
            Ingredient consome = new Ingredient(name: 'consomé granulado de pollo').save()
            Ingredient perejil = new Ingredient(name: 'perejil seco').save()
            Ingredient cebolla = new Ingredient(name: 'cebolla seca en trozo').save()
            Ingredient salh = new Ingredient(name: 'sal con hierbas').save()


            new Quantity(quantity: '6 Kilos', recipe: pavo, ingredient: pavoi).save()
            new Quantity(quantity: '6 cucharadas', recipe: pavo, ingredient: mantequilla).save()
            new Quantity(quantity: "1 litro", recipe: pavo, ingredient: aguat).save()
            new Quantity(quantity: '3 cucharadas', recipe: pavo, ingredient: consome).save()
            new Quantity(quantity: '2 cucharadas', recipe: pavo, ingredient: perejil).save()
            new Quantity(quantity: "2 cucharadas", recipe: pavo, ingredient: salh).save()
            
            File fotopasta = new File("web-app/images/rav.jpg");
            byte[] fileContent7 = Files.readAllBytes(fotopasta.toPath())
            Recipe pasta = new Recipe(name: 'Ensalada de pasta', rating: 4, description: 'Las ensaladas de pasta son una alternativa estupenda para una cena rapida, ya que admiten multiples variantes.',
                    country: Country.findByName('Espana'), difficulty: Difficulty.findByLevel("Facil"),
                    duration: Duration.findByDuration("Entre 15 y 30 minutos"), category: Category.findByName('Pastas'),
                    person: Person.get(3), photo: fileContent7, typical: false).save()

            new Instruction(description: 'Cocemos la pasta, enfriamos.', recipe: pasta, paso: 1).save()
            new Instruction(description: 'Mezclamos con todos los ingredientes y aliñamos con el aceite, sal y pimienta. Ponemos por encima unas pipas.', recipe: pasta, paso: 2).save()

            Ingredient colores = new Ingredient(name: 'pasta de colores').save()
            Ingredient fresas = new Ingredient(name: 'fresas').save()
            Ingredient kiwis = new Ingredient(name: 'kiwis').save()
            Ingredient maiz = new Ingredient(name: 'maiz').save()
            Ingredient atun = new Ingredient(name: 'atun al natural').save()
            Ingredient cebolleta = new Ingredient(name: 'cebolleta').save()
            Ingredient pipas = new Ingredient(name: 'pipas peladas').save()
            Ingredient pimienta2 = new Ingredient(name: 'pimienta negra recien molida').save()

            new Quantity(quantity: '500 gramos', recipe: pasta, ingredient: colores).save()
            new Quantity(quantity: '50 gramos', recipe: pasta, ingredient: fresas).save()
            new Quantity(quantity: "2", recipe: pasta, ingredient: kiwis).save()
            new Quantity(quantity: '1 lata', recipe: pasta, ingredient: atun).save()
            new Quantity(quantity: '100 gramos', recipe: pasta, ingredient: cebolleta).save()
            new Quantity(quantity: "2", recipe: pasta, ingredient: pipas).save()
            new Quantity(quantity: "4 cucharadita", recipe: pasta, ingredient: aceiteo).save()
            new Quantity(quantity: "2 cucharada", recipe: pasta, ingredient: sal).save()
            new Quantity(quantity: "1 cucharadita", recipe: pasta, ingredient: pimienta2).save()
        }

        if( Admin.count() == 0){
            new Admin(name:"Juan Camilo", lastname: "Calero", username: "admin1", email: "jccaleroe@unal.edu.co", password: "Test1234").save()
            new Admin(name:"Andres Felipe", lastname: "De Orcajo",username: "admin2", password: "Test1234", email:"afdev@unal.edu.co").save()
            new Admin(name:"Oscar Dario", lastname: "Parra", username: "admin4", password: "Test1234", email:"odparraj@unal.edu.co").save()
            new Admin(name:"Carlos", lastname: "Solorzano", username: "admin3", password: "Test1234", email:"cosolorzanov@unal.edu.co").save()
        }
    }
    def destroy = {
    }
}

