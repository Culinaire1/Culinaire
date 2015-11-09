package culinairegrails

class Admin extends User{

    String name
    String lastname

    static constraints = {
        rating(nullable: true)
        name(nullable: false, size: 3..50)
        lastname(nullable: false, size: 3..50)
    }
}
