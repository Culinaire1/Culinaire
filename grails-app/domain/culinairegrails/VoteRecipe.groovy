package culinairegrails

class VoteRecipe {

    Integer voter
    static belongsTo = [recipe: Recipe]
}
