package culinairegrails

class Ingredient{
    String name

    static constraints = {
        name (nullable: false, blank: false, unique: true)
    }

    static mapping = {
        sort name: 'asc'
    }

    String toString(){
        "${name}"
    }
}
