package culinairegrails

class Category {

    String name
    byte [] photo


    static constraints = {
        name(blank: false,nullable: false, size: 3..20)
        photo(nullable: true)
    }
}
