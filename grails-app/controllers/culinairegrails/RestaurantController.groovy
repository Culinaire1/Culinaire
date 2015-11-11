package culinairegrails

class RestaurantController {

    static scaffold = Restaurant

    def save(Restaurant restaurant) {
        if (restaurant == null) {
            notFound()
            return
        }

        restaurant.name = params.nameR
        restaurant.photo = params.photoR.getBytes()
        restaurant.username = params.usernameR
        restaurant.password = params.passwordR
        restaurant.email = params.emailR
        restaurant.website = params.websiteR
        restaurant.rating = 1
        restaurant.country = Country.findByName((String) params.countryR)

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

        redirect action: 'login', id: restaurant.id
    }

    def update(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }

        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view: 'edit'
            return
        }

        restaurantInstance.save flush: true

        redirect action: 'login', id: restaurant.id
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
