package culinairegrails

class VotePerson {

    Integer voter
    Integer value
    static belongsTo = [person: Person]
}
