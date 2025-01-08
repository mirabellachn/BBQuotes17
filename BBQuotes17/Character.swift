//
//  Character.swift
//  BBQuotes17
//
//  Created by mirabella  on 12/12/24.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupation: [String]
    let image: [URL]
    let aliases: [String]
    let status: String
    let portayedBy: String
    var death: Death?
    
    enum CodingKeys: CodingKey {
        case name
        case birthday
        case occupation
        case image
        case aliases
        case status
        case portayedBy
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        birthday = try container.decode(String.self, forKey: .birthday)
        occupation = try container.decode([String].self, forKey: .occupation)
        image = try container.decode([URL].self, forKey: .image)
        aliases = try container.decode([String].self, forKey: .aliases)
        status = try container.decode(String.self, forKey: .status)
        portayedBy = try container.decode(String.self, forKey: .portayedBy)
        
        let deathDecoder = JSONDecoder()
        deathDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deathData = try Data(contentsOf: Bundle.main.url(forResource: "sampledeath", withExtension: "json")!)
        death = try deathDecoder.decode(Death.self, from: deathData)
    }
}
