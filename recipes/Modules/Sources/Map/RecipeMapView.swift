//
//  SwiftUIView.swift
//  
//
//  Created by Inés Rojas on 6/08/23.
//

import SwiftUI
import GoogleMaps
import AppCore

public struct RecipeMapView: View {
    let recipe: Recipe
    public init(recipe: Recipe){
        self.recipe = recipe
    }
    
    public var body: some View {
        VStack {
            GoogleMapsView(
                recipe: self.recipe,
                latitude: self.recipe.latitude,
                longitude: self.recipe.longitude
            )
                .edgesIgnoringSafeArea(.top)
        }.navigationTitle("Recipe Origin")
    }
}

struct RecipeMapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMapView(recipe: Dummy.getInstance().recipe1)
    }
}
