//
//  File.swift
//  
//
//  Created by Inés Rojas on 4/08/23.
//

import Foundation

public struct ErrorInfoResponse: Equatable, Codable {
    public var message: String?
    public let detail: String?
    public let msgCode: String?

    enum CodingKeys: String, CodingKey {
        case message
        case detail
        case msgCode = "msg_code"
    }

    public init(
        message: String?,
        detail: String? = nil,
        msgCode: String? = nil
    ) {
        self.message = message
        self.detail = detail
        self.msgCode = msgCode
    }

    public init(from decoder: Decoder) throws {
        let values: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)

        message = try? values.decode(String.self, forKey: .message)
        if message == nil {
            let messages: [String]? = try? values.decode([String].self, forKey: .message)
            message = messages?.first
        }

        detail = try? values.decode(String.self, forKey: .detail)
        msgCode = try? values.decode(String.self, forKey: .msgCode)
    }
}

#if DEBUG
public extension ErrorInfoResponse {
    static func mock(
        message: String? = "Message Error",
        detail: String? = "Detail Error",
        msgCode: String? = "GENERIC_ERROR"
    ) -> Self {
        .init(
            message: message,
            detail: detail,
            msgCode: msgCode
        )
    }
}
#endif

