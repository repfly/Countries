//
//  FavoriteIconButton.swift
//  Countries
//
//  Created by Alper Yıldırım on 18.10.2022.
//

import SwiftUI

struct FavoriteIconButton: View {
    let country: Country
    @State var isFavorite: Bool = false;
    var body: some View {
        Image(systemName: isFavorite ? "star.fill" :  "star")
            .imageScale(.large)
            .padding()
            .foregroundColor(Color.black)
            .onTapGesture {
                if !isFavorite {
                    isFavorite = CacheManager.shared.saveFavoriteCountry(country: country)
                } else {
                    CacheManager.shared.removeFromFavorites(country: country)
                    isFavorite = false
                }
            }
            .onChange(of: country) { country in
                let favoriteCountries = CacheManager.shared.getFavoriteCountries()
                isFavorite = favoriteCountries.contains(country)
            }
            .task {
                let favoriteCountries = CacheManager.shared.getFavoriteCountries()
                isFavorite = favoriteCountries.contains(country)
            }
          
    }
}


