package culinairegrails

class Instruction{

    String description
    Integer paso
    byte[] photo

    static belongsTo = [recipe: Recipe]

    static constraints = {
        description (nullable: false)
        paso(nullable: false, min: 1)
        photo(nullable: true)
    }

    String toString(){
        "${description}"
    }
}
