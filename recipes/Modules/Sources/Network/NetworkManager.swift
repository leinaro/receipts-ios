//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Foundation
import Moya

public final class NetworkManager {

    public private(set) static var instance: NetworkManager!
    
    public static func initialize() {
        instance = .init()
    }

    init() {    }
    
    public static var recipeProvider = MoyaProvider<RecipeEndpoint>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

    
}

