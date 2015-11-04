package culinairegrails

class Ingredient{
    String name
    byte[] photo

    static constraints = {
        name (nullable: false)
        photo(nullable: true, maxSize: 4194304)
    }

    String toString(){
        "${name}"
    }
}
