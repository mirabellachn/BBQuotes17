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
}
