package culinairegrails

class User {

    String username
    String password
    String email
    String description
    byte[] photo
    Integer rating
    String website

    static constraints = {
        username(nullable: false, unique:true, size: 3..15)
        password(nullable: false, minSize: 8, validator: {it.find(/[A-Z]/) && it.find(/\d/) && it.find(/[a-z]/)})
        email(nullable: false, email: true)
        description(nullable: false, blank: false)
        photo(nullable: true, blank: false, maxSize: 1048576)
        rating(nullable: false, range: 1..5)
        website(nullable: true, url: true)
    }

}