//
//  Countries.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import Foundation

// MARK: - Countries
struct Countries: Codable, Equatable{
    let data: [Country]
}

// MARK: - Country
struct Country: Codable, Equatable {
    let code: String
    let currencyCodes: [String]
    let name, wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
}

