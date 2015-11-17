package culinairegrails

class City {

    String name;

    static belongsTo = [country: Country]
    static hasMany = [directions: Direction]

    static constraints = {
        name(nullable: false, blank: false)
    }
}
