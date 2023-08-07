# recipes-ios

Este proyecto es una demostración de cómo usar SwiftUI, The Composable Architecture y SwiftPM para crear una aplicación de iOS.

##Requisitos previos
Este proyecto se desarrollo bajo las siguientes caracteristicas
- Xcode Version 14.2
- iOS 16

##Instalación
- Clonar el repositorio
- Abrir el proyecto en Xcode
- Para el correcto funcionamiento del proyecto se debe agregar la variable de entorno GMS_SERVICES_API_KEY que se obtiene desde la consola de google [Cómo usar claves de API](https://developers.google.com/maps/documentation/android-sdk/get-api-key?hl=es-419#:~:text=Ve%20a%20la%20p%C3%A1gina%20Google%20Maps%20Platform%20%3E%20Credenciales.&text=En%20la%20p%C3%A1gina%20Credenciales%2C%20haz,API%20que%20acabas%20de%20crear.)
- Construir y ejecutar el proyecto

##Uso
El proyecto permite visualizar recetas de cocina, la aplicación consta de tres pantallas: 
- Lista y buscador de las recetas (Home Screen)
Muestra una lista de recetas disonibles para consultar y un
buscador que filtre las recetas por nombre o por sus ingredientes utilizados.
Cada item muestra la imagen y nombre de la receta.

- Detalles de la receta seleccionada (Detail Screen)
Muestra el detalle de la receta, que incluye: Imagen, Nombre, Descripción y Botón para la pantalla de mapa.
  
- Mapa geolocalización de origen de la receta
Mustra un marcador en el mapa que muestra el origen de la receta.

##Decisiones técnicas
###SwiftPM 
[SwiftPM](https://github.com/apple/swift-package-manager) es el administrador de paquetes de Swift. Se utiliza para administrar las dependencias de un proyecto de Swift y permite darle una architectura modular al proyecto. [Modular Project Structure with Swift Package Manager (SPM)](https://santoshbotre01.medium.com/modular-project-structure-with-swift-package-manager-spm-c81fb62c8619)

###The Composable Architecture
[The Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture) es una biblioteca para administrar el estado de las aplicaciones de iOS. Proporciona una manera concisa y fácil de administrar el estado, realizar efectos secundarios y probar aplicaciones.

###SwiftUI
[SwiftUI](https://developer.apple.com/xcode/swiftui/) es un marco de desarrollo de interfaz de usuario declarativo y reactivo desarrollado por Apple Inc. para crear interfaces de usuario para aplicaciones iOS, iPadOS, macOS, tvOS y watchOS.

###GoogleMaps
El SDK de [Google Maps](https://github.com/googlemaps/google-maps-ios-utils) para iOS es una biblioteca de software que permite a los desarrolladores agregar mapas a sus aplicaciones iOS. El SDK proporciona una amplia gama de funciones, incluyendo la capacidad de agregar marcadores, rutas y otras formas a los mapas, así como la capacidad de interactuar con los mapas de diversas maneras.

###Inyección de dependencias
Se implemento inyección de dependencias basica a travez del constructor.

###Internacionalización
###Unit test
###Sourcery
