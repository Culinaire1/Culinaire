package culinairegrails

class Menu {

    static hasMany = [plates: Plate]
    static belongsTo = [restaurant: Restaurant]

    static constraints = {
    }
}
