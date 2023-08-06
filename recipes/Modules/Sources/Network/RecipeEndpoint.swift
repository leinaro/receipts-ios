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
    
    public var sampleData: Data {
        switch self {
        case .fetchRecipes:
            return "[{\"recipe_name\":\"quis libero nullam sit amet turpis\",\"ingredients\":\"Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.\",\"instructions\":\"Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\",\"prep_time\":10,\"cook_time\":116,\"total_time\":196,\"servings\":8,\"cuisine\":\"Mexican\",\"dietary_restrictions\":\"Gluten-free\",\"calories\":149,\"id\":\"cf853ba0-6af7-4d92-9ae3-0f29c9b6d0de\",\"latitude\":55.1848061,\"longitude\":30.201622,\"country\":\"Belarus\",\"country_code\":\"BY\",\"image_url\":\"http://dummyimage.com/155x135.png/ff4444/ffffff\"}]".dataEncoded
            //return "[{\"id\":\"123asdf\",\"name\":\"Arroz con pollo\",\"imageUrl\":\"http://dummyimage.com/155x135.png/ff4444/ffffff\",\"ingredient\":\"Arroz, Pollo, Sal, Agua, Salchichas\", \"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\"}]".utf8Encoded

        default:
            return Data()
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
    var dataEncoded: Data { return self.data(using: String.Encoding.utf8)! }
}

public extension MoyaProvider where Target == RecipeEndpoint {
    func getRecipes() -> AnyPublisher<[Recipe], RecipeError> {
        future(.fetchRecipes)
    }
}
