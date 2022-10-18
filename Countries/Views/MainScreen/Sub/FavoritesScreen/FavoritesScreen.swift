//
//  FavoritesScreen\.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import SwiftUI

struct FavoritesScreen: View {
    @State var favoriteCountries = [Country]()
    @State var isFetched: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if favoriteCountries.isEmpty && isFetched {
                        Text("No favorite countries. You can add one from home screen!")
                            .font(.body)
                    }
                    ForEach(favoriteCountries, id: \.code) { country in
                        CountryCard(country: country)
                    }
                }
                .padding()
                .animation(.easeIn, value: favoriteCountries)
            }
            .navigationTitle("Countries")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                favoriteCountries = CacheManager.shared.getFavoriteCountries()
                isFetched = true
            }
        }
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}



