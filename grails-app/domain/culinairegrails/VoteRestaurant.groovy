package culinairegrails

class VoteRestaurant {
    Integer voter
    static belongsTo = [restaurant: Restaurant]
}
