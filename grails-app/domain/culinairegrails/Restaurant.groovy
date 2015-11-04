package culinairegrails

class Restaurant extends User{

    String name
    String city
    String address

    static hasMany = [plates: Plate]

    static belongsTo = [country: Country]

    static constraints = {
        name(nullable: false, blank: false)
        city(nullable: false, blank: false)
        address(nullable: false, blank: false)
        photo(nullable: false, minSize: 1)
        description(nullable: false)
    }
}
