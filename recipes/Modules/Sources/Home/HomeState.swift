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
    var searchResults: [Recipe] = []
    var query: String
    
    public init(
        recipeList: [Recipe],
        searchResults: [Recipe]=[],
        query: String = ""
    ){
        self.recipeList = recipeList
        self.query = query
        self.searchResults = searchResults
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

