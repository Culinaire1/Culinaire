package culinairegrails

class ConfFilters {

    def filters = {
        all(controller: '*', action: 'show') {
            before = {
                if(session.tu != 'admin') {
                    redirect controller: 'web', action: 'index'
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        all3(controller: '*', action: 'edit') {
            before = {
                if(session.tu != 'admin') {
                    redirect controller: 'web', action: 'index'
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        all4(controller: 'conf', action: 'index') {
            before = {
                if(session.tu != 'admin') {
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
