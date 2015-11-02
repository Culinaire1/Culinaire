package culinairegrails

class Country {

    String name

    static constraints = {
        name(nullable: false, minSize: 3)
    }

    String toString(){
        "${name}"
    }
}
