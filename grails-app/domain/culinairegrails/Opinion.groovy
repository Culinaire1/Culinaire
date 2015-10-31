package culinairegrails

class Opinion {

    String description

    static constraints = {
        description(blank: false,nullable: false)
    }
}
