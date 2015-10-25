package culinairegrails

class Person extends User{

    String name
    String lastname
    Integer age

    static hasMany = [posts: Post, recipes: Recipe]

    static constraints = {
        name(nullable: false, size: 3..50)
        lastname(nullable: false, size: 3..50)
        age(nullable: false, min: 5)
    }


}
