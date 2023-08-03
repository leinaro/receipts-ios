//
//  ContentView.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import SwiftUI
import ComposableArchitecture

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var imageUrl: String
    var ingredient: [String]
    var description: String
}

struct ContentView: View {
        
    
    var body: some View {
        EmptyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
