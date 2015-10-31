package culinairegrails

class PlateController {

    static scaffold = Plate

    def update(Plate plate){

        if (plate == null) {
            notFound()
            return
        }

        if (plate.hasErrors()) {
            respond plate.errors, view: 'create'
            return
        }

        plate.save flush: true

        redirect action: 'show', id: plate.id
    }

    def save(Plate plate){

        if (plate == null) {
            notFound()
            return
        }

        if (plate.hasErrors()) {
            respond plate.errors, view: 'create'
            return
        }

        plate.save flush: true

        redirect action: 'show', id: plate.id
    }
}
