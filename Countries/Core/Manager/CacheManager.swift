//
//  CacheManager.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import Foundation

class CacheManager {
    
    let _defaults : UserDefaults
    static let shared = CacheManager()
    
    private init(){
        _defaults = UserDefaults.standard
    }
    
    func saveFavoriteCountry(countryCode: String) -> Bool {
        
        return true;
    }
    
    
}
