package culinairegrails

class Instruction {

    String description
    Integer paso
    byte[] photo

    static belongsTo = [recipe: Recipe]

    static constraints = {
        description (nullable: false, blank: false)
        paso(nullable: false, min: 1)
        photo(nullable: true, maxSize: 4194304, minSize: 1)
    }

    String toString(){
        "${description}"
    }
}
