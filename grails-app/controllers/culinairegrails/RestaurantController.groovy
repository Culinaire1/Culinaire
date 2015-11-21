package culinairegrails

class RestaurantController {

    static scaffold = Restaurant

    def save() {
        Restaurant restaurant = new Restaurant(name: params.nameR, username: params.usernameR, password: params.passwordR,
                email: params.emailR, photo: params.photoR.getBytes(), website: params.websiteR, country: Country.findByName(params.countryR),
                cuisine: Cuisine.findByName(params.cuisine), description: params.description)

        if (!restaurant.validate()) {
            TreeSet<String> tree = new TreeSet<String>()
            for( i in restaurant.errors.fieldErrors.field){
                tree.add(i)
            }
            redirect(controller: 'web', action: 'ingresar')
            flash.error = tree
            return
        }
        restaurant.save flush: true

        for(int i = 1; i <= params.citiesNum.toInteger(); i++ ){
            String a = params.getProperty("city"+i);
            City city = City.findByName(a);
            if (city == null){
                city = new City(country: Country.findByName(params.countryR), name: a).save flush: true
            }
            restaurant.addToCities(city)
            restaurant.save flush: true

            String b = params.getProperty("cityDirNum"+i)
            int n = b.toInteger();
            for(int j = 1; j <= n; j++){
                new Direction(address: params.getProperty("city"+i+"dir"+j), city: city, restaurant: restaurant).save flush: true
            }
        }
        new Menu(restaurant: restaurant).save()
        redirect action: 'login', id: restaurant.id
    }

    def addComments(){
        Person person = Person.findByUsername(session.user);
        Restaurant restaurant = Restaurant.get(params.id.toInteger())
        RestaurantPost post = new RestaurantPost(person: person, restaurant: restaurant, content: params.post)
        post.save flush: true
        redirect(controller:'web', action:'abrirRestaurante', params: [user: restaurant.username])
    }

    def saveMenu(){
        Restaurant restaurant = Restaurant.findByUsername(session.user)
        int n = params.platesNum.toInteger()
        def plates = restaurant.menu.plates
        for(int i = 1; i <= n; i++){
            if( (i-1) < plates.size()){
                Plate plate = plates.getAt(i-1)
                plate.name = params.getProperty("plate"+i)
                plate.save flush: true
            }
            else
                new Plate(name: params.getProperty("plate"+i), menu: restaurant.menu).save flush: true
        }
        redirect(controller:'web', action:'abrirRestaurante', params: [user: restaurant.username])
    }

    def displayGraph = {
        def resPhoto = Restaurant.findByName((String) params.name)
        if (!resPhoto || !resPhoto.photo) {
            response.sendError(404)
            return
        }
        response.contentType = resPhoto.photo
        response.contentLength = resPhoto.photo.size()
        OutputStream out = response.outputStream
        out.write(resPhoto.photo)
        out.close()
    }

    def login(long id){
        def restaurant = Restaurant.get(id)
        session.user = restaurant.username
        session.tu = false
        redirect controller: 'web', action: 'index'
    }
}
