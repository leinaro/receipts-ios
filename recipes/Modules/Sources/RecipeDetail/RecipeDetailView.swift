//
//  RecipeDetailView.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import SwiftUI
import AppCore
import Map

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

                
                ForEach(self.recipe.ingredient.components(separatedBy: ","), id: \.self) { ingredient in
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
                HStack {
                    Text("Origin: \(self.recipe.country)")
                    NavigationLink(
                        destination: RecipeMapView(recipe: self.recipe)) {
                          Text("See on map")
                        }
                }.padding(16)
                
                
                Spacer()
            }
            .navigationTitle("\(self.recipe.name)")
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
        let recipe = Dummy.getInstance().recipe1
        RecipeDetailView(recipe: recipe)
    }
}
