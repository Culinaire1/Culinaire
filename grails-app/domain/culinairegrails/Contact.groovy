package culinairegrails

class Contact {

    String issue, description

    static constraints = {
        issue(blank: false,nullable: false)
        description(blank: false,nullable: false)
    }

    String toString(){
        "${issue}"
    }
}
