package culinairegrails

class Restaurant extends User{

    String name
    boolean approved

    static hasMany = [cities: City, posts: RestaurantPost]
    static hasOne = [menu: Menu]

    static belongsTo = [country: Country, cuisine: Cuisine]

    static constraints = {
        name(nullable: false, blank: false)
        photo(nullable: false, minSize: 1)
        description(nullable: false)
        menu(nullable: true)
        approved(nullable: false)
    }

    String toString(){
        "${name}"
    }
}
