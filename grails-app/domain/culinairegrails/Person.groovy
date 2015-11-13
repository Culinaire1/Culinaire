package culinairegrails

class Person extends User{

    String name
    String lastname
    Calendar birthdate

    static hasMany = [posts: Post, recipes: Recipe, favoriteUsers: Person, favoriteRecipes: Recipe]

    static constraints = {
        name(nullable: false, size: 3..50)
        lastname(nullable: false, size: 3..50)
        birthdate(nullable: false)
    }

    static mappedBy = [favoriteRecipes: 'follower']

    static mapping = {
        sort rating: 'desc'
    }

    int getAge(){
        Calendar c = Calendar.getInstance()

        if(c.get(c.MONTH) > birthdate.get(Calendar.MONTH))
            return c.get(c.YEAR) - birthdate.get(Calendar.YEAR)

        else if(birthdate.get(birthdate.MONTH) == c.get(c.MONTH) && c.get(c.DATE) > birthdate.get(birthdate.DATE))
            return c.get(c.YEAR) - birthdate.get(Calendar.YEAR)

        return c.get(c.YEAR) - birthdate.get(Calendar.YEAR) - 1
    }

    String toString(){
        "${name} ${lastname}"
    }
}
