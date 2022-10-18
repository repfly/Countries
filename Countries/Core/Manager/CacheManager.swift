//
//  CacheManager.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import Foundation

/// A class that stores low valume of ``country`` objects by utilising `NSUserDefauls`
/// Normally it is best to use Core Data to store complex data types.
/// But in this case I found it uneccessary to implement such system to avoid complexity.
class CacheManager {
    
    // MARK: - Parameters
    
    private let defaults : UserDefaults
    static let shared = CacheManager()
    
    private init(){
        defaults = UserDefaults.standard
    }
    
    /// Saves the passed `country` to memory.
    func saveFavoriteCountry(country: Country) -> Bool {
        // Fetch existing countries. If nil/not existing, initialize an empty one.
        var countries = getFavoriteCountries()
        let doesExist: Bool = countries.contains(country)
        if doesExist {
            return false
        }
        countries.append(country)
        defaults.set(try? PropertyListEncoder().encode(countries), forKey: CacheKeys.favoriteCountries.rawValue)
        defaults.synchronize()
        return true
    }
    
    /// Fetches the saved countries from cache as `[Country]`
    func getFavoriteCountries() -> [Country] {
        let storedObject = defaults.data(forKey: CacheKeys.favoriteCountries.rawValue)
        let countries = try! PropertyListDecoder().decode([Country].self, from: storedObject!)
        return countries
    }
    
    func removeFromFavorites(country: Country) {
        var countries = getFavoriteCountries()
        let index = countries.firstIndex(of: country) ?? 0
        countries.remove(at: index)
        defaults.set(try? PropertyListEncoder().encode(countries), forKey: CacheKeys.favoriteCountries.rawValue)
        defaults.synchronize()
    }
    
    
    // MARK: - Obsolete
    
    
    private func encodeArrayToData<T: Encodable>(array: [T]) -> Data {
        var data: Data
        let encoder = JSONEncoder()
        data = try! encoder.encode(array)
        return data
    }
    
    private func decodeArayFromData<T: Decodable>(data: Data, type: T.Type) -> [T] {
        let decoder = JSONDecoder()
        let decodedData = try! decoder.decode([T].self, from: data)
        return decodedData
    }
    
    
}
