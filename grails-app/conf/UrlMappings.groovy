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
        "/comentarios"(controller: 'web', action: 'comentarios')
        "/faq"(controller: 'web', action: 'faq')
        "/nosotros"(controller: 'web', action: 'nosotros')
        "/contacto"(controller: 'web', action: 'contacto')
        "/acerca"(controller: 'web', action: 'acerca')
        "500"(view:'/error')
	}
}
