package culinairegrails

class Quantity {

    String quantity

    static belongsTo = [ingredient: Ingredient, recipe: Recipe]

    static constraints = {
        quantity(nullable: false, blank: false)
    }
}
