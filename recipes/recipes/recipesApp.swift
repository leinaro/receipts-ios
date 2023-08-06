//
//  recipesApp.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import SwiftUI
import Home
import AppCore
import ComposableArchitecture

@main
struct recipesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            EmptyView()
            HomeView(
                store: Store(
                    initialState: HomeReducer.State(recipeList: [])
                ){
                    HomeReducer()
                })
        }
    }
}
