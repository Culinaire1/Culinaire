package culinairegrails

class Person extends User{

    String name
    String lastname
    Date birthdate

    Person(){
        rating = 1
    }

    static hasMany = [posts: Post, recipes: Recipe, favorites: User]

    static constraints = {
        name(nullable: false, size: 3..50)
        lastname(nullable: false, size: 3..50)
        birthdate(nullable: false)
    }

    int getAge(){
        Calendar c = Calendar.getInstance()
        Calendar birth = Calendar.getInstance(birthdate)

        if(c.get(c.MONTH) > birth.get(Calendar.MONTH))
            return c.get(c.YEAR) - birth.get(Calendar.YEAR)

        else if(birth.get(Calendar.MONTH) == c.get(Calendar.MONTH) && c.get(Calendar.DATE) > birth.get(Calendar.DATE))
            return c.get(Calendar.YEAR) - birth.get(Calendar.YEAR)

        return c.get(Calendar.YEAR) - birth.get(Calendar.YEAR) - 1
    }
}
