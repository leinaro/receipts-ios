//
//  HomeAction.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import Foundation
import AppCore
import Combine
import ComposableArchitecture


public enum HomeAction: Equatable {
    case onAppear
    case showRecipeList([Recipe])
    case showError(String)
}
