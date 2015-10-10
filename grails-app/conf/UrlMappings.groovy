class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "hello", action:"index")
        "categorias"(controller: "hello", action:"categorias")
        "500"(view:'/error')
	}
}
