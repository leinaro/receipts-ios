//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Foundation

public enum RecipeError: Error, Equatable {
    case text(String)
    
    public init(_ error: String) {
        self = .text(error)
    }
}

