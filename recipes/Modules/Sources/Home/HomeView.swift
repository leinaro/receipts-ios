//
//  Home.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import SwiftUI
import ComposableArchitecture
import AppCore
import RecipeDetail

public struct HomeView: View {
    let store: StoreOf<HomeReducer>
    
    public init(store: StoreOf<HomeReducer>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: {$0}){ viewStore in
            NavigationView {
                List(viewStore.recipeList) { recipe in
                    NavigationLink(
                        destination: RecipeDetailView(recipe: recipe)
                    ) {
                        HStack{
                            AsyncImage(
                                url: URL(string: recipe.imageUrl),
                                content: { image in
                                    image.resizable()
                                         .frame(width: 50, height: 50)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            ).frame(maxWidth: 100, maxHeight: 100)
                            Text("\(recipe.name)")
                        }
                    }
                }.navigationTitle("Recipes")
            }
            .onAppear { viewStore.send(.onAppear) }
        }
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            store: Store(
                initialState: .mock()){
                    HomeReducer()
                })
    }
}
#endif
