package culinairegrails

class Duration {

    String duration

    static hasMany = [recipes: Recipe]

    static constraints = {
        duration(nullable: false)
    }

    String toString(){
        "${duration}"
    }
}
