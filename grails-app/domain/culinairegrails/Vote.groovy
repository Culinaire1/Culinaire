package culinairegrails

class Vote {
    Integer voter
    static belongsTo = [person: Person, restaurant: Restaurant, recipe: Recipe]
}
