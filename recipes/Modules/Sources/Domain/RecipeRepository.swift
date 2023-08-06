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

    var recipeProvider: MoyaProvider<RecipeEndpoint>
    
    public init(recipeProvider: MoyaProvider<RecipeEndpoint> = MoyaProvider<RecipeEndpoint>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])) {
        self.recipeProvider = recipeProvider
    }
    
    public func getRecipes() -> AnyPublisher<[Recipe], RecipeError> {
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
