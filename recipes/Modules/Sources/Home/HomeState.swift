//
//  HomeState.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import Foundation
import AppCore

public struct HomeState: Equatable {
    var recipeList: [Recipe] = []
    
    public init(
        recipeList: [Recipe]
    ){
        self.recipeList = recipeList
    }
}

#if DEBUG
public extension HomeState {
    static func mock(
        recipeList: [Recipe] = Dummy.getInstance().recipeList
    ) -> Self {
        .init(
            recipeList: recipeList
        )
    }
}
#endif

