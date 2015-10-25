package culinairegrails

class Restaurant extends User{

    String name
    String city
    String address

    static hasMany = [foods: Food, categories: Category]
    static belongsTo = [country: Country]

    static constraints = {
        name(nullable: false, blank: false)
        city(nullable: false, blank: false)
        address(nullable: false, blank: false)
    }
}
