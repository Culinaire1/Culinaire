package culinairegrails

class RestaurantPost {
    Date dateCreated
    String content

    static belongsTo = [person: Person]
    static hasOne = [restaurant: Restaurant]

    RestaurantPost(){
        dateCreated = new Date()
    }

    static constraints = {
        dateCreated(nullable: false)
        content( blank: false)
    }

    String toString(){
        "${content}"
    }
}
