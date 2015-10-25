package culinairegrails

class Food {

    String name
    static hasMany = [recipes: Recipe]

    static constraints = {
        name(nullable: false, unique: true, minSize: 3)
    }

    static mapping = {
        recipes cascade: "all-delete-orphan"
    }
}
