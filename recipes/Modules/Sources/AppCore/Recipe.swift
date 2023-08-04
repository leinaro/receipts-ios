//
//  File.swift
//  
//
//  Created by Inés Rojas on 3/08/23.
//

import Foundation

public struct Recipe: Identifiable, Equatable {
    
    public var id: UUID?
    public var name: String
    public var imageUrl: String
    public var ingredient: [String]
    public var description: String
    
    public init(id: UUID?, name: String, imageUrl: String, ingredient: [String], description: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.ingredient = ingredient
        self.description = description
    }
}
