//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Foundation
import Moya
import Combine
import AppCore

public enum RecipeEndpoint {
    case fetchRecipes
}

extension RecipeEndpoint: TargetType {
    public var baseURL: URL { URL(string: "https://demo6282033.mockable.io")! }

    public var path: String {
        switch self {
        case .fetchRecipes:
            return "/recipes"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .fetchRecipes:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .fetchRecipes:
            return .requestPlain
        }
        
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
      }
    
}
    
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}

public extension MoyaProvider where Target == RecipeEndpoint {
    func getRecipes() -> AnyPublisher<[Recipe], RecipeError> {
        future(.fetchRecipes)
    }
}
