package culinairegrails

class Ingredients {

    byte[] photo
    String [] ingredientes
    String [] pasoapaso

    static belongsTo = [recipe:Recipe]

    static constraints = {
        photo(nullable: true)
        ingredientes(nullable: false)
        pasoapaso(nullable: false)
    }
}
