//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Foundation

public struct ErrorResponse: Codable, Equatable {
    public var statusCode: Int?
    public var statusMessage: String?
    public var success: Bool?
    public var errors: ErrorInfoResponse?

    enum CodingKeys: String, CodingKey {
        case statusCode
        case statusMessage
        case success
        case errors
    }

    public init(
        statusCode: Int?,
        statusMessage: String?,
        success: Bool?,
        errors: ErrorInfoResponse?
    ) {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
        self.success = success
        self.errors = errors
    }

    public init(from decoder: Decoder) throws {
        let values: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)

        statusCode = try? values.decode(Int.self, forKey: .statusCode)
        statusMessage = try? values.decode(String.self, forKey: .statusMessage)
        success = try? values.decode(Bool.self, forKey: .success)
        errors = try? values.decode(ErrorInfoResponse.self, forKey: .errors)
        if errors == nil {
            let arrayErrors: [String]? = try? values.decode([String].self, forKey: .errors)
            if let arrayErrors: [String] {
                errors = .init(message: arrayErrors.first)
            }
        }
    }

    public var errorDescription: String {
        var description: String = ""
        #if DEBUG
        if let statusCode: Int = statusCode {
            description += "|DEBUG| Status Code: " + String(statusCode) + "\n"
        }
        if let statusMessage: String = statusMessage {
            description += "|DEBUG| Status Message: " + statusMessage + "\n"
        }
        if let msgCode: String = errors?.msgCode {
            description += "\n|DEBUG| Msg Code: " + msgCode + "\n"
        }
        #endif
        if let message: String = errors?.message, !message.isEmpty {
            description += message
            if message.last != "." {
                description += "."
            }
        }
        #if DEBUG
        if let detail: String = errors?.detail {
            description += "\n|DEBUG| Detail: " + detail
        }
        #endif
        return description
    }
}

#if DEBUG
public extension ErrorResponse {
    static func mock(
        statusCode: Int? = 401,
        statusMessage: String? = "Status Message Error",
        success: Bool? = false,
        errors: ErrorInfoResponse? = .mock()
    ) -> Self {
        .init(
            statusCode: statusCode,
            statusMessage: statusMessage,
            success: success,
            errors: errors
        )
    }
}
#endif

