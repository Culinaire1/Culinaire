package culinairegrails

class Recipe {

    String name
    Integer rating
    Date dateCreated
    Date lastUpdate
    String description
    byte[] photo
    String video

    static hasMany = [posts: Post, ingredients: Ingredient, instructions: Instruction]
    static belongsTo = [person: Person, country: Country]
    static hasOne = [difficulty: Difficulty, duration: Duration]

    Recipe(){
        dateCreated = new Date()
        lastUpdate = new Date()
    }

    static constraints = {
        name(nullable: false, minSize: 3)
        rating(nullable: false, range: 1..5)
        dateCreated(nullable: false)
        lastUpdate(nullable: false)
        photo(nullable: false, blank: true, minSize: 1, maxSize: 4194304)
        description(nullable: false)
        video(nullable: true, url: true)
    }

    static mapping = {
        posts cascade: "all-delete-orphan"
    }

    String toString(){
        "${name}"
    }
}
