package culinairegrails

class PublishFilters {

    def filters = {
        all(controller:'web', action:'publicar') {
            before = {
                if(session.tu != true) {
                    redirect controller: 'web', action: 'index'
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
