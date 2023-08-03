//
//  recipesApp.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct recipesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(store: Store(
                initialState: HomeReducer.State(recipeList: [])
            ){
                HomeReducer()
                
            })
        }
    }
}
