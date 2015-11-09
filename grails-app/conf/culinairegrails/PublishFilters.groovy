package culinairegrails

class PublishFilters {

    def filters = {
        all(controller:'web', action:'publicar') {
            before = {
                if(session.user == null) {
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
