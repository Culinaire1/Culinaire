package culinairegrails

class Category {

    String name

    static constraints = {
        name(nullable: false, size: 3..20)
    }
}
