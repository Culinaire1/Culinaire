package culinairegrails

class Ingredient{
    String name
    String quantity
    byte[] photo

    static belongsTo = [recipe:Recipe]
    static constraints = {
        name (nullable: false)
        photo(nullable: true, maxSize: 4194304)
        quantity nullable: false, blank: false
    }

    String toString(){
        "${name}"
    }
}
