//
//  CountriesService.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import Foundation


struct CountriesService {
    
    static let shared = CountriesService()

    func fetchCountries( completion: @escaping (Result<Countries, Error>)-> Void) {
        
        let url =  URL(string: CountriesEndpoints.countries.endpoint)
        URLSession.shared.request(url: url!, expecting: Countries.self) {result in
            switch result {
            case .success(let countries):
                completion(.success(countries))
                break
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}

enum CountriesEndpoints : String  {
    case countries = "/countries"
    
    var endpoint: String {
        get { URLSession.baseUrl + self.rawValue }
    }
}
