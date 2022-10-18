//
//  CountryDetail.swift
//  Countries
//
//  Created by Alper Yıldırım on 17.10.2022.
//

import Foundation

// MARK: - CountryDetail
struct CountryDetail: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let code, callingCode: String
    let currencyCodes: [String]
    let flagImageURI: String
    let name: String
    let numRegions: Int
    let wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code, callingCode, currencyCodes
        case flagImageURI = "flagImageUri"
        case name, numRegions
        case wikiDataID = "wikiDataId"
    }
}
