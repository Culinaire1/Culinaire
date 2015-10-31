package culinairegrails

class RestaurantController {

    static scaffold = Restaurant

    def save(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }

        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view: 'create'
            return
        }

        restaurantInstance.save flush: true

        redirect action: 'show', id: restaurantInstance.id
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
