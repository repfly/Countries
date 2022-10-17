//
//  HomeScreenViewModel.swift
//  Countries
//
//  Created by Alper Yıldırım on 17.10.2022.
//

import Foundation
class HomeScreenViewModel : ObservableObject {
    @Published var countries = [Country]()
    @Published var isLoading = false
    
    @MainActor
    func fetchCountries()  {
        isLoading.toggle()
         CountriesService.shared.fetchCountries(){ countries in
             switch countries {
             case .success(let countries):
                 self.countries = countries.data
                 print(self.countries)
                 break
                 
             case .failure(let error):
                 print(error)
             }
        }
        isLoading.toggle()
    }
}
