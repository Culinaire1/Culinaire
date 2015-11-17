package culinairegrails

class Plate{

    String name

    static belongsTo = [menu: Menu]

    static constraints = {
        name(nullable: false, blank: false)
    }

    String toString(){
        "${name}"
    }
}
