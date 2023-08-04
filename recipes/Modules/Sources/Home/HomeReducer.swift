//
//  HomeReducer.swift
//  recipes
//
//  Created by Inés Rojas on 2/08/23.
//

import Foundation
import ComposableArchitecture
import AppCore


let recipeList: [Recipe] = Dummy.getInstance().recipeList

public struct HomeReducer: Reducer {
    
    public init(){}
    
    public typealias State = HomeState
    
    public typealias Action = HomeAction
    
    public func reduce(into state: inout HomeState, action: HomeAction) -> Effect<HomeAction> {
        switch action {
        case .onAppear:
            // TODO get from service
            state.recipeList = recipeList
            return .none
        }
    }
}
