package culinairegrails

class Cuisine {

    String name;

    static constraints = {
        name(nullable: false, blank: false)
    }

    String toString(){
        "${name}"
    }
}
