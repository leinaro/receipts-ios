//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Foundation

public class Dummy {
    private static var instance: Dummy?
    
    required init(){}
    
    public static func getInstance() -> Dummy {
        if Dummy.instance == nil {
            Dummy.instance = self.init()
        }
        
        return Dummy.instance!
    }

    public let recipeList: [Recipe] = [
        Recipe(
            id: UUID(uuidString: "123asdf"),
            name: "Arroz con pollo",
            imageUrl: "https://cdn0.recetasgratis.net/es/posts/7/4/9/arroz_con_pollo_ecuatoriano_56947_orig.jpg",
            ingredient: ["Arroz", "Pollo", "Sal", "Agua", "Salchichas"],
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        )
    ]

}
