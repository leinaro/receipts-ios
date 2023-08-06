//
//  HomeReducer.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import Foundation
import ComposableArchitecture
import AppCore
import Domain

let recipeList: [Recipe] = Dummy.getInstance().recipeList

public struct HomeReducer: Reducer {

    let recipeRepository: RecipeRepository
    
    public init(recipeRepository: RecipeRepository = RecipeRepository()){
        self.recipeRepository = recipeRepository
    }
    
    struct CancelID {
    }
    
    public typealias State = HomeState
    
    public typealias Action = HomeAction
    
    public func reduce(into state: inout HomeState, action: HomeAction) -> Effect<HomeAction> {
        switch action {
        case .onAppear:
            return .run { send in
                let recipes = try await recipeRepository.getRecipes().async()

                await send(
                  .showRecipeList(recipes)
                )
            }
        case let .showRecipeList(recipeList):
            state.recipeList = recipeList
            return .none
        case let .showError(message):
            return .none
        }
    }
}

