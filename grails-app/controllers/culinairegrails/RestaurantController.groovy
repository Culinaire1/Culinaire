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
        restaurant.country = Country.findByName(params.countryR)

        if (!restaurant.validate()) {
            respond restaurant.errors, view: 'create'
            return
        }

        restaurant.save flush: true

        redirect action: 'show', id: restaurant.id
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

        redirect action: 'show', id: restaurantInstance.id
    }
}
