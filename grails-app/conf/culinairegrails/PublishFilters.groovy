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
        all(controller:'web', action:'usuarios') {
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
        perfil(controller:'web', action:'perfil') {
            before = {
                if(params.username != null ){
                    if(session.tu == true){
                        if(params.username == session.user)
                            render(view: 'perfil', model: [person: Person.findByUsername(session.user)])
                        else {
                            Person person = Person.findByUsername(params.username);
                            if (person != null)
                                render(view: 'perfil2', model: [person: person, user: Person.findByUsername(session.user)])
                            else
                                redirect controller: 'web', action: 'index'
                        }
                    }
                    else {
                        Person person = Person.findByUsername(params.username);
                        if (person != null)
                            render(view: 'perfil2', model: [person: person])
                        else
                            redirect controller: 'web', action: 'index'
                    }
                }
                else if(session.user == true)
                    render(view: 'perfil', model:[person:Person.findByUsername(session.user)])
                else
                    redirect controller: 'web', action: 'index'
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
