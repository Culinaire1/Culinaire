package culinairegrails

class QuantityController {

    static scaffold = Quantity

    def lol(long id){
        Quantity quantity = Quantity.get(id)
        render(quantity.quantity)
        println('lol')
        println(quantity.ingredient)
        println(quantity.ingredient.id)
        println(Quantity.findAll("from Quantity as q where q.recipe.name = 'Pizza de queso'"))
    }
}
