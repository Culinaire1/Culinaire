package culinairegrails

class Ingredient{
    String name

    static constraints = {
        name (nullable: false, blank: false, unique: true)
    }

    String toString(){
        "${name}"
    }
}
