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

    def displayGraph = {
        def resPhoto = Instruction.findById(params.id)
        if (!resPhoto || !resPhoto.photo) {
            response.sendError(404)
            return
        }
        response.contentType = resPhoto.photo
        response.contentLength = resPhoto.photo.size()
        OutputStream out = response.outputStream
        out.write(resPhoto.photo)
        out.close()
    }
}
