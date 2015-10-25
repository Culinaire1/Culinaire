package culinairegrails

class Recipe {

    Integer rating
    String name
    Date dateCreated
    Date lastUpdate

    static hasMany = [posts: Post]
    static belongsTo = [person: Person]
    static hasOne = [food: Food]

    Recipe(){
        dateCreated = new Date()
        lastUpdate = new Date()
    }

    static constraints = {
        rating(nullable: false, range: 1..5)
        name(nullable: false, minSize: 3)
        dateCreated(nullable: false)
        lastUpdate(nullable: false)
    }

    static mapping = {
        posts cascade: "all-delete-orphan"
    }
}
