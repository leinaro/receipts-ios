//
//  RecipeDetailView.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import SwiftUI
import AppCore

public struct RecipeDetailView: View {
    
    private var recipe: Recipe
    public init(recipe: Recipe){
        self.recipe = recipe
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Text("\(self.recipe.name)").font(.title)
            AsyncImage(
                url: URL(string: self.recipe.imageUrl),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 300, maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                }
            ).frame(maxWidth: 300, maxHeight: 100)

            Text("Ingredientes")
                .frame(
                    alignment: .leading
                )
                .font(.headline)

            ForEach(self.recipe.ingredient, id: \.self) { ingredient in
                Text("- \(ingredient)")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .leading
                    )
            }
            Text("Receta")
                .frame(
                    alignment: .leading
                )
                .font(.headline)
            Text("\(self.recipe.description)")
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .leading
                )
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Recipe(
            id: UUID(),
            name: "Arroz con pollo",
            imageUrl: "https://picsum.photos/300/100",
            ingredient: ["Arroz", "Pollo", "Sal", "Agua", "Salchichas"],
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        )
        RecipeDetailView(recipe: recipe)
    }
}
