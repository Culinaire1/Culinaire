package culinairegrails

class Category {

    String name

    static constraints = {
        name(blank: false,nullable: false, size: 3..20)
    }
}
