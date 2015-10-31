package culinairegrails

class Recipe {

    Integer rating
    String name
    String description
    Date dateCreated
    Date lastUpdate
    boolean typical

    static hasMany = [posts: Post]
    static belongsTo = [person: Person]
    static hasOne = [food: Food,ingrediente:Ingredients]

    Recipe(){
        dateCreated = new Date()
        lastUpdate = new Date()
    }

    static constraints = {
        rating(nullable: false, range: 1..5)
        name(nullable: false, minSize: 3)
        description(nullable: false)
        dateCreated(nullable: false)
        lastUpdate(nullable: false)
        typical(null:false)
    }

    static mapping = {
        posts cascade: "all-delete-orphan"
    }
}
