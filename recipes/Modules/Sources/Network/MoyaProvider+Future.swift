//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Combine
import Foundation
import Moya
import AppCore

public extension MoyaProvider {
    func requestPublisher(_ target: Target, callbackQueue: DispatchQueue? = nil) -> AnyPublisher<Response, MoyaError> {
            return MoyaPublisher { [weak self] subscriber in
                    return self?.request(target, callbackQueue: callbackQueue, progress: nil) { result in
                        switch result {
                        case let .success(response):
                            _ = subscriber.receive(response)
                            subscriber.receive(completion: .finished)
                        case let .failure(error):
                            subscriber.receive(completion: .failure(error))
                        }
                    }
                }
                .eraseToAnyPublisher()
        }
    
    
    func future<Model>(
        _ target: Target,
        failsOnEmptyData: Bool = true
    ) -> AnyPublisher<Model, RecipeError> where Model: Decodable {
        Future {
            self.request(
                target,
                completion: self.mapResponseClosure(
                    failsOnEmptyData: failsOnEmptyData,
                    completion: $0
                )
            )
        }
        .eraseToAnyPublisher()
    }
}

extension MoyaProvider {
    public func mapResponseClosure<ResponseType: Decodable>(
        failsOnEmptyData: Bool,
        completion: @escaping (Result<ResponseType, RecipeError>) -> Void
    ) -> Completion {
        let completion: Completion = { result in
            switch result {
            case .success(let response):
                do {
                    debugPrint("### Response SUCCESS ###", response.request?.url ?? "")
                    if let emptyResponse: ResponseType = EmptyResponse() as? ResponseType {
                        completion(.success(emptyResponse))
                    } else {
                        let value: ResponseType = try JSONDecoder().decode(
                            ResponseType.self,
                            from: response.data
                        )
                        completion(.success(value))
                    }
                } catch {
                    let moyaError: MoyaError = MoyaError.objectMapping(error, response)
                    debugPrint("### Response Error ###", moyaError, response.request?.url ?? "")
                    completion(.failure(RecipeError(moyaError.errorDescription ?? "")))
                }

            case .failure(let error):
                debugPrint("### Request Error ###", error, error.response?.request?.url ?? "")
                switch error {
                case let .underlying(_, response):
                    if let response: Response = response {
                        do {
                            let value: ErrorResponse = try JSONDecoder().decode(
                                ErrorResponse.self,
                                from: response.data
                            )
                            completion(.failure(RecipeError(value.errorDescription )))
                        } catch {
                            let moyaError: MoyaError = MoyaError.objectMapping(error, response)
                            completion(.failure(RecipeError(moyaError.errorDescription ?? "")))
                        }
                    }

                default:
                    completion(.failure(RecipeError(error.errorDescription ?? "")))
                }
                completion(.failure(RecipeError(error.errorDescription ?? "")))
            }
        }
        return completion
    }
}
