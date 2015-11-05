package culinairegrails

class Plate{
    String description
    byte[] photo

    static belongsTo = [category: Category, restaurant: Restaurant]

    static constraints = {
        description(nullable: false)
        photo(nullable: false)
    }

    String toString(){
        "${description}"
    }
}
