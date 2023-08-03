//
//  HomeState.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import Foundation

struct HomeState: Equatable {
    var recipeList: [Recipe] = []
    
    init(
        recipeList: [Recipe]
    ){
        self.recipeList = recipeList
    }
}
