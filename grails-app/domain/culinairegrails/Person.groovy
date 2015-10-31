package culinairegrails


class Person extends User{

    String name
    String lastname
    Date dateofbirth

    static hasMany = [posts: Post, recipes: Recipe]

    static constraints = {
        name(nullable: false, size: 3..50)
        lastname(nullable: false, size: 3..50)
        dateofbirth(nullable: false)

    }


}
