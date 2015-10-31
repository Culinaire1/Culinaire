package culinairegrails

class Ingredient{
    String name
    Integer quantity
    String units
    byte[] photo

    static belongsTo = [recipe: Recipe]

    static constraints = {
        name (nullable: false)
        quantity(nullable: false, min: 1)
        units(nullable: false)
        photo(nullable: true)
    }
}
