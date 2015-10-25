package culinairegrails

class Post {

    Date dateCreated
    String content

    static belongsTo = [person: Person]
    static hasOne = [recipe: Recipe]

    Post(){
        dateCreated = new Date()
    }

    static constraints = {
        dateCreated(nullable: false)
        content(nullable: false, blank: false)
    }
}
