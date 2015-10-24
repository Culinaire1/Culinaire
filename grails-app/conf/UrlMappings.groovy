class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'web', action: 'index')
        "/busqueda"(controller: 'web', action: 'busqueda')
        "/categorias"(controller: 'web', action: 'categorias')
        "/favoritos"(controller: 'web', action: 'favoritos')
        "/perfil"(controller: 'web', action: 'perfil')
        "500"(view:'/error')
	}
}
