//
//  HomeReducer.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import Foundation
import ComposableArchitecture


let recipeList: [Recipe] = [
    Recipe(
        name: "Arroz con pollo",
        imageUrl: "https://picsum.photos/300/100",
        ingredient: ["Arroz", "Pollo", "Sal", "Agua", "Salchichas"],
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    )
]

struct HomeReducer: Reducer {
    
    typealias State = HomeState
    
    typealias Action = HomeAction
    
    func reduce(into state: inout HomeState, action: HomeAction) -> Effect<HomeAction> {
        switch action {
        case .onAppear:
            // get from service
            state.recipeList = recipeList
            return .none
        }
    }
    
    
}
