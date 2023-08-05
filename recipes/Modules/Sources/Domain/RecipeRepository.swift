//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Foundation
import Network
import Combine
import AppCore
import Moya

public struct RecipeRepository {

    public static var recipeProvider = MoyaProvider<RecipeEndpoint>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

    public static func getAllRecipes() -> AnyPublisher<[Recipe], RecipeError> {
        return Future {
            recipeProvider.request(
                .fetchRecipes,
                completion: recipeProvider.mapResponseClosure(
                    failsOnEmptyData: true,
                    completion: $0
                )
            )
        }
        .eraseToAnyPublisher()
    }
    
    public static func getRecipes() -> AnyPublisher<[Recipe], RecipeError> {
        recipeProvider
            .getRecipes()
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    
}

enum AsyncError: Error {
    case finishedWithoutValue
}

extension AnyPublisher {
    public func async() async throws -> Output {
        try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            var finishedWithoutValue = true
            cancellable = first()
                .sink { result in
                    switch result {
                    case .finished:
                        if finishedWithoutValue {
                            continuation.resume(throwing: AsyncError.finishedWithoutValue)
                        }
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                    cancellable?.cancel()
                } receiveValue: { value in
                    finishedWithoutValue = false
                    continuation.resume(with: .success(value))
                }
        }
    }
}
