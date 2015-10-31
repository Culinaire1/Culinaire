package culinairegrails

class Plate{
    String description
    byte[] photo

    static belongsTo = [food: Food, restaurant: Restaurant]

    static constraints = {
        description(nullable: false)
        photo(nullable: false)
    }
}
