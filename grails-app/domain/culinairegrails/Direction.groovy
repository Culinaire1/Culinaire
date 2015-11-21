package culinairegrails

class Direction {

    String address;

    static belongsTo = [city: City, restaurant: Restaurant]

    static constraints = {
        address(nullable: false, blank: false)
    }

    String toString(){
        "${address}"
    }
}
