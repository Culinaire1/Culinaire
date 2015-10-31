package culinairegrails

class InstructionController {

    static scaffold = Instruction

    def update(Instruction instruction){

        if (instruction == null) {
            notFound()
            return
        }

        if (instruction.hasErrors()) {
            respond instruction.errors, view: 'create'
            return
        }

        instruction.save flush: true

        redirect action: 'show', id: instruction.id
    }

    def save(Instruction instruction){

        if (instruction == null) {
            notFound()
            return
        }

        if (instruction.hasErrors()) {
            respond instruction.errors, view: 'create'
            return
        }

        instruction.save flush: true

        redirect action: 'show', id: instruction.id
    }
}
