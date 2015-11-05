package culinairegrails

class Difficulty {

    String level

    static hasMany = [recipes: Recipe]

    static constraints = {
        level (nullable: false)
    }

    String toString(){
        "${level}"
    }
}
