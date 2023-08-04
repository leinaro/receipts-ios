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
