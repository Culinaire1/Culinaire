package culinairegrails

class Quantity {

    String quantity

    //static belongsTo = [recipe: Recipe, ingredient: Ingredient]

    static constraints = {
        quantity nullable: false, blank: false
    }
}
