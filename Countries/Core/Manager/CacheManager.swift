//
//  CacheManager.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import Foundation

class CacheManager {
    
    private let defaults : UserDefaults
    static let shared = CacheManager()
    
    private init(){
        defaults = UserDefaults.standard
    }
    
    func saveFavoriteCountry(countryCode: String) {
//        defaults.array(forKey: Fav)
        defaults.set(countryCode, forKey: CacheKeys.favoriteCountries.rawValue)
    }

    
    
}
