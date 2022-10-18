//
//  FavoritesScreen\.swift
//  Countries
//
//  Created by Alper Yıldırım on 16.10.2022.
//

import SwiftUI

struct FavoritesScreen: View {
    @StateObject fileprivate var viewModel = FavoritesViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.favoriteCountries, id: \.code) { country in
                    CountryCard(country: country)
                }
            }
            .padding()
            .animation(.easeIn, value: viewModel.favoriteCountries)
        }
        .task {
            viewModel.getFavoriteCountries()
        }
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}



