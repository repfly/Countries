//
//  FavoritesScreenViewModel.swift
//  Countries
//
//  Created by Alper Yıldırım on 17.10.2022.
//

import Foundation
class FavoritesViewModel : ObservableObject {
    @Published var favoriteCountries = [Country]()
    @Published var isLoading = false
    
    @MainActor
    func getFavoriteCountries() {
        favoriteCountries = CacheManager.shared.getFavoriteCountries()
    }
    
}
