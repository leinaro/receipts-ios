//
//  File.swift
//  
//
//  Created by Inés Rojas on 3/08/23.
//

import Foundation

public struct Recipe: Identifiable, Equatable, Codable {
    
    public var id: UUID?
    public var name: String
    public var imageUrl: String
    public var ingredient: String
    public var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "recipe_name"
        case imageUrl = "image_url"
        case ingredient = "ingredients"
        case description = "instructions"
    }
    
    public init(id: UUID?, name: String, imageUrl: String, ingredient: String, description: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.ingredient = ingredient
        self.description = description
    }
    
    public init(from decoder: Decoder) throws {
        let values: KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decode(UUID.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        imageUrl = try values.decode(String.self, forKey: .imageUrl)
        ingredient = try values.decode(String.self, forKey: .ingredient)
        description = try values.decode(String.self, forKey: .description)
    }
}

extension Recipe {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Recipe.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
