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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        let recipeList: [Recipe] = [
            Recipe(
                id: UUID(uuidString: "123asdf"),
                name: "Arroz con pollo",
                imageUrl: "https://picsum.photos/300/100",
                ingredient: ["Arroz", "Pollo", "Sal", "Agua", "Salchichas"],
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            )
        ]
        HomeView(
            store: Store(
                initialState: HomeReducer.State(recipeList: recipeList)){
                    HomeReducer()
                })
    }
}
